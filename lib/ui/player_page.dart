import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio_Service/fake_api_bloc/fake_api_bloc.dart';
import 'package:just_audio_Service/model/audio/custom/audio_item/audio_item.dart';
import 'package:just_audio_Service/model/audio/custom/audio_port_to_main/audio_port_to_main.dart';
import 'package:just_audio_Service/model/audio/service/processing_state/audio_service_processing_state.dart';
import 'package:just_audio_Service/model/audio/service/state/audio_service_state.dart';
import 'package:just_audio_Service/service/audio/service/audio_service_entrypoint.dart';
import 'package:rxdart/rxdart.dart';

import '../service/audio/service/audio_service_entrypoint.dart';

class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('Play playlist 1'),
                  onPressed: () => BlocProvider.of<FakeApiBloc>(context).add(
                    PlayPlayList1(),
                  ),
                ),
                RaisedButton(
                  child: Text('Play playlist 2'),
                  onPressed: () => BlocProvider.of<FakeApiBloc>(context).add(
                    PlayPlayList2(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            StreamBuilder<AudioServiceState>(
              stream: AudioServiceEntrypoint.playerServiceStream,
              builder: (_, stateSnap) {
                final state = stateSnap.data;
                final processingState = state?.processingState ??
                    AudioServiceProcessingState.none();
                if (processingState == AudioServiceProcessingState.none())
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Start background'),
                        onPressed: AudioServiceEntrypoint.start,
                      ),
                      StreamBuilder<AudioPortToMain>(
                        stream: AudioServiceEntrypoint.isolateEventStream,
                        builder: (_, snapshot) {
                          AudioPortToMain isolateTransfer = snapshot.data;
                          return Text("custom event: $isolateTransfer");
                        },
                      ),
                    ],
                  );
                return StreamBuilder<List<AudioItem>>(
                  stream: AudioServiceEntrypoint.audioItemsStream,
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
                                stream: AudioServiceEntrypoint
                                    .isFirstAudioItemStream,
                                builder: (_, isFirst) => IconButton(
                                  icon: Icon(Icons.skip_previous),
                                  iconSize: 64.0,
                                  onPressed: isFirst.data
                                      ? null
                                      : AudioServiceEntrypoint.skipToPrevious,
                                ),
                              ),
                              StreamBuilder<bool>(
                                stream: AudioServiceEntrypoint
                                    .isLastAudioItemStream,
                                builder: (_, isLast) => IconButton(
                                  icon: Icon(Icons.skip_next),
                                  iconSize: 64.0,
                                  onPressed: isLast.data
                                      ? null
                                      : AudioServiceEntrypoint.skipToNext,
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
                                  onPressed: AudioServiceEntrypoint.pause,
                                )
                              else
                                IconButton(
                                  icon: Icon(Icons.play_arrow),
                                  iconSize: 64.0,
                                  onPressed: AudioServiceEntrypoint.play,
                                ),
                              IconButton(
                                icon: Icon(Icons.stop),
                                iconSize: 64.0,
                                onPressed: AudioServiceEntrypoint.stop,
                              ),
                            ],
                          ),
                          StreamBuilder<AudioItem>(
                            stream: AudioServiceEntrypoint.audioItemStream,
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
            BlocBuilder<FakeApiBloc, FakeApiState>(
              builder: (_, state) {
                if (state is FakeApiInitial) {
                  return Center(child: Text('not loaded from api'));
                } else if (state is FakeApiLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    height: 200,
                    child: StreamBuilder<List<AudioItem>>(
                      stream: AudioServiceEntrypoint.audioItemsStream,
                      builder: (_, snap) {
                        final data = snap.data ?? [];
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (_, index) {
                            return Text(data[index].id);
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
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
  final AudioServiceState state;
  final AudioItem item;
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
                  AudioServiceEntrypoint.seek(
                      Duration(milliseconds: value.toInt()));
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
