import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../dto/display/menu/menu.dto.dart';
import '../../dto/response_wrapper/response_wrapper.dart';

part 'display_api.g.dart';

@RestApi(baseUrl: 'https://www.example.com/')
abstract class DisplayApi {
  factory DisplayApi(Dio _dio, {String? baseUrl}) = _DisplayApi;

  @GET('/api/v1/main/{mall_type}')
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType({
    @Path('mall_type') required String mallType,
  });
}
