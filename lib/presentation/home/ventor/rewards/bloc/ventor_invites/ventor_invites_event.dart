part of 'ventor_invites_bloc.dart';

@freezed
sealed class VentorInvitesEvent with _$VentorInvitesEvent {
  const factory VentorInvitesEvent.started() = _Started;
  const factory VentorInvitesEvent.retryLoad() = _RetryLoad;
}
