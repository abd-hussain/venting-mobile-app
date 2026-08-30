part of 'ventor_buy_points_bloc.dart';

enum VentorBuyPointsStatus { initial, loading, ready, loadFailure }

@freezed
abstract class VentorBuyPointsState with _$VentorBuyPointsState {
  const factory VentorBuyPointsState({
    @Default(VentorBuyPointsStatus.initial) VentorBuyPointsStatus status,
    @Default(<VentorPointPackageData>[]) List<VentorPointPackageData> packages,
    @Default('') String errorMessage,
    @Default(false) bool isPurchasing,
    @Default('') String purchaseErrorMessage,
    @Default(false) bool purchaseSuccess,
    VentorPurchasePointsResult? purchaseResult,
  }) = _VentorBuyPointsState;

  const VentorBuyPointsState._();

  bool get isLoadingOrInitial =>
      status == VentorBuyPointsStatus.initial ||
      status == VentorBuyPointsStatus.loading;

  bool get isLoadFailure => status == VentorBuyPointsStatus.loadFailure;

  bool get isReady => status == VentorBuyPointsStatus.ready;
}
