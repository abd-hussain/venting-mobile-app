import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

class MainAPIException implements Exception {
  final String status; // e.g., "failed"
  final String type; // e.g., "auth"
  final int code; // e.g., 100
  final String message;
  final Map<String, String>? localizedMessage;
  final StackTrace? stackTrace;

  const MainAPIException({
    required this.status,
    required this.type,
    required this.code,
    required this.message,
    this.localizedMessage,
    this.stackTrace,
  });

  factory MainAPIException.fromJson(Map<String, dynamic> json) {
    final Object? errorObj = json['error'];
    final Map<String, dynamic> error = errorObj is Map<String, dynamic>
        ? errorObj
        : const <String, dynamic>{};

    // Extract localized messages
    final Object? localizedObj = error['localized_message'];
    Map<String, String>? localizedMessage;
    if (localizedObj is Map<String, dynamic>) {
      localizedMessage = localizedObj.map(
        (key, value) => MapEntry(key, value.toString()),
      );
    }

    return MainAPIException(
      status: (json['status'] as String?) ?? 'failed',
      type: (error['type'] as String?) ?? 'unknown',
      code: (error['code'] is int)
          ? error['code'] as int
          : int.tryParse('${error['code']}') ?? -1,
      message: (error['message'] as String?) ?? '',
      localizedMessage: localizedMessage,
    );
  }

  String getLocalizedMessage([String? languageCode]) {
    final code =
        languageCode ?? VentingMobLocalizationsHolder.currentLanguageCode;
    if (localizedMessage != null && localizedMessage!.containsKey(code)) {
      return localizedMessage![code]!;
    }
    if (message.isNotEmpty) {
      return message;
    }
    return VentingMobLocalizationsHolder.withLocale(
      code,
      (l10n) => l10n.common_unknown_error,
    );
  }

  @override
  String toString() => 'MainAPIException($status/$type#$code): $message';
}
