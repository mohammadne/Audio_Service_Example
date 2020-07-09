// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_port_to_main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AudioPortToMain _$_$_AudioPortToMainFromJson(Map<String, dynamic> json) {
  return _$_AudioPortToMain(
    playBackOrderState: _$enumDecodeNullable(
        _$PlayBackOrderStateEnumMap, json['playBackOrderState']),
  );
}

Map<String, dynamic> _$_$_AudioPortToMainToJson(_$_AudioPortToMain instance) =>
    <String, dynamic>{
      'playBackOrderState':
          _$PlayBackOrderStateEnumMap[instance.playBackOrderState],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PlayBackOrderStateEnumMap = {
  PlayBackOrderState.order: 'order',
  PlayBackOrderState.repeatAll: 'repeatAll',
  PlayBackOrderState.repeatOne: 'repeatOne',
  PlayBackOrderState.shuffle: 'shuffle',
};
