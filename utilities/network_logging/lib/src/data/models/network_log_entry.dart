import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_log_entry.freezed.dart';
part 'network_log_entry.g.dart';

/// Enum to distinguish between different types of network events
enum NetworkEventType {
  /// HTTP/HTTPS requests
  http,

  /// WebSocket/Socket events
  socket,
}

@freezed
abstract class NetworkLogEntry with _$NetworkLogEntry {
  const factory NetworkLogEntry({
    required String id,
    required String url,
    required String method,
    required DateTime requestTimestamp,
    DateTime? responseTimestamp,
    required Map<String, dynamic> requestHeaders,
    String? requestBody,
    int? statusCode,
    Map<String, dynamic>? responseHeaders,
    String? responseBody,
    String? errorMessage,
    int? duration, // in milliseconds
    @Default(false) bool isSensitive,
    @Default(false) bool isBodyTruncated,
    int? requestBodySize,
    int? responseBodySize,
    // Socket-specific fields
    @Default(NetworkEventType.http) NetworkEventType eventType,
    String?
    socketEvent, // Original socket event name (e.g., "SubscribeToQuotes")
    List<String>? socketTargets, // Socket targets
    List<Object>? socketArgs, // Socket arguments
  }) = _NetworkLogEntry;

  factory NetworkLogEntry.fromJson(Map<String, dynamic> json) =>
      _$NetworkLogEntryFromJson(json);
}

extension NetworkLogEntryExtensions on NetworkLogEntry {
  bool get hasError => errorMessage != null;
  bool get isComplete => responseTimestamp != null;
  bool get isSocket => eventType == NetworkEventType.socket;
  bool get isHttp => eventType == NetworkEventType.http;

  String get statusText {
    if (statusCode == null) return 'Pending';
    if (statusCode! >= 200 && statusCode! < 300) return 'Success';
    if (statusCode! >= 400 && statusCode! < 500) return 'Client Error';
    if (statusCode! >= 500) return 'Server Error';
    return 'Unknown';
  }

  /// Get display name for the event (HTTP method or socket event type)
  String get displayMethod {
    if (isSocket) {
      return method; // For socket: SUBSCRIBE, UNSUBSCRIBE, etc.
    }
    return method; // For HTTP: GET, POST, etc.
  }

  /// Get the event name for display (path for HTTP, socket event for socket)
  String get displayEventName {
    if (isSocket) {
      return socketEvent ?? 'Socket Event';
    }
    // For HTTP, extract path from URL
    try {
      final uri = Uri.parse(url);
      return uri.path.isEmpty ? '/' : uri.path;
    } catch (e) {
      return url;
    }
  }
}
