part of 'listener_call_end_bloc.dart';

enum ListenerCallEndStatus { ready, ending }

@freezed
sealed class ListenerCallEndState with _$ListenerCallEndState {
  const factory ListenerCallEndState({
    @Default(ListenerCallEndStatus.ready) ListenerCallEndStatus status,
    @Default(false) bool endSucceeded,
    @Default('') String errorMessage,
  }) = _ListenerCallEndState;

  const ListenerCallEndState._();

  bool get isEnding => status == ListenerCallEndStatus.ending;
}
