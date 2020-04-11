import 'dart:math';

import 'package:audio_service_example/player.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Service Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AudioServiceWidget(child: MainScreen()),
    );
  }
}

class MainScreen extends StatelessWidget {
  /// Tracks the position while the user drags the seek bar.
  final BehaviorSubject<double> _dragPositionSubject =
      BehaviorSubject.seeded(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Service Demo'),
      ),
      body: Center(
        child: StreamBuilder<BasicPlaybackState>(
          stream: Player.basicPlaybackStateStream,
          initialData: BasicPlaybackState.none,
          builder: (_, snapShot) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (snapShot.data == BasicPlaybackState.none) ...[
                audioPlayerButton(),
              ] else ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreamBuilder<bool>(
                      stream: Player.isFirstMediaItem,
                      builder: (_, snap) => IconButton(
                        icon: Icon(Icons.skip_previous),
                        iconSize: 64.0,
                        onPressed:
                            (snap == null || snap.data == null || snap.data)
                                ? null
                                : AudioService.skipToPrevious,
                      ),
                    ),
                    StreamBuilder<bool>(
                      stream: Player.isLastMediaItem,
                      builder: (_, snap) => IconButton(
                        icon: Icon(Icons.skip_next),
                        iconSize: 64.0,
                        onPressed:
                            (snap == null || snap.data == null || snap.data)
                                ? null
                                : Player.skipToNext,
                      ),
                    ),
                  ],
                ),
                StreamBuilder<MediaItem>(
                  stream: Player.mediaItemStream,
                  builder: (_, snap) => Text(snap.data?.title ?? ''),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (snapShot.data == BasicPlaybackState.playing)
                      pauseButton()
                    else if (snapShot.data == BasicPlaybackState.paused)
                      playButton()
                    else if (snapShot.data == BasicPlaybackState.buffering ||
                        snapShot.data == BasicPlaybackState.skippingToNext ||
                        snapShot.data == BasicPlaybackState.skippingToPrevious)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 64.0,
                          height: 64.0,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    stopButton(),
                  ],
                ),
                if (snapShot.data != BasicPlaybackState.stopped)
                  StreamBuilder<PositionIndicator>(
                    stream: Player.positionIndicator,
                    initialData: PositionIndicator(position: 0, duration: 0),
                    builder: (_, snap) {
                      double _seekPos;
                      return StreamBuilder(
                        stream: Rx.combineLatest2<double, double, double>(
                            _dragPositionSubject.stream,
                            Stream.periodic(Duration(milliseconds: 200)),
                            (dragPosition, _) => dragPosition),
                        builder: (context, snapshot) {
                          double position =
                              snapshot.data ?? snap.data?.position?.toDouble();
                          double duration = snap.data?.duration?.toDouble();
                          return Column(
                            children: [
                              if (duration != null)
                                Slider(
                                  min: 0.0,
                                  max: duration,
                                  value: _seekPos ??
                                      max(0.0, min(position, duration)),
                                  onChanged: (value) {
                                    _dragPositionSubject.add(value);
                                  },
                                  onChangeEnd: (value) {
                                    AudioService.seekTo(value.toInt());
                                    _seekPos = value;
                                    _dragPositionSubject.add(null);
                                  },
                                ),
                              Text(
                                  "${(snap.data.position / 1000).toStringAsFixed(3)}"),
                            ],
                          );
                        },
                      );
                    },
                  )
              ]
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton audioPlayerButton() => RaisedButton(
        child: Text('AudioPlayer'),
        onPressed: Player.start,
      );

  IconButton playButton() => IconButton(
        icon: Icon(Icons.play_arrow),
        iconSize: 64.0,
        onPressed: Player.play,
      );

  IconButton pauseButton() => IconButton(
        icon: Icon(Icons.pause),
        iconSize: 64.0,
        onPressed: Player.pause,
      );

  IconButton stopButton() => IconButton(
        icon: Icon(Icons.stop),
        iconSize: 64.0,
        onPressed: Player.stop,
      );
}
