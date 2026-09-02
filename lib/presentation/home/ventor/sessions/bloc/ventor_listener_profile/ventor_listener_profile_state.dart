part of 'ventor_listener_profile_bloc.dart';

enum VentorListenerProfileStatus { initial, loading, ready, loadFailure }

@freezed
sealed class VentorListenerProfileState with _$VentorListenerProfileState {
  const factory VentorListenerProfileState({
    @Default(VentorListenerProfileStatus.initial)
    VentorListenerProfileStatus status,
    required VentorFindListener listener,
    @Default(false) bool isUpdatingFavorite,
    @Default(0) int favoriteSyncToken,
    @Default('') String errorMessage,
    @Default('') String favoriteErrorMessage,
  }) = _VentorListenerProfileState;

  const VentorListenerProfileState._();

  bool get isLoading => status == VentorListenerProfileStatus.loading;

  bool get isLoadFailure => status == VentorListenerProfileStatus.loadFailure;

  bool get isReady => status == VentorListenerProfileStatus.ready;
}
