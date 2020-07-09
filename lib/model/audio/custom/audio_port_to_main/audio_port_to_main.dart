import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio_Service/model/audio/custom/play_back_order_state/play_back_order_state.dart';

part 'audio_port_to_main.freezed.dart';
part 'audio_port_to_main.g.dart';

@freezed
abstract class AudioPortToMain with _$AudioPortToMain {
  const factory AudioPortToMain({PlayBackOrderState playBackOrderState}) =
      _AudioPortToMain;

  factory AudioPortToMain.fromJson(Map<String, dynamic> json) =>
      _$AudioPortToMainFromJson(json);
}
