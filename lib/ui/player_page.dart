import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_Service/service/audio/player_service.dart';

class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text('Player'),
              onPressed: () => PlayerService.start(),
            ),
            Text(AudioService.connected.toString())
          ],
        ),
      ),
    );
  }
}
