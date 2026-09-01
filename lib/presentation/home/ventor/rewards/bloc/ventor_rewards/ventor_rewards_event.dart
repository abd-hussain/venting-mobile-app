part of 'ventor_rewards_bloc.dart';

@freezed
sealed class VentorRewardsEvent with _$VentorRewardsEvent {
  const factory VentorRewardsEvent.started() = _Started;
  const factory VentorRewardsEvent.retryLoad() = _RetryLoad;
  const factory VentorRewardsEvent.historyTabOpened() = _HistoryTabOpened;
  const factory VentorRewardsEvent.retryHistoryLoad() = _RetryHistoryLoad;
  const factory VentorRewardsEvent.redeemRequested({required String offerId}) =
      _RedeemRequested;
}
