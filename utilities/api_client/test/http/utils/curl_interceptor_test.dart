import 'package:api_client/src/http/utils/curl_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockResponseHandler extends Mock implements ResponseInterceptorHandler {}

class _MockErrorHandler extends Mock implements ErrorInterceptorHandler {}

void main() {
  late CurlInterceptor interceptor;
  late _MockResponseHandler responseHandler;
  late _MockErrorHandler errorHandler;

  setUp(() {
    interceptor = const CurlInterceptor();
    responseHandler = _MockResponseHandler();
    errorHandler = _MockErrorHandler();
  });

  test('onResponse forwards the response', () {
    final options = RequestOptions(
      path: 'https://api.test/users',
      method: 'POST',
      headers: {'Authorization': 'Bearer x', 'Cookie': 'sid=1'},
      data: {'name': 'zain'},
    );
    final response = Response(requestOptions: options, statusCode: 200);

    interceptor.onResponse(response, responseHandler);

    verify(() => responseHandler.next(response)).called(1);
  });

  test('onError forwards the error', () {
    final options = RequestOptions(
      path: 'https://api.test/fail',
      method: 'GET',
    );
    final err = DioException(requestOptions: options);

    interceptor.onError(err, errorHandler);

    verify(() => errorHandler.next(err)).called(1);
  });

  test('converts FormData when enabled', () {
    final formData = FormData.fromMap({'field': 'value'});
    final options = RequestOptions(
      path: 'https://api.test/upload',
      method: 'POST',
      data: formData,
    );
    final response = Response(requestOptions: options, statusCode: 200);

    interceptor.onResponse(response, responseHandler);

    verify(() => responseHandler.next(response)).called(1);
  });

  test('skips FormData conversion when disabled', () {
    interceptor = const CurlInterceptor(convertFormData: false);
    final formData = FormData.fromMap({'field': 'value'});
    final options = RequestOptions(
      path: 'https://api.test/upload',
      method: 'POST',
      data: formData,
    );
    final response = Response(requestOptions: options, statusCode: 200);

    interceptor.onResponse(response, responseHandler);

    verify(() => responseHandler.next(response)).called(1);
  });
}
