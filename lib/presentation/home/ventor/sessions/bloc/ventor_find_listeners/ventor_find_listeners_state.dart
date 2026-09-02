part of 'ventor_find_listeners_bloc.dart';

enum VentorFindListenersStatus { initial, loading, ready, loadFailure }

@freezed
sealed class VentorFindListenersState with _$VentorFindListenersState {
  const factory VentorFindListenersState({
    @Default(VentorFindListenersStatus.initial)
    VentorFindListenersStatus status,
    @Default(<VentorFindListener>[]) List<VentorFindListener> listeners,
    @Default(0) int total,
    @Default('') String query,
    @Default(0) int topicIndex,
    @Default(VentorSessionFilters()) VentorSessionFilters filters,
    @Default(false) bool isRefreshing,
    @Default(<String>{}) Set<String> favoriteUpdatingIds,
    @Default('') String errorMessage,
    @Default('') String favoriteErrorMessage,
  }) = _VentorFindListenersState;

  const VentorFindListenersState._();

  bool get isLoadingOrInitial =>
      status == VentorFindListenersStatus.initial ||
      status == VentorFindListenersStatus.loading;

  bool get isLoadFailure => status == VentorFindListenersStatus.loadFailure;

  bool get isReady => status == VentorFindListenersStatus.ready;
}
