class ResponseError implements Exception {
  final Map error;
  ResponseError(this.error);
}
