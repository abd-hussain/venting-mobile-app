part of 'ventor_buy_points_bloc.dart';

@freezed
sealed class VentorBuyPointsEvent with _$VentorBuyPointsEvent {
  const factory VentorBuyPointsEvent.started() = _Started;
  const factory VentorBuyPointsEvent.retryLoad() = _RetryLoad;
  const factory VentorBuyPointsEvent.purchaseRequested({
    required String packageId,
  }) = _PurchaseRequested;
}
