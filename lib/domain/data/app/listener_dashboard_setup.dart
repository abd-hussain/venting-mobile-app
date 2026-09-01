import 'package:venting_mobile_app/domain/data/api/listener_registration_progress_model.dart';
import 'package:venting_mobile_app/domain/data/api/listener_setup_progress_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_step_slug.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_step.dart';

enum ListenerDashboardSetupStepStatus { done, inProgress, pending, locked }

enum ListenerProfileReviewStatus { incomplete, underReview, approved, rejected }

enum ListenerDashboardSetupStepId {
  createAccount,
  identityVerification,
  aboutYou,
  experience,
  expertise,
  boundaries,
  voiceIntro,
  availability,
  notifications,
  training,
  bookFirstSession,
}

class ListenerDashboardSetupStep {
  const ListenerDashboardSetupStep({required this.id, required this.status});

  final ListenerDashboardSetupStepId id;
  final ListenerDashboardSetupStepStatus status;

  ListenerDashboardSetupStep copyWith({
    ListenerDashboardSetupStepStatus? status,
  }) {
    return ListenerDashboardSetupStep(id: id, status: status ?? this.status);
  }

  bool get isTappable {
    return switch (status) {
      ListenerDashboardSetupStepStatus.inProgress ||
      ListenerDashboardSetupStepStatus.pending => true,
      ListenerDashboardSetupStepStatus.done ||
      ListenerDashboardSetupStepStatus.locked => false,
    };
  }
}

class ListenerDashboardSetupProgress {
  const ListenerDashboardSetupProgress({
    required this.steps,
    this.profileApproved = false,
    this.profileStatus = ListenerProfileReviewStatus.incomplete,
    this.canGoOnline = false,
    this.stepsToRefill = const [],
    this.rejectionReason,
    this.registrationComplete = false,
    this.progressPercentOverride,
  });

  final List<ListenerDashboardSetupStep> steps;
  final bool profileApproved;
  final ListenerProfileReviewStatus profileStatus;
  final bool canGoOnline;
  final List<ListenerDashboardSetupStepId> stepsToRefill;
  final String? rejectionReason;
  final bool registrationComplete;
  final int? progressPercentOverride;

  bool get isProfileUnderReview =>
      profileStatus == ListenerProfileReviewStatus.underReview;

  bool get isProfileRejected =>
      profileStatus == ListenerProfileReviewStatus.rejected;

  bool stepNeedsRefill(ListenerDashboardSetupStepId id) =>
      stepsToRefill.contains(id);

  static const orderedStepIds = <ListenerDashboardSetupStepId>[
    ListenerDashboardSetupStepId.createAccount,
    ListenerDashboardSetupStepId.identityVerification,
    ListenerDashboardSetupStepId.aboutYou,
    ListenerDashboardSetupStepId.experience,
    ListenerDashboardSetupStepId.expertise,
    ListenerDashboardSetupStepId.boundaries,
    ListenerDashboardSetupStepId.voiceIntro,
    ListenerDashboardSetupStepId.availability,
    ListenerDashboardSetupStepId.notifications,
    ListenerDashboardSetupStepId.training,
    ListenerDashboardSetupStepId.bookFirstSession,
  ];

  static const postRegistrationStepIds = <ListenerDashboardSetupStepId>[
    ListenerDashboardSetupStepId.training,
    ListenerDashboardSetupStepId.bookFirstSession,
  ];

  int get progressPercent {
    if (progressPercentOverride != null) return progressPercentOverride!;
    if (steps.isEmpty) return 0;
    var total = 0.0;
    for (final step in steps) {
      total += switch (step.status) {
        ListenerDashboardSetupStepStatus.done => 1.0,
        ListenerDashboardSetupStepStatus.inProgress => 0.5,
        ListenerDashboardSetupStepStatus.pending => 0.0,
        ListenerDashboardSetupStepStatus.locked => 0.0,
      };
    }
    return (total / steps.length * 100).round();
  }

  bool get isComplete =>
      steps.every((s) => s.status == ListenerDashboardSetupStepStatus.done);

  /// Training finished; waiting for the listener to acknowledge the first call.
  bool get isAwaitingFirstSessionWithUs {
    final training = stepById(ListenerDashboardSetupStepId.training);
    final book = stepById(ListenerDashboardSetupStepId.bookFirstSession);
    return training?.status == ListenerDashboardSetupStepStatus.done &&
        book?.status != ListenerDashboardSetupStepStatus.done;
  }

