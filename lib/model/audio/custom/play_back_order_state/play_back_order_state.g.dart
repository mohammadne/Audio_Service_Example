// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_back_order_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayBackOrderStateAdapter extends TypeAdapter<PlayBackOrderState> {
  @override
  final typeId = 0;

  @override
  PlayBackOrderState read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PlayBackOrderState.order;
      case 1:
        return PlayBackOrderState.repeatAll;
      case 2:
        return PlayBackOrderState.repeatOne;
      case 3:
        return PlayBackOrderState.shuffle;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, PlayBackOrderState obj) {
    switch (obj) {
      case PlayBackOrderState.order:
        writer.writeByte(0);
        break;
      case PlayBackOrderState.repeatAll:
        writer.writeByte(1);
        break;
      case PlayBackOrderState.repeatOne:
        writer.writeByte(2);
        break;
      case PlayBackOrderState.shuffle:
        writer.writeByte(3);
        break;
    }
  }
}
