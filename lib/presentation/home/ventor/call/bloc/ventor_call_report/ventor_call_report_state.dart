part of 'ventor_call_report_bloc.dart';

enum VentorCallReportStatus { ready, submitting }

@freezed
sealed class VentorCallReportState with _$VentorCallReportState {
  const factory VentorCallReportState({
    @Default(VentorCallReportStatus.ready) VentorCallReportStatus status,
    VentorCallReportReason? selectedReason,
    @Default('') String details,
    @Default(false) bool submitSucceeded,
    @Default('') String errorMessage,
  }) = _VentorCallReportState;

  const VentorCallReportState._();

  bool get isSubmitting => status == VentorCallReportStatus.submitting;

  bool get isOther => selectedReason == VentorCallReportReason.other;

  bool get canSubmit {
    if (isSubmitting || selectedReason == null) return false;
    if (isOther && details.trim().isEmpty) return false;
    return true;
  }
}
