import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_home.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_rewards.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_home_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_rewards_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'ventor_dashboard_bloc.freezed.dart';
part 'ventor_dashboard_event.dart';
part 'ventor_dashboard_state.dart';

class VentorDashboardBloc
    extends Bloc<VentorDashboardEvent, VentorDashboardState> {
  VentorDashboardBloc(
    this._getVentorHomeUsecase,
    this._getVentorRewardsUsecase,
  ) : super(const VentorDashboardState()) {
    on<_Started>(_onStarted);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_UpcomingSessionUpdated>(_onUpcomingSessionUpdated);
  }

  final GetVentorHomeUsecase _getVentorHomeUsecase;
  final GetVentorRewardsUsecase _getVentorRewardsUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<VentorDashboardState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<VentorDashboardState> emit,
  ) async {
    await _load(emit, showLoading: false);
  }

  void _onUpcomingSessionUpdated(
    _UpcomingSessionUpdated event,
    Emitter<VentorDashboardState> emit,
  ) {
    emit(state.copyWith(upcomingSession: event.session));
  }

  Future<void> _load(
    Emitter<VentorDashboardState> emit, {
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(
        state.copyWith(
          status: VentorDashboardStatus.loading,
          pointsStatus: VentorDashboardPointsStatus.loading,
          errorMessage: '',
        ),
      );
    } else {
      emit(
        state.copyWith(pointsStatus: VentorDashboardPointsStatus.loading),
      );
    }

    try {
      final results = await Future.wait([
        _getVentorHomeUsecase().run(),
        _getVentorRewardsUsecase().run(),
      ]);
      if (emit.isDone) return;

      final homeResult =
          results[0] as Either<Exception, VentorHomeOverview>;
      final rewardsResult =
          results[1] as Either<Exception, VentorRewardsOverviewData>;

      var nextState = state;

      rewardsResult.match(
        (error) {
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'VentorDashboardBloc: load rewards for points failed — '
                '${_mapError(error)}',
          );
          nextState = nextState.copyWith(
            pointsStatus: VentorDashboardPointsStatus.loadFailure,
          );
        },
        (rewards) {
          nextState = nextState.copyWith(
            pointsStatus: VentorDashboardPointsStatus.ready,
            points: rewards.points,
          );
        },
      );

      homeResult.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorDashboardBloc: load failed — $message',
          );
          emit(
            nextState.copyWith(
              status: VentorDashboardStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (overview) {
          emit(
            nextState.copyWith(
              status: VentorDashboardStatus.ready,
              displayName: overview.displayName,
              upcomingSession: overview.upcomingSession,
              recentSessions: overview.recentSessions,
              motivation: overview.motivation,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorDashboardBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorDashboardStatus.loadFailure,
          pointsStatus: VentorDashboardPointsStatus.loadFailure,
          errorMessage: _mapError(error),
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
