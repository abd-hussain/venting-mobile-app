/// Ordered steps for listener registration (12 total).
enum ListenerRegistrationStep {
  createAccount,
  identityVerification,
  profilePhoto,
  aboutYou,
  languages,
  expertise,
  voiceIntro,
  availability,
  experience,
  guidelines,
  verifyEmail,
  reviewSubmit,
}

extension ListenerRegistrationStepX on ListenerRegistrationStep {
  int get number => index + 1;

  static const total = 12;

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
