part of 'ventor_call_end_bloc.dart';

@freezed
sealed class VentorCallEndEvent with _$VentorCallEndEvent {
  const factory VentorCallEndEvent.endRequested({
    required String sessionId,
    int? durationSeconds,
  }) = _EndRequested;
}
