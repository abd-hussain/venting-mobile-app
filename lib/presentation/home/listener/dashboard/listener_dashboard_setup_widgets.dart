import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/domain/data/app/listener_dashboard_setup.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerDashboardSetupSection extends StatelessWidget {
  const ListenerDashboardSetupSection({
    super.key,
    required this.progress,
    required this.l10n,
    required this.onContinueSetup,
    required this.onStepTap,
    this.isLoading = false,
    this.loadFailure = false,
    this.errorMessage,
    this.onRetry,
  });

  final ListenerDashboardSetupProgress? progress;
  final VentingMobLocalizations l10n;
  final VoidCallback onContinueSetup;
  final ValueChanged<ListenerDashboardSetupStepId> onStepTap;
  final bool isLoading;
  final bool loadFailure;
  final String? errorMessage;
  final VoidCallback? onRetry;

  String _stepLabel(ListenerDashboardSetupStepId id) {
    return switch (id) {
      ListenerDashboardSetupStepId.createAccount =>
        l10n.listener_dashboard_setup_account,
      ListenerDashboardSetupStepId.identityVerification =>
        l10n.listener_dashboard_setup_identity,
      ListenerDashboardSetupStepId.aboutYou =>
        l10n.listener_dashboard_setup_about,
      ListenerDashboardSetupStepId.experience =>
        l10n.listener_dashboard_setup_experience,
      ListenerDashboardSetupStepId.expertise =>
        l10n.listener_dashboard_setup_comfort_areas,
      ListenerDashboardSetupStepId.boundaries =>
        l10n.listener_dashboard_setup_boundaries,
      ListenerDashboardSetupStepId.voiceIntro =>
        l10n.listener_dashboard_setup_voice_intro,
      ListenerDashboardSetupStepId.availability =>
        l10n.listener_dashboard_setup_availability,
      ListenerDashboardSetupStepId.notifications =>
        l10n.listener_dashboard_setup_notifications,
      ListenerDashboardSetupStepId.training =>
        l10n.listener_dashboard_setup_training,
      ListenerDashboardSetupStepId.bookFirstSession =>
        l10n.listener_dashboard_setup_book_first_session,
    };
  }

  String _statusLabel(
    ListenerDashboardSetupStepId stepId,
    ListenerDashboardSetupStepStatus status,
    ListenerDashboardSetupProgress? progress,
  ) {
    if (progress != null &&
        progress.stepNeedsRefill(stepId) &&
        status == ListenerDashboardSetupStepStatus.pending) {
      return l10n.listener_dashboard_setup_needs_refill;
    }

    return switch (status) {
      ListenerDashboardSetupStepStatus.done =>
        l10n.listener_dashboard_setup_done,
      ListenerDashboardSetupStepStatus.inProgress =>
        l10n.listener_dashboard_setup_in_progress,
      ListenerDashboardSetupStepStatus.pending =>
        l10n.listener_dashboard_setup_pending,
      ListenerDashboardSetupStepStatus.locked =>
        l10n.listener_dashboard_setup_locked,
    };
  }

  String get _continueLabel {
    final next = progress?.firstActionableStep;
    if (next == ListenerDashboardSetupStepId.training) {
      return l10n.listener_training_continue_learning;
    }
    if (next == ListenerDashboardSetupStepId.bookFirstSession) {
      return l10n.listener_dashboard_setup_book_first_session_cta;
    }
    return l10n.listener_dashboard_setup_continue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A1848), Color(0xFF14101C)],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.listener_dashboard_setup_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.listener_dashboard_setup_subtitle,
                      style: GoogleFonts.inter(
                        color: ListenerProfileTheme.muted,
                        fontSize: 13,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              if (isLoading)
                const SizedBox(
                  width: 56,
                  height: 56,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              else
                _SetupProgressRing(percent: progress?.progressPercent ?? 0),
            ],
          ),
          const SizedBox(height: 18),
          if (loadFailure) ...[
            Text(
              errorMessage?.isNotEmpty == true
                  ? errorMessage!
                  : l10n.common_unknown_error,
              style: GoogleFonts.inter(
                color: ListenerProfileTheme.muted,
                fontSize: 13,
                height: 1.4,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: onRetry,
                child: Text(l10n.common_retry),
              ),
            ],
          ] else if (progress != null) ...[
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 360),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (final step in progress!.steps)
                      _SetupStepRow(
                        label: _stepLabel(step.id),
                        status: step.status,
                        statusLabel: _statusLabel(
                          step.id,
                          step.status,
                          progress,
                        ),
                        onTap: step.isTappable
                            ? () => onStepTap(step.id)
                            : null,
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            FilledButton(
              onPressed:
                  isLoading ||
                      progress!.isComplete ||
                      progress!.firstActionableStep == null
                  ? null
                  : onContinueSetup,
              style: FilledButton.styleFrom(
                backgroundColor: SplashColors.purpleMid,
                foregroundColor: Colors.white,
                disabledBackgroundColor: SplashColors.purpleMid.withValues(
                  alpha: 0.35,
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _continueLabel,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.chevron_right_rounded, size: 20),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SetupProgressRing extends StatelessWidget {
  const _SetupProgressRing({required this.percent});

  final int percent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: CustomPaint(
        painter: _ProgressRingPainter(
          progress: percent / 100,
          trackColor: Colors.white.withValues(alpha: 0.12),
          progressColor: SplashColors.purpleMid,
        ),
        child: Center(
          child: Text(
            '$percent%',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _ProgressRingPainter extends CustomPainter {
  _ProgressRingPainter({
    required this.progress,
    required this.trackColor,
    required this.progressColor,
  });

  final double progress;
  final Color trackColor;
  final Color progressColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;
    const stroke = 4.0;

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = trackColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress.clamp(0.0, 1.0),
      false,
      Paint()
        ..color = progressColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _ProgressRingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _SetupStepRow extends StatelessWidget {
  const _SetupStepRow({
    required this.label,
    required this.status,
    required this.statusLabel,
    this.onTap,
  });

  final String label;
  final ListenerDashboardSetupStepStatus status;
  final String statusLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final statusColor = switch (status) {
      ListenerDashboardSetupStepStatus.done => ListenerProfileTheme.success,
      ListenerDashboardSetupStepStatus.inProgress => SplashColors.purpleMid,
      ListenerDashboardSetupStepStatus.pending => ListenerProfileTheme.gold,
      ListenerDashboardSetupStepStatus.locked => ListenerProfileTheme.muted,
    };

    final content = Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          _StepIcon(status: status),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: status == ListenerDashboardSetupStepStatus.locked
                    ? ListenerProfileTheme.muted
                    : Colors.white,
                fontSize: 14,
                fontWeight:
                    status == ListenerDashboardSetupStepStatus.inProgress
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              statusLabel,
              style: GoogleFonts.inter(
                color: statusColor,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (onTap != null) ...[
            const SizedBox(width: 4),
            Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: statusColor.withValues(alpha: 0.9),
            ),
          ],
        ],
      ),
    );

    if (onTap == null) return content;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: content,
      ),
    );
  }
}

class _StepIcon extends StatelessWidget {
  const _StepIcon({required this.status});

  final ListenerDashboardSetupStepStatus status;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      ListenerDashboardSetupStepStatus.done => const Icon(
        Icons.check_circle_rounded,
        size: 20,
        color: ListenerProfileTheme.success,
      ),
      ListenerDashboardSetupStepStatus.inProgress => Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: SplashColors.purpleMid, width: 2),
        ),
      ),
      ListenerDashboardSetupStepStatus.pending => Icon(
        Icons.radio_button_unchecked_rounded,
        size: 20,
        color: ListenerProfileTheme.gold.withValues(alpha: 0.85),
      ),
      ListenerDashboardSetupStepStatus.locked => const Icon(
        Icons.lock_outline_rounded,
        size: 18,
        color: ListenerProfileTheme.muted,
      ),
    };
  }
}

