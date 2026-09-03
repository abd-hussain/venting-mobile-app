import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/bloc/ventor_call_report/ventor_call_report_bloc.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_report_reason.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

export 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_report_reason.dart';

class VentorCallReportResult {
  const VentorCallReportResult({required this.reason, this.details});

  final VentorCallReportReason reason;
  final String? details;
}

Future<VentorCallReportResult?> showVentorCallReportBottomSheet({
  required BuildContext context,
  required String sessionId,
  required String listenerName,
}) {
  return showModalBottomSheet<VentorCallReportResult>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF16121F),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => BlocProvider(
      create: (_) => diContainer<VentorCallReportBloc>(),
      child: _VentorCallReportBottomSheet(
        sessionId: sessionId,
        listenerName: listenerName,
      ),
    ),
  );
}

class _VentorCallReportBottomSheet extends StatelessWidget {
  const _VentorCallReportBottomSheet({
    required this.sessionId,
    required this.listenerName,
  });

  final String sessionId;
  final String listenerName;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    final reasons = VentorCallReportReason.values;

    return SafeArea(
      top: false,
      child: BlocConsumer<VentorCallReportBloc, VentorCallReportState>(
        listenWhen: (previous, current) =>
            previous.submitSucceeded != current.submitSucceeded ||
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              ),
            );
            return;
          }
          if (state.submitSucceeded && state.selectedReason != null) {
            Navigator.of(context).pop(
              VentorCallReportResult(
                reason: state.selectedReason!,
                details: state.isOther ? state.details.trim() : null,
              ),
            );
          }
        },
        builder: (context, state) {
          final bloc = context.read<VentorCallReportBloc>();

          return Padding(
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
                    l10n.ventor_call_report_subtitle(listenerName),
                    style: GoogleFonts.inter(
                      color: VentorProfileTheme.muted,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...reasons.map((reason) {
                    final isSelected = state.selectedReason == reason;
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
                          onTap: state.isSubmitting
                              ? null
                              : () => bloc.add(
                                  VentorCallReportEvent.reasonSelected(reason),
                                ),
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
                  if (state.isOther) ...[
                    const SizedBox(height: 4),
                    TextField(
                      enabled: !state.isSubmitting,
                      maxLines: 4,
                      maxLength: 300,
                      autofocus: true,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      onChanged: (value) =>
                          bloc.add(VentorCallReportEvent.detailsChanged(value)),
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
                      onPressed: state.canSubmit
                          ? () => bloc.add(
                              VentorCallReportEvent.submitRequested(
                                sessionId: sessionId,
                              ),
                            )
                          : null,
                      style: FilledButton.styleFrom(
                        backgroundColor: SplashColors.purpleMid,
                        disabledBackgroundColor: SplashColors.purpleMid
                            .withValues(alpha: 0.35),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: state.isSubmitting
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              l10n.ventor_call_report_submit,
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ),
                  ),
                  TextButton(
                    onPressed: state.isSubmitting
                        ? null
                        : () => Navigator.of(context).pop(),
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
          );
        },
      ),
    );
  }
}
