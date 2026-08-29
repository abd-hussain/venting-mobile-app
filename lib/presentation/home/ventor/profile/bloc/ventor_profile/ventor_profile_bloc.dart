import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_profile.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_profile_overview_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_ventor_profile_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'ventor_profile_bloc.freezed.dart';
part 'ventor_profile_event.dart';
part 'ventor_profile_state.dart';

class VentorProfileBloc extends Bloc<VentorProfileEvent, VentorProfileState> {
  VentorProfileBloc(
    this._getVentorProfileOverviewUsecase,
    this._updateVentorProfileUsecase,
  ) : super(const VentorProfileState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_ProfileUpdateRequested>(_onProfileUpdateRequested);
  }

  final GetVentorProfileOverviewUsecase _getVentorProfileOverviewUsecase;
  final UpdateVentorProfileUsecase _updateVentorProfileUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<VentorProfileState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<VentorProfileState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<VentorProfileState> emit,
  ) async {
    await _load(emit, showLoading: false);
  }

  Future<void> _onProfileUpdateRequested(
    _ProfileUpdateRequested event,
    Emitter<VentorProfileState> emit,
  ) async {
    if (state.isUpdating) return;

    emit(
      state.copyWith(
        isUpdating: true,
        errorMessage: '',
        localAvatarFilePath: event.avatarFilePath ?? state.localAvatarFilePath,
      ),
    );

    final result = await _updateVentorProfileUsecase(
      nickname: event.nickname,
      avatarFilePath: event.avatarFilePath,
    ).run();

    if (emit.isDone) return;

    result.match(
      (error) {
        LoggerManagerBase.logErrorMessage(
          error: error,
          message:
              'VentorProfileBloc: profile update failed — ${_mapError(error)}',
        );
        emit(state.copyWith(isUpdating: false, errorMessage: _mapError(error)));
      },
      (profile) {
        final overview = state.overview;
        emit(
          state.copyWith(
            isUpdating: false,
            errorMessage: '',
            localAvatarFilePath: null,
            avatarCacheToken: DateTime.now().millisecondsSinceEpoch,
            overview: overview == null
                ? null
                : VentorProfileOverview(
                    profile: profile,
                    moodPoints: overview.moodPoints,
                    favoriteListeners: overview.favoriteListeners,
                  ),
          ),
        );
      },
    );
  }

  Future<void> _load(
    Emitter<VentorProfileState> emit, {
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(
        state.copyWith(status: VentorProfileStatus.loading, errorMessage: ''),
      );
    }

    try {
      final result = await _getVentorProfileOverviewUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorProfileBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorProfileStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (overview) {
          emit(
            state.copyWith(
              status: VentorProfileStatus.ready,
              overview: overview,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorProfileBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorProfileStatus.loadFailure,
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