  ListenerDashboardSetupStepId? get firstIncompleteStep {
    for (final step in steps) {
      if (step.status != ListenerDashboardSetupStepStatus.done) {
        return step.id;
      }
    }
    return null;
  }

  /// Next step the listener can work on now.
  ListenerDashboardSetupStepId? get firstActionableStep {
    for (final step in steps) {
      if (step.status == ListenerDashboardSetupStepStatus.done) continue;
      if (step.isTappable) return step.id;
    }
    return null;
  }

  bool get hasOnlyBlockedSteps {
    if (isComplete) return false;
    return firstActionableStep == null && firstIncompleteStep != null;
  }

  ListenerDashboardSetupStep? stepById(ListenerDashboardSetupStepId id) {
    for (final step in steps) {
      if (step.id == id) return step;
    }
    return null;
  }

  static const _registrationSlugs = <ListenerRegistrationStepSlug>[
    ListenerRegistrationStepSlug.profile,
    ListenerRegistrationStepSlug.identity,
    ListenerRegistrationStepSlug.about,
    ListenerRegistrationStepSlug.experiences,
    ListenerRegistrationStepSlug.comfortAreas,
    ListenerRegistrationStepSlug.boundaries,
    ListenerRegistrationStepSlug.voiceIntro,
    ListenerRegistrationStepSlug.availability,
  ];

  static const _registrationStepIds = <ListenerDashboardSetupStepId>[
    ListenerDashboardSetupStepId.createAccount,
    ListenerDashboardSetupStepId.identityVerification,
    ListenerDashboardSetupStepId.aboutYou,
    ListenerDashboardSetupStepId.experience,
    ListenerDashboardSetupStepId.expertise,
    ListenerDashboardSetupStepId.boundaries,
    ListenerDashboardSetupStepId.voiceIntro,
    ListenerDashboardSetupStepId.availability,
    ListenerDashboardSetupStepId.notifications,
  ];

  /// Maps `GET /v1/listeners/me/setup-progress` payload to the dashboard model.
  factory ListenerDashboardSetupProgress.fromApi(
    ListenerSetupProgressData data,
  ) => listenerDashboardSetupFromApi(data);

  factory ListenerDashboardSetupProgress.fromRegistrationProgress({
    required ListenerRegistrationProgressModel registration,
    bool trainingComplete = false,
    bool bookFirstSessionComplete = false,
  }) {
    final completed = registration.completedSteps.toSet();
    final registrationComplete = registration.registrationComplete;

    final registrationSteps = <ListenerDashboardSetupStep>[];
    ListenerDashboardSetupStepId? firstIncompleteRegistration;

    for (var i = 0; i < _registrationSlugs.length; i++) {
      final slug = _registrationSlugs[i];
      final stepId = _registrationStepIds[i];
      final isDone = completed.contains(slug.pathSegment);

      if (isDone) {
        registrationSteps.add(
          ListenerDashboardSetupStep(
            id: stepId,
            status: ListenerDashboardSetupStepStatus.done,
          ),
        );
      } else {
        firstIncompleteRegistration ??= stepId;
        registrationSteps.add(
          ListenerDashboardSetupStep(
            id: stepId,
            status: stepId == firstIncompleteRegistration
                ? ListenerDashboardSetupStepStatus.inProgress
                : ListenerDashboardSetupStepStatus.pending,
          ),
        );
      }
    }

    final notificationsDone = registrationComplete;
    if (notificationsDone) {
      registrationSteps.add(
        const ListenerDashboardSetupStep(
          id: ListenerDashboardSetupStepId.notifications,
          status: ListenerDashboardSetupStepStatus.done,
        ),
      );
    } else {
      firstIncompleteRegistration ??=
          ListenerDashboardSetupStepId.notifications;
      registrationSteps.add(
        ListenerDashboardSetupStep(
          id: ListenerDashboardSetupStepId.notifications,
          status:
              firstIncompleteRegistration ==
                  ListenerDashboardSetupStepId.notifications
              ? ListenerDashboardSetupStepStatus.inProgress
              : ListenerDashboardSetupStepStatus.pending,
        ),
      );
    }

    final profileApproved =
        registration.profileStatus == 'approved' && registrationComplete;

    if (!registrationComplete) {
      return ListenerDashboardSetupProgress(
        profileApproved: profileApproved,
        steps: [
          ...registrationSteps,
          const ListenerDashboardSetupStep(
            id: ListenerDashboardSetupStepId.training,
            status: ListenerDashboardSetupStepStatus.locked,
          ),
          const ListenerDashboardSetupStep(
            id: ListenerDashboardSetupStepId.bookFirstSession,
            status: ListenerDashboardSetupStepStatus.locked,
          ),
        ],
      );
    }

    final postRegistration = <ListenerDashboardSetupStep>[];

    if (trainingComplete) {
      postRegistration.add(
        const ListenerDashboardSetupStep(
          id: ListenerDashboardSetupStepId.training,
          status: ListenerDashboardSetupStepStatus.done,
        ),
      );
    } else {
      postRegistration.add(
        const ListenerDashboardSetupStep(
          id: ListenerDashboardSetupStepId.training,
          status: ListenerDashboardSetupStepStatus.inProgress,
        ),
      );
    }

    if (!trainingComplete) {
      postRegistration.add(
        const ListenerDashboardSetupStep(
          id: ListenerDashboardSetupStepId.bookFirstSession,
          status: ListenerDashboardSetupStepStatus.locked,
        ),
      );
    } else if (bookFirstSessionComplete) {
      postRegistration.add(
        const ListenerDashboardSetupStep(
          id: ListenerDashboardSetupStepId.bookFirstSession,
          status: ListenerDashboardSetupStepStatus.done,
        ),
      );
    } else {
      postRegistration.add(
        const ListenerDashboardSetupStep(
          id: ListenerDashboardSetupStepId.bookFirstSession,
          status: ListenerDashboardSetupStepStatus.inProgress,
        ),
      );
    }

    return ListenerDashboardSetupProgress(
      profileApproved: profileApproved,
      registrationComplete: true,
      steps: [...registrationSteps, ...postRegistration],
    );
  }

