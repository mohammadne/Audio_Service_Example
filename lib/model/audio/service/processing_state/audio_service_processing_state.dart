import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_service_processing_state.freezed.dart';
part 'audio_service_processing_state.g.dart';

@freezed
abstract class AudioServiceProcessingState with _$AudioServiceProcessingState {
  const factory AudioServiceProcessingState.none() = _None;
  const factory AudioServiceProcessingState.waiting() = _Waiting;
  const factory AudioServiceProcessingState.ready() = _Ready;
  const factory AudioServiceProcessingState.buffering() = _Buffering;
  const factory AudioServiceProcessingState.fastForwarding() = _FastForwarding;
  const factory AudioServiceProcessingState.rewinding() = _Rewinding;
  const factory AudioServiceProcessingState.completed() = _Completed;
  const factory AudioServiceProcessingState.stopped() = _Stopped;
  const factory AudioServiceProcessingState.error() = _Error;

  factory AudioServiceProcessingState.fromJson(Map<String, dynamic> json) =>
      _$AudioServiceProcessingStateFromJson(json);
}
