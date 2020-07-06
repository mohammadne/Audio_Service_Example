// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'audio_service_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AudioServiceState _$AudioServiceStateFromJson(Map<String, dynamic> json) {
  return _PlayerServiceState.fromJson(json);
}

class _$AudioServiceStateTearOff {
  const _$AudioServiceStateTearOff();

  _PlayerServiceState call(
      {@required AudioServiceProcessingState processingState,
      @required bool playing,
      @required double speed,
      @required Duration position,
      @required Duration updateTime,
      @required Duration bufferedPosition}) {
    return _PlayerServiceState(
      processingState: processingState,
      playing: playing,
      speed: speed,
      position: position,
      updateTime: updateTime,
      bufferedPosition: bufferedPosition,
    );
  }
}

// ignore: unused_element
const $AudioServiceState = _$AudioServiceStateTearOff();

mixin _$AudioServiceState {
  AudioServiceProcessingState get processingState;
  bool get playing;
  double get speed;
  Duration get position;
  Duration get updateTime;
  Duration get bufferedPosition;

  Map<String, dynamic> toJson();
  $AudioServiceStateCopyWith<AudioServiceState> get copyWith;
}

abstract class $AudioServiceStateCopyWith<$Res> {
  factory $AudioServiceStateCopyWith(
          AudioServiceState value, $Res Function(AudioServiceState) then) =
      _$AudioServiceStateCopyWithImpl<$Res>;
  $Res call(
      {AudioServiceProcessingState processingState,
      bool playing,
      double speed,
      Duration position,
      Duration updateTime,
      Duration bufferedPosition});

  $AudioServiceProcessingStateCopyWith<$Res> get processingState;
}

class _$AudioServiceStateCopyWithImpl<$Res>
    implements $AudioServiceStateCopyWith<$Res> {
  _$AudioServiceStateCopyWithImpl(this._value, this._then);

  final AudioServiceState _value;
  // ignore: unused_field
  final $Res Function(AudioServiceState) _then;

  @override
  $Res call({
    Object processingState = freezed,
    Object playing = freezed,
    Object speed = freezed,
    Object position = freezed,
    Object updateTime = freezed,
    Object bufferedPosition = freezed,
  }) {
    return _then(_value.copyWith(
      processingState: processingState == freezed
          ? _value.processingState
          : processingState as AudioServiceProcessingState,
      playing: playing == freezed ? _value.playing : playing as bool,
      speed: speed == freezed ? _value.speed : speed as double,
      position: position == freezed ? _value.position : position as Duration,
      updateTime:
          updateTime == freezed ? _value.updateTime : updateTime as Duration,
      bufferedPosition: bufferedPosition == freezed
          ? _value.bufferedPosition
          : bufferedPosition as Duration,
    ));
  }

  @override
  $AudioServiceProcessingStateCopyWith<$Res> get processingState {
    if (_value.processingState == null) {
      return null;
    }
    return $AudioServiceProcessingStateCopyWith<$Res>(_value.processingState,
        (value) {
      return _then(_value.copyWith(processingState: value));
    });
  }
}

abstract class _$PlayerServiceStateCopyWith<$Res>
    implements $AudioServiceStateCopyWith<$Res> {
  factory _$PlayerServiceStateCopyWith(
          _PlayerServiceState value, $Res Function(_PlayerServiceState) then) =
      __$PlayerServiceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AudioServiceProcessingState processingState,
      bool playing,
      double speed,
      Duration position,
      Duration updateTime,
      Duration bufferedPosition});

  @override
  $AudioServiceProcessingStateCopyWith<$Res> get processingState;
}

