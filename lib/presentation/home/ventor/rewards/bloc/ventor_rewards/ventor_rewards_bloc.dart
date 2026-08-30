import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_rewards.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_reward_trades_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_rewards_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/redeem_ventor_reward_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'ventor_rewards_bloc.freezed.dart';
part 'ventor_rewards_event.dart';
part 'ventor_rewards_state.dart';

class VentorRewardsBloc extends Bloc<VentorRewardsEvent, VentorRewardsState> {
  VentorRewardsBloc(
    this._getVentorRewardsUsecase,
    this._getVentorRewardTradesUsecase,
    this._redeemVentorRewardUsecase,
  ) : super(const VentorRewardsState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_HistoryTabOpened>(_onHistoryTabOpened);
    on<_RetryHistoryLoad>(_onRetryHistoryLoad);
    on<_RedeemRequested>(_onRedeemRequested);
  }

  final GetVentorRewardsUsecase _getVentorRewardsUsecase;
  final GetVentorRewardTradesUsecase _getVentorRewardTradesUsecase;
  final RedeemVentorRewardUsecase _redeemVentorRewardUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<VentorRewardsState> emit,
  ) async {
    await _loadRewards(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<VentorRewardsState> emit,
  ) async {
    await _loadRewards(emit);
  }

  Future<void> _onHistoryTabOpened(
    _HistoryTabOpened event,
    Emitter<VentorRewardsState> emit,
  ) async {
    if (state.historyLoaded || state.isHistoryLoading) return;
    await _loadHistory(emit);
  }

  Future<void> _onRetryHistoryLoad(
    _RetryHistoryLoad event,
    Emitter<VentorRewardsState> emit,
  ) async {
    await _loadHistory(emit);
  }

  Future<void> _onRedeemRequested(
    _RedeemRequested event,
    Emitter<VentorRewardsState> emit,
  ) async {
    final overview = state.rewards;
    if (overview == null || state.isRedeeming) return;

    emit(state.copyWith(isRedeeming: true, errorMessage: ''));

    final result = await _redeemVentorRewardUsecase(
      offerId: event.offerId,
      currentOverview: overview,
    ).run();

    if (emit.isDone) return;

    result.match(
      (error) {
        LoggerManagerBase.logErrorMessage(
          error: error,
          message: 'VentorRewardsBloc: redeem failed — ${_mapError(error)}',
        );
        emit(
          state.copyWith(isRedeeming: false, errorMessage: _mapError(error)),
        );
      },
      (redeemResult) {
        final trade = redeemResult.trade;
        final trades = trade == null ? state.trades : [trade, ...state.trades];

        emit(
          state.copyWith(
            isRedeeming: false,
            errorMessage: '',
            rewards: redeemResult.overview,
            trades: trades,
            historyLoaded: state.historyLoaded || trade != null,
            redeemSuccess: true,
          ),
        );
      },
    );
  }

  Future<void> _loadRewards(Emitter<VentorRewardsState> emit) async {
    emit(
      state.copyWith(
        rewardsStatus: VentorRewardsStatus.loading,
        errorMessage: '',
        redeemSuccess: false,
      ),
    );

    try {
      final result = await _getVentorRewardsUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorRewardsBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              rewardsStatus: VentorRewardsStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (rewards) {
          emit(
            state.copyWith(
              rewardsStatus: VentorRewardsStatus.ready,
              rewards: rewards,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorRewardsBloc: unexpected rewards load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          rewardsStatus: VentorRewardsStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _loadHistory(Emitter<VentorRewardsState> emit) async {
    emit(
      state.copyWith(
        historyStatus: VentorRewardsHistoryStatus.loading,
        historyErrorMessage: '',
      ),
    );

    try {
      final result = await _getVentorRewardTradesUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorRewardsBloc: history load failed — $message',
          );
          emit(
            state.copyWith(
              historyStatus: VentorRewardsHistoryStatus.loadFailure,
              historyErrorMessage: message,
            ),
          );
        },
        (trades) {
          emit(
            state.copyWith(
              historyStatus: VentorRewardsHistoryStatus.ready,
              trades: trades,
              historyLoaded: true,
              historyErrorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorRewardsBloc: unexpected history load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          historyStatus: VentorRewardsHistoryStatus.loadFailure,
          historyErrorMessage: _mapError(error),
        ),
      );
    }
  }

  String _mapError(Object error) {
    if (error is MainAPIException) {
      final localized = error.getLocalizedMessage();
      if (localized.isNotEmpty) return localized;
      if (error.message.isNotEmpty) return error.message;
    }
    try {
      return VentingMobLocalizationsHolder.current.common_unknown_error;
    } on Object {
      return 'Something went wrong. Please try again.';
    }
  }
}
