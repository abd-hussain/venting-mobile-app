import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class CurlInterceptor extends Interceptor {
  final bool? printOnSuccess;
  final bool convertFormData;

  const CurlInterceptor({this.printOnSuccess, this.convertFormData = true});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _renderCurlRepresentation(err.requestOptions);
    return handler.next(err); //continue
  }

  @override
  void onResponse(
    Response<Object?> response,
    ResponseInterceptorHandler handler,
  ) {
    _renderCurlRepresentation(response.requestOptions);

    return handler.next(response); //continue
  }

  void _renderCurlRepresentation(RequestOptions requestOptions) {
    // add a breakpoint here so all errors can break
    try {
      log(_cURLRepresentation(requestOptions));
    } catch (err) {
      log('unable to create a CURL representation of the requestOptions');
    }
  }

  String _cURLRepresentation(RequestOptions options) {
    final List<String> components = ['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options.data != null) {
      // Never mutate the live request — FormData may be retried.
      Object? payload = options.data;
      if (payload is FormData && convertFormData == true) {
        final files = payload.files
            .map((e) => MapEntry(e.key, 'FILE(${e.value.filename})'))
            .toList(growable: false);
        payload = Map<String, Object?>.fromEntries([
          ...payload.fields,
          ...files,
        ]);
      }

      final data = json.encode(payload).replaceAll('"', '\\"');
      components.add('-d "$data"');
    }

    // ignore: noop_primitive_operations
    components.add('"${options.uri.toString()}"');

    return components.join(' \\\n\t');
  }
}
