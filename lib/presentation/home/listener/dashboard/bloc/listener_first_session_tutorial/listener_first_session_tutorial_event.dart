part of 'listener_first_session_tutorial_bloc.dart';

@freezed
sealed class ListenerFirstSessionTutorialEvent
    with _$ListenerFirstSessionTutorialEvent {
  const factory ListenerFirstSessionTutorialEvent.acknowledgeRequested() =
      _AcknowledgeRequested;
}
