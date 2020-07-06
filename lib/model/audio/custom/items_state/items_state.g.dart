// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AudioItemSourceAdapter extends TypeAdapter<AudioItemSource> {
  @override
  final typeId = 2;

  @override
  AudioItemSource read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AudioItemSource.Url;
      case 1:
        return AudioItemSource.File;
      case 2:
        return AudioItemSource.Asset;
      case 3:
        return AudioItemSource.HLS;
      case 4:
        return AudioItemSource.DASH;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, AudioItemSource obj) {
    switch (obj) {
      case AudioItemSource.Url:
        writer.writeByte(0);
        break;
      case AudioItemSource.File:
        writer.writeByte(1);
        break;
      case AudioItemSource.Asset:
        writer.writeByte(2);
        break;
      case AudioItemSource.HLS:
        writer.writeByte(3);
        break;
      case AudioItemSource.DASH:
        writer.writeByte(4);
        break;
    }
  }
}
