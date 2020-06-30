import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_service_state.freezed.dart';
part 'player_service_state.g.dart';

@freezed
abstract class PlayerServiceState with _$PlayerServiceState {
  const factory PlayerServiceState({
    @required String id,
    @required String album,
    @required String artist,
    @required String title,
    @required String artUri,
    @required Duration duration,
    String genre,
  }) = _PlayerServiceState;

  factory PlayerServiceState.fromJson(Map<String, dynamic> json) =>
      _$PlayerServiceStateFromJson(json);
}
