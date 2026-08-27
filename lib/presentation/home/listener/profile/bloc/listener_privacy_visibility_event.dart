part of 'listener_privacy_visibility_bloc.dart';

@freezed
sealed class ListenerPrivacyVisibilityEvent
    with _$ListenerPrivacyVisibilityEvent {
  const factory ListenerPrivacyVisibilityEvent.started() = _Started;

  const factory ListenerPrivacyVisibilityEvent.saveRequested({
    required ListenerPrivacyVisibilitySettings settings,
  }) = _SaveRequested;
}
