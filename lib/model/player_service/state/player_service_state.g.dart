// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_service_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerServiceState _$_$_PlayerServiceStateFromJson(
    Map<String, dynamic> json) {
  return _$_PlayerServiceState(
    processingState: json['processingState'] == null
        ? null
        : PlayerServiceProcessingState.fromJson(
            json['processingState'] as Map<String, dynamic>),
    playing: json['playing'] as bool,
    speed: (json['speed'] as num)?.toDouble(),
    position: json['position'] == null
        ? null
        : Duration(microseconds: json['position'] as int),
    updateTime: json['updateTime'] == null
        ? null
        : Duration(microseconds: json['updateTime'] as int),
    bufferedPosition: json['bufferedPosition'] == null
        ? null
        : Duration(microseconds: json['bufferedPosition'] as int),
    genre: json['genre'] as String,
  );
}

Map<String, dynamic> _$_$_PlayerServiceStateToJson(
        _$_PlayerServiceState instance) =>
    <String, dynamic>{
      'processingState': instance.processingState,
      'playing': instance.playing,
      'speed': instance.speed,
      'position': instance.position?.inMicroseconds,
      'updateTime': instance.updateTime?.inMicroseconds,
      'bufferedPosition': instance.bufferedPosition?.inMicroseconds,
      'genre': instance.genre,
    };
