import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_payouts.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_payout_history_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_payout_history_bloc.freezed.dart';
part 'listener_payout_history_event.dart';
part 'listener_payout_history_state.dart';

class ListenerPayoutHistoryBloc
    extends Bloc<ListenerPayoutHistoryEvent, ListenerPayoutHistoryState> {
  ListenerPayoutHistoryBloc(this._getListenerPayoutHistoryUsecase)
    : super(const ListenerPayoutHistoryState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
  }

  final GetListenerPayoutHistoryUsecase _getListenerPayoutHistoryUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<ListenerPayoutHistoryState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<ListenerPayoutHistoryState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _load(Emitter<ListenerPayoutHistoryState> emit) async {
    emit(
      state.copyWith(
        status: ListenerPayoutHistoryLoadStatus.loading,
        errorMessage: '',
      ),
    );

    try {
      final result = await _getListenerPayoutHistoryUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'ListenerPayoutHistoryBloc: load history failed — $message',
          );
          emit(
            state.copyWith(
              status: ListenerPayoutHistoryLoadStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (items) {
          emit(
            state.copyWith(
              status: ListenerPayoutHistoryLoadStatus.ready,
              items: items,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerPayoutHistoryBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerPayoutHistoryLoadStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  String _mapError(Object error) {
    if (error is MainAPIException) {
      if (error.message.isNotEmpty) return error.message;
      final localized = error.getLocalizedMessage();
      if (localized.isNotEmpty) return localized;
    }
    final message = error.toString().trim();
    if (message.isNotEmpty) return message;
    return VentingMobLocalizationsHolder.withLocale(
      VentingMobLocalizationsHolder.currentLanguageCode,
      (l10n) => l10n.common_unknown_error,
    );
  }
}
