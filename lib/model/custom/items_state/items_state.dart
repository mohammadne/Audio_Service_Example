import 'package:hive/hive.dart';

part 'items_state.g.dart';

@HiveType(typeId: 2)
enum ItemsState {
  @HiveField(0)
  normal,
  @HiveField(1)
  download,
  @HiveField(2)
  favorite,
  @HiveField(3)
  playList,
}
