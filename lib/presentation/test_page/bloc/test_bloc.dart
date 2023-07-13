import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/constant/display.dart';
import '../../../core/utils/error/common_error.dart';
import '../../../core/utils/exception/repository_exception.dart';
import '../../../core/utils/exception/usecase_exception.dart';
import '../../../core/utils/logger.dart';
import '../../../core/utils/rest_client/rest_client.dart';
import '../../../data/data_source/mock/display_mock_api.dart';
import '../../../data/data_source/remote/display_api.dart';
import '../../../data/repository_impl/display.repositoryImpl.dart';
import '../../../domain/model/common/result/result.dart';
import '../../../domain/model/display/menu/menu.model.dart';
import '../../../domain/usecase/display/display.usecase.dart';
import '../../../domain/usecase/display/menu/get_menus.usecase.dart';

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
    final mallType = event.mallType;

    emit(state.copyWith(status: Status.loading));
    await Future.delayed(Duration(seconds: 3));
    try {
      // 테스트용
      // final displayApi = DisplayApi(RestClient().getDio);
      final displayApi = DisplayMockApi();
      final displayRepository = DisplayRepositoryImpl(displayApi);
      final displayUsecase = DisplayUsecase(displayRepository);

      // 데이터 호출
      final Result<List<Menu>> response = await displayUsecase.excute(
        usecase: GetMenusUsecase(mallType: mallType),
      );

      response.when(
        success: (data) {
          final menus = data;
          emit(state.copyWith(status: Status.success, menus: menus));
        },
        failure: (error) {
          emit(state.copyWith(status: Status.failure, error: error));
        },
      );
      // 밑 부분은 더 손볼 듯
    } on DioException catch (error) {
      CustomLogger.logger.e(error);

      emit(state.copyWith(
        status: Status.failure,
        error: CommonError(
          status: 'network error',
          code: (error.type == DioExceptionType.badResponse)
              ? error.response?.statusCode.toString()
              : '7777',
          message: 'network error가 발생했습니다.',
        ),
      ));
    } on Exception catch (error) {
      CustomLogger.logger.e(error);

      emit(state.copyWith(
        status: Status.failure,
        error: CommonError(
          status: 'common error',
          code: '9999',
          message: '일반적인 error가 발생했습니다.',
        ),
      ));
    } catch (error) {
      emit(state.copyWith(
        status: Status.failure,
        error: CommonError(
          status: 'unknown error',
          code: '-1',
          message: '알수 없는 오류가 발생했습니다.',
        ),
      ));
    }
  }
}
