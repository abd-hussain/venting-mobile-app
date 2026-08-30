import 'package:venting_mobile_app/domain/data/app/ventor_registration_step_slug.dart';
import 'package:venting_mobile_app/presentation/ventor_registration/steps/ventor_registration_interests_step.dart';

/// `GET /v1/ventors/register/progress`
class VentorRegistrationProgressModel {
  const VentorRegistrationProgressModel({
    required this.registrationComplete,
    this.nextStep,
    this.completedSteps = const [],
    this.saved = const {},
  });

  final bool registrationComplete;
  final String? nextStep;
  final List<String> completedSteps;
  final Map<String, dynamic> saved;

  factory VentorRegistrationProgressModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] is Map<String, dynamic>
        ? json['data'] as Map<String, dynamic>
        : json;

    final completedRaw = data['completed_steps'];
    final savedRaw = data['saved'];

    return VentorRegistrationProgressModel(
      registrationComplete: data['registration_complete'] as bool? ?? false,
      nextStep: data['next_step'] as String?,
      completedSteps: completedRaw is List
          ? completedRaw.map((e) => e.toString()).toList(growable: false)
          : const [],
      saved: savedRaw is Map<String, dynamic>
          ? Map<String, dynamic>.from(savedRaw)
          : const {},
    );
  }

  int resolveResumeStepIndex() {
    final slug = nextStep == null
        ? null
        : VentorRegistrationStepSlug.fromPathSegment(nextStep!);
    if (slug?.toStepIndex() != null) return slug!.toStepIndex()!;

    const order = [
      VentorRegistrationStepSlug.profile,
      VentorRegistrationStepSlug.languages,
      VentorRegistrationStepSlug.interests,
    ];

    for (final step in order) {
      if (!completedSteps.contains(step.pathSegment)) {
        return step.toStepIndex() ?? 0;
      }
    }

    return registrationComplete ? 3 : 3;
  }
}

class VentorRegistrationSavedState {
  const VentorRegistrationSavedState({
    this.nickname = '',
    this.gender,
    this.avatarUrl,
    this.avatarPresetIndex,
    this.languageIds = const [],
    this.interestsSelection,
  });

  final String nickname;
  final String? gender;
  final String? avatarUrl;
  final int? avatarPresetIndex;
  final List<String> languageIds;
  final VentorInterestsSelection? interestsSelection;

  factory VentorRegistrationSavedState.fromProgress(
    VentorRegistrationProgressModel progress,
  ) {
    final saved = progress.saved;
    final profile = saved['profile'];
    final languages = saved['languages'];
    final interests = saved['interests'];

    String nickname = '';
    String? gender;
    String? avatarUrl;
    int? avatarPresetIndex;

    if (profile is Map<String, dynamic>) {
      nickname = profile['nickname'] as String? ?? '';
      gender = profile['gender'] as String?;
      avatarUrl = profile['avatar_url'] as String?;
      final preset = profile['avatar_preset_index'];
      if (preset is num) avatarPresetIndex = preset.toInt();
    }

    var languageIds = <String>[];
    if (languages is Map<String, dynamic>) {
      final ids = languages['language_ids'];
      if (ids is List) {
        languageIds = ids.map((e) => e.toString()).toList(growable: false);
      }
    }

    VentorInterestsSelection? interestsSelection;
    if (interests is Map<String, dynamic>) {
      final ids = interests['interest_ids'];
      if (ids is List) {
        interestsSelection = VentorInterestsSelection(
          interestIds: ids.map((e) => e.toString()).toList(growable: false),
          otherInterestText: interests['other_interest_text'] as String?,
        );
      }
    }

    return VentorRegistrationSavedState(
      nickname: nickname,
      gender: gender,
      avatarUrl: avatarUrl,
      avatarPresetIndex: avatarPresetIndex,
      languageIds: languageIds,
      interestsSelection: interestsSelection,
    );
  }
}
