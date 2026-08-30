import 'dart:convert';

import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/auth_me_response_model.dart';

/// Persists the latest successful `/v1/auth/me` payload for offline reads.
class AuthMeCacheRepository {
  const AuthMeCacheRepository(this._preferences);

  final VentingPreferences _preferences;

  Future<void> save(AuthMeData data) async {
    await _preferences.setValue(
      SavedConstants.cachedAuthMe,
      jsonEncode(data.toJson()),
    );
  }

  AuthMeData? read() {
    final raw = _preferences.getValue<String>(SavedConstants.cachedAuthMe, '');
    if (raw.isEmpty) {
      return null;
    }

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) {
        return null;
      }
      return AuthMeData.fromJson(decoded);
    } on Object {
      return null;
    }
  }

  Future<void> clear() => _preferences.remove(SavedConstants.cachedAuthMe);
}
