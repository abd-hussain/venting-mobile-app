part of 'listener_privacy_visibility_bloc.dart';

enum ListenerPrivacyVisibilityStatus {
  initial,
  loading,
  ready,
  saving,
  loadFailure,
  saveSuccess,
  saveFailure,
}

@freezed
sealed class ListenerPrivacyVisibilityState
    with _$ListenerPrivacyVisibilityState {
  const factory ListenerPrivacyVisibilityState({
    @Default(ListenerPrivacyVisibilityStatus.initial)
    ListenerPrivacyVisibilityStatus status,
    ListenerPrivacyVisibilitySettings? savedSettings,
    @Default('') String errorMessage,
  }) = _ListenerPrivacyVisibilityState;

  const ListenerPrivacyVisibilityState._();

  bool get isLoading => status == ListenerPrivacyVisibilityStatus.loading;

  bool get isSaving => status == ListenerPrivacyVisibilityStatus.saving;

  bool get isReady => status == ListenerPrivacyVisibilityStatus.ready;

  bool get isLoadFailure =>
      status == ListenerPrivacyVisibilityStatus.loadFailure;

  bool get isSaveFailure =>
      status == ListenerPrivacyVisibilityStatus.saveFailure;

  bool get isSaveSuccess =>
      status == ListenerPrivacyVisibilityStatus.saveSuccess;
}
