import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fake_api_event.dart';
part 'fake_api_state.dart';

class FakeApiBloc extends Bloc<FakeApiEvent, FakeApiState> {
  @override
  FakeApiState get initialState => FakeApiInitial();

  @override
  Stream<FakeApiState> mapEventToState(FakeApiEvent event) async* {
    // TODO: implement mapEventToState
  }
}
