part of 'listener_payout_history_bloc.dart';

enum ListenerPayoutHistoryLoadStatus {
  initial,
  loading,
  ready,
  loadFailure,
}

@freezed
sealed class ListenerPayoutHistoryState with _$ListenerPayoutHistoryState {
  const factory ListenerPayoutHistoryState({
    @Default(ListenerPayoutHistoryLoadStatus.initial)
    ListenerPayoutHistoryLoadStatus status,
    @Default(<ListenerPayoutHistoryEntry>[])
    List<ListenerPayoutHistoryEntry> items,
    @Default('') String errorMessage,
  }) = _ListenerPayoutHistoryState;

  const ListenerPayoutHistoryState._();

  bool get isLoadingOrInitial =>
      status == ListenerPayoutHistoryLoadStatus.initial ||
      status == ListenerPayoutHistoryLoadStatus.loading;

  bool get isLoadFailure => status == ListenerPayoutHistoryLoadStatus.loadFailure;

  bool get isReady => status == ListenerPayoutHistoryLoadStatus.ready;
}
