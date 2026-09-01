part of 'ventor_notification_preferences_bloc.dart';

enum VentorNotificationPreferencesStatus {
  initial,
  loading,
  ready,
  saving,
  loadFailure,
  saveSuccess,
  saveFailure,
}

@freezed
sealed class VentorNotificationPreferencesState
    with _$VentorNotificationPreferencesState {
  const factory VentorNotificationPreferencesState({
    @Default(VentorNotificationPreferencesStatus.initial)
    VentorNotificationPreferencesStatus status,
    VentorNotificationPreferences? savedPreferences,
    @Default('') String errorMessage,
  }) = _VentorNotificationPreferencesState;

  const VentorNotificationPreferencesState._();

  bool get isLoading => status == VentorNotificationPreferencesStatus.loading;

  bool get isSaving => status == VentorNotificationPreferencesStatus.saving;

  bool get isReady => status == VentorNotificationPreferencesStatus.ready;

  bool get isLoadFailure =>
      status == VentorNotificationPreferencesStatus.loadFailure;

  bool get isSaveFailure =>
      status == VentorNotificationPreferencesStatus.saveFailure;

  bool get isSaveSuccess =>
      status == VentorNotificationPreferencesStatus.saveSuccess;
}
