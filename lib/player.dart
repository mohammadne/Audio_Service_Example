import 'package:audio_service/audio_service.dart';
import 'package:rxdart/rxdart.dart';

import 'audio_service.dart';

void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioServiceTask());
}

class Player {
  static void start() {
    AudioService.start(
      backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
      androidNotificationChannelName: 'Audio Service Demo',
      notificationColor: 0xFF2196f3,
      androidNotificationIcon: 'mipmap/ic_launcher',
      enableQueue: true,
    );
  }

  static void skipToNext() => AudioService.skipToNext();
  static void skipToPrevious() => AudioService.skipToPrevious();
  static void play() => AudioService.play();
  static void pause() => AudioService.pause();
  static void stop() => AudioService.stop();

  static Stream<List<MediaItem>> get queueStream {
    return AudioService.queueStream;
  }

  static Stream<MediaItem> get mediaItemStream {
    return AudioService.currentMediaItemStream;
  }

  static Stream<PlaybackState> get playbackStateStream {
    return AudioService.playbackStateStream;
  }

  static Stream<BasicPlaybackState> get basicPlaybackStateStream {
    return playbackStateStream
        .map((state) => state?.basicState ?? BasicPlaybackState.none);
  }

  static Stream<PositionIndicator> get positionIndicator =>
      Rx.combineLatest2<PlaybackState, MediaItem, PositionIndicator>(
        playbackStateStream,
        mediaItemStream,
        (playbackState, mediaItem) => PositionIndicator(
          position: playbackState.position,
          speed: playbackState.speed,
          bufferedPosition: null,
          duration: mediaItem.duration,
        ),
      );

  static Stream<bool> get isFirstMediaItem {
    return Rx.combineLatest2<List<MediaItem>, MediaItem, bool>(
      queueStream,
      mediaItemStream,
      (queue, mediaItem) => mediaItem == queue.first,
    );
  }

  static Stream<bool> get isLastMediaItem {
    return Rx.combineLatest2<List<MediaItem>, MediaItem, bool>(
      queueStream,
      mediaItemStream,
      (queue, mediaItem) => mediaItem == queue.last,
    );
  }
}

class PositionIndicator {
  final int position;
  final double speed;
  final int bufferedPosition;
  final int duration;

  PositionIndicator({
    this.position,
    this.speed,
    this.bufferedPosition,
    this.duration,
  });
}
