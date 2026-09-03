import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/end_session_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'ventor_call_end_bloc.freezed.dart';
part 'ventor_call_end_event.dart';
part 'ventor_call_end_state.dart';

class VentorCallEndBloc extends Bloc<VentorCallEndEvent, VentorCallEndState> {
  VentorCallEndBloc(this._endSessionUsecase)
    : super(const VentorCallEndState()) {
    on<_EndRequested>(_onEndRequested);
  }

  final EndSessionUsecase _endSessionUsecase;

  Future<void> _onEndRequested(
    _EndRequested event,
    Emitter<VentorCallEndState> emit,
  ) async {
    if (state.isEnding) return;

    emit(
      state.copyWith(
        status: VentorCallEndStatus.ending,
        errorMessage: '',
        endSucceeded: false,
      ),
    );

    try {
      final result = await _endSessionUsecase(
        sessionId: event.sessionId,
        endedBy: 'ventor',
        durationSeconds: event.durationSeconds,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorCallEndBloc: end failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorCallEndStatus.ready,
              errorMessage: message,
              endSucceeded: true,
            ),
          );
        },
        (_) {
          emit(
            state.copyWith(
              status: VentorCallEndStatus.ready,
              errorMessage: '',
              endSucceeded: true,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorCallEndBloc: unexpected end error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorCallEndStatus.ready,
          errorMessage: _mapError(error),
          endSucceeded: true,
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
