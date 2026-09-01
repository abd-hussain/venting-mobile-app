part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInWithGoogle() = _SignInWithGoogle;
  const factory AuthEvent.signInWithApple() = _SignInWithApple;
  const factory AuthEvent.clearError() = _ClearError;
}
