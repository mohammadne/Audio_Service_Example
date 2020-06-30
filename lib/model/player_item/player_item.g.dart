// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerItem _$_$_PlayerItemFromJson(Map<String, dynamic> json) {
  return _$_PlayerItem(
    id: json['id'] as String,
    album: json['album'] as String,
    title: json['title'] as String,
    artUri: json['artUri'] as String,
    genre: json['genre'] as String,
    duration: json['duration'] == null
        ? null
        : Duration(microseconds: json['duration'] as int),
  );
}

Map<String, dynamic> _$_$_PlayerItemToJson(_$_PlayerItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'album': instance.album,
      'title': instance.title,
      'artUri': instance.artUri,
      'genre': instance.genre,
      'duration': instance.duration?.inMicroseconds,
    };
