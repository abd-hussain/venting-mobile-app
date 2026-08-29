import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_sessions.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/accept_listener_session_request_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/decline_listener_session_request_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_sessions_overview_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_sessions_bloc.freezed.dart';
part 'listener_sessions_event.dart';
part 'listener_sessions_state.dart';

class ListenerSessionsBloc
    extends Bloc<ListenerSessionsEvent, ListenerSessionsState> {
  ListenerSessionsBloc(
    this._getListenerSessionsOverviewUsecase,
    this._acceptListenerSessionRequestUsecase,
    this._declineListenerSessionRequestUsecase,
  ) : super(const ListenerSessionsState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_AcceptRequestRequested>(_onAcceptRequestRequested);
    on<_DeclineRequestRequested>(_onDeclineRequestRequested);
  }

  final GetListenerSessionsOverviewUsecase _getListenerSessionsOverviewUsecase;
  final AcceptListenerSessionRequestUsecase
  _acceptListenerSessionRequestUsecase;
  final DeclineListenerSessionRequestUsecase
  _declineListenerSessionRequestUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<ListenerSessionsState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<ListenerSessionsState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<ListenerSessionsState> emit,
  ) async {
    await _load(emit, showLoading: false);
  }

  Future<void> _load(
    Emitter<ListenerSessionsState> emit, {
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(
        state.copyWith(
          status: ListenerSessionsStatus.loading,
          errorMessage: '',
          actionFeedback: ListenerSessionsActionFeedback.none,
        ),
      );
    } else {
      emit(state.copyWith(actionFeedback: ListenerSessionsActionFeedback.none));
    }

    try {
      final result = await _getListenerSessionsOverviewUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerSessionsBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              status: ListenerSessionsStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (overview) {
          emit(
            state.copyWith(
              status: ListenerSessionsStatus.ready,
              overview: overview,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerSessionsBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerSessionsStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onAcceptRequestRequested(
    _AcceptRequestRequested event,
    Emitter<ListenerSessionsState> emit,
  ) async {
    if (state.isProcessingRequest) return;

    emit(
      state.copyWith(
        isProcessingRequest: true,
        processingRequestId: event.requestId,
        actionFeedback: ListenerSessionsActionFeedback.none,
        errorMessage: '',
      ),
    );

    try {
      final result = await _acceptListenerSessionRequestUsecase(
        requestId: event.requestId,
      ).run();
      if (emit.isDone) return;

      await result.match(
        (error) async {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerSessionsBloc: accept request failed — $message',
          );
          emit(
            state.copyWith(
              isProcessingRequest: false,
              processingRequestId: '',
              errorMessage: message,
            ),
          );
        },
        (acceptResult) async {
          final request = state.overview?.requests
              .where((item) => item.id == event.requestId)
              .firstOrNull;
          final feedback = switch (acceptResult.status) {
            ListenerSessionRequestAcceptStatus.alreadyTaken =>
              ListenerSessionsActionFeedback.requestAlreadyTaken,
            ListenerSessionRequestAcceptStatus.accepted =>
              request?.isInstant == true
                  ? ListenerSessionsActionFeedback.instantRequestAccepted
                  : ListenerSessionsActionFeedback.scheduledRequestAccepted,
          };

          await _load(emit, showLoading: false);
          if (emit.isDone) return;

          emit(
            state.copyWith(
              isProcessingRequest: false,
              processingRequestId: '',
              actionFeedback: feedback,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerSessionsBloc: unexpected accept error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isProcessingRequest: false,
          processingRequestId: '',
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onDeclineRequestRequested(
    _DeclineRequestRequested event,
    Emitter<ListenerSessionsState> emit,
  ) async {
    if (state.isProcessingRequest) return;

    emit(
      state.copyWith(
        isProcessingRequest: true,
        processingRequestId: event.requestId,
        actionFeedback: ListenerSessionsActionFeedback.none,
        errorMessage: '',
      ),
    );

    try {
      final result = await _declineListenerSessionRequestUsecase(
        requestId: event.requestId,
      ).run();
      if (emit.isDone) return;

      await result.match(
        (error) async {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerSessionsBloc: decline request failed — $message',
          );
          emit(
            state.copyWith(
              isProcessingRequest: false,
              processingRequestId: '',
              errorMessage: message,
            ),
          );
        },
        (_) async {
          await _load(emit, showLoading: false);
          if (emit.isDone) return;

          emit(
            state.copyWith(
              isProcessingRequest: false,
              processingRequestId: '',
              actionFeedback: ListenerSessionsActionFeedback.requestDeclined,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerSessionsBloc: unexpected decline error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isProcessingRequest: false,
          processingRequestId: '',
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
