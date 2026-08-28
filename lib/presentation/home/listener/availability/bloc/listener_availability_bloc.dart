import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_availability.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_availability_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_online_status_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_availability_day_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_availability_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_online_status_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/home/listener/availability/listener_availability_widgets.dart';

part 'listener_availability_bloc.freezed.dart';
part 'listener_availability_event.dart';
part 'listener_availability_state.dart';

class ListenerAvailabilityBloc
    extends Bloc<ListenerAvailabilityEvent, ListenerAvailabilityState> {
  ListenerAvailabilityBloc(
    this._getListenerOnlineStatusUsecase,
    this._updateListenerOnlineStatusUsecase,
    this._getListenerAvailabilityUsecase,
    this._updateListenerAvailabilityUsecase,
    this._updateListenerAvailabilityDayUsecase,
  ) : super(const ListenerAvailabilityState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_OnlineStatusChanged>(_onOnlineStatusChanged);
    on<_InstantCallsChanged>(_onInstantCallsChanged);
    on<_SessionLengthChanged>(_onSessionLengthChanged);
    on<_BreakLengthChanged>(_onBreakLengthChanged);
    on<_DayScheduleChanged>(_onDayScheduleChanged);
  }

  final GetListenerOnlineStatusUsecase _getListenerOnlineStatusUsecase;
  final UpdateListenerOnlineStatusUsecase _updateListenerOnlineStatusUsecase;
  final GetListenerAvailabilityUsecase _getListenerAvailabilityUsecase;
  final UpdateListenerAvailabilityUsecase _updateListenerAvailabilityUsecase;
  final UpdateListenerAvailabilityDayUsecase
  _updateListenerAvailabilityDayUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<ListenerAvailabilityState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<ListenerAvailabilityState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _load(Emitter<ListenerAvailabilityState> emit) async {
    emit(
      state.copyWith(
        status: ListenerAvailabilityStatus.loading,
        errorMessage: '',
        savingTarget: null,
        savingDayId: null,
      ),
    );

    try {
      final onlineResult = await _getListenerOnlineStatusUsecase().run();
      final availabilityResult = await _getListenerAvailabilityUsecase().run();
      if (emit.isDone) return;

      String? errorMessage;
      var isOnline = state.isOnline;
      ListenerAvailability? availability;

      onlineResult.match((error) {
        errorMessage = _mapError(error);
        LoggerManagerBase.logErrorMessage(
          error: error,
          message:
              'ListenerAvailabilityBloc: load online status — $errorMessage',
        );
      }, (value) => isOnline = value);

      availabilityResult.match((error) {
        errorMessage ??= _mapError(error);
        LoggerManagerBase.logErrorMessage(
          error: error,
          message:
              'ListenerAvailabilityBloc: load availability — $errorMessage',
        );
      }, (value) => availability = value);

      if (errorMessage != null) {
        emit(
          state.copyWith(
            status: ListenerAvailabilityStatus.loadFailure,
            isOnline: isOnline,
            availability: availability,
            errorMessage: errorMessage!,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          status: ListenerAvailabilityStatus.ready,
          isOnline: isOnline,
          availability: availability,
          errorMessage: '',
        ),
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerAvailabilityBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerAvailabilityStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onOnlineStatusChanged(
    _OnlineStatusChanged event,
    Emitter<ListenerAvailabilityState> emit,
  ) async {
    if (!state.isReady || state.savingTarget != null) return;

    final previous = state.isOnline;
    emit(
      state.copyWith(
        isOnline: event.isOnline,
        savingTarget: ListenerAvailabilitySavingTarget.online,
        errorMessage: '',
      ),
    );

    try {
      final result = await _updateListenerOnlineStatusUsecase(
        isOnline: event.isOnline,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'ListenerAvailabilityBloc: update online status — $message',
          );
          emit(
            state.copyWith(
              isOnline: previous,
              savingTarget: null,
              errorMessage: message,
            ),
          );
        },
        (isOnline) {
          emit(
            state.copyWith(
              isOnline: isOnline,
              savingTarget: null,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerAvailabilityBloc: unexpected online save error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isOnline: previous,
          savingTarget: null,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onInstantCallsChanged(
    _InstantCallsChanged event,
    Emitter<ListenerAvailabilityState> emit,
  ) async {
    final current = state.availability;
    if (!state.isReady || current == null || state.savingTarget != null) return;

    await _persistAvailability(
      emit,
      current.copyWith(acceptInstantCalls: event.acceptInstantCalls),
      savingTarget: ListenerAvailabilitySavingTarget.instantCalls,
    );
  }

  Future<void> _onSessionLengthChanged(
    _SessionLengthChanged event,
    Emitter<ListenerAvailabilityState> emit,
  ) async {
    final current = state.availability;
    if (!state.isReady || current == null || state.savingTarget != null) return;

    await _persistAvailability(
      emit,
      current.copyWith(sessionLength: event.sessionLength),
      savingTarget: ListenerAvailabilitySavingTarget.sessionLength,
    );
  }

  Future<void> _onBreakLengthChanged(
    _BreakLengthChanged event,
    Emitter<ListenerAvailabilityState> emit,
  ) async {
    final current = state.availability;
    if (!state.isReady || current == null || state.savingTarget != null) return;

    await _persistAvailability(
      emit,
      current.copyWith(breakLengthMinutes: event.breakLengthMinutes),
      savingTarget: ListenerAvailabilitySavingTarget.breakLength,
    );
  }

  Future<void> _onDayScheduleChanged(
    _DayScheduleChanged event,
    Emitter<ListenerAvailabilityState> emit,
  ) async {
    final current = state.availability;
    if (!state.isReady || current == null || state.savingTarget != null) return;

    final previousDay = current.dayById(event.dayId);
    final slots = event.enabled
        ? event.slots
              .map(
                (slot) =>
                    ListenerAvailabilitySlot(start: slot.start, end: slot.end),
              )
              .where(
                (slot) =>
                    slot.end.hour * 60 + slot.end.minute >
                    slot.start.hour * 60 + slot.start.minute,
              )
              .toList(growable: false)
        : <ListenerAvailabilitySlot>[];

    final optimistic = current.updateDay(
      ListenerAvailabilityDay(dayId: event.dayId, slots: slots),
    );

    emit(
      state.copyWith(
        availability: optimistic,
        savingTarget: ListenerAvailabilitySavingTarget.day,
        savingDayId: event.dayId,
        errorMessage: '',
      ),
    );

    try {
      final result = await _updateListenerAvailabilityDayUsecase(
        dayId: event.dayId,
        slots: slots,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerAvailabilityBloc: update day — $message',
          );
          emit(
            state.copyWith(
              availability: current.updateDay(previousDay),
              savingTarget: null,
              savingDayId: null,
              errorMessage: message,
            ),
          );
        },
        (day) {
          emit(
            state.copyWith(
              availability: current.updateDay(day),
              savingTarget: null,
              savingDayId: null,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerAvailabilityBloc: unexpected day save error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          availability: current.updateDay(previousDay),
          savingTarget: null,
          savingDayId: null,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _persistAvailability(
    Emitter<ListenerAvailabilityState> emit,
    ListenerAvailability updated, {
    required ListenerAvailabilitySavingTarget savingTarget,
  }) async {
    final previous = state.availability;
    if (previous == null) return;

    emit(
      state.copyWith(
        availability: updated,
        savingTarget: savingTarget,
        savingDayId: null,
        errorMessage: '',
      ),
    );

    try {
      final result = await _updateListenerAvailabilityUsecase(
        availability: updated,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerAvailabilityBloc: update availability — $message',
          );
          emit(
            state.copyWith(
              availability: previous,
              savingTarget: null,
              errorMessage: message,
            ),
          );
        },
        (availability) {
          emit(
            state.copyWith(
              availability: availability,
              savingTarget: null,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerAvailabilityBloc: unexpected availability save error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          availability: previous,
          savingTarget: null,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  String _mapError(Object error) {
    if (error is MainAPIException) {
      return error.message.isNotEmpty
          ? error.message
          : VentingMobLocalizationsHolder.current.common_unknown_error;
    }
    return VentingMobLocalizationsHolder.current.common_unknown_error;
  }
}
