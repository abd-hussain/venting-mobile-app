import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_dashboard_setup.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_setup_progress_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_dashboard_bloc.freezed.dart';
part 'listener_dashboard_event.dart';
part 'listener_dashboard_state.dart';

class ListenerDashboardBloc
    extends Bloc<ListenerDashboardEvent, ListenerDashboardState> {
  ListenerDashboardBloc(this._getListenerSetupProgressUsecase)
    : super(const ListenerDashboardState()) {
    on<_Started>(_onStarted);
    on<_RetrySetupLoad>(_onRetrySetupLoad);
    on<_SetupRefreshRequested>(_onSetupRefreshRequested);
  }

  final GetListenerSetupProgressUsecase _getListenerSetupProgressUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<ListenerDashboardState> emit,
  ) async {
    await _loadSetup(emit);
  }

  Future<void> _onRetrySetupLoad(
    _RetrySetupLoad event,
    Emitter<ListenerDashboardState> emit,
  ) async {
    await _loadSetup(emit);
  }

  Future<void> _onSetupRefreshRequested(
    _SetupRefreshRequested event,
    Emitter<ListenerDashboardState> emit,
  ) async {
    await _loadSetup(emit, showLoading: false);
  }

  Future<void> _loadSetup(
    Emitter<ListenerDashboardState> emit, {
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(
        state.copyWith(
          setupStatus: ListenerDashboardSetupStatus.loading,
          setupErrorMessage: '',
        ),
      );
    }

    try {
      final result = await _getListenerSetupProgressUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerDashboardBloc: load setup failed — $message',
          );
          emit(
            state.copyWith(
              setupStatus: ListenerDashboardSetupStatus.loadFailure,
              setupErrorMessage: message,
            ),
          );
        },
        (progress) {
          emit(
            state.copyWith(
              setupStatus: ListenerDashboardSetupStatus.ready,
              setupProgress: progress,
              setupErrorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerDashboardBloc: unexpected load setup error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          setupStatus: ListenerDashboardSetupStatus.loadFailure,
          setupErrorMessage: _mapError(error),
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
