import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_step.dart';

/// API step ids for `PATCH /v1/listeners/register/steps/{step}`.
enum ListenerRegistrationStepSlug {
  profile('profile'),
  identity('identity'),
  about('about'),
  experiences('experiences'),
  comfortAreas('comfort-areas'),
  boundaries('boundaries'),
  voiceIntro('voice-intro'),
  availability('availability');

  const ListenerRegistrationStepSlug(this.pathSegment);

  final String pathSegment;

  static ListenerRegistrationStepSlug? fromPathSegment(String value) {
    final normalized = value.trim().toLowerCase();
    for (final slug in values) {
      if (slug.pathSegment == normalized) return slug;
    }
    return null;
  }

  static ListenerRegistrationStepSlug fromWizardStep(
    ListenerRegistrationStep step,
  ) {
    return switch (step) {
      ListenerRegistrationStep.createAccount =>
        ListenerRegistrationStepSlug.profile,
      ListenerRegistrationStep.identityVerification =>
        ListenerRegistrationStepSlug.identity,
      ListenerRegistrationStep.aboutYou => ListenerRegistrationStepSlug.about,
      ListenerRegistrationStep.experience =>
        ListenerRegistrationStepSlug.experiences,
      ListenerRegistrationStep.expertise =>
        ListenerRegistrationStepSlug.comfortAreas,
      ListenerRegistrationStep.boundaries =>
        ListenerRegistrationStepSlug.boundaries,
      ListenerRegistrationStep.voiceIntro =>
        ListenerRegistrationStepSlug.voiceIntro,
      ListenerRegistrationStep.availability =>
        ListenerRegistrationStepSlug.availability,
      ListenerRegistrationStep.notifications => throw ArgumentError(
        'Use complete endpoint for notifications step.',
      ),
    };
  }

  ListenerRegistrationStep? toWizardStep() {
    return switch (this) {
      ListenerRegistrationStepSlug.profile =>
        ListenerRegistrationStep.createAccount,
      ListenerRegistrationStepSlug.identity =>
        ListenerRegistrationStep.identityVerification,
      ListenerRegistrationStepSlug.about => ListenerRegistrationStep.aboutYou,
      ListenerRegistrationStepSlug.experiences =>
        ListenerRegistrationStep.experience,
      ListenerRegistrationStepSlug.comfortAreas =>
        ListenerRegistrationStep.expertise,
      ListenerRegistrationStepSlug.boundaries =>
        ListenerRegistrationStep.boundaries,
      ListenerRegistrationStepSlug.voiceIntro =>
        ListenerRegistrationStep.voiceIntro,
      ListenerRegistrationStepSlug.availability =>
        ListenerRegistrationStep.availability,
    };
  }
}
