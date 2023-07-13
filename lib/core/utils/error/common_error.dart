class CommonError {
  final String? status;
  final String? code;
  final String? message;

  CommonError({this.status = 'SUCCESS', this.code = '0000', this.message = ''});

  @override
  String toString() {
    return '{status : $status, code : $code, message : $message}';
  }
}