class ListenerDashboardProfileStatusCard extends StatelessWidget {
  const ListenerDashboardProfileStatusCard({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    required this.accentColor,
  });

  final String title;
  final String message;
  final IconData icon;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accentColor.withValues(alpha: 0.45)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: accentColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: accentColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: GoogleFonts.inter(
                    color: ListenerProfileTheme.muted,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListenerDashboardProfileApprovedCard extends StatelessWidget {
  const ListenerDashboardProfileApprovedCard({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ListenerDashboardProfileStatusCard(
      title: title,
      message: message,
      icon: Icons.verified_user_outlined,
      accentColor: ListenerProfileTheme.success,
    );
  }
}

class ListenerDashboardProfileUnderReviewCard extends StatelessWidget {
  const ListenerDashboardProfileUnderReviewCard({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ListenerDashboardProfileStatusCard(
      title: title,
      message: message,
      icon: Icons.hourglass_top_rounded,
      accentColor: SplashColors.purpleMid,
    );
  }
}

class ListenerDashboardProfileRejectedCard extends StatelessWidget {
  const ListenerDashboardProfileRejectedCard({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ListenerDashboardProfileStatusCard(
      title: title,
      message: message,
      icon: Icons.error_outline_rounded,
      accentColor: const Color(0xFFE57373),
    );
  }
}

class ListenerDashboardLockedFeatureCard extends StatelessWidget {
  const ListenerDashboardLockedFeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailingLockedLabel,
    this.value,
    this.footnote,
    this.showInfoIcon = false,
  });

  final String title;
  final String subtitle;
  final String? trailingLockedLabel;
  final String? value;
  final String? footnote;
  final bool showInfoIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.lock_outline_rounded,
                  size: 18,
                  color: ListenerProfileTheme.muted,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if (showInfoIcon)
                          const Icon(
                            Icons.info_outline_rounded,
                            size: 16,
                            color: ListenerProfileTheme.muted,
                          ),
                      ],
                    ),
                    if (value != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        value!,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                    ],
                    if (subtitle.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.inter(
                          color: ListenerProfileTheme.muted,
                          fontSize: 12,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailingLockedLabel != null) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    trailingLockedLabel!,
                    style: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
          if (footnote != null) ...[
            const SizedBox(height: 10),
            Text(
              footnote!,
              style: GoogleFonts.inter(
                color: ListenerProfileTheme.muted,
                fontSize: 11,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class ListenerDashboardEmptyRequestsCard extends StatelessWidget {
  const ListenerDashboardEmptyRequestsCard({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_month_outlined,
            size: 20,
            color: ListenerProfileTheme.muted,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.inter(
                color: ListenerProfileTheme.muted,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListenerDashboardHelpfulTipCard extends StatelessWidget {
  const ListenerDashboardHelpfulTipCard({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SplashColors.purpleMid.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: SplashColors.purpleMid.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.auto_awesome,
            size: 18,
            color: SplashColors.purpleMid,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: SplashColors.purpleMid,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: GoogleFonts.inter(
                    color: ListenerProfileTheme.muted,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListenerDashboardTitleHeader extends StatelessWidget {
  const ListenerDashboardTitleHeader({
    super.key,
    required this.title,
    required this.hasNotifications,
    required this.onNotifications,
  });

  final String title;
  final bool hasNotifications;
  final VoidCallback onNotifications;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        IconButton(
          onPressed: onNotifications,
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withValues(alpha: 0.06),
            fixedSize: const Size(44, 44),
          ),
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
                size: 22,
              ),
              if (hasNotifications)
                Positioned(
                  right: -1,
                  top: -1,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEF4444),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
