import 'package:intl/intl.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_language_model.dart';
import 'package:venting_mobile_app/domain/data/api/listener_profile_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_phone.dart';
import 'package:venting_mobile_app/domain/data/app/listener_profile_patch.dart';
import 'package:venting_mobile_app/utils/api_asset_url.dart';

class ListenerProfileExperiences {
  const ListenerProfileExperiences({
    this.relationshipId,
    this.familyIds = const {},
    this.experienceIds = const {},
    this.customExperiences = const [],
  });

  final String? relationshipId;
  final Set<String> familyIds;
  final Set<String> experienceIds;
  final List<String> customExperiences;

  bool get hasAny =>
      relationshipId != null ||
      familyIds.isNotEmpty ||
      experienceIds.isNotEmpty ||
      customExperiences.isNotEmpty;
}

class ListenerProfile {
  const ListenerProfile({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.avatarUrl,
    this.aboutMe,
    this.country,
    required this.countryIso,
    required this.city,
    required this.languageIds,
    required this.languages,
    required this.experiences,
    required this.comfortAreaIds,
    this.comfortAreaOtherText,
    required this.boundaryIds,
    this.boundaryOtherText,
    this.voiceIntroUrl,
    required this.voiceIntroSeconds,
    required this.rating,
    required this.reviewCount,
    required this.sessionCount,
    required this.ratingDistribution,
    required this.isOnline,
    required this.profileStatus,
    required this.ratePerMinute,
    this.dateOfBirth,
    this.dateOfBirthDisplay,
  });

  final String id;
  final String fullName;
  final String email;
  final ListenerPhone phone;
  final String? avatarUrl;
  final String? aboutMe;
  final String? country;
  final String countryIso;
  final String city;
  final List<String> languageIds;
  final List<CatalogLanguageModel> languages;
  final ListenerProfileExperiences experiences;
  final Set<String> comfortAreaIds;
  final String? comfortAreaOtherText;
  final Set<String> boundaryIds;
  final String? boundaryOtherText;
  final String? voiceIntroUrl;
  final int voiceIntroSeconds;
  final double rating;
  final int reviewCount;
  final int sessionCount;
  final List<int> ratingDistribution;
  final bool isOnline;
  final String profileStatus;
  final double ratePerMinute;
  final DateTime? dateOfBirth;
  final String? dateOfBirthDisplay;

  IsoCode get countryCode {
    try {
      return IsoCode.values.byName(countryIso.toUpperCase());
    } catch (_) {
      return IsoCode.US;
    }
  }

