part of 'ventor_listener_profile_bloc.dart';

@freezed
sealed class VentorListenerProfileEvent with _$VentorListenerProfileEvent {
  const factory VentorListenerProfileEvent.started() = _Started;

  const factory VentorListenerProfileEvent.retryLoad() = _RetryLoad;

  const factory VentorListenerProfileEvent.favoriteToggled() = _FavoriteToggled;
}