  ListenerDashboardSetupProgress markTrainingComplete() {
    return copyWithPostRegistration(trainingComplete: true);
  }

  ListenerDashboardSetupProgress copyWithPostRegistration({
    bool trainingComplete = false,
    bool bookFirstSessionComplete = false,
  }) {
    return ListenerDashboardSetupProgress(
      profileApproved: profileApproved,
      profileStatus: profileStatus,
      canGoOnline: canGoOnline,
      stepsToRefill: stepsToRefill,
      rejectionReason: rejectionReason,
      registrationComplete: registrationComplete,
      progressPercentOverride: progressPercentOverride,
      steps: [
        for (final step in steps)
          if (step.id == ListenerDashboardSetupStepId.training)
            ListenerDashboardSetupStep(
              id: step.id,
              status: trainingComplete
                  ? ListenerDashboardSetupStepStatus.done
                  : ListenerDashboardSetupStepStatus.inProgress,
            )
          else if (step.id == ListenerDashboardSetupStepId.bookFirstSession)
            ListenerDashboardSetupStep(
              id: step.id,
              status: bookFirstSessionComplete
                  ? ListenerDashboardSetupStepStatus.done
                  : trainingComplete
                  ? ListenerDashboardSetupStepStatus.inProgress
                  : ListenerDashboardSetupStepStatus.locked,
            )
          else
            step,
      ],
    );
  }

  static ListenerRegistrationStep? registrationStepFor(
    ListenerDashboardSetupStepId id,
  ) {
    return switch (id) {
      ListenerDashboardSetupStepId.createAccount =>
        ListenerRegistrationStep.createAccount,
      ListenerDashboardSetupStepId.identityVerification =>
        ListenerRegistrationStep.identityVerification,
      ListenerDashboardSetupStepId.aboutYou =>
        ListenerRegistrationStep.aboutYou,
      ListenerDashboardSetupStepId.experience =>
        ListenerRegistrationStep.experience,
      ListenerDashboardSetupStepId.expertise =>
        ListenerRegistrationStep.expertise,
      ListenerDashboardSetupStepId.boundaries =>
        ListenerRegistrationStep.boundaries,
      ListenerDashboardSetupStepId.voiceIntro =>
        ListenerRegistrationStep.voiceIntro,
      ListenerDashboardSetupStepId.availability =>
        ListenerRegistrationStep.availability,
      ListenerDashboardSetupStepId.notifications =>
        ListenerRegistrationStep.notifications,
      ListenerDashboardSetupStepId.training ||
      ListenerDashboardSetupStepId.bookFirstSession => null,
    };
  }

