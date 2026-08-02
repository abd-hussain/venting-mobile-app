import 'package:flutter/material.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

extension AppLanguageX on BuildContext {
  /// App language: `en` | `ar`.
  ///
  /// Prefer over [Localizations.localeOf].languageCode — Material maps both
  /// Arabic and Kurdish to `ar`, so Kurdish labels would resolve incorrectly.
  String get languageCode {
    // Subscribe so widgets rebuild when Localizations reload on language change.
    Localizations.localeOf(this);
    return VentingMobLocalizationsHolder.currentLanguageCode;
  }

  /// True for Arabic and Kurdish (both RTL in this app).
  bool get isRtlLanguage {
    final code = languageCode;
    return code == 'ar';
  }
}
