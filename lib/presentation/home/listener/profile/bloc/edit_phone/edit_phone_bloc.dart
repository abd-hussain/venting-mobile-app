import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/domain/data/app/listener_phone.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_phone_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'edit_phone_bloc.freezed.dart';
part 'edit_phone_event.dart';
part 'edit_phone_state.dart';

class EditPhoneBloc extends Bloc<EditPhoneEvent, EditPhoneState> {
  EditPhoneBloc(this._updateListenerPhoneUsecase)
    : super(const EditPhoneState()) {
    on<_SaveRequested>(_onSaveRequested);
  }

  final UpdateListenerPhoneUsecase _updateListenerPhoneUsecase;

  Future<void> _onSaveRequested(
    _SaveRequested event,
    Emitter<EditPhoneState> emit,
  ) async {
    if (state.isSaving) return;

    emit(const EditPhoneState(status: EditPhoneStatus.saving));

    try {
      final result = await _updateListenerPhoneUsecase(
        country: event.country,
        nationalNumber: event.nationalNumber,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'EditPhoneBloc: update phone failed — $message',
          );
          emit(
            EditPhoneState(
              status: EditPhoneStatus.failure,
              errorMessage: message,
            ),
          );
        },
        (phone) {
          emit(
            EditPhoneState(status: EditPhoneStatus.success, savedPhone: phone),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'EditPhoneBloc: unexpected update phone error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        EditPhoneState(
          status: EditPhoneStatus.failure,
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
