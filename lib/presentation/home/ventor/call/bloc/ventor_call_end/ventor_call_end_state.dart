part of 'ventor_call_end_bloc.dart';

enum VentorCallEndStatus { ready, ending }

@freezed
sealed class VentorCallEndState with _$VentorCallEndState {
  const factory VentorCallEndState({
    @Default(VentorCallEndStatus.ready) VentorCallEndStatus status,
    @Default(false) bool endSucceeded,
    @Default('') String errorMessage,
  }) = _VentorCallEndState;

  const VentorCallEndState._();

  bool get isEnding => status == VentorCallEndStatus.ending;
}
