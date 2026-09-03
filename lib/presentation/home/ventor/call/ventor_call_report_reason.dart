import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

enum VentorCallReportReason {
  inappropriateBehavior,
  harassment,
  hateSpeech,
  safetyConcern,
  notListening,
  technicalIssue,
  other,
}

extension VentorCallReportReasonL10n on VentorCallReportReason {
  String label(VentingMobLocalizations l10n) {
    return switch (this) {
      VentorCallReportReason.inappropriateBehavior =>
        l10n.ventor_call_report_reason_inappropriate,
      VentorCallReportReason.harassment =>
        l10n.ventor_call_report_reason_harassment,
      VentorCallReportReason.hateSpeech =>
        l10n.ventor_call_report_reason_hate_speech,
      VentorCallReportReason.safetyConcern =>
        l10n.ventor_call_report_reason_safety,
      VentorCallReportReason.notListening =>
        l10n.ventor_call_report_reason_not_listening,
      VentorCallReportReason.technicalIssue =>
        l10n.ventor_call_report_reason_technical,
      VentorCallReportReason.other => l10n.ventor_call_report_reason_other,
    };
  }
}

String ventorCallReportReasonToApi(VentorCallReportReason reason) {
  return switch (reason) {
    VentorCallReportReason.inappropriateBehavior => 'inappropriate_behavior',
    VentorCallReportReason.harassment => 'harassment',
    VentorCallReportReason.hateSpeech => 'hate_speech',
    VentorCallReportReason.safetyConcern => 'safety_concern',
    VentorCallReportReason.notListening => 'not_listening',
    VentorCallReportReason.technicalIssue => 'technical_issue',
    VentorCallReportReason.other => 'other',
  };
}
