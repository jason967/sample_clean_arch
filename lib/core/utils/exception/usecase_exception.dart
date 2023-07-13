class UsecaseException implements Exception {
  final Exception error;

  UsecaseException(this.error);

  @override
  String toString() {
    return '[UseCase Error] ::: $error ';
  }
}
