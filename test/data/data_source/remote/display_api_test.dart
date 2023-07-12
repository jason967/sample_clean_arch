import 'package:dio/dio.dart';
import 'package:e_sample_ver_2/data/data_source/remote/display_api.dart';
import 'package:e_sample_ver_2/data/dto/display/menu/menu.dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'display_api_test.mocks.dart';

@GenerateMocks([Dio, Interceptors])
void main() {
  group('test', () {
    final baseUrl = 'https://www.example.com';
    final MockDio mockDio = MockDio();
    final mockDisplayApi = DisplayApi(mockDio);
    test('생성자 테스트', () {
      expect(mockDisplayApi, isNotNull);
    });

    test('api response 404', () async {
      final path = '/api/main/market';
      final mockInterceptors = MockInterceptors();
      final interceptor = InterceptorsWrapper(onError: (error, handler) {
        print('[test error] ${error}');
        return handler.next(error);
      }, onRequest: (options, handler) {
        print('[test] request : ${options.uri}');
      });
      when(mockInterceptors.add(interceptor)).thenReturn(null);
      when(mockDio.interceptors).thenReturn(mockInterceptors);

      when(mockDio.options).thenReturn(BaseOptions(baseUrl: baseUrl));
      final error = DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(path: path),
          statusCode: 404,
        ),
      );
      // when(mockDio.fetch(any)).thenThrow(error);
      // when(mockDio.fetch(argThat(
      //     having(
      //           (RequestOptions options) => options.path,
      //       'path is /api/main/market',
      //       '/api/main/market',
      //     ))).thenAnswer(
      //       (_) async =>
      //       Response<List<dynamic>>(
      //         requestOptions: RequestOptions(),
      //         statusCode: 404,
      //         data: [
      //           {"title": "안녕하슈"}
      //         ],
      //       ),
      // );
      // when(mockDio.fetch(any)).thenThrow(
      //   DioException(
      //     requestOptions: RequestOptions(),
      //     type: DioExceptionType.badResponse,
      //     message: '안녕하세요',
      //   ),
      // );

      final request =
          await mockDisplayApi.getMenusByMallType(mallType: 'market');

      print('[test] $request');
      expect(mockDisplayApi.getMenusByMallType(mallType: 'market'),
          throwsA(isA<DioException>()));
      // print(request);
    });
  });
}
