part of 'ventor_booked_session_detail_bloc.dart';

enum VentorBookedSessionDetailStatus { initial, loading, ready, loadFailure }

@freezed
sealed class VentorBookedSessionDetailState
    with _$VentorBookedSessionDetailState {
  const factory VentorBookedSessionDetailState({
    @Default(VentorBookedSessionDetailStatus.initial)
    VentorBookedSessionDetailStatus status,
    required VentorBookedSession session,
    VentorBookedSessionListenerSummary? listener,
    VentorBookedSessionPayment? payment,
    @Default(false) bool isCancelling,
    @Default(false) bool cancelSucceeded,
    @Default('') String errorMessage,
    @Default('') String cancelErrorMessage,
  }) = _VentorBookedSessionDetailState;

  const VentorBookedSessionDetailState._();

  bool get isLoadingOrInitial =>
      status == VentorBookedSessionDetailStatus.initial ||
      status == VentorBookedSessionDetailStatus.loading;

  bool get isLoadFailure =>
      status == VentorBookedSessionDetailStatus.loadFailure;

  bool get isReady => status == VentorBookedSessionDetailStatus.ready;
}
