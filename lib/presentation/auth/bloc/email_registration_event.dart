part of 'email_registration_bloc.dart';

@freezed
abstract class EmailRegistrationEvent with _$EmailRegistrationEvent {
  /// Clears a previous check-email result when the user edits the email.
  const factory EmailRegistrationEvent.emailChanged({required String email}) =
      _EmailChanged;

  /// Calls `POST /v1/auth/check-email` to branch register vs login.
  const factory EmailRegistrationEvent.checkEmail({required String email}) =
      _CheckEmail;

  /// Calls `#1 register` or `#2 login`, then `#7 me` for routing.
  const factory EmailRegistrationEvent.submit({
    required String email,
    required String password,
  }) = _Submit;
}
