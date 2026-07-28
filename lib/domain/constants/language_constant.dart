import 'package:venting_mobile_app/domain/data/app/language.dart';

class LanguageConstant {
  static List<LanguageModel> languages = [
    LanguageModel(
      name: 'English',
      nameInOtherLang: 'إنجليزي',
      selectButtonTitle: 'Select',
      languageCode: 'en',
      svgIcon: 'assets/images/language_english_icon.svg',
    ),
    LanguageModel(
      name: 'العربية',
      nameInOtherLang: 'Arabic',
      selectButtonTitle: 'اختيار',
      languageCode: 'ar',
      svgIcon: 'assets/images/language_arabic_icon.svg',
    ),
  ];
}
