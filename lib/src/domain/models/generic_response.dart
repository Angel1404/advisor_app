class GenericResponse<T> {
  final T? data;
  final String? error;
  final bool isError;
  GenericResponse({this.data, this.error, this.isError = false});

  static errorStr(String e) => GenericResponse(error: e, isError: true);
}
