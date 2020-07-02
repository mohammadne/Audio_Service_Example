import 'package:hive/hive.dart';

part 'play_back_order_state.g.dart';

@HiveType(typeId: 0)
enum PlayBackOrderState {
  @HiveField(0)
  order,
  @HiveField(1)
  repeatAll,
  @HiveField(2)
  repeatOne,
  @HiveField(3)
  shuffle,
}
