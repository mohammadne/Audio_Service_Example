import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_item.freezed.dart';
part 'player_item.g.dart';

@freezed
abstract class PlayerItem with _$PlayerItem {
  const factory PlayerItem({
    @required String id,
    @required String album,
    @required String title,
    String artUri,
    String genre,
    Duration duration,
  }) = _PlayerItem;

  factory PlayerItem.fromJson(Map<String, dynamic> json) =>
      _$PlayerItemFromJson(json);
}
