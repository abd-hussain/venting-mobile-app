part of 'ventor_notifications_bloc.dart';

enum VentorNotificationsStatus { initial, loading, ready, loadFailure }

@freezed
sealed class VentorNotificationsState with _$VentorNotificationsState {
  const factory VentorNotificationsState({
    @Default(VentorNotificationsStatus.initial)
    VentorNotificationsStatus status,
    @Default(<AppNotification>[]) List<AppNotification> items,
    @Default(false) bool unreadOnly,
    @Default(false) bool isMarkingAllAsRead,
    String? deletingNotificationId,
    @Default('') String errorMessage,
  }) = _VentorNotificationsState;

  const VentorNotificationsState._();

  bool get isLoading => status == VentorNotificationsStatus.loading;

  bool get isReady => status == VentorNotificationsStatus.ready;

  bool get isLoadFailure => status == VentorNotificationsStatus.loadFailure;

  bool get hasUnread => items.any((item) => !item.isRead);

  List<AppNotification> get visibleItems {
    if (!unreadOnly) return items;
    return items.where((item) => !item.isRead).toList(growable: false);
  }
}
