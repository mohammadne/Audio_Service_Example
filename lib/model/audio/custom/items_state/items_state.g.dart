// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsStateAdapter extends TypeAdapter<ItemsState> {
  @override
  final typeId = 2;

  @override
  ItemsState read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ItemsState.normal;
      case 1:
        return ItemsState.download;
      case 2:
        return ItemsState.favorite;
      case 3:
        return ItemsState.playList;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, ItemsState obj) {
    switch (obj) {
      case ItemsState.normal:
        writer.writeByte(0);
        break;
      case ItemsState.download:
        writer.writeByte(1);
        break;
      case ItemsState.favorite:
        writer.writeByte(2);
        break;
      case ItemsState.playList:
        writer.writeByte(3);
        break;
    }
  }
}
