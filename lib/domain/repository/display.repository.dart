import '../../data/dto/display/menu/menu.dto.dart';
import '../../data/dto/response_wrapper/response_wrapper.dart';

abstract class DisplayRepository {
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(
    String mallType,
    Map<String, String> queryParams,
  );
}
