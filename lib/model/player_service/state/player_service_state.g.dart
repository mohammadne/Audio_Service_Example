// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_service_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerServiceState _$_$_PlayerServiceStateFromJson(
    Map<String, dynamic> json) {
  return _$_PlayerServiceState(
    id: json['id'] as String,
    album: json['album'] as String,
    artist: json['artist'] as String,
    title: json['title'] as String,
    artUri: json['artUri'] as String,
    duration: json['duration'] == null
        ? null
        : Duration(microseconds: json['duration'] as int),
    genre: json['genre'] as String,
  );
}

Map<String, dynamic> _$_$_PlayerServiceStateToJson(
        _$_PlayerServiceState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'album': instance.album,
      'artist': instance.artist,
      'title': instance.title,
      'artUri': instance.artUri,
      'duration': instance.duration?.inMicroseconds,
      'genre': instance.genre,
    };
