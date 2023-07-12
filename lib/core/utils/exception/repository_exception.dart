class RepositoryException implements Exception {
  final Exception error;

  RepositoryException(this.error);

  @override
  String toString() {
    return '[Repository Error] ::: $error ';
  }
}
