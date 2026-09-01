import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

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

Future<ListenerCallReportReason?> showListenerCallReportBottomSheet({
  required BuildContext context,
}) {
  return showModalBottomSheet<ListenerCallReportReason>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF16121F),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const _ListenerCallReportBottomSheet(),
  );
}

class _ListenerCallReportBottomSheet extends StatefulWidget {
  const _ListenerCallReportBottomSheet();

  @override
  State<_ListenerCallReportBottomSheet> createState() =>
      _ListenerCallReportBottomSheetState();
}

class _ListenerCallReportBottomSheetState
    extends State<_ListenerCallReportBottomSheet> {
  ListenerCallReportReason? _selected;
  bool _submitting = false;

  Future<void> _submit() async {
    if (_selected == null || _submitting) return;
    setState(() => _submitting = true);

    // TODO: Submit session report to API.
    await Future<void>.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;
    Navigator.of(context).pop(_selected);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final reasons = ListenerCallReportReason.values;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 16 + bottomInset),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.listener_call_report_title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.listener_call_report_subtitle,
              style: GoogleFonts.inter(
                color: ListenerProfileTheme.muted,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            ...reasons.map((reason) {
              final isSelected = _selected == reason;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Material(
                  color: isSelected
                      ? SplashColors.purpleMid.withValues(alpha: 0.18)
                      : ListenerProfileTheme.cardFill,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: isSelected
                          ? SplashColors.purpleMid
                          : ListenerProfileTheme.cardBorder,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: _submitting
                        ? null
                        : () => setState(() => _selected = reason),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              reason.label(l10n),
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                          if (isSelected)
                            const Icon(
                              Icons.check_circle_rounded,
                              color: SplashColors.purpleMid,
                              size: 20,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 12),
            SizedBox(
              height: 48,
              child: FilledButton(
                onPressed: _selected != null && !_submitting ? _submit : null,
                style: FilledButton.styleFrom(
                  backgroundColor: SplashColors.purpleMid,
                  disabledBackgroundColor: SplashColors.purpleMid.withValues(
                    alpha: 0.35,
                  ),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  l10n.listener_call_report_submit,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: _submitting ? null : () => Navigator.of(context).pop(),
              child: Text(
                l10n.listener_call_report_cancel,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
