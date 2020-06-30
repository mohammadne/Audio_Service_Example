import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio_Service/model/player_service/processing_state/player_service_processing_state.dart';

part 'player_service_state.freezed.dart';
part 'player_service_state.g.dart';

@freezed
abstract class PlayerServiceState with _$PlayerServiceState {
  const factory PlayerServiceState({
    @required PlayerServiceProcessingState processingState,
    @required bool playing,
    @required double speed,
    @required Duration position,
    @required Duration updateTime,
    @required Duration bufferedPosition,
    String genre,
  }) = _PlayerServiceState;

  factory PlayerServiceState.fromJson(Map<String, dynamic> json) =>
      _$PlayerServiceStateFromJson(json);
}
