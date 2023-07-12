import 'package:dio/dio.dart';

class NetworkException extends DioException {
  NetworkException({required super.requestOptions});

  @override
  String toString() {
    return '쨔스 ${super.toString()}';
  }
}
