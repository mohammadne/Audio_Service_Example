import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio_Service/model/audio/custom/audio_item/audio_item.dart';
import 'package:just_audio_Service/service/audio/service/audio_service_entrypoint.dart';

part 'fake_api_event.dart';
part 'fake_api_state.dart';

class FakeApiBloc extends Bloc<FakeApiEvent, FakeApiState> {
  @override
  FakeApiState get initialState => FakeApiInitial();

  @override
  Stream<FakeApiState> mapEventToState(FakeApiEvent event) async* {
    yield FakeApiLoading();
    await Future.delayed(Duration(seconds: 2));
    if (event is PlayPlayList1) {
      AudioServiceEntrypoint.updateQueue(<AudioItem>[
        AudioItem(
          id: "https://dl.melovaz.net/Free/2019/11/This%20Is%20Taylor%20Swift%20%282019%29%20MELOVAZ.NET/01%20Lover%20%28Remix%29.mp3",
          album: "This Is Taylor Swift",
          title: "Lover (Remix)",
          artist: "Taylor Swift",
          duration: Duration(milliseconds: 223000),
          artUri:
              "http://musicsbaran.ir/wp-content/uploads/2020/01/Taylor-Swift-Pic-77766.jpg",
        ),
        AudioItem(
          id: "https://dl.melovaz.net/Free/2019/11/This%20Is%20Taylor%20Swift%20%282019%29%20MELOVAZ.NET/01%20Lover%20%28Remix%29.mp3",
          album: "This Is Taylor Swift",
          title: "Blank Space",
          artist: "Taylor Swift",
          duration: Duration(milliseconds: 233000),
          artUri:
              "http://up.irandubstep.ir/view/2860777/Taylor%20Swift%20-%20You%20Need%20To%20Calm%20Down.jpg",
        ),
        AudioItem(
          id: "https://dl.melovaz.net/Free/2019/11/This%20Is%20Taylor%20Swift%20%282019%29%20MELOVAZ.NET/03%20Delicate.mp3",
          album: "This Is Taylor Swift",
          title: "Delicate",
          artist: "Taylor Swift",
          duration: Duration(milliseconds: 234000),
          artUri:
              "http://up.irandubstep.ir/view/2860777/Taylor%20Swift%20-%20You%20Need%20To%20Calm%20Down.jpg",
        ),
        AudioItem(
          id: "https://dl.melovaz.net/Free/2019/11/This%20Is%20Taylor%20Swift%20%282019%29%20MELOVAZ.NET/04%20You%20Need%20To%20Calm%20Down.mp3",
          album: "This Is Taylor Swift",
          title: "You Need To Calm Down",
          artist: "Taylor Swift",
          duration: Duration(milliseconds: 173000),
          artUri:
              "http://up.irandubstep.ir/view/2860777/Taylor%20Swift%20-%20You%20Need%20To%20Calm%20Down.jpg",
        ),
      ]);
    } else if (event is PlayPlayList2) {
      AudioServiceEntrypoint.updateQueue(<AudioItem>[
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
    yield FakeApiLoaded();
  }
}
