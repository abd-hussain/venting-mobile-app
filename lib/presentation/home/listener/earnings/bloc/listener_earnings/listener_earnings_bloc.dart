import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_earnings.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_earnings_overview_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_earnings_bloc.freezed.dart';
part 'listener_earnings_event.dart';
part 'listener_earnings_state.dart';

class ListenerEarningsBloc
    extends Bloc<ListenerEarningsEvent, ListenerEarningsState> {
  ListenerEarningsBloc(this._getListenerEarningsOverviewUsecase)
    : super(const ListenerEarningsState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_RefreshRequested>(_onRefreshRequested);
  }

  final GetListenerEarningsOverviewUsecase _getListenerEarningsOverviewUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<ListenerEarningsState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<ListenerEarningsState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<ListenerEarningsState> emit,
  ) async {
    await _load(emit, showLoading: false);
  }

  Future<void> _load(
    Emitter<ListenerEarningsState> emit, {
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(
        state.copyWith(
          status: ListenerEarningsStatus.loading,
          errorMessage: '',
        ),
      );
    }

    try {
      final result = await _getListenerEarningsOverviewUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerEarningsBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              status: ListenerEarningsStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (overview) {
          emit(
            state.copyWith(
              status: ListenerEarningsStatus.ready,
              overview: overview,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerEarningsBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerEarningsStatus.loadFailure,
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
