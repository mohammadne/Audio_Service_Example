import 'dart:async';
import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_Service/model/custom/play_back_order_state/play_back_order_state.dart';
import 'package:just_audio_Service/model/custom/player_item/player_item.dart';
import 'package:just_audio_Service/model/player_service/processing_state/player_service_processing_state.dart';
import 'package:just_audio_Service/model/player_service/state/player_service_state.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
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
  static Future<void> seek(Duration position) => AudioService.seekTo(position);
  static Future<void> setSpeed(double speed) => AudioService.setSpeed(speed);

  static PlayBackOrderState get playBackState =>
      Hive.box<PlayBackOrderState>('play_back_order_state').get(0);

  static Stream<PlayerServiceState> get playerServiceStream =>
      AudioService.playbackStateStream.map(_playbackStateToPlayerServiceState);

  // PlayerItem

  static int get playerItemIndex => playerItems.indexWhere(
        (playerServiceItem) => playerServiceItem.id == playerItem.id,
      );

  static String get playerItemId => playerItem.id;

  static PlayerItem get playerItem =>
      _mediaItemToPlayerItem(AudioService.currentMediaItem);

  static Stream<PlayerItem> get playerItemStream =>
      AudioService.currentMediaItemStream.map(_mediaItemToPlayerItem);

  // PlayerItems

  static int get playerItemsLength => playerItems.length;

  static List<PlayerItem> get playerItems =>
      _mediaItemsToPlayerItems(AudioService.queue);

  static Stream<List<PlayerItem>> get playerItemsStream =>
      AudioService.queueStream.map(_mediaItemsToPlayerItems);

  static bool get isFirstPlayerItem => playerItems.first == playerItem;

  static Stream<bool> get isFirstPlayerItemStream =>
      Rx.combineLatest2<List<PlayerItem>, PlayerItem, bool>(
        playerItemsStream,
        playerItemStream,
        (items, item) => item == items.first,
      );

  static bool get isLastPlayerItem => playerItems.first == playerItem;

  static Stream<bool> get isLastPlayerItemStream =>
      Rx.combineLatest2<List<PlayerItem>, PlayerItem, bool>(
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

PlayerItem _mediaItemToPlayerItem(MediaItem mediaItem) =>
    PlayerItem(
        id: mediaItem.id,
        artUri: mediaItem.artUri,
        title: mediaItem.artist,
        album: mediaItem.album,
        artist: mediaItem.artist,
        duration: mediaItem.duration);

List<PlayerItem> _mediaItemsToPlayerItems(List<MediaItem> mediaItems) =>
    mediaItems.map(_mediaItemToPlayerItem);

PlayerServiceProcessingState
    _audioProcessingStateToPlayerServiceProcessingState(state) {
  switch (state) {
    case AudioProcessingState.connecting:
      return PlayerServiceProcessingState.waiting();
    case AudioProcessingState.ready:
      return PlayerServiceProcessingState.ready();
    case AudioProcessingState.buffering:
      return PlayerServiceProcessingState.buffering();
    case AudioProcessingState.fastForwarding:
      return PlayerServiceProcessingState.fastForwarding();
    case AudioProcessingState.rewinding:
      return PlayerServiceProcessingState.rewinding();
    case AudioProcessingState.skippingToPrevious:
      return PlayerServiceProcessingState.waiting();
    case AudioProcessingState.skippingToNext:
      return PlayerServiceProcessingState.waiting();
    case AudioProcessingState.skippingToQueueItem:
      return PlayerServiceProcessingState.waiting();
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
