part of 'edit_phone_bloc.dart';

enum EditPhoneStatus { idle, saving, success, failure }

@freezed
sealed class EditPhoneState with _$EditPhoneState {
  const factory EditPhoneState({
    @Default(EditPhoneStatus.idle) EditPhoneStatus status,
    @Default('') String errorMessage,
    ListenerPhone? savedPhone,
  }) = _EditPhoneState;

  const EditPhoneState._();

  bool get isSaving => status == EditPhoneStatus.saving;
  bool get isSuccess => status == EditPhoneStatus.success;
  bool get isFailure => status == EditPhoneStatus.failure;
}
