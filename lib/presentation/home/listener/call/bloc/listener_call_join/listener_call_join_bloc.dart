import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/session_call_credentials.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/join_session_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_call_join_bloc.freezed.dart';
part 'listener_call_join_event.dart';
part 'listener_call_join_state.dart';

class ListenerCallJoinBloc
    extends Bloc<ListenerCallJoinEvent, ListenerCallJoinState> {
  ListenerCallJoinBloc(this._joinSessionUsecase)
    : super(const ListenerCallJoinState()) {
    on<_JoinRequested>(_onJoinRequested);
  }

  final JoinSessionUsecase _joinSessionUsecase;

  Future<void> _onJoinRequested(
    _JoinRequested event,
    Emitter<ListenerCallJoinState> emit,
  ) async {
    if (state.isJoining) return;

    emit(
      state.copyWith(
        status: ListenerCallJoinStatus.joining,
        errorMessage: '',
        joinSucceeded: false,
        callCredentials: null,
      ),
    );

    try {
      final result = await _joinSessionUsecase(
        sessionId: event.sessionId,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerCallJoinBloc: join failed — $message',
          );
          emit(
            state.copyWith(
              status: ListenerCallJoinStatus.ready,
              errorMessage: message,
              joinSucceeded: false,
              callCredentials: null,
            ),
          );
        },
        (credentials) {
          emit(
            state.copyWith(
              status: ListenerCallJoinStatus.ready,
              errorMessage: '',
              joinSucceeded: true,
              callCredentials: credentials,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerCallJoinBloc: unexpected join error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerCallJoinStatus.ready,
          errorMessage: _mapError(error),
          joinSucceeded: false,
          callCredentials: null,
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
