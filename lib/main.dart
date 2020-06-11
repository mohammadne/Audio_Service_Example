import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

import 'player_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AudioServiceWidget(
      child: MaterialApp(
        title: 'Just Audio Service Example',
        home: PlayerPage(),
      ),
    );
  }
}
