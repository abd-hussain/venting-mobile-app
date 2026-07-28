import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

/// Provides device and app information for API headers
class DeviceInfoProvider {
  DeviceInfoProvider(this._preferences);

  final VentingPreferences _preferences;

  /// Gets the installation ID, generating and storing it if it doesn't exist
  Future<String> getInstallationId() async {
    final existingId = _preferences.getValue<String>(
      SavedConstants.installationId,
      '',
    );
    if (existingId.isNotEmpty) {
      return existingId;
    }

    // Generate a new installation ID
    final deviceInfo = DeviceInfoPlugin();
    String deviceId;
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? '';
    } else {
      deviceId = DateTime.now().millisecondsSinceEpoch.toString();
    }

    // Create a unique installation ID by combining device ID with timestamp
    final installationId =
        '${deviceId}_${DateTime.now().millisecondsSinceEpoch}';
    await _preferences.setValue<String>(
      SavedConstants.installationId,
      installationId,
    );
    return installationId;
  }

  /// Gets the platform name (Android or iOS)
  String getPlatform() {
    if (Platform.isAndroid) return 'Android';
    if (Platform.isIOS) return 'iOS';
    return 'Unknown';
  }

  /// Gets the OS version
  Future<String> getOsVersion() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.release;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.systemVersion;
    }
    return 'Unknown';
  }

  /// Gets the app version
  Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// Returns the app's current language code (synced via VentingMobLocalizationsHolder).
  String getLanguageCode() => VentingMobLocalizationsHolder.currentLanguageCode;

  /// Gets the user-agent string for HTTP requests
  /// Format: "Galleon/{version} {platform_info}"
  Future<String> getUserAgent() async {
    final appVersion = await getAppVersion();
    final platform = getPlatform();
    final osVersion = await getOsVersion();

    if (Platform.isIOS) {
      // iOS format: "Galleon/{version} CFNetwork/{version} Darwin/{version}"
      // Using simplified format since we don't have CFNetwork/Darwin versions
      return 'Zalleon/$appVersion ($platform $osVersion)';
    } else if (Platform.isAndroid) {
      // Android format: "Galleon/{version} (Linux; Android {version}; {device_model})"
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      return 'Zalleon/$appVersion (Linux; Android $osVersion; ${androidInfo.model})';
    }

    return 'Zalleon/$appVersion';
  }

  /// Gets the phone version (device model and manufacturer)
  Future<String> getPhoneVersion() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final manufacturer = androidInfo.manufacturer;
      final model = androidInfo.model;
      return '$manufacturer $model';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      final model = iosInfo.model;
      final name = iosInfo.name;
      return '$name ($model)';
    }

    return 'Unknown';
  }
}
