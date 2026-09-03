import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/session_call_credentials.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/join_session_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'ventor_call_join_bloc.freezed.dart';
part 'ventor_call_join_event.dart';
part 'ventor_call_join_state.dart';

class VentorCallJoinBloc
    extends Bloc<VentorCallJoinEvent, VentorCallJoinState> {
  VentorCallJoinBloc(this._joinSessionUsecase)
    : super(const VentorCallJoinState()) {
    on<_JoinRequested>(_onJoinRequested);
  }

  final JoinSessionUsecase _joinSessionUsecase;

  Future<void> _onJoinRequested(
    _JoinRequested event,
    Emitter<VentorCallJoinState> emit,
  ) async {
    if (state.isJoining) return;

    emit(
      state.copyWith(
        status: VentorCallJoinStatus.joining,
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
            message: 'VentorCallJoinBloc: join failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorCallJoinStatus.ready,
              errorMessage: message,
              joinSucceeded: false,
              callCredentials: null,
            ),
          );
        },
        (credentials) {
          emit(
            state.copyWith(
              status: VentorCallJoinStatus.ready,
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
        message: 'VentorCallJoinBloc: unexpected join error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorCallJoinStatus.ready,
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
