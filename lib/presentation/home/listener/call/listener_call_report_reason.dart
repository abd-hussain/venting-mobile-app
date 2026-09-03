import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

enum ListenerCallReportReason {
  inappropriateBehavior,
  harassment,
  hateSpeech,
  safetyConcern,
  technicalIssue,
  other,
}

extension ListenerCallReportReasonL10n on ListenerCallReportReason {
  String label(VentingMobLocalizations l10n) {
    switch (this) {
      case ListenerCallReportReason.inappropriateBehavior:
        return l10n.listener_call_report_reason_inappropriate;
      case ListenerCallReportReason.harassment:
        return l10n.listener_call_report_reason_harassment;
      case ListenerCallReportReason.hateSpeech:
        return l10n.listener_call_report_reason_hate_speech;
      case ListenerCallReportReason.safetyConcern:
        return l10n.listener_call_report_reason_safety;
      case ListenerCallReportReason.technicalIssue:
        return l10n.listener_call_report_reason_technical;
      case ListenerCallReportReason.other:
        return l10n.listener_call_report_reason_other;
    }
  }
}

String listenerCallReportReasonToApi(ListenerCallReportReason reason) {
  return switch (reason) {
    ListenerCallReportReason.inappropriateBehavior => 'inappropriate_behavior',
    ListenerCallReportReason.harassment => 'harassment',
    ListenerCallReportReason.hateSpeech => 'hate_speech',
    ListenerCallReportReason.safetyConcern => 'safety_concern',
    ListenerCallReportReason.technicalIssue => 'technical_issue',
    ListenerCallReportReason.other => 'other',
  };
}
