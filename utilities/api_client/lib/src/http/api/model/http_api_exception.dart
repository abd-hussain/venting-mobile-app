import 'package:api_client/src/http/api/model/mobile_bff_base_error.dart';

/// Base class for all rest client exceptions
abstract class HttpApiException implements Exception {
  const HttpApiException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;
}

/// Base class for all rest client exceptions that have a cause
abstract class HttpApiExceptionWithCause extends HttpApiException {
  const HttpApiExceptionWithCause({
    required super.message,
    required this.cause,
    this.mobileBffBaseError,
    super.statusCode,
    this.stackTrace,
  });

  /// The cause of the exception
  ///
  /// It is the inner exception that caused this exception to be thrown
  final Object? cause;
  final StackTrace? stackTrace;
  final MobileBffBaseError? mobileBffBaseError;
}

/// [ClientException] is thrown if something went wrong on client side
class ClientException extends HttpApiException {
  const ClientException({
    required super.message,
    super.statusCode,
    this.mobileBffBaseError,
    this.cause,
    this.stackTrace,
  });

  /// The cause of the exception
  ///
  /// It is the inner exception that caused this exception to be thrown
  final Object? cause;
  final StackTrace? stackTrace;
  final MobileBffBaseError? mobileBffBaseError;

  @override
  String toString() =>
      'ClientException('
      'message: $message,'
      'statusCode: ${statusCode ?? ''},'
      'cause: ${cause ?? ''},'
      'stackTrace: ${stackTrace ?? ''}'
      ')';
}

/// [ConnectionException] is thrown if there are problems with the connection
class ConnectionException extends HttpApiExceptionWithCause {
  const ConnectionException({
    required super.message,
    super.statusCode,
    super.mobileBffBaseError,
    super.cause,
    super.stackTrace,
  });

  @override
  String toString() =>
      'ConnectionException('
      'message: $message,'
      'mobileBffBaseError: ${mobileBffBaseError ?? ''},'
      'statusCode: ${statusCode ?? ''},'
      'cause: ${cause ?? ''},'
      'stackTrace: ${stackTrace ?? ''}'
      ')';
}
