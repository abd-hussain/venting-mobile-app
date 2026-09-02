part of 'ventor_booked_sessions_bloc.dart';

enum VentorBookedSessionsStatus { initial, loading, ready, loadFailure }

@freezed
sealed class VentorBookedSessionsState with _$VentorBookedSessionsState {
  const factory VentorBookedSessionsState({
    @Default(VentorBookedSessionsStatus.initial)
    VentorBookedSessionsStatus status,
    @Default(<VentorBookedSession>[]) List<VentorBookedSession> sessions,
    @Default(false) bool isRefreshing,
    @Default('') String errorMessage,
  }) = _VentorBookedSessionsState;

  const VentorBookedSessionsState._();

  bool get isLoadingOrInitial =>
      status == VentorBookedSessionsStatus.initial ||
      status == VentorBookedSessionsStatus.loading;

  bool get isLoadFailure => status == VentorBookedSessionsStatus.loadFailure;

  bool get isReady => status == VentorBookedSessionsStatus.ready;
}
