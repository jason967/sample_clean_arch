import 'package:dio/dio.dart';

class RestClient {
  final Dio _dio = Dio();

  static final RestClient _instance = RestClient._internal();

  Dio get getDio => _dio;

  factory RestClient() => _instance;

  RestClient._internal() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('[rest_client] api request : ${options.uri}');

          return handler.next(options);
        },
        onResponse: (options, handler) {
          print('[rest_client] api response : ${options.statusCode}');

          return handler.next(options);
        },
        onError: (DioException error, handler) {
          print(
            '[rest_client_error] error : ${error.response?.statusCode ?? 200}',
          );

          return handler.next(error);
        },
      ),
    );
  }
}
