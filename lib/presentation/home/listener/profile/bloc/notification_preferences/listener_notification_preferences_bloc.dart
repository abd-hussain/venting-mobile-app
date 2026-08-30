import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_notification_preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_notification_preferences_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_notification_preferences_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_notification_preferences_bloc.freezed.dart';
part 'listener_notification_preferences_event.dart';
part 'listener_notification_preferences_state.dart';

class ListenerNotificationPreferencesBloc
    extends
        Bloc<
          ListenerNotificationPreferencesEvent,
          ListenerNotificationPreferencesState
        > {
  ListenerNotificationPreferencesBloc(
    this._getListenerNotificationPreferencesUsecase,
    this._updateListenerNotificationPreferencesUsecase,
  ) : super(const ListenerNotificationPreferencesState()) {
    on<_Started>(_onStarted);
    on<_SaveRequested>(_onSaveRequested);
  }

  final GetListenerNotificationPreferencesUsecase
  _getListenerNotificationPreferencesUsecase;
  final UpdateListenerNotificationPreferencesUsecase
  _updateListenerNotificationPreferencesUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<ListenerNotificationPreferencesState> emit,
  ) async {
    emit(
      const ListenerNotificationPreferencesState(
        status: ListenerNotificationPreferencesStatus.loading,
      ),
    );

    try {
      final result = await _getListenerNotificationPreferencesUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'ListenerNotificationPreferencesBloc: load failed — $message',
          );
          emit(
            ListenerNotificationPreferencesState(
              status: ListenerNotificationPreferencesStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (preferences) {
          emit(
            ListenerNotificationPreferencesState(
              status: ListenerNotificationPreferencesStatus.ready,
              savedPreferences: preferences,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerNotificationPreferencesBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        ListenerNotificationPreferencesState(
          status: ListenerNotificationPreferencesStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onSaveRequested(
    _SaveRequested event,
    Emitter<ListenerNotificationPreferencesState> emit,
  ) async {
    if (state.isSaving) return;

    emit(
      state.copyWith(
        status: ListenerNotificationPreferencesStatus.saving,
        errorMessage: '',
      ),
    );

    try {
      final result = await _updateListenerNotificationPreferencesUsecase(
        preferences: event.preferences,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'ListenerNotificationPreferencesBloc: save failed — $message',
          );
          emit(
            state.copyWith(
              status: ListenerNotificationPreferencesStatus.saveFailure,
              errorMessage: message,
            ),
          );
        },
        (preferences) {
          emit(
            ListenerNotificationPreferencesState(
              status: ListenerNotificationPreferencesStatus.saveSuccess,
              savedPreferences: preferences,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerNotificationPreferencesBloc: unexpected save error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerNotificationPreferencesStatus.saveFailure,
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
