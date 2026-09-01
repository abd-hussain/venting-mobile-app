part of 'listener_profile_bloc.dart';

@freezed
sealed class ListenerProfileEvent with _$ListenerProfileEvent {
  const factory ListenerProfileEvent.started() = _Started;

  const factory ListenerProfileEvent.refreshRequested() = _RefreshRequested;

  const factory ListenerProfileEvent.avatarUpdateRequested({
    required String avatarFilePath,
  }) = _AvatarUpdateRequested;

  const factory ListenerProfileEvent.aboutMeUpdateRequested({
    required String aboutMe,
  }) = _AboutMeUpdateRequested;

  const factory ListenerProfileEvent.voiceIntroUpdateRequested({
    required String voiceFilePath,
    required int durationSeconds,
  }) = _VoiceIntroUpdateRequested;

  const factory ListenerProfileEvent.profileFieldsUpdateRequested({
    required ListenerProfileSavingTarget target,
    required Map<String, dynamic> fields,
  }) = _ProfileFieldsUpdateRequested;
}
