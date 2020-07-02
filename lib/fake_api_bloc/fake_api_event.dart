part of 'fake_api_bloc.dart';

abstract class FakeApiEvent extends Equatable {
  const FakeApiEvent();
}

class PlayPlayList1 extends FakeApiEvent {
  @override
  List<Object> get props => [];
}

class PlayPlayList2 extends FakeApiEvent {
  @override
  List<Object> get props => [];
}
