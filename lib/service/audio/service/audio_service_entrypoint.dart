import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:just_audio_Service/model/audio/custom/audio_port_to_main/audio_port_to_main.dart';
import 'package:just_audio_Service/model/audio/custom/items_state/items_state.dart';
import 'package:just_audio_Service/model/audio/custom/main_port_to_audio/main_port_to_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart';
import 'package:audio_service/audio_service.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:just_audio_Service/model/audio/custom/play_back_order_state/play_back_order_state.dart';
import 'package:just_audio_Service/model/audio/custom/audio_item/audio_item.dart';
import 'package:just_audio_Service/model/audio/service/processing_state/audio_service_processing_state.dart';
import 'package:just_audio_Service/model/audio/service/state/audio_service_state.dart';

import '../just_audio.dart';
import '../audio_base.dart';

part 'audio_service_task_isolate.dart';

class AudioServiceEntryPointWidget extends StatefulWidget {
  const AudioServiceEntryPointWidget({@required this.child});
  final Widget child;

  @override
  _AudioServiceWidgetState createState() => _AudioServiceWidgetState();
}

class _AudioServiceWidgetState extends State<AudioServiceEntryPointWidget> {
  @override
  void initState() {
    super.initState();
    AudioServiceEntrypoint.start();
  }

  @override
  Widget build(BuildContext context) => AudioServiceWidget(child: widget.child);
}

void _audioServiceTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioServiceTaskIsolate());
}

abstract class AudioServiceEntrypoint {
  // Methods
  static Future<bool> start() => AudioService.start(
        backgroundTaskEntrypoint: _audioServiceTaskEntrypoint,
        androidNotificationChannelName: 'PlayerService',
        androidNotificationColor: 0xFF2196f3,
        androidNotificationIcon: 'mipmap/ic_launcher',
        androidEnableQueue: true,
      );

  static Future<void> play() => AudioService.play();
  static Future<void> playAudioItem(String id) =>
      AudioService.playFromMediaId(id);

  static Future<void> pause() => AudioService.pause();
  static Future<void> stop() => AudioService.stop();
  static Future<void> skipToNext() => AudioService.skipToNext();
  static Future<void> skipToPrevious() => AudioService.skipToPrevious();
  static Future<void> seek(Duration position) => AudioService.seekTo(position);
  static Future<void> setSpeed(double speed) => AudioService.setSpeed(speed);

  static Future<void> updateQueue(List<AudioItem> audioItems) =>
      AudioService.updateQueue(
        audioItems
            .map((AudioItem audioItem) => _audioItemToMediaItem(audioItem))
            .toList(),
      );

  static Future<void> sendIsolateEvent(MainPortToAudio mainPortToAudio) =>
      AudioService.customAction(
        'customAction',
        mainPortToAudio.toJson(),
      );

  // Streams
  static Stream<AudioServiceState> get playerServiceStream =>
      AudioService.playbackStateStream.map(_playbackStateToPlayerServiceState);

  static Stream<AudioPortToMain> get isolateEventStream =>
      Stream.castFrom<dynamic, AudioPortToMain>(AudioService.customEventStream);

  // AudioItem
  static Stream<AudioItem> get audioItemStream =>
      AudioService.currentMediaItemStream.map(_mediaItemToAudioItem);

  static Stream<bool> get isFirstAudioItemStream =>
      Rx.combineLatest2<List<AudioItem>, AudioItem, bool>(
        audioItemsStream,
        audioItemStream,
        (items, item) => item == items.first,
      );

  static Stream<bool> get isLastAudioItemStream =>
      Rx.combineLatest2<List<AudioItem>, AudioItem, bool>(
        audioItemsStream,
        audioItemStream,
        (items, item) => item == items.last,
      );

  // AudioItems
  static Stream<List<AudioItem>> get audioItemsStream =>
      AudioService.queueStream
          .map((mediaItems) => mediaItems.map(_mediaItemToAudioItem).toList());

  // Utils
  static AudioServiceState _playbackStateToPlayerServiceState(
          PlaybackState playbackState) =>
      AudioServiceState(
        processingState: _audioProcessingStateToAudioServiceProcessingState(
          playbackState.processingState,
        ),
        playing: playbackState.playing,
        speed: playbackState.speed,
        position: playbackState.currentPosition,
        updateTime: playbackState.updateTime,
        bufferedPosition: playbackState.bufferedPosition,
      );

  static AudioItem _mediaItemToAudioItem(MediaItem mediaItem) => AudioItem(
        id: mediaItem.id,
        artUri: mediaItem.artUri,
        title: mediaItem.artist,
        album: mediaItem.album,
        artist: mediaItem.artist,
        duration: mediaItem.duration,
      );

  static MediaItem _audioItemToMediaItem(AudioItem audioItem) => MediaItem(
        id: audioItem.id,
        artUri: audioItem.artUri,
        title: audioItem.artist,
        album: audioItem.album,
        artist: audioItem.artist,
        duration: audioItem.duration,
      );

  static AudioServiceProcessingState
      _audioProcessingStateToAudioServiceProcessingState(state) {
    switch (state) {
      case AudioProcessingState.connecting:
      case AudioProcessingState.skippingToNext:
      case AudioProcessingState.skippingToQueueItem:
        return AudioServiceProcessingState.waiting();
      case AudioProcessingState.ready:
        return AudioServiceProcessingState.ready();
      case AudioProcessingState.buffering:
        return AudioServiceProcessingState.buffering();
      case AudioProcessingState.fastForwarding:
        return AudioServiceProcessingState.fastForwarding();
      case AudioProcessingState.rewinding:
        return AudioServiceProcessingState.rewinding();
      case AudioProcessingState.skippingToPrevious:
        return AudioServiceProcessingState.waiting();
      case AudioProcessingState.completed:
        return AudioServiceProcessingState.completed();
      case AudioProcessingState.stopped:
        return AudioServiceProcessingState.stopped();
      case AudioProcessingState.error:
        return AudioServiceProcessingState.error();
      default:
        return AudioServiceProcessingState.none();
    }
  }
}
