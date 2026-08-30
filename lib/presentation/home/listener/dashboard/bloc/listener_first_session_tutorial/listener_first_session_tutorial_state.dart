part of 'listener_first_session_tutorial_bloc.dart';

@freezed
sealed class ListenerFirstSessionTutorialState
    with _$ListenerFirstSessionTutorialState {
  const factory ListenerFirstSessionTutorialState({
    @Default(false) bool isSubmitting,
    @Default(false) bool isAcknowledged,
    @Default('') String errorMessage,
  }) = _ListenerFirstSessionTutorialState;
}