  /// Dev preview — registration mostly done, training in progress.
  static const mockAwaitingTraining = ListenerDashboardSetupProgress(
    profileApproved: true,
    steps: [
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.createAccount,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.identityVerification,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.aboutYou,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.experience,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.expertise,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.boundaries,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.voiceIntro,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.availability,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.notifications,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.training,
        status: ListenerDashboardSetupStepStatus.inProgress,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.bookFirstSession,
        status: ListenerDashboardSetupStepStatus.locked,
      ),
    ],
    registrationComplete: true,
  );
}

ListenerDashboardSetupProgress listenerDashboardSetupFromApi(
  ListenerSetupProgressData data,
) {
  final stepsById =
      <ListenerDashboardSetupStepId, ListenerDashboardSetupStep>{};

  for (final step in data.steps) {
    final id = _setupStepIdFromApi(step.id);
    final status = _setupStepStatusFromApi(step.status);
    if (id == null || status == null) continue;
    stepsById[id] = ListenerDashboardSetupStep(id: id, status: status);
  }

  final orderedSteps = <ListenerDashboardSetupStep>[
    for (final id in ListenerDashboardSetupProgress.orderedStepIds)
      stepsById[id] ?? _defaultSetupStep(id, stepsById),
  ];

  final registrationComplete =
      data.registration_complete || _registrationSetupComplete(stepsById);

  final progress = ListenerDashboardSetupProgress(
    profileApproved: _isProfileApproved(data),
    profileStatus: _profileReviewStatusFromApi(data),
    canGoOnline: data.can_go_online,
    stepsToRefill: _stepsToRefillFromApi(data.steps_to_refill),
    rejectionReason: data.rejection_reason.trim().isEmpty
        ? null
        : data.rejection_reason.trim(),
    registrationComplete: registrationComplete,
    progressPercentOverride: data.progress_percent,
    steps: orderedSteps,
  );

  return _unlockPostRegistrationSteps(progress);
}

bool _isProfileApproved(ListenerSetupProgressData data) {
  if (data.profile_approved) return true;
  return data.profile_status.trim().toLowerCase() == 'approved';
}

ListenerProfileReviewStatus _profileReviewStatusFromApi(
  ListenerSetupProgressData data,
) {
  if (_isProfileApproved(data)) {
    return ListenerProfileReviewStatus.approved;
  }

  return switch (data.profile_status.trim().toLowerCase()) {
    'under_review' => ListenerProfileReviewStatus.underReview,
    'rejected' => ListenerProfileReviewStatus.rejected,
    'approved' => ListenerProfileReviewStatus.approved,
    _ => ListenerProfileReviewStatus.incomplete,
  };
}

List<ListenerDashboardSetupStepId> _stepsToRefillFromApi(
  List<String> rawSteps,
) {
  return [
    for (final raw in rawSteps)
      if (_setupStepIdFromApi(raw) case final id?) id,
  ];
}

bool _registrationSetupComplete(
  Map<ListenerDashboardSetupStepId, ListenerDashboardSetupStep> stepsById,
) {
  const registrationIds = <ListenerDashboardSetupStepId>[
    ListenerDashboardSetupStepId.createAccount,
    ListenerDashboardSetupStepId.identityVerification,
    ListenerDashboardSetupStepId.aboutYou,
    ListenerDashboardSetupStepId.experience,
    ListenerDashboardSetupStepId.expertise,
    ListenerDashboardSetupStepId.boundaries,
    ListenerDashboardSetupStepId.voiceIntro,
    ListenerDashboardSetupStepId.availability,
    ListenerDashboardSetupStepId.notifications,
  ];

  return registrationIds.every(
    (id) => stepsById[id]?.status == ListenerDashboardSetupStepStatus.done,
  );
}

