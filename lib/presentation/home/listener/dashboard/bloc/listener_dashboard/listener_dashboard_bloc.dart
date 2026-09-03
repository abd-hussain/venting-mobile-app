import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_dashboard.dart';
import 'package:venting_mobile_app/domain/data/app/listener_dashboard_setup.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_cached_auth_me_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_dashboard_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_profile_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_setup_progress_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_online_status_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_dashboard_bloc.freezed.dart';
part 'listener_dashboard_event.dart';
part 'listener_dashboard_state.dart';

class ListenerDashboardBloc
    extends Bloc<ListenerDashboardEvent, ListenerDashboardState> {
  ListenerDashboardBloc(
    this._getListenerSetupProgressUsecase,
    this._getListenerDashboardUsecase,
    this._getListenerProfileUsecase,
    this._getCachedAuthMeUsecase,
    this._updateListenerOnlineStatusUsecase,
  ) : super(const ListenerDashboardState()) {
    on<_Started>(_onStarted);
    on<_RetrySetupLoad>(_onRetrySetupLoad);
    on<_SetupRefreshRequested>(_onSetupRefreshRequested);
    on<_OnlineStatusChanged>(_onOnlineStatusChanged);
  }

  final GetListenerSetupProgressUsecase _getListenerSetupProgressUsecase;
  final GetListenerDashboardUsecase _getListenerDashboardUsecase;
  final GetListenerProfileUsecase _getListenerProfileUsecase;
  final GetCachedAuthMeUsecase _getCachedAuthMeUsecase;
  final UpdateListenerOnlineStatusUsecase _updateListenerOnlineStatusUsecase;

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
          onlineStatusErrorMessage: '',
        ),
      );
    }

    try {
      final displayNameFuture = _resolveListenerDisplayName();
      final dashboardFuture = _resolveDashboard();
      final result = await _getListenerSetupProgressUsecase().run();
      final listenerDisplayName = await displayNameFuture;
      final dashboard = await dashboardFuture;
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
              listenerDisplayName: listenerDisplayName,
              isOnline: dashboard?.isOnline ?? state.isOnline,
              dailyReminder: dashboard?.reminder,
              nextUpcomingSession: dashboard?.nextUpcomingSession,
            ),
          );
        },
        (progress) {
          emit(
            state.copyWith(
              setupStatus: ListenerDashboardSetupStatus.ready,
              setupProgress: progress,
              setupErrorMessage: '',
              listenerDisplayName: listenerDisplayName,
              isOnline: dashboard?.isOnline ?? state.isOnline,
              dailyReminder: dashboard?.reminder,
              nextUpcomingSession: dashboard?.nextUpcomingSession,
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

  Future<void> _onOnlineStatusChanged(
    _OnlineStatusChanged event,
    Emitter<ListenerDashboardState> emit,
  ) async {
    if (state.isUpdatingOnlineStatus) return;

    final previous = state.isOnline;
    emit(
      state.copyWith(
        isOnline: event.isOnline,
        isUpdatingOnlineStatus: true,
        onlineStatusErrorMessage: '',
      ),
    );

    try {
      final result = await _updateListenerOnlineStatusUsecase(
        isOnline: event.isOnline,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'ListenerDashboardBloc: update online status failed — $message',
          );
          emit(
            state.copyWith(
              isOnline: previous,
              isUpdatingOnlineStatus: false,
              onlineStatusErrorMessage: message,
            ),
          );
        },
        (isOnline) {
          emit(
            state.copyWith(
              isOnline: isOnline,
              isUpdatingOnlineStatus: false,
              onlineStatusErrorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerDashboardBloc: unexpected online status error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isOnline: previous,
          isUpdatingOnlineStatus: false,
          onlineStatusErrorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<ListenerDashboard?> _resolveDashboard() async {
    final dashboardResult = await _getListenerDashboardUsecase().run();
    return dashboardResult.match((error) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerDashboardBloc: load dashboard failed',
      );
      return null;
    }, (dashboard) => dashboard);
  }

  Future<String> _resolveListenerDisplayName() async {
    final profileResult = await _getListenerProfileUsecase().run();
    return profileResult.match(
      (error) {
        LoggerManagerBase.logErrorMessage(
          error: error,
          message:
              'ListenerDashboardBloc: load profile for display name failed',
        );
        return _displayNameFromAuthMe();
      },
      (profile) {
        final name = _firstNameFrom(profile.fullName);
        return name.isNotEmpty ? name : _displayNameFromAuthMe();
      },
    );
  }

  String _displayNameFromAuthMe() {
    final authMe = _getCachedAuthMeUsecase();
    final displayName = authMe?.display_name?.trim() ?? '';
    if (displayName.isNotEmpty) {
      return _firstNameFrom(displayName);
    }

    final email = authMe?.email.trim() ?? '';
    if (email.isEmpty) return '';
    return email.split('@').first;
  }

  String _firstNameFrom(String raw) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return '';
    return trimmed.split(RegExp(r'\s+')).first;
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
