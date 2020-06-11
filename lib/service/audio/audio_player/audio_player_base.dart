abstract class AudioPlayerBase {
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
  Stream<AudioPlayerBaseState> get audioPlayerBaseStateStream;
  Stream<Duration> get bufferedPositionStream;
  Stream<Duration> get positionStream;
  Stream<Duration> get durationStream;
  // Stream<Duration> get volumeStream; => this should be added !!
  Stream<double> get speedStream;

  /// values
  Duration get bufferedPosition;
  Duration get position;
  Duration get duration;
  double get volume;
  double get speed;
}

enum AudioPlayerBaseState {
  none,
  connecting,
  buffering,
  playing,
  paused,
  completed,
  stopped,
}
