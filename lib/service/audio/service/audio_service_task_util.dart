part of 'audio_service_entrypoint.dart';

abstract class _AudioServiceIsolateTaskUtil {
  // Methods
  

  //State
  static PlaybackState get playbackState => AudioService.playbackState;
  static AudioProcessingState get processingState =>
      AudioService.playbackState.processingState;

  // Media Item
  static int get mediaItemIndex => queue.indexWhere(
        (item) => item.id == mediaItem.id,
      );

  static bool get isFirstPlayerItem => mediaItem == queue.first;
  static bool get isLastPlayerItem => mediaItem == queue.last;

  static MediaItem get mediaItem => AudioService.currentMediaItem;

  //Queue
  static int get queueLength => queue.length;

  static List<MediaItem> get queue => AudioService.queue;
}
