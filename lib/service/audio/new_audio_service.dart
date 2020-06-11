import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio_Service/service/audio/audio_player/audio_player_base.dart';
import 'package:just_audio_Service/service/audio/audio_player/just_audio.dart';

class AudioServiceTask extends BackgroundAudioTask {
  AudioPlayerBase audioPlayer = JustAudio();
  Completer _completer = Completer();
  AudioProcessingState _skipState;

  bool get isBuffering;
  bool get isPlaying;

  @override
  Future<void> onStart(Map<String, dynamic> params) async {
    StreamSubscription<AudioPlayerBaseState> complitionSubscription =
        audioPlayer.audioPlayerBaseStateStream
            .where((state) => state == AudioPlayerBaseState.completed)
            .listen((state) {
      _handleAudioPlayerCompleted();
    });
    StreamSubscription<AudioPlayerBaseState> playerSubscription =
        audioPlayer.audioPlayerBaseStateStream.listen((event) {
      switch (event) {
        case AudioPlayerBaseState.paused:
          _setState(
            processingState: audioPlayer.isBuffered
                ? AudioProcessingState.buffering
                : AudioProcessingState.ready,
            position: audioPlayer.position,
          );
          break;
        case AudioPlayerBaseState.playing:
          _setState(
            processingState: audioPlayer.isBuffered
                ? AudioProcessingState.buffering
                : AudioProcessingState.ready,
            position: audioPlayer.position,
          );
          break;
        case AudioPlayerBaseState.connecting:
          _setState(
            processingState: _skipState ?? AudioProcessingState.connecting,
            position: audioPlayer.position,
          );
          break;
        default:
          break;
      }
    });

    await _completer.future;

    complitionSubscription.cancel();
    playerSubscription.cancel();
  }

  void _handleAudioPlayerCompleted() {
    // if (hasNext) {
    if (true) {
      onSkipToNext();
    } else {
      onStop();
    }
  }

  @override
  void onStop() {}

  @override
  void onPlay() {}

  @override
  void onPause() {}

  @override
  void onSkipToNext() {}

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

  @override
  void onAudioFocusGained(AudioInterruption interruption) {}

  @override
  void onAudioFocusLost(AudioInterruption interruption) {}

  @override
  void onAudioBecomingNoisy() {}

  @override
  void onPlayFromMediaId(String mediaId) {}

  @override
  void onSeekTo(Duration position) {}

  @override
  void onSetSpeed(double speed) {}

  @override
  void onSkipToQueueItem(String mediaId) {}

  @override
  void onClick(MediaButton button) {
    if (AudioServiceBackground.state.playing)
      onPause();
    else
      onPlay();
  }

  @override
  Future onCustomAction(String name, arguments) async {}

  Future<void> _setState({
    AudioProcessingState processingState,
    Duration bufferedPosition,
    Duration position,
  }) =>
      AudioServiceBackground.setState(
        controls: _getControls(),
        systemActions: [MediaAction.seekTo],
        processingState:
            processingState ?? AudioServiceBackground.state.processingState,
        playing: _playing,
        position: position,
        bufferedPosition: bufferedPosition ?? position,
        speed: _audioPlayer.speedStream,
      );

  List<MediaControl> _getControls(bool playing) {
    if (playing) {
      return [
        _skipToPreviousControl,
        _pauseControl,
        _stopControl,
        _skipToNextControl
      ];
    } else {
      return [
        _skipToPreviousControl,
        _playControl,
        _stopControl,
        _skipToNextControl
      ];
    }
  }
}

MediaControl _playControl = MediaControl(
  androidIcon: 'drawable/ic_action_play_arrow',
  label: 'Play',
  action: MediaAction.play,
);
MediaControl _pauseControl = MediaControl(
  androidIcon: 'drawable/ic_action_pause',
  label: 'Pause',
  action: MediaAction.pause,
);
MediaControl _skipToNextControl = MediaControl(
  androidIcon: 'drawable/ic_action_skip_next',
  label: 'Next',
  action: MediaAction.skipToNext,
);
MediaControl _skipToPreviousControl = MediaControl(
  androidIcon: 'drawable/ic_action_skip_previous',
  label: 'Previous',
  action: MediaAction.skipToPrevious,
);
MediaControl _stopControl = MediaControl(
  androidIcon: 'drawable/ic_action_stop',
  label: 'Stop',
  action: MediaAction.stop,
);
