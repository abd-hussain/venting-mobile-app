import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/submit_listener_session_report_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_report_reason.dart';

part 'listener_call_report_bloc.freezed.dart';
part 'listener_call_report_event.dart';
part 'listener_call_report_state.dart';

class ListenerCallReportBloc
    extends Bloc<ListenerCallReportEvent, ListenerCallReportState> {
  ListenerCallReportBloc(this._submitListenerSessionReportUsecase)
    : super(const ListenerCallReportState()) {
    on<_ReasonSelected>(_onReasonSelected);
    on<_SubmitRequested>(_onSubmitRequested);
  }

  final SubmitListenerSessionReportUsecase _submitListenerSessionReportUsecase;

  void _onReasonSelected(
    _ReasonSelected event,
    Emitter<ListenerCallReportState> emit,
  ) {
    if (state.isSubmitting) return;
    emit(state.copyWith(selectedReason: event.reason, errorMessage: ''));
  }

  Future<void> _onSubmitRequested(
    _SubmitRequested event,
    Emitter<ListenerCallReportState> emit,
  ) async {
    final reason = state.selectedReason;
    if (reason == null || state.isSubmitting) return;

    emit(
      state.copyWith(
        status: ListenerCallReportStatus.submitting,
        errorMessage: '',
        submitSucceeded: false,
      ),
    );

    try {
      final result = await _submitListenerSessionReportUsecase(
        sessionId: event.sessionId,
        reason: listenerCallReportReasonToApi(reason),
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerCallReportBloc: submit failed — $message',
          );
          emit(
            state.copyWith(
              status: ListenerCallReportStatus.ready,
              errorMessage: message,
              submitSucceeded: false,
            ),
          );
        },
        (_) {
          emit(
            state.copyWith(
              status: ListenerCallReportStatus.ready,
              errorMessage: '',
              submitSucceeded: true,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerCallReportBloc: unexpected submit error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerCallReportStatus.ready,
          errorMessage: _mapError(error),
          submitSucceeded: false,
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
