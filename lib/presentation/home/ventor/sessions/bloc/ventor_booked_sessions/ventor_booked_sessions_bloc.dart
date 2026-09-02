import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_booked_sessions_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/home/ventor/home/ventor_home_mapper.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';

part 'ventor_booked_sessions_bloc.freezed.dart';
part 'ventor_booked_sessions_event.dart';
part 'ventor_booked_sessions_state.dart';

class VentorBookedSessionsBloc
    extends Bloc<VentorBookedSessionsEvent, VentorBookedSessionsState> {
  VentorBookedSessionsBloc(this._getVentorBookedSessionsUsecase)
    : super(const VentorBookedSessionsState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_SessionUpdated>(_onSessionUpdated);
  }

  final GetVentorBookedSessionsUsecase _getVentorBookedSessionsUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<VentorBookedSessionsState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<VentorBookedSessionsState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<VentorBookedSessionsState> emit,
  ) async {
    await _load(emit, showLoading: false);
  }

  void _onSessionUpdated(
    _SessionUpdated event,
    Emitter<VentorBookedSessionsState> emit,
  ) {
    emit(
      state.copyWith(
        sessions: [
          for (final session in state.sessions)
            if (session.id == event.session.id) event.session else session,
        ],
      ),
    );
  }

  Future<void> _load(
    Emitter<VentorBookedSessionsState> emit, {
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(
        state.copyWith(
          status: VentorBookedSessionsStatus.loading,
          errorMessage: '',
        ),
      );
    } else {
      emit(state.copyWith(isRefreshing: true, errorMessage: ''));
    }

    try {
      final result = await _getVentorBookedSessionsUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorBookedSessionsBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorBookedSessionsStatus.loadFailure,
              isRefreshing: false,
              errorMessage: message,
            ),
          );
        },
        (overview) {
          emit(
            state.copyWith(
              status: VentorBookedSessionsStatus.ready,
              isRefreshing: false,
              sessions: [
                for (final item in overview.sessions)
                  ventorBookedSessionFromData(item),
              ],
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorBookedSessionsBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorBookedSessionsStatus.loadFailure,
          isRefreshing: false,
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
