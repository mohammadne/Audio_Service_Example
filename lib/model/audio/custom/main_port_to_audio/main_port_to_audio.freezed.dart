// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'main_port_to_audio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MainPortToAudio _$MainPortToAudioFromJson(Map<String, dynamic> json) {
  return _MainPortToAudio.fromJson(json);
}

class _$MainPortToAudioTearOff {
  const _$MainPortToAudioTearOff();

  _MainPortToAudio call(
      {PlayBackOrderState playBackOrderState,
      AudioItemSource audioItemSource}) {
    return _MainPortToAudio(
      playBackOrderState: playBackOrderState,
      audioItemSource: audioItemSource,
    );
  }
}

// ignore: unused_element
const $MainPortToAudio = _$MainPortToAudioTearOff();

mixin _$MainPortToAudio {
  PlayBackOrderState get playBackOrderState;
  AudioItemSource get audioItemSource;

  Map<String, dynamic> toJson();
  $MainPortToAudioCopyWith<MainPortToAudio> get copyWith;
}

abstract class $MainPortToAudioCopyWith<$Res> {
  factory $MainPortToAudioCopyWith(
          MainPortToAudio value, $Res Function(MainPortToAudio) then) =
      _$MainPortToAudioCopyWithImpl<$Res>;
  $Res call(
      {PlayBackOrderState playBackOrderState, AudioItemSource audioItemSource});
}

class _$MainPortToAudioCopyWithImpl<$Res>
    implements $MainPortToAudioCopyWith<$Res> {
  _$MainPortToAudioCopyWithImpl(this._value, this._then);

  final MainPortToAudio _value;
  // ignore: unused_field
  final $Res Function(MainPortToAudio) _then;

  @override
  $Res call({
    Object playBackOrderState = freezed,
    Object audioItemSource = freezed,
  }) {
    return _then(_value.copyWith(
      playBackOrderState: playBackOrderState == freezed
          ? _value.playBackOrderState
          : playBackOrderState as PlayBackOrderState,
      audioItemSource: audioItemSource == freezed
          ? _value.audioItemSource
          : audioItemSource as AudioItemSource,
    ));
  }
}

abstract class _$MainPortToAudioCopyWith<$Res>
    implements $MainPortToAudioCopyWith<$Res> {
  factory _$MainPortToAudioCopyWith(
          _MainPortToAudio value, $Res Function(_MainPortToAudio) then) =
      __$MainPortToAudioCopyWithImpl<$Res>;
  @override
  $Res call(
      {PlayBackOrderState playBackOrderState, AudioItemSource audioItemSource});
}

class __$MainPortToAudioCopyWithImpl<$Res>
    extends _$MainPortToAudioCopyWithImpl<$Res>
    implements _$MainPortToAudioCopyWith<$Res> {
  __$MainPortToAudioCopyWithImpl(
      _MainPortToAudio _value, $Res Function(_MainPortToAudio) _then)
      : super(_value, (v) => _then(v as _MainPortToAudio));

  @override
  _MainPortToAudio get _value => super._value as _MainPortToAudio;

  @override
  $Res call({
    Object playBackOrderState = freezed,
    Object audioItemSource = freezed,
  }) {
    return _then(_MainPortToAudio(
      playBackOrderState: playBackOrderState == freezed
          ? _value.playBackOrderState
          : playBackOrderState as PlayBackOrderState,
      audioItemSource: audioItemSource == freezed
          ? _value.audioItemSource
          : audioItemSource as AudioItemSource,
    ));
  }
}

@JsonSerializable()
class _$_MainPortToAudio
    with DiagnosticableTreeMixin
    implements _MainPortToAudio {
  const _$_MainPortToAudio({this.playBackOrderState, this.audioItemSource});

  factory _$_MainPortToAudio.fromJson(Map<String, dynamic> json) =>
      _$_$_MainPortToAudioFromJson(json);

  @override
  final PlayBackOrderState playBackOrderState;
  @override
  final AudioItemSource audioItemSource;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainPortToAudio(playBackOrderState: $playBackOrderState, audioItemSource: $audioItemSource)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainPortToAudio'))
      ..add(DiagnosticsProperty('playBackOrderState', playBackOrderState))
      ..add(DiagnosticsProperty('audioItemSource', audioItemSource));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MainPortToAudio &&
            (identical(other.playBackOrderState, playBackOrderState) ||
                const DeepCollectionEquality()
                    .equals(other.playBackOrderState, playBackOrderState)) &&
            (identical(other.audioItemSource, audioItemSource) ||
                const DeepCollectionEquality()
                    .equals(other.audioItemSource, audioItemSource)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(playBackOrderState) ^
      const DeepCollectionEquality().hash(audioItemSource);

  @override
  _$MainPortToAudioCopyWith<_MainPortToAudio> get copyWith =>
      __$MainPortToAudioCopyWithImpl<_MainPortToAudio>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MainPortToAudioToJson(this);
  }
}

abstract class _MainPortToAudio implements MainPortToAudio {
  const factory _MainPortToAudio(
      {PlayBackOrderState playBackOrderState,
      AudioItemSource audioItemSource}) = _$_MainPortToAudio;

  factory _MainPortToAudio.fromJson(Map<String, dynamic> json) =
      _$_MainPortToAudio.fromJson;

  @override
  PlayBackOrderState get playBackOrderState;
  @override
  AudioItemSource get audioItemSource;
  @override
  _$MainPortToAudioCopyWith<_MainPortToAudio> get copyWith;
}
