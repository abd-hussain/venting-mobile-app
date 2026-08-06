/// Outcome of a submitted listener registration profile.
enum ListenerProfileStatus {
  underReview,
  approved,
  rejected,
}

class ListenerProfileStatusArgs {
  const ListenerProfileStatusArgs({
    required this.status,
    this.rejectionReasons = const [],
    this.editStepLabel,
  });

  final ListenerProfileStatus status;

  /// Shown on the rejected screen. Falls back to sample copy when empty.
  final List<String> rejectionReasons;

  /// Optional hint under the rejected stepper, e.g. "Experience".
  final String? editStepLabel;
}
