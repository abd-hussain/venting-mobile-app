import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';

/// Base repository class that provides common error handling and response parsing
/// for all API repositories.
abstract class BaseRepository {
  final ApiClientBase apiClient;
  const BaseRepository(this.apiClient);

  MainAPIException mapTransportErrorToException(Exception exception) {
    if (exception is ClientException) {
      if (exception.cause is DioException) {
        final dioException = exception.cause! as DioException;
        if (dioException.response?.data is Map<String, dynamic>) {
          final responseData =
              dioException.response!.data as Map<String, dynamic>;
          if (responseData.containsKey('error') ||
              responseData.containsKey('status')) {
            return MainAPIException.fromJson(responseData);
          }
        }
      }

      return MainAPIException(
        status: 'failed',
        type: 'client',
        code: exception.statusCode ?? -10,
        message: exception.message,
      );
    }

    if (exception is HttpApiException) {
      final int status = exception.statusCode ?? -10;
      return MainAPIException(
        status: 'failed',
        type: 'network',
        code: status,
        message: exception.message,
      );
    }

    return MainAPIException(
      status: 'failed',
      type: 'unknown',
      code: -10,
      message: exception.toString(),
    );
  }

  MainAPIException mapUnknownErrorToException(
    Object error,
    StackTrace stackTrace,
  ) {
    if (error is MainAPIException) return error;
    return MainAPIException(
      status: 'failed',
      type: 'unknown',
      code: -1,
      message: error.toString(),
      stackTrace: stackTrace,
    );
  }

  Map<String, dynamic> normalizeToJsonMap(Object? data) {
    if (data is Map<String, dynamic>) return data;
    if (data is String) {
      final Object? decoded = jsonDecode(data);
      if (decoded is Map<String, dynamic>) return decoded;
      throw MainAPIException(
        status: 'failed',
        type: 'parse',
        code: -3,
        message: 'Decoded JSON is not an object. Got ${decoded.runtimeType}.',
      );
    }
    if (data == null) {
      throw const MainAPIException(
        status: 'failed',
        type: 'parse',
        code: -5,
        message: 'Empty response body (null).',
      );
    }
    throw MainAPIException(
      status: 'failed',
      type: 'parse',
      code: -2,
      message:
          'Unexpected response type: ${data.runtimeType}. Expected JSON object.',
    );
  }

  T parseSuccessfulResponse<T>(
    Object? data,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final Map<String, dynamic> json = normalizeToJsonMap(data);
    final String? status = json['status'] as String?;
    if (status == 'failed') {
      throw MainAPIException.fromJson(json);
    }
    return fromJson(json);
  }

  TaskEither<Exception, T> executeRequest<T>({
    required TaskEither<Exception, HttpApiResponse<Object?>> request,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    return request
        .mapLeft(mapTransportErrorToException)
        .flatMap(
          (response) => TaskEither.tryCatch(
            () async => parseSuccessfulResponse(response.data, fromJson),
            mapUnknownErrorToException,
          ),
        );
  }

  TaskEither<Exception, void> executeVoidRequest({
    required TaskEither<Exception, HttpApiResponse<Object?>> request,
  }) {
    return request
        .mapLeft(mapTransportErrorToException)
        .flatMap(
          (response) =>
              TaskEither.tryCatch(() async => null, mapUnknownErrorToException),
        );
  }
}
