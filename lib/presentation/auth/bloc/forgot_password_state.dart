part of 'forgot_password_bloc.dart';

@freezed
sealed class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default('') String email,
    @Default(false) bool isSubmitting,
    @Default(false) bool emailSent,
    @Default('') String errorMessage,
  }) = _ForgotPasswordState;
}
