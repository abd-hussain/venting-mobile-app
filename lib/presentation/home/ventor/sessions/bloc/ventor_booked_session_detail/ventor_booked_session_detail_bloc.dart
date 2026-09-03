import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/cancel_ventor_session_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_booked_session_detail_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/home/ventor/home/ventor_home_mapper.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_booked_sessions_mapper.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';

part 'ventor_booked_session_detail_bloc.freezed.dart';
part 'ventor_booked_session_detail_event.dart';
part 'ventor_booked_session_detail_state.dart';

class VentorBookedSessionDetailBloc
    extends
        Bloc<VentorBookedSessionDetailEvent, VentorBookedSessionDetailState> {
  VentorBookedSessionDetailBloc(
    this._getVentorBookedSessionDetailUsecase,
    this._cancelVentorSessionUsecase, {
    required VentorBookedSession initialSession,
  }) : super(
         VentorBookedSessionDetailState(
           status: VentorBookedSessionDetailStatus.loading,
           session: initialSession,
         ),
       ) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_CancelRequested>(_onCancelRequested);
  }

  final GetVentorBookedSessionDetailUsecase
  _getVentorBookedSessionDetailUsecase;
  final CancelVentorSessionUsecase _cancelVentorSessionUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<VentorBookedSessionDetailState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<VentorBookedSessionDetailState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _load(Emitter<VentorBookedSessionDetailState> emit) async {
    emit(
      state.copyWith(
        status: VentorBookedSessionDetailStatus.loading,
        errorMessage: '',
        cancelErrorMessage: '',
      ),
    );

    try {
      final result = await _getVentorBookedSessionDetailUsecase(
        sessionId: state.session.id,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorBookedSessionDetailBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorBookedSessionDetailStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (detail) {
          final mapped = ventorBookedSessionDetailFromDomain(detail);
          emit(
            state.copyWith(
              status: VentorBookedSessionDetailStatus.ready,
              session: mapped.session,
              listener: mapped.listener,
              payment: mapped.payment,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorBookedSessionDetailBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorBookedSessionDetailStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onCancelRequested(
    _CancelRequested event,
    Emitter<VentorBookedSessionDetailState> emit,
  ) async {
    if (state.isCancelling ||
        state.session.status != VentorBookedSessionStatus.upcoming) {
      return;
    }

    emit(state.copyWith(isCancelling: true, cancelErrorMessage: ''));

    try {
      final result = await _cancelVentorSessionUsecase(
        sessionId: state.session.id,
        reason: event.reason,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorBookedSessionDetailBloc: cancel failed — $message',
          );
          emit(
            state.copyWith(isCancelling: false, cancelErrorMessage: message),
          );
        },
        (cancelled) {
          emit(
            state.copyWith(
              isCancelling: false,
              session: ventorBookedSessionFromData(cancelled),
              cancelErrorMessage: '',
              cancelSucceeded: true,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorBookedSessionDetailBloc: unexpected cancel error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isCancelling: false,
          cancelErrorMessage: _mapError(error),
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
