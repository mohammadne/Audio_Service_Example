import 'dart:async';
import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_Service/model/audio/custom/play_back_order_state/play_back_order_state.dart';
import 'package:just_audio_Service/model/audio/custom/player_item/audio_item.dart';
import 'package:just_audio_Service/model/audio/service/processing_state/audio_service_processing_state.dart';
import 'package:just_audio_Service/model/audio/service/state/audio_service_state.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:rxdart/rxdart.dart';
import 'package:hive/hive.dart';

import '../just_audio.dart';
import '../audio_base.dart';

part 'audio_service_task.dart';
part 'audio_service_task_util.dart';

void _audioServiceTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioServiceIsolateTask());
}

abstract class AudioServiceEntrypoint {
  static Future<bool> start() => AudioService.start(
        backgroundTaskEntrypoint: _audioServiceTaskEntrypoint,
        androidNotificationChannelName: 'PlayerService',
        androidNotificationColor: 0xFF2196f3,
        androidNotificationIcon: 'mipmap/ic_launcher',
        androidEnableQueue: true,
      );

  static Future<void> play() => AudioService.play();
  static Future<void> pause() => AudioService.pause();
  static Future<void> stop() => AudioService.stop();
  static Future<void> skipToNext() => AudioService.skipToNext();
  static Future<void> skipToPrevious() => AudioService.skipToPrevious();
  static Future<void> seek(Duration position) => AudioService.seekTo(position);
  static Future<void> setSpeed(double speed) => AudioService.setSpeed(speed);

  static PlayBackOrderState get playBackState =>
      Hive.box<PlayBackOrderState>('play_back_order_state').get(0);

  static Stream<AudioServiceState> get playerServiceStream =>
      AudioService.playbackStateStream.map(_playbackStateToPlayerServiceState);

  // PlayerItem

  static int get playerItemIndex => playerItems.indexWhere(
        (playerServiceItem) => playerServiceItem.id == playerItem.id,
      );

  static String get playerItemId => playerItem.id;

  static AudioItem get playerItem =>
      _mediaItemToPlayerItem(AudioService.currentMediaItem);

  static Stream<AudioItem> get playerItemStream =>
      AudioService.currentMediaItemStream.map(_mediaItemToPlayerItem);

  // PlayerItems

  static int get playerItemsLength => playerItems.length;

  static List<AudioItem> get playerItems =>
      _mediaItemsToPlayerItems(AudioService.queue);

  static Stream<List<AudioItem>> get playerItemsStream =>
      AudioService.queueStream.map(_mediaItemsToPlayerItems);

  static bool get isFirstPlayerItem => playerItems.first == playerItem;

  static Stream<bool> get isFirstPlayerItemStream =>
      Rx.combineLatest2<List<AudioItem>, AudioItem, bool>(
        playerItemsStream,
        playerItemStream,
        (items, item) => item == items.first,
      );

  static bool get isLastPlayerItem => playerItems.first == playerItem;

  static Stream<bool> get isLastPlayerItemStream =>
      Rx.combineLatest2<List<AudioItem>, AudioItem, bool>(
        playerItemsStream,
        playerItemStream,
        (items, item) => item == items.last,
      );
}

AudioServiceState _playbackStateToPlayerServiceState(
        PlaybackState playbackState) =>
    AudioServiceState(
      processingState: _audioProcessingStateToPlayerServiceProcessingState(
          playbackState.processingState),
      playing: playbackState.playing,
      speed: playbackState.speed,
      position: playbackState.currentPosition,
      updateTime: playbackState.updateTime,
      bufferedPosition: playbackState.bufferedPosition,
    );

AudioItem _mediaItemToPlayerItem(MediaItem mediaItem) => AudioItem(
    id: mediaItem.id,
    artUri: mediaItem.artUri,
    title: mediaItem.artist,
    album: mediaItem.album,
    artist: mediaItem.artist,
    duration: mediaItem.duration);

List<AudioItem> _mediaItemsToPlayerItems(List<MediaItem> mediaItems) =>
    mediaItems.map(_mediaItemToPlayerItem);

AudioServiceProcessingState _audioProcessingStateToPlayerServiceProcessingState(
    state) {
  switch (state) {
    case AudioProcessingState.connecting:
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
    case AudioProcessingState.skippingToNext:
      return AudioServiceProcessingState.waiting();
    case AudioProcessingState.skippingToQueueItem:
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
