part of 'ventor_rewards_bloc.dart';

enum VentorRewardsStatus { initial, loading, ready, loadFailure }

enum VentorRewardsHistoryStatus { initial, loading, ready, loadFailure }

@freezed
abstract class VentorRewardsState with _$VentorRewardsState {
  const factory VentorRewardsState({
    @Default(VentorRewardsStatus.initial) VentorRewardsStatus rewardsStatus,
    VentorRewardsOverviewData? rewards,
    @Default(VentorRewardsHistoryStatus.initial)
    VentorRewardsHistoryStatus historyStatus,
    @Default(<VentorRewardTradeData>[]) List<VentorRewardTradeData> trades,
    @Default(false) bool historyLoaded,
    @Default('') String errorMessage,
    @Default('') String historyErrorMessage,
    @Default(false) bool isRedeeming,
    @Default(false) bool redeemSuccess,
  }) = _VentorRewardsState;

  const VentorRewardsState._();

  bool get isRewardsLoadingOrInitial =>
      rewardsStatus == VentorRewardsStatus.initial ||
      rewardsStatus == VentorRewardsStatus.loading;

  bool get isRewardsLoadFailure =>
      rewardsStatus == VentorRewardsStatus.loadFailure;

  bool get isRewardsReady => rewardsStatus == VentorRewardsStatus.ready;

  bool get isHistoryLoading =>
      historyStatus == VentorRewardsHistoryStatus.loading;

  bool get isHistoryLoadFailure =>
      historyStatus == VentorRewardsHistoryStatus.loadFailure;
}
