part of 'listener_availability_bloc.dart';

@freezed
sealed class ListenerAvailabilityEvent with _$ListenerAvailabilityEvent {
  const factory ListenerAvailabilityEvent.started() = _Started;

  const factory ListenerAvailabilityEvent.retryLoad() = _RetryLoad;

  const factory ListenerAvailabilityEvent.onlineStatusChanged({
    required bool isOnline,
  }) = _OnlineStatusChanged;

  const factory ListenerAvailabilityEvent.sessionLengthChanged({
    required PreferredSessionLengthSelection sessionLength,
  }) = _SessionLengthChanged;

  const factory ListenerAvailabilityEvent.breakLengthChanged({
    required int breakLengthMinutes,
  }) = _BreakLengthChanged;

  const factory ListenerAvailabilityEvent.dayScheduleChanged({
    required String dayId,
    required bool enabled,
    required List<TimeSlot> slots,
  }) = _DayScheduleChanged;
}
