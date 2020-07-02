// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isolate_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IsolateTransfer _$_$_IsolateTransferFromJson(Map<String, dynamic> json) {
  return _$_IsolateTransfer(
    playBackOrderState: _$enumDecodeNullable(
        _$PlayBackOrderStateEnumMap, json['playBackOrderState']),
    itemsState: _$enumDecodeNullable(_$ItemsStateEnumMap, json['itemsState']),
  );
}

Map<String, dynamic> _$_$_IsolateTransferToJson(_$_IsolateTransfer instance) =>
    <String, dynamic>{
      'playBackOrderState':
          _$PlayBackOrderStateEnumMap[instance.playBackOrderState],
      'itemsState': _$ItemsStateEnumMap[instance.itemsState],
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

const _$ItemsStateEnumMap = {
  ItemsState.normal: 'normal',
  ItemsState.download: 'download',
  ItemsState.favorite: 'favorite',
  ItemsState.playList: 'playList',
};
