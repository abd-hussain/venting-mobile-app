part of 'email_registration_bloc.dart';

@freezed
sealed class EmailRegistrationState with _$EmailRegistrationState {
  const factory EmailRegistrationState({
    @Default(false) bool isCheckingEmail,
    @Default(false) bool isSubmitting,
    @Default(EmailAuthMode.unknown) EmailAuthMode authMode,
    @Default('') String checkedEmail,
    AuthCheckEmailData? checkEmailData,

    /// Check-email / role-mismatch errors (shown under email).
    @Default('') String errorMessage,

    /// Login / register errors (shown under password).
    @Default('') String submitErrorMessage,
    AuthDestination? destination,
  }) = _EmailRegistrationState;
}
