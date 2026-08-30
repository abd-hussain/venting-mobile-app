import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_notification_preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_notification_preferences_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_ventor_notification_preferences_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'ventor_notification_preferences_bloc.freezed.dart';
part 'ventor_notification_preferences_event.dart';
part 'ventor_notification_preferences_state.dart';

class VentorNotificationPreferencesBloc
    extends
        Bloc<
          VentorNotificationPreferencesEvent,
          VentorNotificationPreferencesState
        > {
  VentorNotificationPreferencesBloc(
    this._getVentorNotificationPreferencesUsecase,
    this._updateVentorNotificationPreferencesUsecase,
  ) : super(const VentorNotificationPreferencesState()) {
    on<_Started>(_onStarted);
    on<_SaveRequested>(_onSaveRequested);
  }

  final GetVentorNotificationPreferencesUsecase
  _getVentorNotificationPreferencesUsecase;
  final UpdateVentorNotificationPreferencesUsecase
  _updateVentorNotificationPreferencesUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<VentorNotificationPreferencesState> emit,
  ) async {
    emit(
      const VentorNotificationPreferencesState(
        status: VentorNotificationPreferencesStatus.loading,
      ),
    );

    try {
      final result = await _getVentorNotificationPreferencesUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'VentorNotificationPreferencesBloc: load failed — $message',
          );
          emit(
            VentorNotificationPreferencesState(
              status: VentorNotificationPreferencesStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (preferences) {
          emit(
            VentorNotificationPreferencesState(
              status: VentorNotificationPreferencesStatus.ready,
              savedPreferences: preferences,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorNotificationPreferencesBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        VentorNotificationPreferencesState(
          status: VentorNotificationPreferencesStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onSaveRequested(
    _SaveRequested event,
    Emitter<VentorNotificationPreferencesState> emit,
  ) async {
    if (state.isSaving) return;

    emit(
      state.copyWith(
        status: VentorNotificationPreferencesStatus.saving,
        errorMessage: '',
      ),
    );

    try {
      final result = await _updateVentorNotificationPreferencesUsecase(
        preferences: event.preferences,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'VentorNotificationPreferencesBloc: save failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorNotificationPreferencesStatus.saveFailure,
              errorMessage: message,
            ),
          );
        },
        (preferences) {
          emit(
            VentorNotificationPreferencesState(
              status: VentorNotificationPreferencesStatus.saveSuccess,
              savedPreferences: preferences,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorNotificationPreferencesBloc: unexpected save error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorNotificationPreferencesStatus.saveFailure,
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
