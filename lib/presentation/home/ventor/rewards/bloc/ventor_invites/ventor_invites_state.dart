part of 'ventor_invites_bloc.dart';

enum VentorInvitesStatus { initial, loading, ready, loadFailure }

@freezed
abstract class VentorInvitesState with _$VentorInvitesState {
  const factory VentorInvitesState({
    @Default(VentorInvitesStatus.initial) VentorInvitesStatus status,
    VentorInvitesOverviewData? overview,
    @Default('') String errorMessage,
  }) = _VentorInvitesState;

  const VentorInvitesState._();

  bool get isLoadingOrInitial =>
      status == VentorInvitesStatus.initial ||
      status == VentorInvitesStatus.loading;

  bool get isLoadFailure => status == VentorInvitesStatus.loadFailure;

  bool get isReady => status == VentorInvitesStatus.ready;
}
