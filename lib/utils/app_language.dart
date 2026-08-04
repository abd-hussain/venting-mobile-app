import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/venting_app.dart';

/// Persists [languageCode] and rebuilds the app so locale / RTL update.
Future<void> changeAppLanguage(
  BuildContext context,
  String languageCode,
) async {
  if (!VentingMobLocalizationsHolder.supportedLanguageCodes.contains(
    languageCode,
  )) {
    return;
  }

  if (VentingMobLocalizationsHolder.currentLanguageCode == languageCode) {
    return;
  }

  await diContainer<VentingPreferences>().setValue(
    SavedConstants.selectedLanguageCode,
    languageCode,
  );
  VentingMobLocalizationsHolder.syncCurrentLanguage(languageCode);

  if (!context.mounted) return;
  VentingApp.of(context)?.rebuild();
}
