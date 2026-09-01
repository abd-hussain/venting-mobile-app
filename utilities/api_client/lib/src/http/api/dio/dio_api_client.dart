import 'package:api_client/src/http/api/model/http_api_exception.dart';
import 'package:api_client/src/http/api/model/http_api_response.dart';
import 'package:api_client/src/http/api/model/mobile_bff_base_error.dart';
import 'package:api_client/src/http/api_client_base.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class DioApiClient extends ApiClientBase {
  DioApiClient(this._dio);

  final Dio _dio;

  Interceptors get interceptor => _dio.interceptors;

  @override
  TaskEither<Exception, HttpApiResponse<T>> get<T>(
    String path, {
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return HttpApiResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    }, _mapException);
  }

  @override
  TaskEither<Exception, HttpApiResponse<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) => TaskEither.tryCatch(() async {
    final response = await _dio.delete<T>(
      path,
      queryParameters: queryParams,
      options: Options(headers: headers),
      data: data,
    );

    return HttpApiResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }, _mapException);

  @override
  TaskEither<Exception, HttpApiResponse<T>> patch<T>(
    String path, {
    required Object? data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) => TaskEither.tryCatch(() async {
    final response = await _dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParams,
      options: data is FormData
          ? Options(headers: headers)
          : Options(headers: headers),
    );

    return HttpApiResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }, _mapException);

  @override
  TaskEither<Exception, HttpApiResponse<T>> post<T>(
    String path, {
    required Object? data,
    Map<String, Object?>? headers,
    String? contentType,
    Map<String, Object?>? queryParams,
  }) => TaskEither.tryCatch(() async {
    final response = await _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParams,
      options: data is FormData
          ? Options(headers: headers)
          : Options(headers: headers, contentType: contentType),
    );

    return HttpApiResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }, _mapException);

  @override
  TaskEither<Exception, HttpApiResponse<T>> put<T>(
    String path, {
    required Object? data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) => TaskEither.tryCatch(() async {
    final response = await _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );

    return HttpApiResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }, _mapException);

  Exception _mapException(Object error, StackTrace stackTrace) {
    if (error case final DioException dioException) {
      if (dioException.type == DioExceptionType.connectionTimeout ||
          dioException.type == DioExceptionType.connectionError ||
          dioException.type == DioExceptionType.receiveTimeout ||
          dioException.type == DioExceptionType.sendTimeout) {
        return ConnectionException(
          message: 'ConnectionException',
          statusCode: error.response?.statusCode,
          cause: error,
          stackTrace: stackTrace,
        );
      }
      return ClientException(
        message: error.toString(),
        statusCode: error.response?.statusCode,
        cause: error,
        mobileBffBaseError: error.response?.data is Map<String, dynamic>
            ? MobileBffBaseError.fromJson(
                error.response?.data as Map<String, dynamic>,
              )
            : null,
        stackTrace: stackTrace,
      );
    }
    return ClientException(
      message: error.toString(),
      cause: error,
      stackTrace: stackTrace,
    );
  }

  @override
  Future<Response<T>> request<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.request<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
