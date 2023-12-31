import '../../core/utils/constant/display.dart';
import '../../data/dto/response_wrapper/response_wrapper.dart';
import '../model/display/menu/menu.model.dart';
import 'repository.dart';

abstract class DisplayRepository extends Repository {
  Future<ResponseWrapper<List<Menu>>> getMenusByMallType({
    required MallType mallType,
    required Map<String, String> queryParams,
  });
}
