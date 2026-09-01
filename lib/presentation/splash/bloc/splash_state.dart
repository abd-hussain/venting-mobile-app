part of 'splash_bloc.dart';

@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState({
    @Default(SplashProcessState.idle()) SplashProcessState processState,
    @Default('') String errorMessage,
    @Default('') String userEmail,
  }) = _SplashState;
}

@freezed
sealed class SplashProcessState with _$SplashProcessState {
  const factory SplashProcessState.idle() = SplashProcessIdle;
  const factory SplashProcessState.needOnboarding() =
      SplashProcessNeedOnboarding;
  const factory SplashProcessState.autherizedForApp({
    required AuthUserType userType,
  }) = SplashProcessAutherizedForApp;
  const factory SplashProcessState.needAuthenticate() =
      SplashProcessNeedAuthenticate;
  const factory SplashProcessState.needVentorRegistration() =
      SplashProcessNeedVentorRegistration;
  const factory SplashProcessState.needListenerRegistration() =
      SplashProcessNeedListenerRegistration;
  const factory SplashProcessState.listenerProfileUnderReview() =
      SplashProcessListenerProfileUnderReview;
  const factory SplashProcessState.listenerProfileRejected() =
      SplashProcessListenerProfileRejected;
  const factory SplashProcessState.error() = SplashProcessError;
}
