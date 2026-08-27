import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_privacy_settings.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_privacy_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_privacy_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_privacy_visibility_bloc.freezed.dart';
part 'listener_privacy_visibility_event.dart';
part 'listener_privacy_visibility_state.dart';

class ListenerPrivacyVisibilityBloc
    extends
        Bloc<ListenerPrivacyVisibilityEvent, ListenerPrivacyVisibilityState> {
  ListenerPrivacyVisibilityBloc(
    this._getListenerPrivacyUsecase,
    this._updateListenerPrivacyUsecase,
  ) : super(const ListenerPrivacyVisibilityState()) {
    on<_Started>(_onStarted);
    on<_SaveRequested>(_onSaveRequested);
  }

  final GetListenerPrivacyUsecase _getListenerPrivacyUsecase;
  final UpdateListenerPrivacyUsecase _updateListenerPrivacyUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<ListenerPrivacyVisibilityState> emit,
  ) async {
    emit(
      const ListenerPrivacyVisibilityState(
        status: ListenerPrivacyVisibilityStatus.loading,
      ),
    );

    try {
      final result = await _getListenerPrivacyUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'ListenerPrivacyVisibilityBloc: load privacy failed — $message',
          );
          emit(
            ListenerPrivacyVisibilityState(
              status: ListenerPrivacyVisibilityStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (settings) {
          emit(
            ListenerPrivacyVisibilityState(
              status: ListenerPrivacyVisibilityStatus.ready,
              savedSettings: settings,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerPrivacyVisibilityBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        ListenerPrivacyVisibilityState(
          status: ListenerPrivacyVisibilityStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onSaveRequested(
    _SaveRequested event,
    Emitter<ListenerPrivacyVisibilityState> emit,
  ) async {
    if (state.isSaving) return;

    emit(
      state.copyWith(
        status: ListenerPrivacyVisibilityStatus.saving,
        errorMessage: '',
      ),
    );

    try {
      final result = await _updateListenerPrivacyUsecase(
        settings: event.settings,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'ListenerPrivacyVisibilityBloc: save privacy failed — $message',
          );
          emit(
            state.copyWith(
              status: ListenerPrivacyVisibilityStatus.saveFailure,
              errorMessage: message,
            ),
          );
        },
        (settings) {
          emit(
            ListenerPrivacyVisibilityState(
              status: ListenerPrivacyVisibilityStatus.saveSuccess,
              savedSettings: settings,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerPrivacyVisibilityBloc: unexpected save error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerPrivacyVisibilityStatus.saveFailure,
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
