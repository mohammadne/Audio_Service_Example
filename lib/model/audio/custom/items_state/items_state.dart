import 'package:hive/hive.dart';

part 'items_state.g.dart';

@HiveType(typeId: 2)
enum AudioItemSource {
  @HiveField(0)
  Url,
  @HiveField(1)
  File,
  @HiveField(2)
  Asset,
  @HiveField(3)
  HLS,
  @HiveField(4)
  DASH,
}
