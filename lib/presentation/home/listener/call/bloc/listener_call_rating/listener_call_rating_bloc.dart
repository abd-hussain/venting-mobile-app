import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/submit_listener_session_feedback_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_call_rating_bloc.freezed.dart';
part 'listener_call_rating_event.dart';
part 'listener_call_rating_state.dart';

class ListenerCallRatingBloc
    extends Bloc<ListenerCallRatingEvent, ListenerCallRatingState> {
  ListenerCallRatingBloc(this._submitListenerSessionFeedbackUsecase)
    : super(const ListenerCallRatingState()) {
    on<_StarsChanged>(_onStarsChanged);
    on<_FeltHeardChanged>(_onFeltHeardChanged);
    on<_TalkAgainChanged>(_onTalkAgainChanged);
    on<_SubmitRequested>(_onSubmitRequested);
  }

  final SubmitListenerSessionFeedbackUsecase
  _submitListenerSessionFeedbackUsecase;

  void _onStarsChanged(
    _StarsChanged event,
    Emitter<ListenerCallRatingState> emit,
  ) {
    emit(state.copyWith(stars: event.stars.clamp(1, 5), errorMessage: ''));
  }

  void _onFeltHeardChanged(
    _FeltHeardChanged event,
    Emitter<ListenerCallRatingState> emit,
  ) {
    emit(state.copyWith(feltHeard: event.value, errorMessage: ''));
  }

  void _onTalkAgainChanged(
    _TalkAgainChanged event,
    Emitter<ListenerCallRatingState> emit,
  ) {
    emit(state.copyWith(talkAgain: event.value, errorMessage: ''));
  }

  Future<void> _onSubmitRequested(
    _SubmitRequested event,
    Emitter<ListenerCallRatingState> emit,
  ) async {
    if (!state.canSubmit) return;

    emit(
      state.copyWith(
        status: ListenerCallRatingStatus.submitting,
        errorMessage: '',
        submitSucceeded: false,
      ),
    );

    try {
      final result = await _submitListenerSessionFeedbackUsecase(
        sessionId: event.sessionId,
        stars: state.stars,
        feltHeard: state.feltHeard!,
        talkAgain: state.talkAgain!,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerCallRatingBloc: submit failed — $message',
          );
          emit(
            state.copyWith(
              status: ListenerCallRatingStatus.ready,
              errorMessage: message,
              submitSucceeded: false,
            ),
          );
        },
        (_) {
          emit(
            state.copyWith(
              status: ListenerCallRatingStatus.ready,
              errorMessage: '',
              submitSucceeded: true,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerCallRatingBloc: unexpected submit error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerCallRatingStatus.ready,
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
