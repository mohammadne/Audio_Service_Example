part of 'audio_service_entrypoint.dart';

class AudioServiceTaskIsolate extends BackgroundAudioTask {
  PlayBackOrderState playBackState;
  AudioBase _player;

  @override
  Future<void> onStart(Map<String, dynamic> params) async {
    await _hiveInitial();
    _player = JustAudio();
    // _AudioServiceIsolateTaskUtil.sendIsolateEvent(
    //   IsolateTransfer(
    //     itemsState: ItemsState.download,
    //     playBackOrderState: PlayBackOrderState.shuffle,
    //   ),
    // );
    _player.playerStateStream.listen((state) {
      state.when(
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
        none: () => _setState(
          isPlaying: false,
          processingState: AudioProcessingState.none,
        ),
      );
    });
  }

  _hiveInitial() async {
    final appDocDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    Hive.registerAdapter<PlayBackOrderState>(
      PlayBackOrderStateAdapter(),
    );
    final playBackBox =
        await Hive.openBox<PlayBackOrderState>('play_back_order_state');
    if (playBackBox.isEmpty) await playBackBox.put(0, PlayBackOrderState.order);
  }

  _handlePlayerCompletion() async {
    switch (playBackState) {
      case PlayBackOrderState.order:
        if (_AudioServiceIsolateTaskUtil.isLastPlayerItem) {
          onPause();
        } else {
          _skip(1);
        }
        break;
      case PlayBackOrderState.repeatAll:
        if (_AudioServiceIsolateTaskUtil.isLastPlayerItem) {
          onSkipToQueueItem(_AudioServiceIsolateTaskUtil.queue.first.id);
        } else {
          _skip(1);
        }
        break;
      case PlayBackOrderState.repeatOne:
        await onStop();
        onPlay();
        break;
      case PlayBackOrderState.shuffle:
        int random = Random().nextInt(_AudioServiceIsolateTaskUtil.queueLength);
        onSkipToQueueItem(_AudioServiceIsolateTaskUtil.queue[random].id);
        break;
    }
  }

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
    Hive.close();
  }

  @override
  void onSkipToNext() {
    switch (playBackState) {
      case PlayBackOrderState.shuffle:
        int random = Random().nextInt(_AudioServiceIsolateTaskUtil.queueLength);
        onSkipToQueueItem(_AudioServiceIsolateTaskUtil.queue[random].id);
        break;
      default:
        if (_AudioServiceIsolateTaskUtil.isLastPlayerItem) {
          onSkipToQueueItem(_AudioServiceIsolateTaskUtil.queue.first.id);
        } else {
          _skip(1);
        }
    }
  }

  @override
  void onSkipToPrevious() {
    switch (playBackState) {
      case PlayBackOrderState.shuffle:
        int random = Random().nextInt(_AudioServiceIsolateTaskUtil.queueLength);
        onSkipToQueueItem(_AudioServiceIsolateTaskUtil.queue[random].id);
        break;
      default:
        if (_AudioServiceIsolateTaskUtil.isFirstPlayerItem) {
          onSkipToQueueItem(_AudioServiceIsolateTaskUtil.queue.last.id);
        } else {
          _skip(-1);
        }
    }
  }

  @override
  void onSkipToQueueItem(String mediaId) {}

  Future<void> _skip(int offset) async {
    final pos = _AudioServiceIsolateTaskUtil.mediaItemIndex + offset;
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
    final currIndex = _AudioServiceIsolateTaskUtil.mediaItemIndex;
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
  Future onCustomAction(String name, arguments) async {
    final args = new Map<String, dynamic>.from(arguments);
    IsolateTransfer transfer = IsolateTransfer.fromJson(args);
    print(transfer);
  }

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
