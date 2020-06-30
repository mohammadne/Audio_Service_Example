part of 'fake_api_bloc.dart';

abstract class FakeApiState extends Equatable {
  const FakeApiState();
}

class FakeApiInitial extends FakeApiState {
  @override
  List<Object> get props => [];
}
