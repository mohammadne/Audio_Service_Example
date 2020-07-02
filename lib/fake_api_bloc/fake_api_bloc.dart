import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio_Service/model/audio/custom/player_item/audio_item.dart';
import 'package:just_audio_Service/service/audio/service/audio_service_entrypoint.dart';

part 'fake_api_event.dart';
part 'fake_api_state.dart';

class FakeApiBloc extends Bloc<FakeApiEvent, FakeApiState> {
  @override
  FakeApiState get initialState => FakeApiInitial();

  @override
  Stream<FakeApiState> mapEventToState(FakeApiEvent event) async* {
    if (event is PlayPlayList1) {
      AudioServiceEntrypoint.setQueue(<AudioItem>[
        AudioItem(
          id: "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
          album: "Science Friday",
          title: "A Salute To Head-Scratching Science",
          artist: "Science Friday and WNYC Studios",
          duration: Duration(milliseconds: 5739820),
          artUri:
              "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
        ),
        AudioItem(
          id: "https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3",
          album: "Science Friday",
          title: "From Cat Rheology To Operatic Incompetence",
          artist: "Science Friday and WNYC Studios",
          duration: Duration(milliseconds: 2856950),
          artUri:
              "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
        ),
      ]);
    } else if (event is PlayPlayList2) {
      AudioServiceEntrypoint.setQueue(<AudioItem>[
        AudioItem(
          id: "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
          album: "Science Friday",
          title: "A Salute To Head-Scratching Science",
          artist: "Science Friday and WNYC Studios",
          duration: Duration(milliseconds: 5739820),
          artUri:
              "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
        ),
        AudioItem(
          id: "https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3",
          album: "Science Friday",
          title: "From Cat Rheology To Operatic Incompetence",
          artist: "Science Friday and WNYC Studios",
          duration: Duration(milliseconds: 2856950),
          artUri:
              "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
        ),
      ]);
    }
  }
}
