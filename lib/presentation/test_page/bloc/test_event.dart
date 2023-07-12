part of 'test_bloc.dart';

abstract class TestEvent {
  const TestEvent();
}

class TestInitialized extends TestEvent {
  final MallType mallType;

  TestInitialized(this.mallType);
}
