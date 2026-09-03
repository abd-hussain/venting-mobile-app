part of 'listener_call_report_bloc.dart';

enum ListenerCallReportStatus { ready, submitting }

@freezed
sealed class ListenerCallReportState with _$ListenerCallReportState {
  const factory ListenerCallReportState({
    @Default(ListenerCallReportStatus.ready) ListenerCallReportStatus status,
    ListenerCallReportReason? selectedReason,
    @Default(false) bool submitSucceeded,
    @Default('') String errorMessage,
  }) = _ListenerCallReportState;

  const ListenerCallReportState._();

  bool get isSubmitting => status == ListenerCallReportStatus.submitting;

  bool get canSubmit => !isSubmitting && selectedReason != null;
}
