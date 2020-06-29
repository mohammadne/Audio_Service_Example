import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:hive/hive.dart';

import 'player/just_audio.dart';
import 'player/player_base.dart';

part 'audio_service_task.dart';

void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

enum PlayBackState {
  Order,
  RepeatAll,
  RepeatOne,
  Shuffle,
}

abstract class PlayerService {
  static Future<bool> start() => AudioService.start(
        backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
        androidNotificationChannelName: 'PlayerService',
        androidNotificationColor: 0xFF2196f3,
        androidNotificationIcon: 'mipmap/ic_launcher',
        androidEnableQueue: true,
      );

  static Stream get s => Hive.box('name').watch();

  static final BehaviorSubject<PlayBackState> _playBackState =
      BehaviorSubject.seeded(PlayBackState.Order);

  // static Stream<bool> get isFirstMediaItem =>
  //     Rx.combineLatest2<List<MediaItem>, MediaItem, bool>(
  //       queueStream,
  //       mediaItemStream,
  //       (queue, mediaItem) => mediaItem == queue.first,
  //     );

  // static Stream<bool> get isLastMediaItem =>
  //     Rx.combineLatest2<List<MediaItem>, MediaItem, bool>(
  //       queueStream,
  //       mediaItemStream,
  //       (queue, mediaItem) => mediaItem == queue.last,
  //     );
}
//   static Future<void> play() => AudioService.play();
//   static Future<void> pause() => AudioService.pause();
//   static Future<void> stop() => AudioService.stop();
//   static Future<void> skipToNext() => AudioService.skipToNext();
//   static Future<void> skipToPrevious() => AudioService.skipToPrevious();
//   static Future<void> setSpeed(double speed) => AudioService.setSpeed(speed);

//   static Stream<MediaItem> get mediaItemStream =>
//       AudioService.currentMediaItemStream;

//   static Stream<List<MediaItem>> get queueStream => AudioService.queueStream;

//   static Stream<PlaybackState> get playbackStateStream =>
//       AudioService.playbackStateStream;

//   // static Stream<BasicPlaybackState> get basicPlaybackStateStream {
//   //   return playbackStateStream
//   //       .map((state) => state?.basicState ?? BasicPlaybackState.none);
//   // }

//   // static Stream<PositionIndicator> get positionIndicator =>
//   //     Rx.combineLatest2<PlaybackState, MediaItem, PositionIndicator>(
//   //       playbackStateStream,
//   //       mediaItemStream,
//   //       (playbackState, mediaItem) => PositionIndicator(
//   //         position: playbackState.position,
//   //         speed: playbackState.speed,
//   //         bufferedPosition: null,
//   //         duration: mediaItem.duration,
//   //       ),
//   //     );
