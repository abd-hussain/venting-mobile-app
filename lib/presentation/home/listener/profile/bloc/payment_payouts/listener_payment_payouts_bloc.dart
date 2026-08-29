import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_payouts.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_payment_payouts_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/request_listener_payout_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_payout_method_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_payment_payouts_bloc.freezed.dart';
part 'listener_payment_payouts_event.dart';
part 'listener_payment_payouts_state.dart';

class ListenerPaymentPayoutsBloc
    extends Bloc<ListenerPaymentPayoutsEvent, ListenerPaymentPayoutsState> {
  ListenerPaymentPayoutsBloc(
    this._getListenerPaymentPayoutsUsecase,
    this._updateListenerPayoutMethodUsecase,
    this._requestListenerPayoutUsecase,
  ) : super(const ListenerPaymentPayoutsState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_UpdateMethodRequested>(_onUpdateMethodRequested);
    on<_RequestPayoutRequested>(_onRequestPayoutRequested);
  }

  static const minPayoutAmount = 100.0;

  final GetListenerPaymentPayoutsUsecase _getListenerPaymentPayoutsUsecase;
  final UpdateListenerPayoutMethodUsecase _updateListenerPayoutMethodUsecase;
  final RequestListenerPayoutUsecase _requestListenerPayoutUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<ListenerPaymentPayoutsState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<ListenerPaymentPayoutsState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<ListenerPaymentPayoutsState> emit,
  ) async {
    await _load(emit, showLoading: false);
  }

  Future<void> _load(
    Emitter<ListenerPaymentPayoutsState> emit, {
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(
        state.copyWith(
          status: ListenerPaymentPayoutsStatus.loading,
          errorMessage: '',
          mutationErrorMessage: '',
          payoutRequestSucceeded: false,
          methodUpdateSucceeded: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          mutationErrorMessage: '',
          payoutRequestSucceeded: false,
          methodUpdateSucceeded: false,
        ),
      );
    }

    try {
      final result = await _getListenerPaymentPayoutsUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerPaymentPayoutsBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              status: ListenerPaymentPayoutsStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (overview) {
          emit(
            state.copyWith(
              status: ListenerPaymentPayoutsStatus.ready,
              overview: overview,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerPaymentPayoutsBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerPaymentPayoutsStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onUpdateMethodRequested(
    _UpdateMethodRequested event,
    Emitter<ListenerPaymentPayoutsState> emit,
  ) async {
    if (state.isSavingMethod) return;

    emit(
      state.copyWith(
        isSavingMethod: true,
        mutationErrorMessage: '',
        methodUpdateSucceeded: false,
      ),
    );

    try {
      final result = await _updateListenerPayoutMethodUsecase(
        accountHolderName: event.accountHolderName,
        bankName: event.bankName,
        ibanOrAccountNumber: event.ibanOrAccountNumber,
        swiftCode: event.swiftCode,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'ListenerPaymentPayoutsBloc: update method failed — $message',
          );
          emit(
            state.copyWith(
              isSavingMethod: false,
              mutationErrorMessage: message,
            ),
          );
        },
        (bankAccount) {
          final overview = state.overview;
          emit(
            state.copyWith(
              isSavingMethod: false,
              methodUpdateSucceeded: true,
              overview: overview == null
                  ? null
                  : ListenerPaymentPayoutsOverview(
                      balances: overview.balances,
                      bankAccount: bankAccount,
                    ),
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerPaymentPayoutsBloc: unexpected update method error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isSavingMethod: false,
          mutationErrorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onRequestPayoutRequested(
    _RequestPayoutRequested event,
    Emitter<ListenerPaymentPayoutsState> emit,
  ) async {
    if (state.isRequestingPayout) return;

    final overview = state.overview;
    final bankAccount = overview?.bankAccount;
    if (overview == null || bankAccount == null) return;

    if (overview.balances.available < minPayoutAmount) return;

    emit(
      state.copyWith(
        isRequestingPayout: true,
        mutationErrorMessage: '',
        payoutRequestSucceeded: false,
      ),
    );

    try {
      final result = await _requestListenerPayoutUsecase(
        amount: overview.balances.available,
        payoutMethodId: bankAccount.methodId,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'ListenerPaymentPayoutsBloc: request payout failed — $message',
          );
          emit(
            state.copyWith(
              isRequestingPayout: false,
              mutationErrorMessage: message,
            ),
          );
        },
        (updatedOverview) {
          emit(
            state.copyWith(
              isRequestingPayout: false,
              overview: updatedOverview,
              payoutRequestSucceeded: true,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerPaymentPayoutsBloc: unexpected request payout error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isRequestingPayout: false,
          mutationErrorMessage: _mapError(error),
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
