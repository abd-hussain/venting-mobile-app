/// API step ids for `PATCH /v1/ventors/register/steps/{step}`.
enum VentorRegistrationStepSlug {
  profile('profile'),
  languages('languages'),
  interests('interests');

  const VentorRegistrationStepSlug(this.pathSegment);

  final String pathSegment;

  static VentorRegistrationStepSlug? fromPathSegment(String value) {
    final normalized = value.trim().toLowerCase();
    for (final slug in values) {
      if (slug.pathSegment == normalized) return slug;
    }
    return null;
  }

  static VentorRegistrationStepSlug fromStepIndex(int index) {
    return switch (index) {
      0 => VentorRegistrationStepSlug.profile,
      1 => VentorRegistrationStepSlug.languages,
      2 => VentorRegistrationStepSlug.interests,
      _ => throw ArgumentError(
        'Invalid ventor registration step index: $index',
      ),
    };
  }

  int? toStepIndex() {
    return switch (this) {
      VentorRegistrationStepSlug.profile => 0,
      VentorRegistrationStepSlug.languages => 1,
      VentorRegistrationStepSlug.interests => 2,
    };
  }
}
