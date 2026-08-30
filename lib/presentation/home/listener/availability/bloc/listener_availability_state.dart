part of 'listener_availability_bloc.dart';

enum ListenerAvailabilityStatus { initial, loading, ready, loadFailure }

enum ListenerAvailabilitySavingTarget {
  online,
  instantCalls,
  sessionLength,
  breakLength,
  day,
}

@freezed
sealed class ListenerAvailabilityState with _$ListenerAvailabilityState {
  const factory ListenerAvailabilityState({
    @Default(ListenerAvailabilityStatus.initial)
    ListenerAvailabilityStatus status,
    ListenerAvailability? availability,
    @Default(false) bool isOnline,
    ListenerAvailabilitySavingTarget? savingTarget,
    String? savingDayId,
    @Default('') String errorMessage,
  }) = _ListenerAvailabilityState;

  const ListenerAvailabilityState._();

  bool get isLoading => status == ListenerAvailabilityStatus.loading;

  bool get isReady => status == ListenerAvailabilityStatus.ready;

  bool get isLoadFailure => status == ListenerAvailabilityStatus.loadFailure;

  bool get isSavingOnline =>
      savingTarget == ListenerAvailabilitySavingTarget.online;

  bool get isSavingInstantCalls =>
      savingTarget == ListenerAvailabilitySavingTarget.instantCalls;

  bool get isSavingSessionLength =>
      savingTarget == ListenerAvailabilitySavingTarget.sessionLength;

  bool get isSavingBreakLength =>
      savingTarget == ListenerAvailabilitySavingTarget.breakLength;

  bool isSavingDay(String dayId) =>
      savingTarget == ListenerAvailabilitySavingTarget.day &&
      savingDayId == dayId;
}
