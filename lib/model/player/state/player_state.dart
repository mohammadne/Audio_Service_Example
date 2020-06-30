import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_state.freezed.dart';
part 'player_state.g.dart';

@freezed
abstract class PlayerState with _$PlayerState {
  const factory PlayerState.none() = None;
  const factory PlayerState.connecting() = Connecting;
  const factory PlayerState.playing() = Playing;
  const factory PlayerState.paused() = Paused;
  const factory PlayerState.completed() = Completed;
  const factory PlayerState.stopped() = Stopped;

  factory PlayerState.fromJson(Map<String, dynamic> json) =>
      _$PlayerStateFromJson(json);
}