ListenerDashboardSetupStep _defaultSetupStep(
  ListenerDashboardSetupStepId id,
  Map<ListenerDashboardSetupStepId, ListenerDashboardSetupStep> stepsById,
) {
  final registrationComplete = _registrationSetupComplete(stepsById);

  if (ListenerDashboardSetupProgress.postRegistrationStepIds.contains(id)) {
    if (!registrationComplete) {
      return ListenerDashboardSetupStep(
        id: id,
        status: ListenerDashboardSetupStepStatus.locked,
      );
    }
    if (id == ListenerDashboardSetupStepId.bookFirstSession) {
      final trainingStatus =
          stepsById[ListenerDashboardSetupStepId.training]?.status;
      if (trainingStatus != ListenerDashboardSetupStepStatus.done) {
        return ListenerDashboardSetupStep(
          id: id,
          status: ListenerDashboardSetupStepStatus.locked,
        );
      }
    }
    return ListenerDashboardSetupStep(
      id: id,
      status: ListenerDashboardSetupStepStatus.pending,
    );
  }

  return ListenerDashboardSetupStep(
    id: id,
    status: ListenerDashboardSetupStepStatus.pending,
  );
}

ListenerDashboardSetupProgress _unlockPostRegistrationSteps(
  ListenerDashboardSetupProgress progress,
) {
  if (!progress.registrationComplete) return progress;

  final stepsById = {for (final step in progress.steps) step.id: step};

  bool isDone(ListenerDashboardSetupStepId id) =>
      stepsById[id]?.status == ListenerDashboardSetupStepStatus.done;

  final updatedSteps = <ListenerDashboardSetupStep>[];

  for (final step in progress.steps) {
    if (!ListenerDashboardSetupProgress.postRegistrationStepIds.contains(
      step.id,
    )) {
      updatedSteps.add(step);
      continue;
    }

    if (step.status != ListenerDashboardSetupStepStatus.locked) {
      updatedSteps.add(step);
      continue;
    }

    if (step.id == ListenerDashboardSetupStepId.bookFirstSession &&
        !isDone(ListenerDashboardSetupStepId.training)) {
      updatedSteps.add(step);
      continue;
    }

    updatedSteps.add(
      step.copyWith(
        status: step.id == ListenerDashboardSetupStepId.training
            ? ListenerDashboardSetupStepStatus.inProgress
            : ListenerDashboardSetupStepStatus.pending,
      ),
    );
  }

  return ListenerDashboardSetupProgress(
    profileApproved: progress.profileApproved,
    profileStatus: progress.profileStatus,
    canGoOnline: progress.canGoOnline,
    stepsToRefill: progress.stepsToRefill,
    rejectionReason: progress.rejectionReason,
    registrationComplete: progress.registrationComplete,
    progressPercentOverride: progress.progressPercentOverride,
    steps: updatedSteps,
  );
}

ListenerDashboardSetupStepId? _setupStepIdFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'create_account' => ListenerDashboardSetupStepId.createAccount,
    'profile' => ListenerDashboardSetupStepId.createAccount,
    'identity_verification' ||
    'identity_verified' ||
    'identity' => ListenerDashboardSetupStepId.identityVerification,
    'profile_info' => ListenerDashboardSetupStepId.createAccount,
    'about_you' || 'about' => ListenerDashboardSetupStepId.aboutYou,
    'experience' || 'experiences' => ListenerDashboardSetupStepId.experience,
    'comfort_areas' ||
    'comfort-areas' ||
    'expertise' => ListenerDashboardSetupStepId.expertise,
    'boundaries' => ListenerDashboardSetupStepId.boundaries,
    'voice_intro' || 'voice-intro' => ListenerDashboardSetupStepId.voiceIntro,
    'availability' => ListenerDashboardSetupStepId.availability,
    'notifications' => ListenerDashboardSetupStepId.notifications,
    'training' => ListenerDashboardSetupStepId.training,
    'book_first_session' ||
    'book-first-session' => ListenerDashboardSetupStepId.bookFirstSession,
    'first_session_tutorial' || 'first-session-tutorial' => null,
    _ => null,
  };
}

ListenerDashboardSetupStepStatus? _setupStepStatusFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'done' ||
    'completed' ||
    'approved' ||
    'uploaded' ||
    'submitted' => ListenerDashboardSetupStepStatus.done,
    'in_progress' ||
    'in-progress' => ListenerDashboardSetupStepStatus.inProgress,
    'pending' ||
    'not_started' ||
    'needs_refill' => ListenerDashboardSetupStepStatus.pending,
    'locked' => ListenerDashboardSetupStepStatus.locked,
    _ => null,
  };
}
