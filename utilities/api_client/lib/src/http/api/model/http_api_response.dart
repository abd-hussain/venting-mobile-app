class HttpApiResponse<T> {
  const HttpApiResponse({this.data, this.statusCode, this.statusMessage});

  final T? data;
  final int? statusCode;
  final String? statusMessage;
}
