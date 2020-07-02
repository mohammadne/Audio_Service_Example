import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio_Service/fake_api_bloc/fake_api_bloc.dart';

import 'ui/player_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AudioServiceWidget(
      child: BlocProvider<FakeApiBloc>(
        create: (_) => FakeApiBloc(),
        child: MaterialApp(
          title: 'Just Audio Service Example',
          home: PlayerPage(),
        ),
      ),
    );
  }
}
