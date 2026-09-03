part of 'listener_call_end_bloc.dart';

@freezed
sealed class ListenerCallEndEvent with _$ListenerCallEndEvent {
  const factory ListenerCallEndEvent.endRequested({
    required String sessionId,
    int? durationSeconds,
  }) = _EndRequested;
}
