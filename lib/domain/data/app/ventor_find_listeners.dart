import 'package:venting_mobile_app/domain/data/api/ventor_find_listeners_response_model.dart';
import 'package:venting_mobile_app/utils/api_asset_url.dart';

enum VentorFindListenerGenderData { female, male, preferNotToSay }

enum VentorFindFavoriteFilterData { any, favoritesOnly, notFavorites }

class VentorFindListenerAvailabilityData {
  const VentorFindListenerAvailabilityData({
    required this.days,
    required this.fromHour,
    required this.toHour,
    required this.timeZoneId,
    required this.acceptInstantCall,
    required this.sessionMinutes,
  });

  final List<String> days;
  final String fromHour;
  final String toHour;
  final String timeZoneId;
  final bool acceptInstantCall;
  final List<int> sessionMinutes;
}

class VentorFindListenerData {
  const VentorFindListenerData({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.rating,
    required this.reviewCount,
    required this.sessionCount,
    required this.topics,
    required this.languages,
    required this.gender,
    required this.ratePerMinute,
    required this.bio,
    required this.helpWith,
    required this.voicePreviewSeconds,
    required this.isOnline,
    required this.isVerified,
    required this.ratingBreakdown,
    required this.country,
    required this.city,
    required this.countryIsoCode,
    required this.lifeExperiences,
    required this.boundaries,
    required this.availability,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final String avatarUrl;
  final double rating;
  final int reviewCount;
  final int sessionCount;
  final List<String> topics;
  final List<String> languages;
  final VentorFindListenerGenderData gender;
  final double ratePerMinute;
  final String bio;
  final List<String> helpWith;
  final int voicePreviewSeconds;
  final bool isOnline;
  final bool isVerified;
  final Map<int, int> ratingBreakdown;
  final String country;
  final String city;
  final String countryIsoCode;
  final List<String> lifeExperiences;
  final List<String> boundaries;
  final VentorFindListenerAvailabilityData availability;
  final bool isFavorite;

  VentorFindListenerData copyWith({bool? isFavorite}) {
    return VentorFindListenerData(
      id: id,
      name: name,
      avatarUrl: avatarUrl,
      rating: rating,
      reviewCount: reviewCount,
      sessionCount: sessionCount,
      topics: topics,
      languages: languages,
      gender: gender,
      ratePerMinute: ratePerMinute,
      bio: bio,
      helpWith: helpWith,
      voicePreviewSeconds: voicePreviewSeconds,
      isOnline: isOnline,
      isVerified: isVerified,
      ratingBreakdown: ratingBreakdown,
      country: country,
      city: city,
      countryIsoCode: countryIsoCode,
      lifeExperiences: lifeExperiences,
      boundaries: boundaries,
      availability: availability,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class VentorFindListenersPageData {
  const VentorFindListenersPageData({required this.items, required this.total});

  final List<VentorFindListenerData> items;
  final int total;
}

class VentorFindListenersQueryData {
  const VentorFindListenersQueryData({
    this.query = '',
    this.topicId = 'all',
    this.minPricePerMinute = 0,
    this.maxPricePerMinute = 3,
    this.languageIds = const <String>{},
    this.genders = const <VentorFindListenerGenderData>{},
    this.minRating = 0,
    this.favoriteFilter = VentorFindFavoriteFilterData.any,
    this.page = 1,
    this.pageSize = 20,
  });

  final String query;
  final String topicId;
  final double minPricePerMinute;
  final double maxPricePerMinute;
  final Set<String> languageIds;
  final Set<VentorFindListenerGenderData> genders;
  final double minRating;
  final VentorFindFavoriteFilterData favoriteFilter;
  final int page;
  final int pageSize;
}

VentorFindListenersPageData ventorFindListenersPageFromApi(
  VentorFindListenersData data, {
  required String apiBaseUrl,
}) {
  return VentorFindListenersPageData(
    items: [
      for (final item in data.items)
        ventorFindListenerFromApi(item, apiBaseUrl: apiBaseUrl),
    ],
    total: data.total,
  );
}

VentorFindListenerData ventorFindListenerFromApi(
  VentorFindListenerModel model, {
  required String apiBaseUrl,
}) {
  return VentorFindListenerData(
    id: model.id.trim(),
    name: model.name.trim(),
    avatarUrl: resolveApiAssetUrl(model.avatar_url, baseUrl: apiBaseUrl),
    rating: model.rating,
    reviewCount: model.review_count,
    sessionCount: model.session_count,
    topics: List<String>.from(model.topics),
    languages: List<String>.from(model.languages),
    gender: _genderFromApi(model.gender),
    ratePerMinute: model.rate_per_minute,
    bio: model.bio.trim(),
    helpWith: List<String>.from(model.help_with),
    voicePreviewSeconds: model.voice_preview_seconds,
    isOnline: model.is_online,
    isVerified: model.is_verified,
    ratingBreakdown: _ratingBreakdownFromApi(model.rating_breakdown),
    country: model.country.trim(),
    city: model.city.trim(),
    countryIsoCode: model.country_iso.trim().toUpperCase(),
    lifeExperiences: _stringTagsFromApi(model.life_experiences),
    boundaries: _stringTagsFromApi(model.boundaries),
    availability: _availabilityFromApi(model.availability),
    isFavorite: model.is_favorite,
  );
}

VentorFindListenerGenderData _genderFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'female' => VentorFindListenerGenderData.female,
    'male' => VentorFindListenerGenderData.male,
    _ => VentorFindListenerGenderData.preferNotToSay,
  };
}

String ventorFindListenerGenderToApi(VentorFindListenerGenderData gender) {
  return switch (gender) {
    VentorFindListenerGenderData.female => 'female',
    VentorFindListenerGenderData.male => 'male',
    VentorFindListenerGenderData.preferNotToSay => 'prefer_not_to_say',
  };
}

String ventorFindFavoriteFilterToApi(VentorFindFavoriteFilterData filter) {
  return switch (filter) {
    VentorFindFavoriteFilterData.any => 'any',
    VentorFindFavoriteFilterData.favoritesOnly => 'only',
    VentorFindFavoriteFilterData.notFavorites => 'exclude',
  };
}

Map<int, int> _ratingBreakdownFromApi(Map<String, dynamic>? raw) {
  if (raw == null || raw.isEmpty) return const {};
  final out = <int, int>{};
  raw.forEach((key, value) {
    final star = int.tryParse(key);
    if (star == null) return;
    final count = value is num
        ? value.toInt()
        : int.tryParse(value?.toString() ?? '') ?? 0;
    out[star] = count;
  });
  return out;
}

List<String> _stringTagsFromApi(Object? raw) {
  if (raw is List) {
    final out = <String>[];
    for (final entry in raw) {
      if (entry is String) {
        final trimmed = entry.trim();
        if (trimmed.isNotEmpty) out.add(trimmed);
        continue;
      }
      if (entry is Map) {
        final id = entry['id']?.toString().trim() ?? '';
        final label =
            entry['label']?.toString().trim() ??
            entry['name']?.toString().trim() ??
            entry['name_en']?.toString().trim() ??
            '';
        if (id.isNotEmpty) {
          out.add(id);
        } else if (label.isNotEmpty) {
          out.add(label);
        }
      }
    }
    return out;
  }

  if (raw is Map) {
    final out = <String>[];
    void addList(Object? value) {
      if (value is! List) return;
      for (final entry in value) {
        final text = entry?.toString().trim() ?? '';
        if (text.isNotEmpty) out.add(text);
      }
    }

    addList(raw['life_experience_ids']);
    addList(raw['family_role_ids']);
    addList(raw['boundary_ids']);
    addList(raw['custom_experiences']);
    final relationship = raw['relationship_status']?.toString().trim() ?? '';
    if (relationship.isNotEmpty) out.add(relationship);
    final customBoundary =
        raw['custom_boundary_text']?.toString().trim() ??
        raw['custom_text']?.toString().trim() ??
        '';
    if (customBoundary.isNotEmpty) out.add(customBoundary);
    return out;
  }

  return const [];
}

VentorFindListenerAvailabilityData _availabilityFromApi(
  VentorFindListenerAvailabilityModel? model,
) {
  if (model == null) {
    return const VentorFindListenerAvailabilityData(
      days: <String>[],
      fromHour: '09:00 AM',
      toHour: '09:00 PM',
      timeZoneId: 'UTC',
      acceptInstantCall: false,
      sessionMinutes: <int>[30, 45, 60],
    );
  }

  final sessionMinutes = model.session_minutes.isEmpty
      ? const <int>[30, 45, 60]
      : List<int>.from(model.session_minutes);

  return VentorFindListenerAvailabilityData(
    days: List<String>.from(model.days),
    fromHour: model.from_hour.trim().isEmpty
        ? '09:00 AM'
        : model.from_hour.trim(),
    toHour: model.to_hour.trim().isEmpty ? '09:00 PM' : model.to_hour.trim(),
    timeZoneId: model.time_zone_id.trim().isEmpty
        ? 'UTC'
        : model.time_zone_id.trim(),
    acceptInstantCall: model.accept_instant_call,
    sessionMinutes: sessionMinutes,
  );
}
