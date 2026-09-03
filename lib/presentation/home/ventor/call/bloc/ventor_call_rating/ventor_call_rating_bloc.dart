import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/submit_ventor_session_rating_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_report_reason.dart';

part 'ventor_call_rating_bloc.freezed.dart';
part 'ventor_call_rating_event.dart';
part 'ventor_call_rating_state.dart';

class VentorCallRatingBloc
    extends Bloc<VentorCallRatingEvent, VentorCallRatingState> {
  VentorCallRatingBloc(this._submitVentorSessionRatingUsecase)
    : super(const VentorCallRatingState()) {
    on<_StarsChanged>(_onStarsChanged);
    on<_TipChanged>(_onTipChanged);
    on<_ReviewChanged>(_onReviewChanged);
    on<_ReportCaptured>(_onReportCaptured);
    on<_SubmitRequested>(_onSubmitRequested);
  }

  final SubmitVentorSessionRatingUsecase _submitVentorSessionRatingUsecase;

  void _onStarsChanged(
    _StarsChanged event,
    Emitter<VentorCallRatingState> emit,
  ) {
    emit(state.copyWith(stars: event.stars.clamp(1, 5), errorMessage: ''));
  }

  void _onTipChanged(_TipChanged event, Emitter<VentorCallRatingState> emit) {
    emit(state.copyWith(tipAmount: event.tipAmount, errorMessage: ''));
  }

  void _onReviewChanged(
    _ReviewChanged event,
    Emitter<VentorCallRatingState> emit,
  ) {
    emit(state.copyWith(review: event.review, errorMessage: ''));
  }

  void _onReportCaptured(
    _ReportCaptured event,
    Emitter<VentorCallRatingState> emit,
  ) {
    emit(
      state.copyWith(
        reportReason: event.reason,
        reportDetails: event.details,
        reportAlreadySubmitted: event.alreadySubmitted,
        errorMessage: '',
      ),
    );
  }

  Future<void> _onSubmitRequested(
    _SubmitRequested event,
    Emitter<VentorCallRatingState> emit,
  ) async {
    if (state.isSubmitting) return;

    emit(
      state.copyWith(
        status: VentorCallRatingStatus.submitting,
        errorMessage: '',
        submitSucceeded: false,
        tipCharged: null,
      ),
    );

    try {
      // Report is already POSTed via /reports when captured from the sheet.
      // Do not nest it again on /rating to avoid duplicate SessionReport rows.
      final result = await _submitVentorSessionRatingUsecase(
        sessionId: event.sessionId,
        stars: state.stars,
        review: state.review,
        tipAmount: state.tipAmount,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorCallRatingBloc: submit failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorCallRatingStatus.ready,
              errorMessage: message,
              submitSucceeded: false,
              tipCharged: null,
            ),
          );
        },
        (rating) {
          emit(
            state.copyWith(
              status: VentorCallRatingStatus.ready,
              errorMessage: '',
              submitSucceeded: true,
              tipCharged: rating.tipCharged,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorCallRatingBloc: unexpected submit error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorCallRatingStatus.ready,
          errorMessage: _mapError(error),
          submitSucceeded: false,
          tipCharged: null,
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
