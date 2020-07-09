// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_port_to_audio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MainPortToAudio _$_$_MainPortToAudioFromJson(Map<String, dynamic> json) {
  return _$_MainPortToAudio(
    playBackOrderState: _$enumDecodeNullable(
        _$PlayBackOrderStateEnumMap, json['playBackOrderState']),
    audioItemSource:
        _$enumDecodeNullable(_$AudioItemSourceEnumMap, json['audioItemSource']),
  );
}

Map<String, dynamic> _$_$_MainPortToAudioToJson(_$_MainPortToAudio instance) =>
    <String, dynamic>{
      'playBackOrderState':
          _$PlayBackOrderStateEnumMap[instance.playBackOrderState],
      'audioItemSource': _$AudioItemSourceEnumMap[instance.audioItemSource],
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

const _$AudioItemSourceEnumMap = {
  AudioItemSource.Url: 'Url',
  AudioItemSource.File: 'File',
  AudioItemSource.Asset: 'Asset',
  AudioItemSource.HLS: 'HLS',
  AudioItemSource.DASH: 'DASH',
};
