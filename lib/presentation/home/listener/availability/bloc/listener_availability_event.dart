part of 'listener_availability_bloc.dart';

@freezed
sealed class ListenerAvailabilityEvent with _$ListenerAvailabilityEvent {
  const factory ListenerAvailabilityEvent.started() = _Started;

  const factory ListenerAvailabilityEvent.onlineStatusChanged({
    required bool isOnline,
  }) = _OnlineStatusChanged;
}
