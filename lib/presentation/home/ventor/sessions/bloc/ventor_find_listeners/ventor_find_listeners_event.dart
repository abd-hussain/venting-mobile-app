part of 'ventor_find_listeners_bloc.dart';

@freezed
sealed class VentorFindListenersEvent with _$VentorFindListenersEvent {
  const factory VentorFindListenersEvent.started() = _Started;

  const factory VentorFindListenersEvent.retryLoad() = _RetryLoad;

  const factory VentorFindListenersEvent.refreshRequested() = _RefreshRequested;

  const factory VentorFindListenersEvent.queryChanged(String query) =
      _QueryChanged;

  const factory VentorFindListenersEvent.topicChanged(int topicIndex) =
      _TopicChanged;

  const factory VentorFindListenersEvent.filtersChanged(
    VentorSessionFilters filters,
  ) = _FiltersChanged;

  const factory VentorFindListenersEvent.favoriteToggled({
    required String listenerId,
  }) = _FavoriteToggled;

  const factory VentorFindListenersEvent.listenerFavoriteUpdated(
    VentorFindListener listener,
  ) = _ListenerFavoriteUpdated;
}
