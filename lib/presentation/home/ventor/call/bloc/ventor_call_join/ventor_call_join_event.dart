part of 'ventor_call_join_bloc.dart';

@freezed
sealed class VentorCallJoinEvent with _$VentorCallJoinEvent {
  const factory VentorCallJoinEvent.joinRequested({required String sessionId}) =
      _JoinRequested;
}
