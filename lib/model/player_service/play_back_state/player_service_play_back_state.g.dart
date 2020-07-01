// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_service_play_back_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerServicePlayBackStateAdapter
    extends TypeAdapter<PlayerServicePlayBackState> {
  @override
  final typeId = 0;

  @override
  PlayerServicePlayBackState read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PlayerServicePlayBackState.order;
      case 1:
        return PlayerServicePlayBackState.repeatAll;
      case 2:
        return PlayerServicePlayBackState.repeatOne;
      case 3:
        return PlayerServicePlayBackState.shuffle;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, PlayerServicePlayBackState obj) {
    switch (obj) {
      case PlayerServicePlayBackState.order:
        writer.writeByte(0);
        break;
      case PlayerServicePlayBackState.repeatAll:
        writer.writeByte(1);
        break;
      case PlayerServicePlayBackState.repeatOne:
        writer.writeByte(2);
        break;
      case PlayerServicePlayBackState.shuffle:
        writer.writeByte(3);
        break;
    }
  }
}
