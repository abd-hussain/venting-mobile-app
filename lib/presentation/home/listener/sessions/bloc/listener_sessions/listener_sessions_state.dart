part of 'listener_sessions_bloc.dart';

enum ListenerSessionsStatus { initial, loading, ready, loadFailure }

enum ListenerSessionsActionFeedback {
  none,
  scheduledRequestAccepted,
  requestAlreadyTaken,
  requestDeclined,
}

@freezed
sealed class ListenerSessionsState with _$ListenerSessionsState {
  const factory ListenerSessionsState({
    @Default(ListenerSessionsStatus.initial) ListenerSessionsStatus status,
    ListenerSessionsOverview? overview,
    @Default('') String errorMessage,
    @Default('') String processingRequestId,
    @Default(false) bool isProcessingRequest,
    @Default(ListenerSessionsActionFeedback.none)
    ListenerSessionsActionFeedback actionFeedback,
  }) = _ListenerSessionsState;

  const ListenerSessionsState._();

  bool get isLoadingOrInitial =>
      status == ListenerSessionsStatus.initial ||
      status == ListenerSessionsStatus.loading;

  bool get isLoadFailure => status == ListenerSessionsStatus.loadFailure;

  bool get isReady => status == ListenerSessionsStatus.ready;
}