  String get voiceDurationLabel {
    final minutes = voiceIntroSeconds ~/ 60;
    final seconds = voiceIntroSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  bool get hasRatingDistribution =>
      ratingDistribution.any((count) => count > 0);

  ListenerProfile applyReviewSummary({
    required double rating,
    required int reviewCount,
    required List<int> ratingDistribution,
  }) {
    return ListenerProfile(
      id: id,
      fullName: fullName,
      email: email,
      phone: phone,
      avatarUrl: avatarUrl,
      aboutMe: aboutMe,
      country: country,
      countryIso: countryIso,
      city: city,
      languageIds: languageIds,
      languages: languages,
      experiences: experiences,
      comfortAreaIds: comfortAreaIds,
      comfortAreaOtherText: comfortAreaOtherText,
      boundaryIds: boundaryIds,
      boundaryOtherText: boundaryOtherText,
      voiceIntroUrl: voiceIntroUrl,
      voiceIntroSeconds: voiceIntroSeconds,
      rating: rating,
      reviewCount: reviewCount,
      sessionCount: sessionCount,
      ratingDistribution: ratingDistribution,
      isOnline: isOnline,
      profileStatus: profileStatus,
      ratePerMinute: ratePerMinute,
      dateOfBirth: dateOfBirth,
      dateOfBirthDisplay: dateOfBirthDisplay,
    );
  }
}

/// Prefer freshly written fields when a follow-up GET is briefly stale.
ListenerProfile mergeProfileAfterWrite(
  ListenerProfile server,
  ListenerProfile written,
) {
  final voiceChanged =
      written.voiceIntroSeconds != server.voiceIntroSeconds ||
      (written.voiceIntroUrl ?? '') != (server.voiceIntroUrl ?? '');

  return ListenerProfile(
    id: server.id,
    fullName: server.fullName,
    email: server.email,
    phone: server.phone,
    avatarUrl: _firstNonEmpty([written.avatarUrl, server.avatarUrl]),
    aboutMe: server.aboutMe,
    country: server.country,
    countryIso: server.countryIso,
    city: server.city,
    languageIds: server.languageIds,
    languages: server.languages,
    experiences: server.experiences.hasAny || !written.experiences.hasAny
        ? server.experiences
        : written.experiences,
    comfortAreaIds: server.comfortAreaIds,
    comfortAreaOtherText: _firstNonEmpty([
      server.comfortAreaOtherText,
      written.comfortAreaOtherText,
    ]),
    boundaryIds: server.boundaryIds,
    boundaryOtherText: _firstNonEmpty([
      server.boundaryOtherText,
      written.boundaryOtherText,
    ]),
    voiceIntroUrl: voiceChanged ? written.voiceIntroUrl : server.voiceIntroUrl,
    voiceIntroSeconds: voiceChanged
        ? written.voiceIntroSeconds
        : server.voiceIntroSeconds,
    rating: server.rating,
    reviewCount: server.reviewCount,
    sessionCount: server.sessionCount,
    ratingDistribution: server.ratingDistribution,
    isOnline: server.isOnline,
    profileStatus: server.profileStatus,
    ratePerMinute: server.ratePerMinute,
    dateOfBirth: server.dateOfBirth,
    dateOfBirthDisplay: server.dateOfBirthDisplay,
  );
}

String? _firstNonEmpty(List<String?> values) {
  for (final value in values) {
    final trimmed = value?.trim();
    if (trimmed != null && trimmed.isNotEmpty) return trimmed;
  }
  return null;
}

String? _resolvedMediaUrl(String? url, {required String apiBaseUrl}) {
  final resolved = resolveApiAssetUrl(url, baseUrl: apiBaseUrl);
  return resolved.isEmpty ? null : resolved;
}

ListenerProfile listenerProfileFromApi(
  ListenerProfileData data, {
  List<CatalogLanguageModel> catalogLanguages = const [],
  String apiBaseUrl = '',
}) {
  final lifeExperienceIds = _parseLifeExperienceIds(data.life_experiences);
  final customExperiences = _parseCustomExperiences(data.life_experiences);
  final experiences = _mapExperiencesFromApi(
    data.life_experiences,
    lifeExperienceIds,
    customExperiences,
  );
  final languageIds = List<String>.from(data.language_ids);
  final languages = catalogLanguages
      .where((language) => languageIds.contains(language.id))
      .toList(growable: false);

  return ListenerProfile(
    id: data.id,
    fullName: data.full_name,
    email: data.email,
    phone: ListenerPhone.fromApi(
      phone: data.phone,
      phoneCountry: data.phone_country,
    ),
    avatarUrl: _resolvedMediaUrl(data.avatar_url, apiBaseUrl: apiBaseUrl),
    aboutMe: data.about_me,
    country: data.country,
    countryIso: data.country_iso,
    city: data.city,
    languageIds: languageIds,
    languages: languages,
    experiences: experiences,
    comfortAreaIds: _parseIdSet(data.comfort_areas),
    comfortAreaOtherText:
        _parseCustomText(
          data.comfort_areas,
          keys: const ['custom_comfort_area_text', 'custom_text'],
        ) ??
        _parseOtherTextFromList(data.comfort_areas),
    boundaryIds: _parseIdSet(data.boundaries),
    boundaryOtherText:
        _parseCustomText(
          data.boundaries,
          keys: const ['custom_boundary_text', 'custom_text'],
        ) ??
        _parseOtherTextFromList(data.boundaries),
    voiceIntroUrl: _resolvedMediaUrl(
      data.voice_intro_url,
      apiBaseUrl: apiBaseUrl,
    ),
    voiceIntroSeconds: data.voice_intro_seconds,
    rating: data.rating,
    reviewCount: data.review_count,
    sessionCount: data.session_count,
    ratingDistribution: parseRatingDistribution(
      data.rating_breakdown,
      data.review_count,
    ),
    isOnline: data.is_online,
    profileStatus: data.profile_status,
    ratePerMinute: data.rate_per_minute,
    dateOfBirth: _parseDateOfBirth(data.date_of_birth),
    dateOfBirthDisplay: _formatDateOfBirth(data.date_of_birth),
  );
}

List<String> _parseLifeExperienceIds(dynamic raw) {
  if (raw is Map<String, dynamic>) {
    final ids = raw['life_experience_ids'];
    if (ids is List) return _stringListFromDynamic(ids);
  }
  if (raw is List) return _stringListFromDynamic(raw);
  return const [];
}

List<String> _parseCustomExperiences(dynamic raw) {
  if (raw is Map<String, dynamic>) {
    final custom = raw['custom_experiences'];
    if (custom is List) return _stringListFromDynamic(custom);
  }
  if (raw is List) {
    final labels = <String>[];
    for (final entry in raw) {
      if (entry is Map<String, dynamic>) {
        final id = entry['id']?.toString() ?? '';
        if (isCustomLifeExperienceSlug(id)) {
          final label =
              entry['label']?.toString() ??
              entry['name']?.toString() ??
              entry['name_en']?.toString();
          if (label != null && label.trim().isNotEmpty) {
            labels.add(label.trim());
          }
          continue;
        }
        final customText = entry['custom_text']?.toString().trim();
        if (customText != null && customText.isNotEmpty) {
          labels.add(customText);
        }
      }
    }
    return normalizedCustomExperienceLabels(labels);
  }
  return const [];
}

ListenerProfileExperiences _mapExperiencesFromApi(
  dynamic raw,
  List<String> catalogIds,
  List<String> customExperiences,
) {
  if (raw is Map<String, dynamic>) {
    final relationshipField = raw['relationship_status']?.toString().trim();
    final familyField = _parseStringList(raw['family_role_ids']);
    final hasSplitFields =
        (relationshipField != null && relationshipField.isNotEmpty) ||
        familyField.isNotEmpty;

    if (hasSplitFields) {
      return ListenerProfileExperiences(
        relationshipId:
            relationshipField != null && relationshipField.isNotEmpty
            ? relationshipField
            : null,
        familyIds: familyField.toSet(),
        experienceIds: catalogIds
            .where(
              (id) =>
                  isCatalogLifeExperienceId(id) &&
                  !isCustomLifeExperienceSlug(id),
            )
            .toSet(),
        customExperiences: normalizedCustomExperienceLabels(customExperiences),
      );
    }
  }

  return _mapExperiences(catalogIds, customExperiences);
}

List<String> _parseStringList(dynamic raw) {
  if (raw is! List) return const [];
  return _stringListFromDynamic(raw);
}

ListenerProfileExperiences _mapExperiences(
  List<String> ids,
  List<String> customExperiences,
) {
  final relationshipIds = kRelationshipStatusIds;
  final familyIds = kFamilyRoleIds;
  const knownIds = {...kRelationshipStatusIds, ...kFamilyRoleIds};

  String? relationshipId;
  final family = <String>{};
  final experiences = <String>{};

  for (final id in ids) {
    if (isCustomLifeExperienceSlug(id)) continue;
    if (relationshipIds.contains(id)) {
      relationshipId = id;
    } else if (familyIds.contains(id)) {
      family.add(id);
    } else if (isCatalogLifeExperienceId(id)) {
      experiences.add(id);
    }
  }

  final custom = normalizedCustomExperienceLabels([
    ...customExperiences,
    ...ids.where(
      (id) =>
          !knownIds.contains(id) &&
          !isCatalogLifeExperienceId(id) &&
          !isCustomLifeExperienceSlug(id),
    ),
  ]);

  return ListenerProfileExperiences(
    relationshipId: relationshipId,
    familyIds: family,
    experienceIds: experiences,
    customExperiences: custom,
  );
}

Set<String> _parseIdSet(dynamic raw) {
  if (raw is Map<String, dynamic>) {
    for (final key in ['comfort_area_ids', 'boundary_ids', 'ids']) {
      final ids = raw[key];
      if (ids is List) return _stringListFromDynamic(ids).toSet();
    }
  }
  if (raw is List) return _stringListFromDynamic(raw).toSet();
  return {};
}

String? _parseCustomText(dynamic raw, {required List<String> keys}) {
  if (raw is! Map<String, dynamic>) return null;
  for (final key in keys) {
    final value = raw[key]?.toString().trim();
    if (value != null && value.isNotEmpty) return value;
  }
  return null;
}

String? _parseOtherTextFromList(dynamic raw) {
  if (raw is! List) return null;

  for (final entry in raw) {
    if (entry is! Map<String, dynamic>) continue;
    if (entry['id']?.toString() != 'other') continue;

    for (final key in const [
      'custom_text',
      'custom_comfort_area_text',
      'custom_boundary_text',
      'name',
      'label',
    ]) {
      final value = entry[key]?.toString().trim();
      if (value != null && value.isNotEmpty && value.toLowerCase() != 'other') {
        return value;
      }
    }
  }

  return null;
}

List<String> _stringListFromDynamic(List<dynamic> raw) {
  return raw
      .map((entry) {
        if (entry is String) return entry;
        if (entry is Map<String, dynamic>) {
          return entry['id']?.toString() ?? '';
        }
        return entry?.toString() ?? '';
      })
      .where((id) => id.isNotEmpty)
      .toList(growable: false);
}

List<int> ratingDistributionFromRatings(Iterable<int> ratings) {
  final counts = List<int>.filled(5, 0);
  for (final rating in ratings) {
    if (rating >= 1 && rating <= 5) {
      counts[5 - rating]++;
    }
  }
  return counts;
}

List<int> parseRatingDistribution(
  Map<String, dynamic>? breakdown,
  int reviewCount,
) {
  if (breakdown != null && breakdown.isNotEmpty) {
    final parsed = _ratingCountsFromBreakdown(breakdown);
    if (parsed != null) return parsed;
  }

  return const [0, 0, 0, 0, 0];
}

List<int>? _ratingCountsFromBreakdown(Map<String, dynamic> breakdown) {
  final direct = _readRatingCounts(breakdown);
  if (direct.any((count) => count > 0)) return direct;

  for (final key in const ['counts', 'stars', 'distribution', 'breakdown']) {
    final nested = breakdown[key];
    if (nested is Map<String, dynamic>) {
      final parsed = _readRatingCounts(nested);
      if (parsed.any((count) => count > 0)) return parsed;
    }
  }

  return null;
}

List<int> _readRatingCounts(Map<String, dynamic> breakdown) {
  return [
    _ratingCount(breakdown, '5'),
    _ratingCount(breakdown, '4'),
    _ratingCount(breakdown, '3'),
    _ratingCount(breakdown, '2'),
    _ratingCount(breakdown, '1'),
  ];
}

int _ratingCount(Map<String, dynamic> breakdown, String stars) {
  for (final key in <String>[
    stars,
    '${stars}_star',
    '${stars}_stars',
    'star_$stars',
    'stars_$stars',
  ]) {
    final value = breakdown[key];
    if (value is num) return value.toInt();
    final parsed = int.tryParse(value?.toString() ?? '');
    if (parsed != null) return parsed;
  }
  return 0;
}

DateTime? _parseDateOfBirth(String? raw) {
  if (raw == null || raw.trim().isEmpty) return null;
  return DateTime.tryParse(raw);
}

String? _formatDateOfBirth(String? raw) {
  final date = _parseDateOfBirth(raw);
  if (date == null) return null;
  return DateFormat('MMM d, yyyy').format(date);
}
