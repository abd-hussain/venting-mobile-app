part of 'listener_call_rating_bloc.dart';

enum ListenerCallRatingStatus { ready, submitting }

@freezed
sealed class ListenerCallRatingState with _$ListenerCallRatingState {
  const factory ListenerCallRatingState({
    @Default(ListenerCallRatingStatus.ready) ListenerCallRatingStatus status,
    @Default(5) int stars,
    bool? feltHeard,
    bool? talkAgain,
    @Default(false) bool submitSucceeded,
    @Default('') String errorMessage,
  }) = _ListenerCallRatingState;

  const ListenerCallRatingState._();

  bool get isSubmitting => status == ListenerCallRatingStatus.submitting;

  bool get canSubmit => !isSubmitting && feltHeard != null && talkAgain != null;
}
