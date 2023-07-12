part of 'test_bloc.dart';

enum Status { initialized, loading, success, failure }

@freezed
class TestState with _$TestState {
  factory TestState({
    @Default(Status.initialized) Status status,
  }) = _TestState;
}
