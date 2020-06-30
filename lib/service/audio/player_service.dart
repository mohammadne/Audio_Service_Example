import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio_Service/model/player_service/item/player_service_item.dart';
import 'package:just_audio_Service/model/player_service/play_back_state/player_service_play_back_state.dart';
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

  static PlayerServiceItem _mediaItemToPlayerItem(MediaItem mediaItem) =>
      PlayerServiceItem(
          id: mediaItem.id,
          artUri: mediaItem.artUri,
          title: mediaItem.artist,
          album: mediaItem.album,
          artist: mediaItem.artist,
          duration: mediaItem.duration);

  static List<PlayerServiceItem> _mediaItemsToPlayerItems(
          List<MediaItem> mediaItems) =>
      mediaItems.map(_mediaItemToPlayerItem);

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

  static Stream<PlaybackState> get playbackStateStream =>
      AudioService.playbackStateStream;
}

// static Stream<BasicPlaybackState> get basicPlaybackStateStream {
//   return playbackStateStream
//       .map((state) => state?.basicState ?? BasicPlaybackState.none);
// }

// static Stream<PositionIndicator> get positionIndicator =>
//     Rx.combineLatest2<PlaybackState, MediaItem, PositionIndicator>(
//       playbackStateStream,
//       mediaItemStream,
//       (playbackState, mediaItem) => PositionIndicator(
//         position: playbackState.position,
//         speed: playbackState.speed,
//         bufferedPosition: null,
//         duration: mediaItem.duration,
//       ),
//     );
