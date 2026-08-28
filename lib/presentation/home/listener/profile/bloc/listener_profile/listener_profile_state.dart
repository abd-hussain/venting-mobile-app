part of 'listener_profile_bloc.dart';

enum ListenerProfileStatus { initial, loading, refreshing, ready, loadFailure }

enum ListenerProfileSavingTarget {
  experiences,
  comfortAreas,
  boundaries,
  country,
  city,
  languages,
}

@freezed
sealed class ListenerProfileState with _$ListenerProfileState {
  const factory ListenerProfileState({
    @Default(ListenerProfileStatus.initial) ListenerProfileStatus status,
    ListenerProfile? profile,
    @Default('') String errorMessage,
    @Default(false) bool isUploadingAvatar,
    @Default(false) bool isSavingAboutMe,
    ListenerProfileSavingTarget? savingProfileField,
    @Default(false) bool isUploadingVoiceIntro,
    String? pendingAvatarFilePath,
    String? pendingVoiceFilePath,
    int? pendingVoiceDurationSeconds,
    int? avatarCacheToken,
    @Default('') String updateErrorMessage,
  }) = _ListenerProfileState;

  const ListenerProfileState._();

  bool get isLoading => status == ListenerProfileStatus.loading;

  bool get isRefreshing => status == ListenerProfileStatus.refreshing;

  bool get isReady => status == ListenerProfileStatus.ready;

  bool get isLoadFailure => status == ListenerProfileStatus.loadFailure;

  bool isSavingField(ListenerProfileSavingTarget target) =>
      savingProfileField == target;
}
