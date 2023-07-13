import 'common_error.dart';

class ServiceError extends CommonError {
  @override
  String toString() {
    return '[service error] ::: ${super.toString()}';
  }
}
