part of 'player_service.dart';

class AudioPlayerTask extends BackgroundAudioTask {
  PlayerBase _player = JustAudio();
  var box;

  /// Initialise your audio task
  @override
  Future<void> onStart(Map<String, dynamic> params) async {
    _player.playerStateStream.listen((state) {
      state.maybeWhen(
        completed: () => _handlePlayerCompletion(),
        orElse: () {},
      );
    });
  }

  _handlePlayerCompletion() => PlayerService.playBackState.when(
        order: () {},
        repeatAll: () {},
        repeatOne: () {},
        shuffle: () {},
      );

  /// Handle a request to play audio
  @override
  void onPlay() {}

  /// Handle a request to pause audio
  @override
  void onPause() {}

  /// Handle a request to stop audio and finish the task
  @override
  Future<void> onStop() async {
    super.onStop();
  }

  /// Handle a request to skip to the next queue item
  @override
  void onSkipToNext() {}

  /// Handle a request to skip to the previous queue item
  @override
  void onSkipToPrevious() {}

  @override
  void onAddQueueItem(MediaItem mediaItem) {}

  @override
  void onAddQueueItemAt(MediaItem mediaItem, int index) {}

  @override
  void onFastForward() {}

  @override
  void onRewind() {}

  /// Handle the end of an audio interruption.
  @override
  void onAudioFocusGained(AudioInterruption interruption) {}

  /// Handle a phone call or other interruption
  @override
  void onAudioFocusLost(AudioInterruption interruption) {}

  @override
  void onAudioBecomingNoisy() {}

  @override
  void onPlayFromMediaId(String mediaId) {}

  /// Handle a request to seek to a position
  @override
  void onSeekTo(Duration position) {}

  @override
  void onSetSpeed(double speed) {}

  @override
  void onSkipToQueueItem(String mediaId) {}

  /// Handle a headset button click (play/pause, skip next/prev)
  @override
  void onClick(MediaButton button) {}

  @override
  Future onCustomAction(String name, arguments) async {}

  @override
  void onClose() {}
}

MediaControl playControl = MediaControl(
  androidIcon: 'drawable/ic_action_play_arrow',
  label: 'Play',
  action: MediaAction.play,
);
MediaControl pauseControl = MediaControl(
  androidIcon: 'drawable/ic_action_pause',
  label: 'Pause',
  action: MediaAction.pause,
);
MediaControl skipToNextControl = MediaControl(
  androidIcon: 'drawable/ic_action_skip_next',
  label: 'Next',
  action: MediaAction.skipToNext,
);
MediaControl skipToPreviousControl = MediaControl(
  androidIcon: 'drawable/ic_action_skip_previous',
  label: 'Previous',
  action: MediaAction.skipToPrevious,
);
MediaControl stopControl = MediaControl(
  androidIcon: 'drawable/ic_action_stop',
  label: 'Stop',
  action: MediaAction.stop,
);
