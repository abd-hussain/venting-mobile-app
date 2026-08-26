import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_step_slug.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_step.dart';

/// `GET /v1/listeners/register/progress`
class ListenerRegistrationProgressModel {
  const ListenerRegistrationProgressModel({
    required this.registrationComplete,
    this.profileStatus,
    this.nextStep,
    this.completedSteps = const [],
    this.saved = const {},
  });

  final bool registrationComplete;
  final String? profileStatus;
  final String? nextStep;
  final List<String> completedSteps;
  final Map<String, dynamic> saved;

  factory ListenerRegistrationProgressModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final data = json['data'] is Map<String, dynamic>
        ? json['data'] as Map<String, dynamic>
        : json;

    final completedRaw = data['completed_steps'];
    final savedRaw = data['saved'];

    return ListenerRegistrationProgressModel(
      registrationComplete: data['registration_complete'] as bool? ?? false,
      profileStatus: data['profile_status'] as String?,
      nextStep: data['next_step'] as String?,
      completedSteps: completedRaw is List
          ? completedRaw.map((e) => e.toString()).toList(growable: false)
          : const [],
      saved: savedRaw is Map<String, dynamic>
          ? Map<String, dynamic>.from(savedRaw)
          : const {},
    );
  }

  ListenerRegistrationStep? resolveResumeStep() {
    final slug = nextStep == null
        ? null
        : ListenerRegistrationStepSlug.fromPathSegment(nextStep!);
    return slug?.toWizardStep() ??
        _firstIncompleteWizardStep() ??
        ListenerRegistrationStep.createAccount;
  }

  ListenerRegistrationStep? _firstIncompleteWizardStep() {
    const order = [
      ListenerRegistrationStepSlug.profile,
      ListenerRegistrationStepSlug.identity,
      ListenerRegistrationStepSlug.about,
      ListenerRegistrationStepSlug.experiences,
      ListenerRegistrationStepSlug.comfortAreas,
      ListenerRegistrationStepSlug.boundaries,
      ListenerRegistrationStepSlug.voiceIntro,
      ListenerRegistrationStepSlug.availability,
    ];

    for (final slug in order) {
      if (!completedSteps.contains(slug.pathSegment)) {
        return slug.toWizardStep();
      }
    }

    if (registrationComplete) return null;
    return ListenerRegistrationStep.notifications;
  }
}

