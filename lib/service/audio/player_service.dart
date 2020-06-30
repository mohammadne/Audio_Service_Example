import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio_Service/model/player_service/item/player_service_item.dart';
import 'package:just_audio_Service/model/player_service/play_back_state/player_service_play_back_state.dart';
import 'package:just_audio_Service/model/player_service/processing_state/player_service_processing_state.dart';
import 'package:just_audio_Service/model/player_service/state/player_service_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:hive/hive.dart';

import 'player/just_audio.dart';
import 'player/player_base.dart';

part 'audio_service_task.dart';

void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

abstract class PlayerService {
  static Future<bool> start() => AudioService.start(
        backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
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
  static Future<void> setSpeed(double speed) => AudioService.setSpeed(speed);

  static PlayerServicePlayBackState get playBackState =>
      Hive.box('player_service_play_back_state').get(0);

  static Stream<PlayerServiceItem> get playerItemStream =>
      AudioService.currentMediaItemStream.map(_mediaItemToPlayerItem);

  static Stream<List<PlayerServiceItem>> get playerItemsStream =>
      AudioService.queueStream.map(_mediaItemsToPlayerItems);

  static Stream<bool> get isFirstPlayerItem =>
      Rx.combineLatest2<List<PlayerServiceItem>, PlayerServiceItem, bool>(
        playerItemsStream,
        playerItemStream,
        (items, item) => item == items.first,
      );

  static Stream<bool> get isLastPlayerItem =>
      Rx.combineLatest2<List<PlayerServiceItem>, PlayerServiceItem, bool>(
        playerItemsStream,
        playerItemStream,
        (items, item) => item == items.last,
      );
}

PlayerServiceState _playbackStateToPlayerServiceState(
        PlaybackState playbackState) =>
    PlayerServiceState(
      processingState: _audioProcessingStateToPlayerServiceProcessingState(
          playbackState.processingState),
      playing: playbackState.playing,
      speed: playbackState.speed,
      position: playbackState.currentPosition,
      updateTime: playbackState.updateTime,
      bufferedPosition: playbackState.bufferedPosition,
    );

Stream<PlayerServiceState> get playerServiceStream =>
    AudioService.playbackStateStream.map(_playbackStateToPlayerServiceState);

PlayerServiceItem _mediaItemToPlayerItem(MediaItem mediaItem) =>
    PlayerServiceItem(
        id: mediaItem.id,
        artUri: mediaItem.artUri,
        title: mediaItem.artist,
        album: mediaItem.album,
        artist: mediaItem.artist,
        duration: mediaItem.duration);

List<PlayerServiceItem> _mediaItemsToPlayerItems(List<MediaItem> mediaItems) =>
    mediaItems.map(_mediaItemToPlayerItem);

PlayerServiceProcessingState
    _audioProcessingStateToPlayerServiceProcessingState(state) {
  switch (state) {
    case AudioProcessingState.connecting:
      return PlayerServiceProcessingState.connecting();
    case AudioProcessingState.ready:
      return PlayerServiceProcessingState.ready();
    case AudioProcessingState.buffering:
      return PlayerServiceProcessingState.buffering();
    case AudioProcessingState.fastForwarding:
      return PlayerServiceProcessingState.fastForwarding();
    case AudioProcessingState.rewinding:
      return PlayerServiceProcessingState.rewinding();
    case AudioProcessingState.skippingToPrevious:
      return PlayerServiceProcessingState.skippingToPrevious();
    case AudioProcessingState.skippingToNext:
      return PlayerServiceProcessingState.skippingToNext();
    case AudioProcessingState.skippingToQueueItem:
      return PlayerServiceProcessingState.skippingToQueueItem();
    case AudioProcessingState.completed:
      return PlayerServiceProcessingState.completed();
    case AudioProcessingState.stopped:
      return PlayerServiceProcessingState.stopped();
    case AudioProcessingState.error:
      return PlayerServiceProcessingState.error();
    default:
      return PlayerServiceProcessingState.none();
  }
}
