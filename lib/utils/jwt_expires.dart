import 'dart:convert';

/// Helpers for JWT expiry using `exp` (standard) or `expires` (unix seconds).
///
/// Treat as expired when claim <= now (seconds). Decoding is unverified —
/// we only need the claim for local refresh decisions, not auth trust.
class JwtExpires {
  const JwtExpires._();

  /// Returns `true` when the token is past expiry (with clock-skew leeway).
  ///
  /// Returns `false` when expiry cannot be read — do not treat unknown/`exp`-less
  /// tokens as expired (that falsely triggers refresh right after login).
  static bool isExpired(
    String token, {
    DateTime? now,
    Duration leeway = const Duration(seconds: 120),
  }) {
    final expiresAt = readExpires(token);
    if (expiresAt == null) return false;
    final currentSeconds =
        (now ?? DateTime.now()).millisecondsSinceEpoch ~/ 1000;
    return expiresAt <= (currentSeconds - leeway.inSeconds);
  }

  /// Returns `true` when a non-empty token exists and is not past expiry.
  /// Tokens without a readable `exp` are treated as usable.
  static bool isUsable(String token, {DateTime? now}) {
    if (token.isEmpty) return false;
    return !isExpired(token, now: now);
  }

  /// Reads `exp` or `expires` (seconds). Returns null if absent/unreadable.
  static int? readExpires(String token) {
    if (token.isEmpty) return null;
    try {
      final parts = token.split('.');
      if (parts.length < 2) return null;
      final payload = utf8.decode(base64Url.decode(_normalize(parts[1])));
      final decoded = jsonDecode(payload);
      if (decoded is! Map) return null;

      final expires = decoded['exp'] ?? decoded['expires'];
      if (expires is num) return expires.toInt();
      if (expires is String) return int.tryParse(expires);
      return null;
    } on Object {
      return null;
    }
  }

  static String _normalize(String input) {
    final normalized = input.replaceAll('-', '+').replaceAll('_', '/');
    final pad = (4 - normalized.length % 4) % 4;
    return normalized.padRight(normalized.length + pad, '=');
  }
}
