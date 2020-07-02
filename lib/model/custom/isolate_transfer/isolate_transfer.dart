import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio_Service/model/custom/items_state/items_state.dart';
import 'package:just_audio_Service/model/custom/play_back_order_state/play_back_order_state.dart';

part 'isolate_transfer.freezed.dart';
part 'isolate_transfer.g.dart';

@freezed
abstract class IsolateTransfer with _$IsolateTransfer {
  const factory IsolateTransfer({
    @required PlayBackOrderState processingState,
    @required ItemsState itemsState,
  }) = _IsolateTransfer;

  factory IsolateTransfer.fromJson(Map<String, dynamic> json) =>
      _$IsolateTransferFromJson(json);
}
