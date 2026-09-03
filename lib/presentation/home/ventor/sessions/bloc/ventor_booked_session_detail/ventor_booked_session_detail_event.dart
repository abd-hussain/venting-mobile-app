part of 'ventor_booked_session_detail_bloc.dart';

@freezed
sealed class VentorBookedSessionDetailEvent
    with _$VentorBookedSessionDetailEvent {
  const factory VentorBookedSessionDetailEvent.started() = _Started;

  const factory VentorBookedSessionDetailEvent.retryLoad() = _RetryLoad;

  const factory VentorBookedSessionDetailEvent.cancelRequested({
    String? reason,
  }) = _CancelRequested;
}
