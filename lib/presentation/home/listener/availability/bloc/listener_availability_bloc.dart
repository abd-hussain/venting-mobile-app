import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_online_status_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_online_status_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_availability_bloc.freezed.dart';
part 'listener_availability_event.dart';
part 'listener_availability_state.dart';

class ListenerAvailabilityBloc
    extends Bloc<ListenerAvailabilityEvent, ListenerAvailabilityState> {
  ListenerAvailabilityBloc(
    this._getListenerOnlineStatusUsecase,
    this._updateListenerOnlineStatusUsecase,
  ) : super(const ListenerAvailabilityState()) {
    on<_Started>(_onStarted);
    on<_OnlineStatusChanged>(_onOnlineStatusChanged);
  }

  final GetListenerOnlineStatusUsecase _getListenerOnlineStatusUsecase;
  final UpdateListenerOnlineStatusUsecase _updateListenerOnlineStatusUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<ListenerAvailabilityState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ListenerAvailabilityStatus.loading,
        errorMessage: '',
      ),
    );

    try {
      final result = await _getListenerOnlineStatusUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerAvailabilityBloc: load online status — $message',
          );
          emit(
            state.copyWith(
              status: ListenerAvailabilityStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (isOnline) {
          emit(
            state.copyWith(
              status: ListenerAvailabilityStatus.ready,
              isOnline: isOnline,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerAvailabilityBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerAvailabilityStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onOnlineStatusChanged(
    _OnlineStatusChanged event,
    Emitter<ListenerAvailabilityState> emit,
  ) async {
    if (!state.isReady || state.isSavingOnline) return;

    final previous = state.isOnline;
    emit(
      state.copyWith(
        isOnline: event.isOnline,
        isSavingOnline: true,
        errorMessage: '',
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
                'ListenerAvailabilityBloc: update online status — $message',
          );
          emit(
            state.copyWith(
              isOnline: previous,
              isSavingOnline: false,
              errorMessage: message,
            ),
          );
        },
        (isOnline) {
          emit(
            state.copyWith(
              isOnline: isOnline,
              isSavingOnline: false,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerAvailabilityBloc: unexpected save error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isOnline: previous,
          isSavingOnline: false,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  String _mapError(Object error) {
    if (error is MainAPIException) {
      return error.message.isNotEmpty
          ? error.message
          : VentingMobLocalizationsHolder.current.common_unknown_error;
    }
    return VentingMobLocalizationsHolder.current.common_unknown_error;
  }
}
