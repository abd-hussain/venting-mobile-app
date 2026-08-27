part of 'change_password_bloc.dart';

enum ChangePasswordStatus { idle, submitting, success, failure }

@freezed
sealed class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(ChangePasswordStatus.idle) ChangePasswordStatus status,
    @Default('') String errorMessage,
  }) = _ChangePasswordState;

  const ChangePasswordState._();

  bool get isSubmitting => status == ChangePasswordStatus.submitting;
  bool get isSuccess => status == ChangePasswordStatus.success;
  bool get isFailure => status == ChangePasswordStatus.failure;
}
