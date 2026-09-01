import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_invites.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_invites_overview_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'ventor_invites_bloc.freezed.dart';
part 'ventor_invites_event.dart';
part 'ventor_invites_state.dart';

class VentorInvitesBloc extends Bloc<VentorInvitesEvent, VentorInvitesState> {
  VentorInvitesBloc(this._getVentorInvitesOverviewUsecase)
    : super(const VentorInvitesState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
  }

  final GetVentorInvitesOverviewUsecase _getVentorInvitesOverviewUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<VentorInvitesState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<VentorInvitesState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _load(Emitter<VentorInvitesState> emit) async {
    emit(state.copyWith(status: VentorInvitesStatus.loading, errorMessage: ''));

    try {
      final result = await _getVentorInvitesOverviewUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorInvitesBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorInvitesStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (overview) {
          emit(
            state.copyWith(
              status: VentorInvitesStatus.ready,
              overview: overview,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorInvitesBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorInvitesStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
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
