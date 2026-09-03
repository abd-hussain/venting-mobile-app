part of 'listener_call_join_bloc.dart';

enum ListenerCallJoinStatus { ready, joining }

@freezed
sealed class ListenerCallJoinState with _$ListenerCallJoinState {
  const factory ListenerCallJoinState({
    @Default(ListenerCallJoinStatus.ready) ListenerCallJoinStatus status,
    @Default(false) bool joinSucceeded,
    SessionCallCredentials? callCredentials,
    @Default('') String errorMessage,
  }) = _ListenerCallJoinState;

  const ListenerCallJoinState._();

  bool get isJoining => status == ListenerCallJoinStatus.joining;
}
