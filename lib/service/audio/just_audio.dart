import 'package:just_audio/just_audio.dart';
import 'package:just_audio_Service/model/player/state/player_state.dart';

import 'audio_base.dart';

class JustAudio implements AudioBase {
  JustAudio() : _audioPlayer = AudioPlayer();
  final AudioPlayer _audioPlayer;

  @override
  Future<Duration> setUrl(String uri) => _audioPlayer.setUrl(uri);

  @override
  Future play() => _audioPlayer.play();

  @override
  Future pause() => _audioPlayer.pause();

  @override
  Future seek(Duration duration) => _audioPlayer.seek(duration);

  @override
  Future setSpeed(double speed) => _audioPlayer.setSpeed(speed);

  @override
  Future setVolume(double volume) => _audioPlayer.setVolume(volume);

  @override
  Future stop() => _audioPlayer.stop();

  @override
  Future dispose() => _audioPlayer.dispose();

  @override
  Stream<PlayerState> get playerStateStream =>
      _audioPlayer.playbackStateStream.map((state) {
        switch (state) {
          case AudioPlaybackState.stopped:
            return PlayerState.stopped();
          case AudioPlaybackState.paused:
            return PlayerState.paused();
          case AudioPlaybackState.playing:
            return PlayerState.playing();
          case AudioPlaybackState.connecting:
            return PlayerState.connecting();
          case AudioPlaybackState.completed:
            return PlayerState.completed();
          default:
            return PlayerState.none();
        }
      });

  @override
  Stream<Duration> get positionStream =>
      _audioPlayer.playbackEventStream.map((event) => event.position);

  @override
  Stream<Duration> get bufferedPositionStream =>
      _audioPlayer.bufferedPositionStream;

  @override
  Stream<bool> get isBufferingStream => _audioPlayer.bufferingStream;

  @override
  Stream<Duration> get durationStream => _audioPlayer.durationStream;

  @override
  Stream<double> get speedStream =>
      _audioPlayer.playbackEventStream.map((event) => event.speed);

  @override
  Stream<Duration> get volumeStream => throw UnimplementedError();

  @override
  double get volume => _audioPlayer.volume;

  @override
  Duration get position => _audioPlayer.playbackEvent.position;

  @override
  Duration get bufferedPosition => _audioPlayer.playbackEvent.bufferedPosition;

  @override
  bool get isBuffering => _audioPlayer.buffering;

  @override
  Duration get duration => _audioPlayer.playbackEvent.duration;

  @override
  double get speed => _audioPlayer.playbackEvent.speed;
}