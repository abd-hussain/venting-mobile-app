part of 'listener_availability_bloc.dart';

enum ListenerAvailabilityStatus { initial, loading, ready, loadFailure }

@freezed
sealed class ListenerAvailabilityState with _$ListenerAvailabilityState {
  const factory ListenerAvailabilityState({
    @Default(ListenerAvailabilityStatus.initial)
    ListenerAvailabilityStatus status,
    @Default(false) bool isOnline,
    @Default(false) bool isSavingOnline,
    @Default('') String errorMessage,
  }) = _ListenerAvailabilityState;

  const ListenerAvailabilityState._();

  bool get isLoading => status == ListenerAvailabilityStatus.loading;

  bool get isReady => status == ListenerAvailabilityStatus.ready;

  bool get isLoadFailure => status == ListenerAvailabilityStatus.loadFailure;
}
