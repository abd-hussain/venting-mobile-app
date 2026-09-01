part of 'edit_phone_bloc.dart';

@freezed
sealed class EditPhoneEvent with _$EditPhoneEvent {
  const factory EditPhoneEvent.saveRequested({
    required IsoCode country,
    required String nationalNumber,
  }) = _SaveRequested;
}
