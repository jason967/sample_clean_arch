import '../../core/utils/constant/display.dart';
import '../../core/utils/exception/repository_exception.dart';
import '../../domain/model/display/menu/menu.model.dart';
import '../../domain/repository/display.repository.dart';
import '../data_source/remote/display_api.dart';
import '../dto/response_wrapper/response_wrapper.dart';
import '../mapper/display.mapper.dart';

class DisplayRepositoryImpl implements DisplayRepository {
  final DisplayApi _displayApi;

  DisplayRepositoryImpl(this._displayApi);

  @override
  Future<ResponseWrapper<List<Menu>>> getMenusByMallType({
    required MallType mallType,
    required Map<String, String> queryParams,
  }) async {
    try {
      final response = await _displayApi.getMenusByMallType(mallType.name);
      final List<Menu> data =
          response.data?.map((e) => e.toModel()).toList() ?? [];

      return ResponseWrapper<List<Menu>>(
        status: response.status,
        code: response.code,
        message: response.message,
        data: data,
      );
    } on Exception catch (error) {
      throw RepositoryException(error);
    }
  }
}
