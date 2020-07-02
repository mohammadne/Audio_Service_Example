import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_Service/model/custom/isolate_transfer/isolate_transfer.dart';
import 'package:just_audio_Service/model/custom/items_state/items_state.dart';
import 'package:just_audio_Service/model/custom/play_back_order_state/play_back_order_state.dart';
import 'package:just_audio_Service/model/custom/player_item/player_item.dart';
import 'package:just_audio_Service/service/audio/service/player_service.dart';
import 'package:rxdart/rxdart.dart';

import '../model/player_service/processing_state/player_service_processing_state.dart';
import '../model/player_service/state/player_service_state.dart';
import '../service/audio/service/player_service.dart';

class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<PlayerServiceState>(
          stream: AudioServiceUtil.playerServiceStream,
          builder: (_, stateSnap) {
            final state = stateSnap.data;
            final processingState =
                state?.processingState ?? PlayerServiceProcessingState.none();
            if (processingState == PlayerServiceProcessingState.none())
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Start background'),
                    onPressed: AudioServiceUtil.start,
                  ),
                  RaisedButton(
                    child: Text('Send test to back ground'),
                    onPressed: () {
                      AudioService.customAction(
                        '',
                        IsolateTransfer(
                          itemsState: ItemsState.download,
                          playBackOrderState: PlayBackOrderState.shuffle,
                        ).toJson(),
                      );
                    },
                  ),
                  StreamBuilder(
                    stream: AudioService.customEventStream,
                    builder: (context, snapshot) {
                      return Text("custom event: ${snapshot.data}");
                    },
                  ),
                ],
              );
            return StreamBuilder<List<PlayerItem>>(
              stream: AudioServiceUtil.playerItemsStream,
              builder: (_, itemsSnap) {
                final items = itemsSnap.data;
                if (items == null) {
                  return Center(child: Text('Null items'));
                } else if (items.isEmpty) {
                  return Center(child: Text('Empty items'));
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder<bool>(
                            stream: AudioServiceUtil.isFirstPlayerItemStream,
                            builder: (_, isFirst) => IconButton(
                              icon: Icon(Icons.skip_previous),
                              iconSize: 64.0,
                              onPressed: isFirst.data
                                  ? null
                                  : AudioServiceUtil.skipToPrevious,
                            ),
                          ),
                          StreamBuilder<bool>(
                            stream: AudioServiceUtil.isLastPlayerItemStream,
                            builder: (_, isLast) => IconButton(
                              icon: Icon(Icons.skip_next),
                              iconSize: 64.0,
                              onPressed:
                                  isLast.data ? null : AudioServiceUtil.skipToNext,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (state.playing)
                            IconButton(
                              icon: Icon(Icons.pause),
                              iconSize: 64.0,
                              onPressed: AudioServiceUtil.pause,
                            )
                          else
                            IconButton(
                              icon: Icon(Icons.play_arrow),
                              iconSize: 64.0,
                              onPressed: AudioServiceUtil.play,
                            ),
                          IconButton(
                            icon: Icon(Icons.stop),
                            iconSize: 64.0,
                            onPressed: AudioServiceUtil.stop,
                          ),
                        ],
                      ),
                      StreamBuilder<PlayerItem>(
                        stream: AudioServiceUtil.playerItemStream,
                        builder: (_, item) => PositionIndicator(
                          state,
                          item.data,
                          _dragPositionSubject,
                        ),
                      ),
                      Text(
                        "Processing state: " +
                            "$processingState".replaceAll(
                              RegExp(r'^.*\.'),
                              '',
                            ),
                      ),
                    ],
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  /// Tracks the position while the user drags the seek bar.
  final BehaviorSubject<double> _dragPositionSubject =
      BehaviorSubject.seeded(null);
}

class PositionIndicator extends StatelessWidget {
  const PositionIndicator(this.state, this.item, this.dragPositionSubject);
  final PlayerServiceState state;
  final PlayerItem item;
  final BehaviorSubject<double> dragPositionSubject;

  @override
  Widget build(BuildContext context) {
    double seekPos;
    return StreamBuilder(
      stream: Rx.combineLatest2<double, double, double>(
          dragPositionSubject.stream,
          Stream.periodic(Duration(milliseconds: 200)),
          (dragPosition, _) => dragPosition),
      builder: (context, snapshot) {
        double position =
            snapshot.data ?? state.position.inMilliseconds.toDouble();
        double duration = item?.duration?.inMilliseconds?.toDouble();
        return Column(
          children: [
            if (duration != null)
              Slider(
                min: 0.0,
                max: duration,
                value: seekPos ?? max(0.0, min(position, duration)),
                onChanged: (value) {
                  dragPositionSubject.add(value);
                },
                onChangeEnd: (value) {
                  AudioServiceUtil.seek(Duration(milliseconds: value.toInt()));
                  // Due to a delay in platform channel communication, there is
                  // a brief moment after releasing the Slider thumb before the
                  // new position is broadcast from the platform side. This
                  // hack is to hold onto seekPos until the next state update
                  // comes through.
                  // TODO: Improve this code.
                  seekPos = value;
                  dragPositionSubject.add(null);
                },
              ),
            Text("${state.position}"),
          ],
        );
      },
    );
  }
}
