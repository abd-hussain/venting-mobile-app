part of 'splash_bloc.dart';

@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState({
    @Default(SplashProcessState.idle()) SplashProcessState processState,
    @Default("") String errorMessage,
  }) = _SplashState;
}

@freezed
sealed class SplashProcessState with _$SplashProcessState {
  const factory SplashProcessState.idle() = SplashProcessIdle;
  const factory SplashProcessState.needOnboarding() =
      SplashProcessNeedOnboarding;
  const factory SplashProcessState.autherizedForApp() =
      SplashProcessAutherizedForApp;
  const factory SplashProcessState.needToLogIn() = SplashProcessNeedToLogIn;
  const factory SplashProcessState.needToRegister() =
      SplashProcessNeedToRegister;
  const factory SplashProcessState.error() = SplashProcessError;
}
