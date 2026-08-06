class SpokenLanguage {
  const SpokenLanguage({required this.id, required this.en, required this.ar});

  final String id;
  final String en;
  final String ar;

  String label(String languageCode) => languageCode == 'ar' ? ar : en;
}

const spokenLanguages = <SpokenLanguage>[
  SpokenLanguage(id: 'en', en: 'English', ar: 'الإنجليزية'),
  SpokenLanguage(id: 'ar', en: 'Arabic', ar: 'العربية'),
  SpokenLanguage(id: 'es', en: 'Spanish', ar: 'الإسبانية'),
  SpokenLanguage(id: 'fr', en: 'French', ar: 'الفرنسية'),
  SpokenLanguage(id: 'de', en: 'German', ar: 'الألمانية'),
  SpokenLanguage(id: 'tr', en: 'Turkish', ar: 'التركية'),
  SpokenLanguage(id: 'it', en: 'Italian', ar: 'الإيطالية'),
  SpokenLanguage(id: 'pt', en: 'Portuguese', ar: 'البرتغالية'),
  SpokenLanguage(id: 'hi', en: 'Hindi', ar: 'الهندية'),
  SpokenLanguage(id: 'zh', en: 'Chinese', ar: 'الصينية'),
  SpokenLanguage(id: 'ja', en: 'Japanese', ar: 'اليابانية'),
  SpokenLanguage(id: 'ko', en: 'Korean', ar: 'الكورية'),
  SpokenLanguage(id: 'ru', en: 'Russian', ar: 'الروسية'),
  SpokenLanguage(id: 'nl', en: 'Dutch', ar: 'الهولندية'),
  SpokenLanguage(id: 'ur', en: 'Urdu', ar: 'الأردية'),
  SpokenLanguage(id: 'fa', en: 'Persian', ar: 'الفارسية'),
];

SpokenLanguage? spokenLanguageById(String id) {
  for (final language in spokenLanguages) {
    if (language.id == id) return language;
  }
  return null;
}
