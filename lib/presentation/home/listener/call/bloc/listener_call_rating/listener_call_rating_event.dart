part of 'listener_call_rating_bloc.dart';

@freezed
sealed class ListenerCallRatingEvent with _$ListenerCallRatingEvent {
  const factory ListenerCallRatingEvent.starsChanged(int stars) = _StarsChanged;

  const factory ListenerCallRatingEvent.feltHeardChanged(bool value) =
      _FeltHeardChanged;

  const factory ListenerCallRatingEvent.talkAgainChanged(bool value) =
      _TalkAgainChanged;

  const factory ListenerCallRatingEvent.submitRequested({
    required String sessionId,
  }) = _SubmitRequested;
}
