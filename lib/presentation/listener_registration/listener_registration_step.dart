/// Ordered steps for listener registration (9 total).
enum ListenerRegistrationStep {
  createAccount,
  identityVerification,
  aboutYou,
  experience,
  expertise,
  boundaries,
  voiceIntro,
  availability,
  notifications,
}

extension ListenerRegistrationStepX on ListenerRegistrationStep {
  int get number => index + 1;

  static const total = 9;

  ListenerRegistrationStep? get next {
    final i = index + 1;
    if (i >= ListenerRegistrationStep.values.length) return null;
    return ListenerRegistrationStep.values[i];
  }

  ListenerRegistrationStep? get previous {
    final i = index - 1;
    if (i < 0) return null;
    return ListenerRegistrationStep.values[i];
  }
}
