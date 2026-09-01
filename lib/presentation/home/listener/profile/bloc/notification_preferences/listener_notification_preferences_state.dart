part of 'listener_notification_preferences_bloc.dart';

enum ListenerNotificationPreferencesStatus {
  initial,
  loading,
  ready,
  saving,
  loadFailure,
  saveSuccess,
  saveFailure,
}

@freezed
sealed class ListenerNotificationPreferencesState
    with _$ListenerNotificationPreferencesState {
  const factory ListenerNotificationPreferencesState({
    @Default(ListenerNotificationPreferencesStatus.initial)
    ListenerNotificationPreferencesStatus status,
    ListenerNotificationPreferences? savedPreferences,
    @Default('') String errorMessage,
  }) = _ListenerNotificationPreferencesState;

  const ListenerNotificationPreferencesState._();

  bool get isLoading => status == ListenerNotificationPreferencesStatus.loading;

  bool get isSaving => status == ListenerNotificationPreferencesStatus.saving;

  bool get isReady => status == ListenerNotificationPreferencesStatus.ready;

  bool get isLoadFailure =>
      status == ListenerNotificationPreferencesStatus.loadFailure;

  bool get isSaveFailure =>
      status == ListenerNotificationPreferencesStatus.saveFailure;

  bool get isSaveSuccess =>
      status == ListenerNotificationPreferencesStatus.saveSuccess;
}
