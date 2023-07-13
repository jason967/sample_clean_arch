import 'dart:convert';
import 'dart:io';

import '../../dto/display/menu/menu.dto.dart';
import '../../dto/response_wrapper/response_wrapper.dart';
import '../remote/display_api.dart';
import 'display_mock_data.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(
    String mallType,
  ) async {
    throw SocketException('쨔쓰!');
    return Future(
      () => ResponseWrapper(
        status: 'fail',
        code: '0000',
        message: '서비스 에러 입니다.',
        data: menuParser(
          (mallType == 'market')
              ? DisplayMockData.menusByMarket
              : DisplayMockData.menusByBeauty,
        ),
      ),
    );
  }

  // parsers
  List<MenuDto> menuParser(String source) {
    List<MenuDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => MenuDto.fromJson(e)).toList();

    return menus;
  }
}
