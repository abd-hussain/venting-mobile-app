part of 'ventor_booked_sessions_bloc.dart';

@freezed
sealed class VentorBookedSessionsEvent with _$VentorBookedSessionsEvent {
  const factory VentorBookedSessionsEvent.started() = _Started;

  const factory VentorBookedSessionsEvent.retryLoad() = _RetryLoad;

  const factory VentorBookedSessionsEvent.refreshRequested() =
      _RefreshRequested;

  const factory VentorBookedSessionsEvent.sessionUpdated(
    VentorBookedSession session,
  ) = _SessionUpdated;
}
