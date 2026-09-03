part of 'ventor_call_report_bloc.dart';

@freezed
sealed class VentorCallReportEvent with _$VentorCallReportEvent {
  const factory VentorCallReportEvent.reasonSelected(
    VentorCallReportReason reason,
  ) = _ReasonSelected;

  const factory VentorCallReportEvent.detailsChanged(String details) =
      _DetailsChanged;

  const factory VentorCallReportEvent.submitRequested({
    required String sessionId,
  }) = _SubmitRequested;
}
