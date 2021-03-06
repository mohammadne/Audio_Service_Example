import 'package:just_audio_Service/model/audio/state/audio_state.dart';

abstract class AudioBase {
  /// functions
  Future<Duration> setUrl(String uri);
  Future play();
  Future pause();
  Future stop();
  Future dispose();
  Future seek(Duration duration);
  Future setSpeed(double speed);
  Future setVolume(double volume);

  /// streams
  Stream<AudioState> get playerStateStream;
  Stream<Duration> get bufferedPositionStream;
  Stream<bool> get isBufferingStream;
  Stream<Duration> get positionStream;
  Stream<Duration> get durationStream;
  Stream<Duration> get volumeStream;
  Stream<double> get speedStream;

  /// values
  Duration get bufferedPosition;
  bool get isBuffering;
  Duration get position;
  Duration get duration;
  double get volume;
  double get speed;
}


