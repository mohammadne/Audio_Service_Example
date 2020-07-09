import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio_Service/model/audio/custom/items_state/items_state.dart';
import 'package:just_audio_Service/model/audio/custom/play_back_order_state/play_back_order_state.dart';

part 'main_port_to_audio.freezed.dart';
part 'main_port_to_audio.g.dart';

@freezed
abstract class MainPortToAudio with _$MainPortToAudio {
  const factory MainPortToAudio({
    PlayBackOrderState playBackOrderState,
    AudioItemSource audioItemSource,
  }) = _MainPortToAudio;

  factory MainPortToAudio.fromJson(Map<String, dynamic> json) =>
      _$MainPortToAudioFromJson(json);
}
