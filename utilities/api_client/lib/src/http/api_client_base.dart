import 'package:api_client/src/http/api/model/http_api_response.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

abstract class ApiClientBase {
  TaskEither<Exception, HttpApiResponse<T>> get<T>(
    String path, {
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  });

  TaskEither<Exception, HttpApiResponse<T>> post<T>(
    String path, {
    required Object? data,
    Map<String, Object?>? headers,
    String? contentType,
    Map<String, Object?>? queryParams,
  });

  TaskEither<Exception, HttpApiResponse<T>> put<T>(
    String path, {
    required Object? data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  });

  TaskEither<Exception, HttpApiResponse<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  });

  TaskEither<Exception, HttpApiResponse<T>> patch<T>(
    String path, {
    required Object? data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  });

  Future<Response<T>> request<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}
