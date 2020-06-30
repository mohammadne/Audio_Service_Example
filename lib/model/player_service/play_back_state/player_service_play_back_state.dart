import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_service_play_back_state.freezed.dart';
part 'player_service_play_back_state.g.dart';

@freezed
abstract class PlayerServicePlayBackState with _$PlayerServicePlayBackState {
  const factory PlayerServicePlayBackState.order() = Order;
  const factory PlayerServicePlayBackState.repeatAll() = RepeatAll;
  const factory PlayerServicePlayBackState.repeatOne() = RepeatOne;
  const factory PlayerServicePlayBackState.shuffle() = Shuffle;

  factory PlayerServicePlayBackState.fromJson(Map<String, dynamic> json) =>
      _$PlayerServicePlayBackStateFromJson(json);
}
