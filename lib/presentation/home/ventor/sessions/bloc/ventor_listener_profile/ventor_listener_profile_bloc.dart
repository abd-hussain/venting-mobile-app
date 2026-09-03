import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/add_ventor_favorite_listener_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_listener_profile_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/remove_ventor_favorite_listener_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_find_listeners_mapper.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';

part 'ventor_listener_profile_bloc.freezed.dart';
part 'ventor_listener_profile_event.dart';
part 'ventor_listener_profile_state.dart';

class VentorListenerProfileBloc
    extends Bloc<VentorListenerProfileEvent, VentorListenerProfileState> {
  VentorListenerProfileBloc(
    this._getVentorListenerProfileUsecase,
    this._addVentorFavoriteListenerUsecase,
    this._removeVentorFavoriteListenerUsecase, {
    required VentorFindListener initialListener,
  }) : super(
         VentorListenerProfileState(
           status: VentorListenerProfileStatus.loading,
           listener: initialListener,
         ),
       ) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_FavoriteToggled>(_onFavoriteToggled);
  }

  final GetVentorListenerProfileUsecase _getVentorListenerProfileUsecase;
  final AddVentorFavoriteListenerUsecase _addVentorFavoriteListenerUsecase;
  final RemoveVentorFavoriteListenerUsecase
  _removeVentorFavoriteListenerUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<VentorListenerProfileState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<VentorListenerProfileState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _load(Emitter<VentorListenerProfileState> emit) async {
    emit(
      state.copyWith(
        status: VentorListenerProfileStatus.loading,
        errorMessage: '',
      ),
    );

    try {
      final result = await _getVentorListenerProfileUsecase(
        listenerId: state.listener.id,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorListenerProfileBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorListenerProfileStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (profile) {
          emit(
            state.copyWith(
              status: VentorListenerProfileStatus.ready,
              listener: ventorFindListenerFromDomain(profile),
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorListenerProfileBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorListenerProfileStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onFavoriteToggled(
    _FavoriteToggled event,
    Emitter<VentorListenerProfileState> emit,
  ) async {
    if (state.isUpdatingFavorite) return;

    final previous = state.listener;
    final nextFavorite = !previous.isFavorite;

    emit(
      state.copyWith(
        listener: previous.copyWith(isFavorite: nextFavorite),
        isUpdatingFavorite: true,
        favoriteErrorMessage: '',
      ),
    );

    try {
      final result = nextFavorite
          ? await _addVentorFavoriteListenerUsecase(
              listenerId: previous.id,
            ).run()
          : await _removeVentorFavoriteListenerUsecase(
              listenerId: previous.id,
            ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'VentorListenerProfileBloc: favorite toggle failed — $message',
          );
          emit(
            state.copyWith(
              listener: previous,
              isUpdatingFavorite: false,
              favoriteErrorMessage: message,
            ),
          );
        },
        (_) {
          emit(
            state.copyWith(
              isUpdatingFavorite: false,
              favoriteErrorMessage: '',
              favoriteSyncToken: state.favoriteSyncToken + 1,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorListenerProfileBloc: unexpected favorite toggle error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          listener: previous,
          isUpdatingFavorite: false,
          favoriteErrorMessage: _mapError(error),
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
