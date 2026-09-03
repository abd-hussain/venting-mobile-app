import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/submit_ventor_session_report_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_report_reason.dart';

part 'ventor_call_report_bloc.freezed.dart';
part 'ventor_call_report_event.dart';
part 'ventor_call_report_state.dart';

class VentorCallReportBloc
    extends Bloc<VentorCallReportEvent, VentorCallReportState> {
  VentorCallReportBloc(this._submitVentorSessionReportUsecase)
    : super(const VentorCallReportState()) {
    on<_ReasonSelected>(_onReasonSelected);
    on<_DetailsChanged>(_onDetailsChanged);
    on<_SubmitRequested>(_onSubmitRequested);
  }

  final SubmitVentorSessionReportUsecase _submitVentorSessionReportUsecase;

  void _onReasonSelected(
    _ReasonSelected event,
    Emitter<VentorCallReportState> emit,
  ) {
    if (state.isSubmitting) return;
    emit(
      state.copyWith(
        selectedReason: event.reason,
        errorMessage: '',
        details: event.reason == VentorCallReportReason.other
            ? state.details
            : '',
      ),
    );
  }

  void _onDetailsChanged(
    _DetailsChanged event,
    Emitter<VentorCallReportState> emit,
  ) {
    if (state.isSubmitting) return;
    emit(state.copyWith(details: event.details, errorMessage: ''));
  }

  Future<void> _onSubmitRequested(
    _SubmitRequested event,
    Emitter<VentorCallReportState> emit,
  ) async {
    final reason = state.selectedReason;
    if (reason == null || !state.canSubmit) return;

    emit(
      state.copyWith(
        status: VentorCallReportStatus.submitting,
        errorMessage: '',
        submitSucceeded: false,
      ),
    );

    try {
      final details = reason == VentorCallReportReason.other
          ? state.details.trim()
          : null;
      final result = await _submitVentorSessionReportUsecase(
        sessionId: event.sessionId,
        reason: ventorCallReportReasonToApi(reason),
        details: details,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorCallReportBloc: submit failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorCallReportStatus.ready,
              errorMessage: message,
              submitSucceeded: false,
            ),
          );
        },
        (_) {
          emit(
            state.copyWith(
              status: VentorCallReportStatus.ready,
              errorMessage: '',
              submitSucceeded: true,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorCallReportBloc: unexpected submit error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorCallReportStatus.ready,
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
