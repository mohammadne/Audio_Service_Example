import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_back_state.freezed.dart';
part 'play_back_state.g.dart';

@freezed
abstract class PlayBackState with _$PlayBackState {
  const factory PlayBackState.order() = Order;
  const factory PlayBackState.repeatAll() = RepeatAll;
  const factory PlayBackState.repeatOne() = RepeatOne;
  const factory PlayBackState.shuffle() = Shuffle;

  factory PlayBackState.fromJson(Map<String, dynamic> json) =>
      _$PlayBackStateFromJson(json);
}
