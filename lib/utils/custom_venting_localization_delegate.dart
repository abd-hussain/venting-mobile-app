import 'package:flutter/material.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

class CustomVentingMobLocalizationsDelegate
    extends LocalizationsDelegate<VentingMobLocalizations> {
  final String currentLanguage;

  const CustomVentingMobLocalizationsDelegate({required this.currentLanguage});

  @override
  Future<VentingMobLocalizations> load(Locale locale) async {
    final effectiveLocale = _localeForLanguage(currentLanguage);
    final instance = lookupVentingMobLocalizations(effectiveLocale);
    VentingMobLocalizationsHolder.adoptLoadedInstance(
      currentLanguage,
      instance,
    );
    return instance;
  }

  @override
  bool isSupported(Locale locale) => true;

  @override
  bool shouldReload(CustomVentingMobLocalizationsDelegate old) =>
      old.currentLanguage != currentLanguage;

  static Locale _localeForLanguage(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return const Locale('ar');
      default:
        return const Locale('en');
    }
  }
}
