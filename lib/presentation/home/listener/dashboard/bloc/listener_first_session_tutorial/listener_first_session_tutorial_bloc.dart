import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/acknowledge_listener_first_session_tutorial_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_first_session_tutorial_bloc.freezed.dart';
part 'listener_first_session_tutorial_event.dart';
part 'listener_first_session_tutorial_state.dart';

class ListenerFirstSessionTutorialBloc
    extends
        Bloc<
          ListenerFirstSessionTutorialEvent,
          ListenerFirstSessionTutorialState
        > {
  ListenerFirstSessionTutorialBloc(
    this._acknowledgeListenerFirstSessionTutorialUsecase,
  ) : super(const ListenerFirstSessionTutorialState()) {
    on<_AcknowledgeRequested>(_onAcknowledgeRequested);
  }

  final AcknowledgeListenerFirstSessionTutorialUsecase
  _acknowledgeListenerFirstSessionTutorialUsecase;

  Future<void> _onAcknowledgeRequested(
    _AcknowledgeRequested event,
    Emitter<ListenerFirstSessionTutorialState> emit,
  ) async {
    if (state.isSubmitting) return;

    emit(state.copyWith(isSubmitting: true, errorMessage: ''));

    try {
      final result = await _acknowledgeListenerFirstSessionTutorialUsecase()
          .run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'ListenerFirstSessionTutorialBloc: acknowledge failed — $message',
          );
          emit(state.copyWith(isSubmitting: false, errorMessage: message));
        },
        (_) {
          emit(
            state.copyWith(
              isSubmitting: false,
              isAcknowledged: true,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message:
            'ListenerFirstSessionTutorialBloc: unexpected acknowledge error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(state.copyWith(isSubmitting: false, errorMessage: _mapError(error)));
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
