import 'package:dio/dio.dart';

import '../../domain/repository/display.repository.dart';
import '../data_source/remote/display_api.dart';
import '../dto/display/menu/menu.dto.dart';
import '../dto/response_wrapper/response_wrapper.dart';

class DisplayRepositoryImpl implements DisplayRepository {
  final DisplayApi _displayApi;

  DisplayRepositoryImpl(this._displayApi);

  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(
    String mallType,
    Map<String, String> queryParams,
  ) async {
    try {
      return await _displayApi.getMenusByMallType(mallType: mallType);
    } on DioException catch (err) {
      // print('[error] $err');
      // rethrow;
      throw Exception(err);
    }
  }
}
