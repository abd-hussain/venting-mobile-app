part of 'listener_notifications_bloc.dart';

enum ListenerNotificationsStatus { initial, loading, ready, loadFailure }

@freezed
sealed class ListenerNotificationsState with _$ListenerNotificationsState {
  const factory ListenerNotificationsState({
    @Default(ListenerNotificationsStatus.initial)
    ListenerNotificationsStatus status,
    @Default(<ListenerNotification>[]) List<ListenerNotification> items,
    @Default(false) bool unreadOnly,
    @Default(false) bool isMarkingAllAsRead,
    String? deletingNotificationId,
    @Default('') String errorMessage,
  }) = _ListenerNotificationsState;

  const ListenerNotificationsState._();

  bool get isLoading => status == ListenerNotificationsStatus.loading;

  bool get isReady => status == ListenerNotificationsStatus.ready;

  bool get isLoadFailure => status == ListenerNotificationsStatus.loadFailure;

  bool get hasUnread => items.any((item) => !item.isRead);

  List<ListenerNotification> get visibleItems {
    if (!unreadOnly) return items;
    return items.where((item) => !item.isRead).toList(growable: false);
  }
}
