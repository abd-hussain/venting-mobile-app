import 'package:venting_mobile_app/domain/data/app/ventor_find_listeners.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';

VentorFindListener ventorFindListenerFromDomain(VentorFindListenerData data) {
  return VentorFindListener(
    id: data.id,
    name: data.name,
    avatarUrl: data.avatarUrl,
    rating: data.rating,
    reviewCount: data.reviewCount,
    sessionCount: data.sessionCount,
    topics: List<String>.from(data.topics),
    languages: List<String>.from(data.languages),
    gender: switch (data.gender) {
      VentorFindListenerGenderData.female => VentorListenerGender.female,
      VentorFindListenerGenderData.male => VentorListenerGender.male,
      VentorFindListenerGenderData.preferNotToSay =>
        VentorListenerGender.preferNotToSay,
    },
    ratePerMinute: data.ratePerMinute,
    bio: data.bio,
    helpWith: List<String>.from(data.helpWith),
    voicePreviewSeconds: data.voicePreviewSeconds,
    voiceIntroUrl: data.voiceIntroUrl,
    isOnline: data.isOnline,
    isVerified: data.isVerified,
    ratingBreakdown: Map<int, int>.from(data.ratingBreakdown),
    country: data.country,
    city: data.city,
    countryIsoCode: data.countryIsoCode,
    lifeExperiences: List<String>.from(data.lifeExperiences),
    boundaries: List<String>.from(data.boundaries),
    availability: VentorListenerAvailability(
      days: List<String>.from(data.availability.days),
      fromHour: data.availability.fromHour,
      toHour: data.availability.toHour,
      timeZoneId: data.availability.timeZoneId,
      acceptInstantCall: data.availability.acceptInstantCall,
      sessionMinutes: List<int>.from(data.availability.sessionMinutes),
    ),
    isFavorite: data.isFavorite,
  );
}

VentorFindListenersQueryData ventorFindListenersQueryFromUi({
  required String query,
  required String topicId,
  required VentorSessionFilters filters,
  int page = 1,
  int pageSize = 20,
}) {
  return VentorFindListenersQueryData(
    query: query,
    topicId: topicId,
    minPricePerMinute: filters.minPricePerMinute,
    maxPricePerMinute: filters.maxPricePerMinute,
    languageIds: {
      for (final language in filters.languages) _languageIdForFilter(language),
    },
    genders: {
      for (final gender in filters.genders)
        switch (gender) {
          VentorListenerGender.female => VentorFindListenerGenderData.female,
          VentorListenerGender.male => VentorFindListenerGenderData.male,
          VentorListenerGender.preferNotToSay =>
            VentorFindListenerGenderData.preferNotToSay,
        },
    },
    minRating: filters.minRating,
    favoriteFilter: switch (filters.favoriteFilter) {
      VentorFavoriteFilter.any => VentorFindFavoriteFilterData.any,
      VentorFavoriteFilter.favoritesOnly =>
        VentorFindFavoriteFilterData.favoritesOnly,
      VentorFavoriteFilter.notFavorites =>
        VentorFindFavoriteFilterData.notFavorites,
    },
    page: page,
    pageSize: pageSize,
  );
}

String _languageIdForFilter(String language) {
  final trimmed = language.trim();
  final lower = trimmed.toLowerCase();
  return switch (lower) {
    'english' || 'en' => 'en',
    'arabic' || 'ar' => 'ar',
    'french' || 'fr' => 'fr',
    _ => lower,
  };
}
