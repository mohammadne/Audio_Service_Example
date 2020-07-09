// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'audio_port_to_main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AudioPortToMain _$AudioPortToMainFromJson(Map<String, dynamic> json) {
  return _AudioPortToMain.fromJson(json);
}

class _$AudioPortToMainTearOff {
  const _$AudioPortToMainTearOff();

  _AudioPortToMain call({PlayBackOrderState playBackOrderState}) {
    return _AudioPortToMain(
      playBackOrderState: playBackOrderState,
    );
  }
}

// ignore: unused_element
const $AudioPortToMain = _$AudioPortToMainTearOff();

mixin _$AudioPortToMain {
  PlayBackOrderState get playBackOrderState;

  Map<String, dynamic> toJson();
  $AudioPortToMainCopyWith<AudioPortToMain> get copyWith;
}

abstract class $AudioPortToMainCopyWith<$Res> {
  factory $AudioPortToMainCopyWith(
          AudioPortToMain value, $Res Function(AudioPortToMain) then) =
      _$AudioPortToMainCopyWithImpl<$Res>;
  $Res call({PlayBackOrderState playBackOrderState});
}

class _$AudioPortToMainCopyWithImpl<$Res>
    implements $AudioPortToMainCopyWith<$Res> {
  _$AudioPortToMainCopyWithImpl(this._value, this._then);

  final AudioPortToMain _value;
  // ignore: unused_field
  final $Res Function(AudioPortToMain) _then;

  @override
  $Res call({
    Object playBackOrderState = freezed,
  }) {
    return _then(_value.copyWith(
      playBackOrderState: playBackOrderState == freezed
          ? _value.playBackOrderState
          : playBackOrderState as PlayBackOrderState,
    ));
  }
}

abstract class _$AudioPortToMainCopyWith<$Res>
    implements $AudioPortToMainCopyWith<$Res> {
  factory _$AudioPortToMainCopyWith(
          _AudioPortToMain value, $Res Function(_AudioPortToMain) then) =
      __$AudioPortToMainCopyWithImpl<$Res>;
  @override
  $Res call({PlayBackOrderState playBackOrderState});
}

class __$AudioPortToMainCopyWithImpl<$Res>
    extends _$AudioPortToMainCopyWithImpl<$Res>
    implements _$AudioPortToMainCopyWith<$Res> {
  __$AudioPortToMainCopyWithImpl(
      _AudioPortToMain _value, $Res Function(_AudioPortToMain) _then)
      : super(_value, (v) => _then(v as _AudioPortToMain));

  @override
  _AudioPortToMain get _value => super._value as _AudioPortToMain;

  @override
  $Res call({
    Object playBackOrderState = freezed,
  }) {
    return _then(_AudioPortToMain(
      playBackOrderState: playBackOrderState == freezed
          ? _value.playBackOrderState
          : playBackOrderState as PlayBackOrderState,
    ));
  }
}

@JsonSerializable()
class _$_AudioPortToMain
    with DiagnosticableTreeMixin
    implements _AudioPortToMain {
  const _$_AudioPortToMain({this.playBackOrderState});

  factory _$_AudioPortToMain.fromJson(Map<String, dynamic> json) =>
      _$_$_AudioPortToMainFromJson(json);

  @override
  final PlayBackOrderState playBackOrderState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AudioPortToMain(playBackOrderState: $playBackOrderState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AudioPortToMain'))
      ..add(DiagnosticsProperty('playBackOrderState', playBackOrderState));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AudioPortToMain &&
            (identical(other.playBackOrderState, playBackOrderState) ||
                const DeepCollectionEquality()
                    .equals(other.playBackOrderState, playBackOrderState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(playBackOrderState);

  @override
  _$AudioPortToMainCopyWith<_AudioPortToMain> get copyWith =>
      __$AudioPortToMainCopyWithImpl<_AudioPortToMain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AudioPortToMainToJson(this);
  }
}

abstract class _AudioPortToMain implements AudioPortToMain {
  const factory _AudioPortToMain({PlayBackOrderState playBackOrderState}) =
      _$_AudioPortToMain;

  factory _AudioPortToMain.fromJson(Map<String, dynamic> json) =
      _$_AudioPortToMain.fromJson;

  @override
  PlayBackOrderState get playBackOrderState;
  @override
  _$AudioPortToMainCopyWith<_AudioPortToMain> get copyWith;
}
