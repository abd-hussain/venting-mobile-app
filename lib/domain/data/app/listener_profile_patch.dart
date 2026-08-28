/// Client-local relationship status chips (not in `#76` catalog).
const kRelationshipStatusIds = {
  'single',
  'in_relationship',
  'married',
  'divorced',
  'widowed',
};

/// Client-local family role chips (not in `#76` catalog).
const kFamilyRoleIds = {'parent', 'single_parent', 'caregiver'};

bool isRelationshipStatusId(String id) => kRelationshipStatusIds.contains(id);

bool isFamilyRoleId(String id) => kFamilyRoleIds.contains(id);

bool lifeExperienceSelectionEquals({
  required String? relationshipIdA,
  required Set<String> familyIdsA,
  required Set<String> experienceIdsA,
  required List<String> customExperiencesA,
  required String? relationshipIdB,
  required Set<String> familyIdsB,
  required Set<String> experienceIdsB,
  required List<String> customExperiencesB,
}) {
  return relationshipIdA == relationshipIdB &&
      _setEquals(familyIdsA, familyIdsB) &&
      _setEquals(experienceIdsA, experienceIdsB) &&
      _listEquals(customExperiencesA, customExperiencesB);
}

bool idSetEquals(Set<String> a, Set<String> b) => _setEquals(a, b);

bool languageIdsEqual(List<String> a, List<String> b) => _listEquals(a, b);

/// Server-generated slug for a user-typed experience (e.g. `custom_{listenerId}_0_aaa`).
bool isCustomLifeExperienceSlug(String value) =>
    value.trim().toLowerCase().startsWith('custom_');

/// Catalog life-experience tag ids from `#76` (profile UI + PATCH filter).
const kCatalogLifeExperienceIds = {
  'career_change',
  'job_loss',
  'startup_founder',
  'financial_struggle',
  'life_stages',
  'grief_loss',
  'anxiety_stress',
  'health_challenge',
  'addiction_recovery',
};

bool isCatalogLifeExperienceId(String id) =>
    kCatalogLifeExperienceIds.contains(id);

List<String> catalogLifeExperienceIds(Set<String> experienceIds) {
  return experienceIds
      .where(
        (id) =>
            isCatalogLifeExperienceId(id) && !isCustomLifeExperienceSlug(id),
      )
      .toList(growable: false);
}

List<String> normalizedCustomExperienceLabels(List<String> labels) {
  final seen = <String>{};
  final normalized = <String>[];

  for (final raw in labels) {
    final label = raw.trim();
    if (label.isEmpty || isCustomLifeExperienceSlug(label)) continue;
    final key = label.toLowerCase();
    if (seen.add(key)) normalized.add(label);
  }

  return normalized;
}

/// Shared body for registration step **experiences** and profile PATCH.
Map<String, dynamic> experiencesUpdateBody({
  String? relationshipId,
  required Set<String> familyIds,
  required Set<String> experienceIds,
  required List<String> customExperiences,
}) {
  final body = <String, dynamic>{
    'life_experience_ids': catalogLifeExperienceIds(experienceIds),
  };

  final relationship = relationshipId?.trim();
  if (relationship != null &&
      relationship.isNotEmpty &&
      !isCustomLifeExperienceSlug(relationship)) {
    body['relationship_status'] = relationship;
  } else {
    body['relationship_status'] = null;
  }

  final family =
      familyIds
          .where((id) => !isCustomLifeExperienceSlug(id))
          .toList(growable: false)
        ..sort();
  body['family_role_ids'] = family;

  final customLabels = normalizedCustomExperienceLabels(customExperiences);
  body['custom_experiences'] = customLabels;

  return body;
}

Map<String, dynamic> patchBodyForExperiences({
  String? relationshipId,
  required Set<String> familyIds,
  required Set<String> experienceIds,
  required List<String> customExperiences,
}) => experiencesUpdateBody(
  relationshipId: relationshipId,
  familyIds: familyIds,
  experienceIds: experienceIds,
  customExperiences: customExperiences,
);

Map<String, dynamic> patchBodyForComfortAreas(
  Set<String> selectedIds, {
  String? otherText,
}) {
  final body = <String, dynamic>{
    'comfort_area_ids': selectedIds.toList(growable: false)..sort(),
  };
  final trimmed = otherText?.trim();
  if (trimmed != null && trimmed.isNotEmpty) {
    body['custom_comfort_area_text'] = trimmed;
  }
  return body;
}

Map<String, dynamic> patchBodyForBoundaries(
  Set<String> selectedIds, {
  String? otherText,
}) {
  final body = <String, dynamic>{
    'boundary_ids': selectedIds.toList(growable: false)..sort(),
  };
  final trimmed = otherText?.trim();
  if (trimmed != null && trimmed.isNotEmpty) {
    body['custom_boundary_text'] = trimmed;
  }
  return body;
}

bool comfortAreasEqual({
  required Set<String> selectedIdsA,
  String? otherTextA,
  required Set<String> selectedIdsB,
  String? otherTextB,
}) {
  return idSetEquals(selectedIdsA, selectedIdsB) &&
      (otherTextA ?? '').trim() == (otherTextB ?? '').trim();
}

bool boundariesEqual({
  required Set<String> selectedIdsA,
  String? otherTextA,
  required Set<String> selectedIdsB,
  String? otherTextB,
}) {
  return idSetEquals(selectedIdsA, selectedIdsB) &&
      (otherTextA ?? '').trim() == (otherTextB ?? '').trim();
}

Map<String, dynamic> patchBodyForCountryIso(String countryIso) {
  return {'country_iso': countryIso.toUpperCase()};
}

Map<String, dynamic> patchBodyForCity(String city) {
  return {'city': city.trim()};
}

Map<String, dynamic> patchBodyForLanguageIds(List<String> languageIds) {
  return {'language_ids': List<String>.from(languageIds)..sort()};
}

bool _setEquals(Set<String> a, Set<String> b) {
  if (a.length != b.length) return false;
  return a.containsAll(b);
}

bool _listEquals(List<String> a, List<String> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
