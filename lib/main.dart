import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'model/player_service/play_back_state/player_service_play_back_state.dart';
import 'ui/player_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  await Hive.openBox<PlayerServicePlayBackState>(
    'player_service_play_back_state',
  );
  return runApp(new MyApp());
}

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
