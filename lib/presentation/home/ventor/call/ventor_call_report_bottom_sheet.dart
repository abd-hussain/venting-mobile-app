import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

enum VentorCallReportReason {
  inappropriateBehavior,
  harassment,
  hateSpeech,
  safetyConcern,
  notListening,
  technicalIssue,
  other,
}

class VentorCallReportResult {
  const VentorCallReportResult({
    required this.reason,
    this.details,
  });

  final VentorCallReportReason reason;
  final String? details;
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

Future<VentorCallReportResult?> showVentorCallReportBottomSheet({
  required BuildContext context,
  required String listenerName,
}) {
  return showModalBottomSheet<VentorCallReportResult>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF16121F),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) =>
        _VentorCallReportBottomSheet(listenerName: listenerName),
  );
}

class _VentorCallReportBottomSheet extends StatefulWidget {
  const _VentorCallReportBottomSheet({required this.listenerName});

  final String listenerName;

  @override
  State<_VentorCallReportBottomSheet> createState() =>
      _VentorCallReportBottomSheetState();
}

class _VentorCallReportBottomSheetState
    extends State<_VentorCallReportBottomSheet> {
  VentorCallReportReason? _selected;
  final _otherController = TextEditingController();
  var _submitting = false;

  bool get _isOther => _selected == VentorCallReportReason.other;

  bool get _canSubmit {
    if (_selected == null || _submitting) return false;
    if (_isOther && _otherController.text.trim().isEmpty) return false;
    return true;
  }

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_canSubmit) return;
    setState(() => _submitting = true);

    // TODO: Submit listener report to API (include other details when set).
    await Future<void>.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;
    Navigator.of(context).pop(
      VentorCallReportResult(
        reason: _selected!,
        details: _isOther ? _otherController.text.trim() : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    final reasons = VentorCallReportReason.values;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          10,
          20,
          16 + bottomInset + keyboardInset,
        ),
        child: SingleChildScrollView(
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
                l10n.ventor_call_report_title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l10n.ventor_call_report_subtitle(widget.listenerName),
                style: GoogleFonts.inter(
                  color: VentorProfileTheme.muted,
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
                        : VentorProfileTheme.cardFill,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: isSelected
                            ? SplashColors.purpleMid
                            : VentorProfileTheme.cardBorder,
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
              if (_isOther) ...[
                const SizedBox(height: 4),
                TextField(
                  controller: _otherController,
                  enabled: !_submitting,
                  maxLines: 4,
                  maxLength: 300,
                  autofocus: true,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: l10n.ventor_call_report_other_hint,
                    hintStyle: GoogleFonts.inter(
                      color: VentorProfileTheme.muted,
                      fontSize: 13,
                    ),
                    filled: true,
                    fillColor: VentorProfileTheme.cardFill,
                    counterStyle: GoogleFonts.inter(
                      color: VentorProfileTheme.muted,
                      fontSize: 11,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: VentorProfileTheme.cardBorder,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: VentorProfileTheme.cardBorder,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: SplashColors.purpleMid,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ] else
                const SizedBox(height: 12),
              SizedBox(
                height: 48,
                child: FilledButton(
                  onPressed: _canSubmit ? _submit : null,
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
                    l10n.ventor_call_report_submit,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed:
                    _submitting ? null : () => Navigator.of(context).pop(),
                child: Text(
                  l10n.ventor_call_report_cancel,
                  style: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
