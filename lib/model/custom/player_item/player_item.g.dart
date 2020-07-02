// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerItemAdapter extends TypeAdapter<PlayerItem> {
  @override
  final typeId = 1;

  @override
  PlayerItem read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerItem(
      id: fields[0] as String,
      album: fields[1] as String,
      artist: fields[2] as String,
      title: fields[3] as String,
      artUri: fields[4] as String,
      duration: fields[5] as Duration,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.album)
      ..writeByte(2)
      ..write(obj.artist)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.artUri)
      ..writeByte(5)
      ..write(obj.duration);
  }
}