import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/rest_client/rest_client.dart';
import '../../../data/data_source/remote/display_api.dart';
import '../../../data/repository_impl/display.repositoryImpl.dart';
import '../../../domain/repository/display.repository.dart';

part 'test_event.dart';

part 'test_state.dart';

part 'test_bloc.freezed.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestState()) {
    on<TestInitialized>(_onTestInitialized);
  }

  Future<void> _onTestInitialized(
    TestInitialized event,
    Emitter<TestState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final displayApi = DisplayApi(RestClient().getDio);
    final mallType = event.mallType;
    final response = await DisplayRepositoryImpl(displayApi)
        .getMenusByMallType(mallType, {});

    print('[test] $response');
    emit(state.copyWith(status: Status.success));
  }
}
