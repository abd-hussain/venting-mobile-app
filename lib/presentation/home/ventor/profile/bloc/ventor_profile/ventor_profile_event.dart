part of 'ventor_profile_bloc.dart';

@freezed
sealed class VentorProfileEvent with _$VentorProfileEvent {
  const factory VentorProfileEvent.started() = _Started;
  const factory VentorProfileEvent.retryLoad() = _RetryLoad;
  const factory VentorProfileEvent.refreshRequested() = _RefreshRequested;
  const factory VentorProfileEvent.profileUpdateRequested({
    String? nickname,
    String? avatarFilePath,
  }) = _ProfileUpdateRequested;
}
