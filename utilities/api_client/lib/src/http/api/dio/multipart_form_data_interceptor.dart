import 'package:dio/dio.dart';

/// Ensures [FormData] requests keep an unset Content-Type so Dio adds the
/// multipart boundary. Run this interceptor **last** in the chain.
class MultipartFormDataInterceptor extends Interceptor {
  const MultipartFormDataInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.data is FormData) {
      options.headers.remove(Headers.contentTypeHeader);
      options.headers.remove('content-type');
      options.contentType = null;
    }
    handler.next(options);
  }
}
