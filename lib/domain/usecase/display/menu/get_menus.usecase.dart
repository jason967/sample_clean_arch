import '../../../../core/utils/constant/display.dart';
import '../../../../core/utils/extensions.dart';
import '../../../model/common/result/result.dart';
import '../../../model/common/service_state/service_state.dart';
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
    final isSuccess = result.status.isSuccess;

    return isSuccess
        ? Result.success(result.data ?? [])
        : Result.error(
            ServiceState(
              status: result.status,
              code: result.code,
              message: result.message,
            ),
          );
  }
}

ServiceState _validateMenus(List<Menu> menus) {
  // collections bar의 데이터가 없는 경우
  if (menus.isEmpty) {
    final code = 'GNB-0000';
    final status = 'collection data is empty';
    final message = '서비스에 일시적인 오류가 발생했습니다. 잠시 후에 다시 시도해주세요';

    return ServiceState(status: status, code: code, message: message);
  }

  return ServiceState();
}
