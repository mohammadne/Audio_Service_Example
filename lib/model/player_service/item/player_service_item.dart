import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_service_item.freezed.dart';
part 'player_service_item.g.dart';

@freezed
abstract class PlayerServiceItem with _$PlayerServiceItem {
  const factory PlayerServiceItem({
    @required String id,
    @required String album,
    @required String artist,
    @required String title,
    @required String artUri,
    @required Duration duration,
    String genre,
  }) = _PlayerServiceItem;

  factory PlayerServiceItem.fromJson(Map<String, dynamic> json) =>
      _$PlayerServiceItemFromJson(json);
}
