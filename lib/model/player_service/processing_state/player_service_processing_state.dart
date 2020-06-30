import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_service_processing_state.freezed.dart';
part 'player_service_processing_state.g.dart';

@freezed
abstract class PlayerServiceProcessingState
    with _$PlayerServiceProcessingState {
  const factory PlayerServiceProcessingState.none() = _None;
  const factory PlayerServiceProcessingState.waiting() = _Waiting;
  const factory PlayerServiceProcessingState.ready() = _Ready;
  const factory PlayerServiceProcessingState.buffering() = _Buffering;
  const factory PlayerServiceProcessingState.fastForwarding() = _FastForwarding;
  const factory PlayerServiceProcessingState.rewinding() = _Rewinding;
  const factory PlayerServiceProcessingState.completed() = _Completed;
  const factory PlayerServiceProcessingState.stopped() = _Stopped;
  const factory PlayerServiceProcessingState.error() = _Error;

  factory PlayerServiceProcessingState.fromJson(Map<String, dynamic> json) =>
      _$PlayerServiceProcessingStateFromJson(json);
}
