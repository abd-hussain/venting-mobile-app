part of 'listener_call_report_bloc.dart';

@freezed
sealed class ListenerCallReportEvent with _$ListenerCallReportEvent {
  const factory ListenerCallReportEvent.reasonSelected(
    ListenerCallReportReason reason,
  ) = _ReasonSelected;

  const factory ListenerCallReportEvent.submitRequested({
    required String sessionId,
  }) = _SubmitRequested;
}
