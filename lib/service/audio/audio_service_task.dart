part of 'player_service.dart';

class AudioPlayerTask extends BackgroundAudioTask {
  PlayerBase _player = JustAudio();

  @override
  Future<void> onStart(Map<String, dynamic> params) async {
    _player.playerStateStream.listen((state) {
      state.maybeWhen(
        completed: () => _handlePlayerCompletion(),
        playing: () => _setState(
          isPlaying: true,
          processingState: _player.isBuffering
              ? AudioProcessingState.buffering
              : AudioProcessingState.ready,
        ),
        paused: () => _setState(
          isPlaying: false,
          processingState: _player.isBuffering
              ? AudioProcessingState.buffering
              : AudioProcessingState.ready,
        ),
        stopped: () => _setState(
          isPlaying: false,
          processingState: AudioProcessingState.stopped,
        ),
        connecting: () => _setState(
          isPlaying: false,
          processingState: AudioProcessingState.connecting,
        ),
        orElse: () {},
      );
    });
  }

  _handlePlayerCompletion() => PlayerService.playBackState.when(
        order: () {
          if (PlayerService.isLastPlayerItem) {
            onPause();
          } else {
            _skip(1);
          }
        },
        repeatAll: () {
          if (PlayerService.isLastPlayerItem) {
            onSkipToQueueItem(PlayerService.playerItems.first.id);
          } else {
            _skip(1);
          }
        },
        repeatOne: () async {
          await onStop();
          onPlay();
        },
        shuffle: () {
          int random = Random().nextInt(PlayerService.playerItemsLength);
          onSkipToQueueItem(PlayerService.playerItems[random].id);
        },
      );

  @override
  void onPlay() {
    _player.play();
  }

  @override
  void onPause() {
    _player.pause();
  }

  @override
  Future<void> onStop() async {
    await _player.stop();
    await super.onStop();
  }

  @override
  void onClose() {
    onStop();
  }

  @override
  void onSkipToNext() {
    PlayerService.playBackState.maybeWhen(
      shuffle: () {
        int random = Random().nextInt(PlayerService.playerItemsLength);
        onSkipToQueueItem(PlayerService.playerItems[random].id);
      },
      orElse: () {
        if (PlayerService.isLastPlayerItem) {
          onSkipToQueueItem(PlayerService.playerItems.first.id);
        } else {
          _skip(1);
        }
      },
    );
  }

  @override
  void onSkipToPrevious() {
    PlayerService.playBackState.maybeWhen(
      shuffle: () {
        int random = Random().nextInt(PlayerService.playerItemsLength);
        onSkipToQueueItem(PlayerService.playerItems[random].id);
      },
      orElse: () {
        if (PlayerService.isFirstPlayerItem) {
          onSkipToQueueItem(PlayerService.playerItems.last.id);
        } else {
          _skip(-1);
        }
      },
    );
  }

  @override
  void onSkipToQueueItem(String mediaId) {}

  Future<void> _skip(int offset) async {
    final pos = PlayerService.playerItemIndex + offset;
    await _player.stop();
    MediaItem mediaItem = AudioService.queue[pos];
    AudioServiceBackground.setMediaItem(mediaItem);
    await _player.setUrl(mediaItem.id);
    onPlay();
  }

  @override
  void onAddQueueItem(MediaItem mediaItem) {}

  @override
  void onAddQueueItemAt(MediaItem mediaItem, int index) {}

  @override
  void onFastForward() {
    _seekRelative(fastForwardInterval);
  }

  @override
  void onRewind() {
    _seekRelative(-rewindInterval);
  }

  Future<void> _seekRelative(Duration offset) async {
    final pos = _player.position + offset;
    final mediaItem = AudioService.currentMediaItem;
    if (pos < Duration.zero) _player.seek(Duration.zero);
    if (pos > mediaItem.duration) _player.seek(mediaItem.duration);
    await _player.seek(pos);
  }

  @override
  void onAudioFocusLost(AudioInterruption interruption) {
    onPause();
  }

  @override
  void onAudioFocusGained(AudioInterruption interruption) {
    onPlay();
  }

  @override
  void onAudioBecomingNoisy() {
    onPause();
  }

  @override
  void onPlayFromMediaId(String mediaId) {
    final currIndex = PlayerService.playerItemIndex;
    final reqIndex = AudioService.queue.indexWhere(
      (mediaItem) => mediaItem.id == mediaId,
    );
    _skip(reqIndex - currIndex);
  }

  @override
  void onSeekTo(Duration position) {
    _player.seek(position);
  }

  @override
  void onSetSpeed(double speed) {
    _player.setSpeed(speed);
  }

  @override
  void onClick(MediaButton button) {
    switch (button) {
      case MediaButton.next:
        onSkipToNext();
        break;
      case MediaButton.previous:
        onSkipToPrevious();
        break;
      case MediaButton.media:
        if (AudioServiceBackground.state.playing)
          onPause();
        else
          onPlay();
        break;
    }
  }

  @override
  Future onCustomAction(String name, arguments) async {}

  Future<void> _setState({
    @required bool isPlaying,
    AudioProcessingState processingState,
  }) async =>
      await AudioServiceBackground.setState(
        controls: _getControls(isPlaying),
        systemActions: [MediaAction.seekTo],
        processingState:
            processingState ?? AudioServiceBackground.state.processingState,
        playing: isPlaying,
        position: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
      );

  List<MediaControl> _getControls(bool isPlaying) {
    if (isPlaying) {
      return [
        stopControl,
        skipToPreviousControl,
        pauseControl,
        skipToNextControl,
      ];
    } else {
      return [
        stopControl,
        skipToPreviousControl,
        playControl,
        skipToNextControl,
      ];
    }
  }
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
