import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_training.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/complete_listener_training_module_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_training_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_training_curriculum.dart';

part 'listener_training_bloc.freezed.dart';
part 'listener_training_event.dart';
part 'listener_training_state.dart';

class ListenerTrainingBloc
    extends Bloc<ListenerTrainingEvent, ListenerTrainingState> {
  ListenerTrainingBloc(
    this._getListenerTrainingUsecase,
    this._completeListenerTrainingModuleUsecase,
  ) : super(const ListenerTrainingState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_ModuleCompleted>(_onModuleCompleted);
  }

  final GetListenerTrainingUsecase _getListenerTrainingUsecase;
  final CompleteListenerTrainingModuleUsecase
  _completeListenerTrainingModuleUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<ListenerTrainingState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<ListenerTrainingState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onModuleCompleted(
    _ModuleCompleted event,
    Emitter<ListenerTrainingState> emit,
  ) async {
    if (state.isCompletingModule) return;

    emit(
      state.copyWith(
        isCompletingModule: true,
        completingModuleId: event.moduleId,
        errorMessage: '',
      ),
    );

    try {
      final result = await _completeListenerTrainingModuleUsecase(
        moduleId: event.moduleId,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerTrainingBloc: complete module failed — $message',
          );
          emit(
            state.copyWith(
              isCompletingModule: false,
              completingModuleId: '',
              errorMessage: message,
            ),
          );
        },
        (progress) {
          emit(
            state.copyWith(
              loadStatus: ListenerTrainingLoadStatus.ready,
              modules: _localizedModules(progress.modules),
              allCompleted: progress.allCompleted,
              isCompletingModule: false,
              completingModuleId: '',
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerTrainingBloc: unexpected complete module error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isCompletingModule: false,
          completingModuleId: '',
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _load(Emitter<ListenerTrainingState> emit) async {
    emit(
      state.copyWith(
        loadStatus: ListenerTrainingLoadStatus.loading,
        errorMessage: '',
      ),
    );

    try {
      final result = await _getListenerTrainingUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerTrainingBloc: load training failed — $message',
          );
          emit(
            state.copyWith(
              loadStatus: ListenerTrainingLoadStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (progress) {
          emit(
            state.copyWith(
              loadStatus: ListenerTrainingLoadStatus.ready,
              modules: _localizedModules(progress.modules),
              allCompleted: progress.allCompleted,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerTrainingBloc: unexpected load training error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          loadStatus: ListenerTrainingLoadStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  List<ListenerTrainingModule> _localizedModules(
    List<ListenerTrainingModule> modules,
  ) {
    final l10n = VentingMobLocalizationsHolder.current;
    return [
      for (final module in modules)
        module.title.trim().isEmpty
            ? module.copyWith(
                title: ListenerTrainingCurriculum.titleForModuleId(
                  l10n,
                  module.id,
                ),
              )
            : module,
    ];
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
