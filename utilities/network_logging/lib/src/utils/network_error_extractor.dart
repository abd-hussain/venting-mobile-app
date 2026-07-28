import 'dart:convert';

/// Formats API response data for display in network logs.
String? formatResponseBody(dynamic data) {
  if (data == null) return null;
  if (data is String) return data;
  if (data is Map || data is List) {
    try {
      return const JsonEncoder.withIndent('  ').convert(data);
    } catch (_) {
      return data.toString();
    }
  }
  return data.toString();
}

/// Normalizes error response data to a JSON map when possible.
Map<String, dynamic>? normalizeErrorJson(dynamic data) {
  if (data is Map<String, dynamic>) return data;
  if (data is Map) return Map<String, dynamic>.from(data);
  if (data is String && data.trim().isNotEmpty) {
    try {
      final decoded = jsonDecode(data);
      if (decoded is Map) return Map<String, dynamic>.from(decoded);
    } catch (_) {
      return null;
    }
  }
  return null;
}

/// Extracts a human-readable error message from common API error payloads.
String? extractErrorMessage(dynamic data, {String? fallback}) {
  if (data is String) {
    final trimmed = data.trim();
    if (trimmed.isEmpty) return fallback;

    final decoded = normalizeErrorJson(trimmed);
    if (decoded != null) {
      return _extractFromJson(decoded) ?? trimmed;
    }
    return trimmed;
  }

  final json = normalizeErrorJson(data);
  if (json != null) {
    return _extractFromJson(json) ?? fallback;
  }

  return fallback;
}

String? _extractFromJson(Map<String, dynamic> json) {
  final errorNode = json['error'];
  if (errorNode is Map) {
    final errorMap = errorNode is Map<String, dynamic>
        ? errorNode
        : Map<String, dynamic>.from(errorNode);

    final message = _nonEmptyString(errorMap['message']);
    if (message != null) return message;

    final description = _nonEmptyString(errorMap['description']);
    if (description != null) return description;

    final localized = errorMap['localized_message'];
    if (localized is Map && localized.isNotEmpty) {
      for (final value in localized.values) {
        final localizedMessage = _nonEmptyString(value);
        if (localizedMessage != null) return localizedMessage;
      }
    }
  }

  if (errorNode is String) {
    final errorString = _nonEmptyString(errorNode);
    if (errorString != null) return errorString;
  }

  final rootMessage = _nonEmptyString(json['message']);
  if (rootMessage != null) return rootMessage;

  final title = _nonEmptyString(json['title']);
  if (title != null) return title;

  final detail = _nonEmptyString(json['detail']);
  if (detail != null) return detail;

  return null;
}

String? _nonEmptyString(Object? value) {
  if (value == null) return null;
  final text = value.toString().trim();
  return text.isEmpty ? null : text;
}
