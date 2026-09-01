part of 'ventor_profile_bloc.dart';

enum VentorProfileStatus { initial, loading, ready, loadFailure }

@freezed
abstract class VentorProfileState with _$VentorProfileState {
  const factory VentorProfileState({
    @Default(VentorProfileStatus.initial) VentorProfileStatus status,
    VentorProfileOverview? overview,
    @Default('') String errorMessage,
    @Default(false) bool isUpdating,
    String? localAvatarFilePath,
    @Default(0) int avatarCacheToken,
  }) = _VentorProfileState;

  const VentorProfileState._();

  bool get isLoadingOrInitial =>
      status == VentorProfileStatus.initial ||
      status == VentorProfileStatus.loading;

  bool get isLoadFailure => status == VentorProfileStatus.loadFailure;

  bool get isReady => status == VentorProfileStatus.ready;
}
