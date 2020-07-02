part of 'player_service.dart';

abstract class AudioServiceIsolateTaskUtil {
  // Media Item
  static int get mediaItemIndex => queue.indexWhere(
        (item) => item.id == mediaItem.id,
      );

  static MediaItem get mediaItem => AudioService.currentMediaItem;

  //Queue
  static int get queueLength => queue.length;

  static List<MediaItem> get queue => AudioService.queue;
}