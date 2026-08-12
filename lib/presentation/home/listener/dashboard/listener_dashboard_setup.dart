enum ListenerDashboardSetupStepStatus { done, inProgress, locked }

enum ListenerDashboardSetupStepId {
  identityVerified,
  profileInfo,
  availability,
  training,
  firstSessionTutorial,
}

class ListenerDashboardSetupStep {
  const ListenerDashboardSetupStep({required this.id, required this.status});

  final ListenerDashboardSetupStepId id;
  final ListenerDashboardSetupStepStatus status;
}

class ListenerDashboardSetupProgress {
  const ListenerDashboardSetupProgress({
    required this.steps,
    this.profileApproved = false,
  });

  final List<ListenerDashboardSetupStep> steps;
  final bool profileApproved;

  int get progressPercent {
    if (steps.isEmpty) return 0;
    var total = 0.0;
    for (final step in steps) {
      total += switch (step.status) {
        ListenerDashboardSetupStepStatus.done => 1.0,
        ListenerDashboardSetupStepStatus.inProgress => 0.5,
        ListenerDashboardSetupStepStatus.locked => 0.0,
      };
    }
    return (total / steps.length * 100).round();
  }

  bool get isComplete =>
      steps.every((s) => s.status == ListenerDashboardSetupStepStatus.done);

  ListenerDashboardSetupStepId? get firstIncompleteStep {
    for (final step in steps) {
      if (step.status != ListenerDashboardSetupStepStatus.done) {
        return step.id;
      }
    }
    return null;
  }

  // TODO: Load from listener onboarding / setup API.
  /// Registration finished — remaining work is training (+ locked tutorial).
  static const mockAwaitingTraining = ListenerDashboardSetupProgress(
    profileApproved: true,
    steps: [
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.identityVerified,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.profileInfo,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.availability,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.training,
        status: ListenerDashboardSetupStepStatus.inProgress,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.firstSessionTutorial,
        status: ListenerDashboardSetupStepStatus.locked,
      ),
    ],
  );

  static const mockIncomplete = ListenerDashboardSetupProgress(
    profileApproved: true,
    steps: [
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.identityVerified,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.profileInfo,
        status: ListenerDashboardSetupStepStatus.done,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.availability,
        status: ListenerDashboardSetupStepStatus.inProgress,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.training,
        status: ListenerDashboardSetupStepStatus.locked,
      ),
      ListenerDashboardSetupStep(
        id: ListenerDashboardSetupStepId.firstSessionTutorial,
        status: ListenerDashboardSetupStepStatus.locked,
      ),
    ],
  );
}
