import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio_Service/model/audio/service/processing_state/audio_service_processing_state.dart';

part 'audio_service_state.freezed.dart';
part 'audio_service_state.g.dart';

@freezed
abstract class AudioServiceState with _$AudioServiceState {
  const factory AudioServiceState({
    @required AudioServiceProcessingState processingState,
    @required bool playing,
    @required double speed,
    @required Duration position,
    @required Duration updateTime,
    @required Duration bufferedPosition,
  }) = _PlayerServiceState;

  factory AudioServiceState.fromJson(Map<String, dynamic> json) =>
      _$AudioServiceStateFromJson(json);
}
