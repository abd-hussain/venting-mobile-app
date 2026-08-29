part of 'listener_earnings_bloc.dart';

enum ListenerEarningsStatus { initial, loading, ready, loadFailure }

@freezed
sealed class ListenerEarningsState with _$ListenerEarningsState {
  const factory ListenerEarningsState({
    @Default(ListenerEarningsStatus.initial) ListenerEarningsStatus status,
    ListenerEarningsOverview? overview,
    @Default(false) bool isProfileUnderReview,
    @Default('') String errorMessage,
  }) = _ListenerEarningsState;

  const ListenerEarningsState._();

  bool get isLoading => status == ListenerEarningsStatus.loading;

  bool get isLoadingOrInitial =>
      status == ListenerEarningsStatus.loading ||
      status == ListenerEarningsStatus.initial;

  bool get isReady => status == ListenerEarningsStatus.ready;

  bool get isLoadFailure => status == ListenerEarningsStatus.loadFailure;
}
