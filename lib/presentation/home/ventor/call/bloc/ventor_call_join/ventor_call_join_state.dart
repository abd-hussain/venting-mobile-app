part of 'ventor_call_join_bloc.dart';

enum VentorCallJoinStatus { ready, joining }

@freezed
sealed class VentorCallJoinState with _$VentorCallJoinState {
  const factory VentorCallJoinState({
    @Default(VentorCallJoinStatus.ready) VentorCallJoinStatus status,
    @Default(false) bool joinSucceeded,
    SessionCallCredentials? callCredentials,
    @Default('') String errorMessage,
  }) = _VentorCallJoinState;

  const VentorCallJoinState._();

  bool get isJoining => status == VentorCallJoinStatus.joining;
}
