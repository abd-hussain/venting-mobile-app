part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoadingGoogle,
    @Default(false) bool isLoadingApple,
    @Default('') String errorMessage,
    AuthDestination? destination,
  }) = _AuthState;
}