extension ListenerRegistrationProgressApply
    on ListenerRegistrationProgressModel {
  void applySavedToDraft(ListenerRegistrationDraft draft) {
    final profile = saved['profile'];
    if (profile is Map<String, dynamic>) {
      draft.fullName = profile['full_name'] as String? ?? draft.fullName;
      draft.phoneNational =
          profile['phone_national'] as String? ??
          _nationalFromE164(profile['phone'] as String?) ??
          draft.phoneNational;
      draft.phoneCountryIso =
          profile['phone_country'] as String? ?? draft.phoneCountryIso;
      draft.profilePhotoPath =
          profile['avatar_url'] as String? ?? draft.profilePhotoPath;
    }

    final identity = saved['identity'];
    if (identity is Map<String, dynamic>) {
      draft.idImagePath =
          identity['identity_document_url'] as String? ?? draft.idImagePath;
      draft.selfieImagePath =
          identity['selfie_url'] as String? ?? draft.selfieImagePath;
    }

    final about = saved['about'];
    if (about is Map<String, dynamic>) {
      final dob = about['date_of_birth'] as String?;
      if (dob != null) draft.dateOfBirth = DateTime.tryParse(dob);
      draft.countryIso = about['country_iso'] as String? ?? draft.countryIso;
      draft.city = about['city'] as String? ?? draft.city;
      final languageIds = about['language_ids'];
      if (languageIds is List) {
        draft.languageIds = languageIds
            .map((e) => e.toString())
            .toList(growable: false);
      }
    }

    final experiences = saved['experiences'];
    if (experiences is Map<String, dynamic>) {
      final ids = experiences['life_experience_ids'];
      if (ids is List) {
        _applyLifeExperienceIds(
          draft,
          ids.map((e) => e.toString()).toList(growable: false),
        );
      }
      final custom = experiences['custom_experiences'];
      if (custom is List) {
        draft.customExperiences = custom
            .map((e) => e.toString())
            .toList(growable: false);
      }
    }

    final comfort = saved['comfort_areas'];
    if (comfort is Map<String, dynamic>) {
      final ids = comfort['comfort_area_ids'];
      if (ids is List) {
        draft.comfortAreaIds = ids
            .map((e) => e.toString())
            .toList(growable: false);
      }
      draft.comfortAreaOtherText =
          comfort['custom_comfort_area_text'] as String? ??
          draft.comfortAreaOtherText;
    }

    final boundaries = saved['boundaries'];
    if (boundaries is Map<String, dynamic>) {
      final ids = boundaries['boundary_ids'];
      if (ids is List) {
        draft.boundaryIds = ids
            .map((e) => e.toString())
            .toList(growable: false);
      }
      draft.boundaryOtherText =
          boundaries['custom_boundary_text'] as String? ??
          draft.boundaryOtherText;
    }

    final voice = saved['voice_intro'];
    if (voice is Map<String, dynamic>) {
      draft.voiceIntroPath =
          voice['voice_intro_url'] as String? ?? draft.voiceIntroPath;
      final seconds = voice['voice_intro_seconds'];
      if (seconds is num) draft.voiceIntroSeconds = seconds.toInt();
    }

    final availability = saved['availability'];
    if (availability is Map<String, dynamic>) {
      draft.timeZoneId =
          availability['time_zone_id'] as String? ?? draft.timeZoneId;
      draft.acceptInstantCalls =
          availability['accept_instant_calls'] as bool? ??
          draft.acceptInstantCalls;

      final sessionMinutes = availability['session_minutes'];
      if (sessionMinutes is List) {
        draft.sessionMinutes = sessionMinutes
            .whereType<num>()
            .map((e) => e.toInt())
            .toList(growable: false);
      } else if (sessionMinutes is num) {
        draft.sessionMinutes = [sessionMinutes.toInt()];
      }

      final availabilityJson = availability['availability'];
      if (availabilityJson is Map<String, dynamic>) {
        final days = availabilityJson['days'];
        if (days is List && days.isNotEmpty) {
          final firstDay = days.first;
          if (firstDay is Map<String, dynamic>) {
            draft.availabilityDays = days
                .whereType<Map<String, dynamic>>()
                .map((d) => d['day']?.toString())
                .whereType<String>()
                .toList(growable: false);

            final slots = firstDay['slots'];
            if (slots is List && slots.isNotEmpty) {
              final slot = slots.first;
              if (slot is Map<String, dynamic>) {
                draft.availabilityFrom = _to12Hour(
                  slot['start']?.toString() ?? draft.availabilityFrom,
                );
                draft.availabilityTo = _to12Hour(
                  slot['end']?.toString() ?? draft.availabilityTo,
                );
              }
            }
          }
        }
      }
    }
  }

  static String? _nationalFromE164(String? phone) {
    if (phone == null || phone.isEmpty) return null;
    return phone.replaceAll(RegExp(r'\D'), '');
  }

  static void _applyLifeExperienceIds(
    ListenerRegistrationDraft draft,
    List<String> ids,
  ) {
    const relationshipIds = {
      'single',
      'in_relationship',
      'married',
      'divorced',
      'widowed',
    };
    const familyIds = {'parent', 'single_parent', 'caregiver'};

    draft.relationshipId = null;
    draft.familyIds = const [];
    draft.experienceIds = const [];

    final family = <String>[];
    final experiences = <String>[];

    for (final id in ids) {
      if (relationshipIds.contains(id)) {
        draft.relationshipId = id;
      } else if (familyIds.contains(id)) {
        family.add(id);
      } else {
        experiences.add(id);
      }
    }

    draft.familyIds = family;
    draft.experienceIds = experiences;
  }

  static String _to12Hour(String value24) {
    final parts = value24.split(':');
    if (parts.length != 2) return value24;

    var hour = int.tryParse(parts[0]) ?? 0;
    final minute = parts[1].padLeft(2, '0');
    final meridiem = hour >= 12 ? 'PM' : 'AM';
    if (hour == 0) hour = 12;
    if (hour > 12) hour -= 12;

    return '${hour.toString().padLeft(2, '0')}:$minute $meridiem';
  }
}
