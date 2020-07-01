import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'player_service_play_back_state.g.dart';

@HiveType(typeId: 0)
enum PlayerServicePlayBackState {
  @HiveField(0)
  order,
  @HiveField(1)
  repeatAll,
  @HiveField(2)
  repeatOne,
  @HiveField(3)
  shuffle,
}
