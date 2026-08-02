import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

/// Cached [VentingMobLocalizations] for code without [BuildContext] (blocs, repos).
abstract final class VentingMobLocalizationsHolder {
  static const supportedLanguageCodes = ['en', 'ar'];
  static const defaultLanguageCode = 'ar';

  static VentingMobLocalizations? _instance;
  static String _currentLanguageCode = defaultLanguageCode;

  static String get currentLanguageCode => _currentLanguageCode;

  static VentingMobLocalizations get current {
    final instance = _instance;
    if (instance == null) {
      throw StateError(
        'VentingMobLocalizations not loaded. Call warm() first.',
      );
    }
    return instance;
  }

  static Future<void> ensureDefaultLanguageSaved(
    VentingPreferences preferences,
  ) async {
    final saved = preferences.getValue<String>(
      SavedConstants.selectedLanguageCode,
      '',
    );
    if (saved.isEmpty) {
      await preferences.setValue(
        SavedConstants.selectedLanguageCode,
        defaultLanguageCode,
      );
    }
  }

  static Future<void> warm() async {
    await _loadActiveLocale(_currentLanguageCode);
  }

  static void adoptLoadedInstance(
    String languageCode,
    VentingMobLocalizations instance,
  ) {
    _currentLanguageCode = languageCode;
    _instance = instance;
  }

  static Future<void> refresh() async {
    await _loadActiveLocale(_currentLanguageCode);
  }

  static Future<void> _loadActiveLocale(String languageCode) async {
    final code = languageCode;
    _currentLanguageCode = code;
    _instance = lookupVentingMobLocalizations(Locale(code));
  }

  static void syncCurrentLanguage(String languageCode) {
    _currentLanguageCode = languageCode;
    _instance = lookupVentingMobLocalizations(Locale(_currentLanguageCode));
  }

  static void syncFromPreferences(VentingPreferences preferences) {
    syncCurrentLanguage(languageCodeFromPreferences(preferences));
  }

  static String languageCodeFromPreferences(VentingPreferences preferences) {
    final saved = preferences.getValue<String>(
      SavedConstants.selectedLanguageCode,
      '',
    );
    return saved.isNotEmpty ? saved : defaultLanguageCode;
  }

  /// Resolves [message] for [languageCode].
  static T withLocale<T>(
    String languageCode,
    T Function(VentingMobLocalizations localizations) message,
  ) {
    return message(lookupVentingMobLocalizations(Locale(languageCode)));
  }
}
