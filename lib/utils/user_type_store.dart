import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';

/// Persists and resolves the signed-in app role (ventor / listener).
abstract final class UserTypeStore {
  static const _ventor = 'ventor';
  static const _listener = 'lissener';

  static Future<void> save(
    VentingPreferences preferences,
    AuthUserType userType,
  ) async {
    final value = switch (userType) {
      AuthUserType.ventor => _ventor,
      AuthUserType.lissener => _listener,
    };
    await preferences.setValue(SavedConstants.userType, value);
  }

  static AuthUserType? read(VentingPreferences preferences) {
    final raw = preferences.getValue<String>(SavedConstants.userType, '');
    return switch (raw) {
      _ventor => AuthUserType.ventor,
      _listener => AuthUserType.lissener,
      _ => null,
    };
  }
}