class __$PlayerServiceStateCopyWithImpl<$Res>
    extends _$AudioServiceStateCopyWithImpl<$Res>
    implements _$PlayerServiceStateCopyWith<$Res> {
  __$PlayerServiceStateCopyWithImpl(
      _PlayerServiceState _value, $Res Function(_PlayerServiceState) _then)
      : super(_value, (v) => _then(v as _PlayerServiceState));

  @override
  _PlayerServiceState get _value => super._value as _PlayerServiceState;

  @override
  $Res call({
    Object processingState = freezed,
    Object playing = freezed,
    Object speed = freezed,
    Object position = freezed,
    Object updateTime = freezed,
    Object bufferedPosition = freezed,
  }) {
    return _then(_PlayerServiceState(
      processingState: processingState == freezed
          ? _value.processingState
          : processingState as AudioServiceProcessingState,
      playing: playing == freezed ? _value.playing : playing as bool,
      speed: speed == freezed ? _value.speed : speed as double,
      position: position == freezed ? _value.position : position as Duration,
      updateTime:
          updateTime == freezed ? _value.updateTime : updateTime as Duration,
      bufferedPosition: bufferedPosition == freezed
          ? _value.bufferedPosition
          : bufferedPosition as Duration,
    ));
  }
}

@JsonSerializable()
class _$_PlayerServiceState implements _PlayerServiceState {
  const _$_PlayerServiceState(
      {@required this.processingState,
      @required this.playing,
      @required this.speed,
      @required this.position,
      @required this.updateTime,
      @required this.bufferedPosition})
      : assert(processingState != null),
        assert(playing != null),
        assert(speed != null),
        assert(position != null),
        assert(updateTime != null),
        assert(bufferedPosition != null);

  factory _$_PlayerServiceState.fromJson(Map<String, dynamic> json) =>
      _$_$_PlayerServiceStateFromJson(json);

  @override
  final AudioServiceProcessingState processingState;
  @override
  final bool playing;
  @override
  final double speed;
  @override
  final Duration position;
  @override
  final Duration updateTime;
  @override
  final Duration bufferedPosition;

  @override
  String toString() {
    return 'AudioServiceState(processingState: $processingState, playing: $playing, speed: $speed, position: $position, updateTime: $updateTime, bufferedPosition: $bufferedPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlayerServiceState &&
            (identical(other.processingState, processingState) ||
                const DeepCollectionEquality()
                    .equals(other.processingState, processingState)) &&
            (identical(other.playing, playing) ||
                const DeepCollectionEquality()
                    .equals(other.playing, playing)) &&
            (identical(other.speed, speed) ||
                const DeepCollectionEquality().equals(other.speed, speed)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.updateTime, updateTime) ||
                const DeepCollectionEquality()
                    .equals(other.updateTime, updateTime)) &&
            (identical(other.bufferedPosition, bufferedPosition) ||
                const DeepCollectionEquality()
                    .equals(other.bufferedPosition, bufferedPosition)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(processingState) ^
      const DeepCollectionEquality().hash(playing) ^
      const DeepCollectionEquality().hash(speed) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(updateTime) ^
      const DeepCollectionEquality().hash(bufferedPosition);

  @override
  _$PlayerServiceStateCopyWith<_PlayerServiceState> get copyWith =>
      __$PlayerServiceStateCopyWithImpl<_PlayerServiceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlayerServiceStateToJson(this);
  }
}

abstract class _PlayerServiceState implements AudioServiceState {
  const factory _PlayerServiceState(
      {@required AudioServiceProcessingState processingState,
      @required bool playing,
      @required double speed,
      @required Duration position,
      @required Duration updateTime,
      @required Duration bufferedPosition}) = _$_PlayerServiceState;

  factory _PlayerServiceState.fromJson(Map<String, dynamic> json) =
      _$_PlayerServiceState.fromJson;

  @override
  AudioServiceProcessingState get processingState;
  @override
  bool get playing;
  @override
  double get speed;
  @override
  Duration get position;
  @override
  Duration get updateTime;
  @override
  Duration get bufferedPosition;
  @override
  _$PlayerServiceStateCopyWith<_PlayerServiceState> get copyWith;
}
