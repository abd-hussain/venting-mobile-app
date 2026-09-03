part of 'listener_call_join_bloc.dart';

@freezed
sealed class ListenerCallJoinEvent with _$ListenerCallJoinEvent {
  const factory ListenerCallJoinEvent.joinRequested({
    required String sessionId,
  }) = _JoinRequested;
}
