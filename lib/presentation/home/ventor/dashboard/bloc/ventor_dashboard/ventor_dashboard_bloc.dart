import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_mood_journey_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_home.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_rewards.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_home_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_mood_journey_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_rewards_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/redeem_ventor_reward_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/submit_ventor_mood_checkin_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'ventor_dashboard_bloc.freezed.dart';
part 'ventor_dashboard_event.dart';
part 'ventor_dashboard_state.dart';

class VentorDashboardBloc
    extends Bloc<VentorDashboardEvent, VentorDashboardState> {
  VentorDashboardBloc(
    this._getVentorHomeUsecase,
    this._getVentorRewardsUsecase,
    this._getVentorMoodJourneyUsecase,
    this._submitVentorMoodCheckinUsecase,
    this._redeemVentorRewardUsecase,
  ) : super(const VentorDashboardState()) {
    on<_Started>(_onStarted);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_UpcomingSessionUpdated>(_onUpcomingSessionUpdated);
    on<_MoodCheckInSubmitted>(_onMoodCheckInSubmitted);
    on<_StreakClaimRequested>(_onStreakClaimRequested);
    on<_MoodFeedbackCleared>(_onMoodFeedbackCleared);
  }

  final GetVentorHomeUsecase _getVentorHomeUsecase;
  final GetVentorRewardsUsecase _getVentorRewardsUsecase;
  final GetVentorMoodJourneyUsecase _getVentorMoodJourneyUsecase;
  final SubmitVentorMoodCheckinUsecase _submitVentorMoodCheckinUsecase;
  final RedeemVentorRewardUsecase _redeemVentorRewardUsecase;

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

  void _onMoodFeedbackCleared(
    _MoodFeedbackCleared event,
    Emitter<VentorDashboardState> emit,
  ) {
    emit(state.copyWith(moodFeedback: VentorDashboardMoodFeedback.none));
  }

  Future<void> _onMoodCheckInSubmitted(
    _MoodCheckInSubmitted event,
    Emitter<VentorDashboardState> emit,
  ) async {
    if (state.hasCheckedInToday || state.isSubmittingMood) return;

    emit(
      state.copyWith(
        isSubmittingMood: true,
        moodErrorMessage: '',
        moodFeedback: VentorDashboardMoodFeedback.none,
      ),
    );

    try {
      final result = await _submitVentorMoodCheckinUsecase(
        mood: event.mood,
        note: event.note,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorDashboardBloc: mood check-in failed — $message',
          );
          emit(
            state.copyWith(isSubmittingMood: false, moodErrorMessage: message),
          );
        },
        (checkIn) {
          final mergedStreak = _mergeStreakAfterCheckIn(checkIn.streak);
          final streakComplete =
              mergedStreak.isComplete || mergedStreak.rewardUnlocked;
          emit(
            state.copyWith(
              isSubmittingMood: false,
              todayMood: checkIn.mood,
              todayNote: checkIn.note,
              streak: mergedStreak,
              streakWeekChecked: markTodayCheckedInWeek(
                state.streakWeekChecked,
              ),
              moodFeedback: streakComplete
                  ? VentorDashboardMoodFeedback.streakComplete
                  : VentorDashboardMoodFeedback.saved,
              moodErrorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorDashboardBloc: unexpected mood check-in error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isSubmittingMood: false,
          moodErrorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onStreakClaimRequested(
    _StreakClaimRequested event,
    Emitter<VentorDashboardState> emit,
  ) async {
    if (!state.canClaimStreak || state.isClaimingStreak) return;

    final offerId = state.streak?.rewardOfferId?.trim() ?? '';
    final rewardsOverview = state.rewardsOverview;
    if (offerId.isEmpty || rewardsOverview == null) {
      emit(
        state.copyWith(
          moodErrorMessage: _mapError(
            const MainAPIException(
              status: 'failed',
              type: 'validation',
              code: 422,
              message: 'Reward unavailable',
            ),
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isClaimingStreak: true,
        moodErrorMessage: '',
        moodFeedback: VentorDashboardMoodFeedback.none,
      ),
    );

    try {
      final result = await _redeemVentorRewardUsecase(
        offerId: offerId,
        currentOverview: rewardsOverview,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorDashboardBloc: streak claim failed — $message',
          );
          emit(
            state.copyWith(isClaimingStreak: false, moodErrorMessage: message),
          );
        },
        (redeemResult) {
          emit(
            state.copyWith(
              isClaimingStreak: false,
              streakClaimed: true,
              points: redeemResult.overview.points,
              rewardsOverview: redeemResult.overview,
              pointsStatus: VentorDashboardPointsStatus.ready,
              moodFeedback: VentorDashboardMoodFeedback.streakClaimed,
              moodErrorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorDashboardBloc: unexpected streak claim error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isClaimingStreak: false,
          moodErrorMessage: _mapError(error),
        ),
      );
    }
  }

  VentorHomeStreakData _mergeStreakAfterCheckIn(VentorHomeStreakData incoming) {
    final previous = state.streak;
    return VentorHomeStreakData(
      currentDays: incoming.currentDays,
      targetDays: previous?.targetDays ?? incoming.targetDays,
      discountPercent: previous?.discountPercent ?? incoming.discountPercent,
      rewardOfferId: previous?.rewardOfferId ?? incoming.rewardOfferId,
      rewardUnlocked:
          incoming.rewardUnlocked || (previous?.rewardUnlocked ?? false),
    );
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
      emit(state.copyWith(pointsStatus: VentorDashboardPointsStatus.loading));
    }

    try {
      final results = await Future.wait([
        _getVentorHomeUsecase().run(),
        _getVentorRewardsUsecase().run(),
        _getVentorMoodJourneyUsecase().run(),
      ]);
      if (emit.isDone) return;

      final homeResult = results[0] as Either<Exception, VentorHomeOverview>;
      final rewardsResult =
          results[1] as Either<Exception, VentorRewardsOverviewData>;
      final moodJourneyResult =
          results[2] as Either<Exception, VentorMoodJourneyData>;

      final weekChecked = moodJourneyResult.match((error) {
        LoggerManagerBase.logErrorMessage(
          error: error,
          message: 'VentorDashboardBloc: load mood journey failed',
        );
        return state.streakWeekChecked;
      }, ventorMoodWeekCheckedFromJourney);

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
            rewardsOverview: rewards,
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
          final mergedOverview = VentorHomeOverview(
            displayName: overview.displayName,
            upcomingSession: overview.upcomingSession,
            recentSessions: overview.recentSessions,
            motivation: overview.motivation,
            moodCheckInToday: overview.moodCheckInToday,
            streak: overview.streak,
            streakWeekChecked: _mergeTodayIntoWeekChecked(
              weekChecked,
              hasCheckedInToday: overview.moodCheckInToday != null,
            ),
          );

          emit(
            nextState.copyWith(
              status: VentorDashboardStatus.ready,
              displayName: mergedOverview.displayName,
              upcomingSession: mergedOverview.upcomingSession,
              recentSessions: mergedOverview.recentSessions,
              motivation: mergedOverview.motivation,
              todayMood: mergedOverview.moodCheckInToday?.mood,
              todayNote: mergedOverview.moodCheckInToday?.note,
              streak: mergedOverview.streak,
              streakWeekChecked: mergedOverview.streakWeekChecked,
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

  List<bool> _mergeTodayIntoWeekChecked(
    List<bool> checked, {
    required bool hasCheckedInToday,
  }) {
    if (!hasCheckedInToday) return checked;
    return markTodayCheckedInWeek(checked);
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
