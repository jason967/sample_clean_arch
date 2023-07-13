import '../../../../core/utils/constant/display.dart';
import '../../../../core/utils/error/common_error.dart';
import '../../../../core/utils/exception/usecase_exception.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/logger.dart';
import '../../../model/common/result/result.dart';
import '../../../model/display/menu/menu.model.dart';
import '../../../repository/display.repository.dart';
import '../../base/remote.usecase.dart';

class GetMenusUsecase extends RemoteUsecase<DisplayRepository> {
  final MallType mallType;

  GetMenusUsecase({required this.mallType});

  @override
  Future<Result<List<Menu>>> call(DisplayRepository repository) async {
    final result = await repository.getMenusByMallType(
      mallType: mallType,
      queryParams: {},
    );

    return (result.status.isSuccess)
        ? Result.success(result.data ?? [])
        : Result.failure(
            CommonError(
              status: result.status,
              code: result.code,
              message: result.message,
            ),
          );
  }
}

// UsecaseErrorType _validateData(List<Menu> menus) {
//   // collections bar의 데이터가 없는 경우
//   if (menus.isEmpty) {
//     return 'GNB-1000';
//   }
//
//   return '0000';
// }
