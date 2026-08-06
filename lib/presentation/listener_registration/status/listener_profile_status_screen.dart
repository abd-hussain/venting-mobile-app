import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/listener_registration/status/listener_profile_status.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

/// Post-submit listener profile status: under review, approved, or rejected.
class ListenerProfileStatusScreen extends StatelessWidget {
  const ListenerProfileStatusScreen({
    super.key,
    required this.status,
    this.rejectionReasons = const [],
    this.editStepLabel,
  });

  final ListenerProfileStatus status;
  final List<String> rejectionReasons;
  final String? editStepLabel;

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const _cardFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);
  static const _success = Color(0xFF22C55E);
  static const _danger = Color(0xFFE11D48);
  static const _dangerSoft = Color(0xFFFF6B6B);

  void _goDashboard(BuildContext context) {
    context.go(AppRoutes.tabHome);
  }

  void _onPrimary(BuildContext context) {
    switch (status) {
      case ListenerProfileStatus.underReview:
        _goDashboard(context);
      case ListenerProfileStatus.approved:
        _goDashboard(context);
      case ListenerProfileStatus.rejected:
        context.go(AppRoutes.listenerRegistration);
    }
  }

  List<String> _reasons(VentingMobLocalizations l10n) {
    if (rejectionReasons.isNotEmpty) return rejectionReasons;
    return [
      l10n.listener_profile_reject_reason_voice,
      l10n.listener_profile_reject_reason_experience,
      l10n.listener_profile_reject_reason_id,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    final title = switch (status) {
      ListenerProfileStatus.underReview =>
        l10n.listener_profile_under_review_title,
      ListenerProfileStatus.approved => l10n.listener_profile_approved_title,
      ListenerProfileStatus.rejected => l10n.listener_profile_rejected_title,
    };

    final subtitle = switch (status) {
      ListenerProfileStatus.underReview =>
        l10n.listener_profile_under_review_subtitle,
      ListenerProfileStatus.approved => l10n.listener_profile_approved_subtitle,
      ListenerProfileStatus.rejected => l10n.listener_profile_rejected_subtitle,
    };

    final primaryLabel = switch (status) {
      ListenerProfileStatus.underReview => l10n.listener_profile_got_it,
      ListenerProfileStatus.approved => l10n.listener_reg_continue,
      ListenerProfileStatus.rejected => l10n.listener_profile_review_edit,
    };

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundTop,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                SplashColors.backgroundTop,
                SplashColors.backgroundBottom,
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: IconButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        _goDashboard(context);
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        _StatusIllustration(status: status),
                        const SizedBox(height: 28),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Colors.white.withValues(alpha: 0.65),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.45,
                          ),
                        ),
                        if (status == ListenerProfileStatus.underReview) ...[
                          const SizedBox(height: 28),
                          _ReviewTimeCard(
                            title: l10n.listener_profile_review_time_title,
                            body: l10n.listener_profile_review_time_body,
                          ),
                        ],
                        if (status == ListenerProfileStatus.rejected) ...[
                          const SizedBox(height: 24),
                          _ReasonsCard(
                            title: l10n.listener_profile_reasons_title,
                            reasons: _reasons(l10n),
                          ),
                          const SizedBox(height: 22),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              l10n.listener_profile_what_you_can_do,
                              style: GoogleFonts.inter(
                                color: _dangerSoft,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.listener_profile_what_you_can_do_body,
                            style: GoogleFonts.inter(
                              color: Colors.white.withValues(alpha: 0.65),
                              fontSize: 14,
                              height: 1.45,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                  child: SizedBox(
                    height: 54,
                    child: FilledButton(
                      onPressed: () => _onPrimary(context),
                      style: FilledButton.styleFrom(
                        backgroundColor: SplashColors.purpleMid,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: Text(primaryLabel),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _goDashboard(context),
                  child: Text(
                    l10n.listener_profile_go_to_dashboard,
                    style: GoogleFonts.inter(
                      color: SplashColors.purpleMid,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (status == ListenerProfileStatus.rejected) ...[
                  const SizedBox(height: 8),
                  _RejectedStepHint(
                    hint: l10n.listener_profile_edit_step_hint(
                      editStepLabel ?? l10n.listener_reg_step_experience,
                    ),
                  ),
                  const SizedBox(height: 12),
                ] else
                  const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ReviewTimeCard extends StatelessWidget {
  const _ReviewTimeCard({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ListenerProfileStatusScreen._cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: SplashColors.purpleMid.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calendar_today_rounded,
              color: SplashColors.purpleMid,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  body,
                  style: GoogleFonts.inter(
                    color: SplashColors.purpleMid,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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

class _ReasonsCard extends StatelessWidget {
  const _ReasonsCard({required this.title, required this.reasons});

  final String title;
  final List<String> reasons;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: ListenerProfileStatusScreen._cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ListenerProfileStatusScreen._danger.withValues(alpha: 0.45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.error_outline_rounded,
                color: ListenerProfileStatusScreen._dangerSoft,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.inter(
                  color: ListenerProfileStatusScreen._dangerSoft,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final reason in reasons) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    reason,
                    style: GoogleFonts.inter(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            if (reason != reasons.last) const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _RejectedStepHint extends StatelessWidget {
  const _RejectedStepHint({required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    final steps = [
      (Icons.check_rounded, true, false),
      (Icons.check_rounded, true, false),
      (Icons.check_rounded, true, false),
      (Icons.edit_document, false, true),
      (Icons.school_outlined, false, false),
      (Icons.fact_check_outlined, false, false),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < steps.length; i++) ...[
                _StepDot(
                  icon: steps[i].$1,
                  done: steps[i].$2,
                  highlighted: steps[i].$3,
                ),
                if (i != steps.length - 1)
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      color: steps[i].$2
                          ? ListenerProfileStatusScreen._success.withValues(
                              alpha: 0.55,
                            )
                          : Colors.white.withValues(alpha: 0.12),
                    ),
                  ),
              ],
            ],
          ),
          const SizedBox(height: 10),
          Text(
            hint,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: ListenerProfileStatusScreen._muted,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  const _StepDot({
    required this.icon,
    required this.done,
    required this.highlighted,
  });

  final IconData icon;
  final bool done;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final color = highlighted
        ? ListenerProfileStatusScreen._danger
        : done
        ? ListenerProfileStatusScreen._success
        : const Color(0xFF3A3348);

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color.withValues(alpha: highlighted || done ? 1 : 0.9),
        borderRadius: BorderRadius.circular(highlighted ? 8 : 999),
      ),
      child: Icon(icon, size: 15, color: Colors.white),
    );
  }
}

class _StatusIllustration extends StatelessWidget {
  const _StatusIllustration({required this.status});

  final ListenerProfileStatus status;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      ListenerProfileStatus.underReview => const _UnderReviewArt(),
      ListenerProfileStatus.approved => const _ApprovedArt(),
      ListenerProfileStatus.rejected => const _RejectedArt(),
    };
  }
}

class _UnderReviewArt extends StatelessWidget {
  const _UnderReviewArt();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: SplashColors.purpleMid.withValues(alpha: 0.12),
            ),
          ),
          Positioned(
            left: 28,
            child: Container(
              width: 110,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF8B5CF6), SplashColors.purpleMid],
                ),
                boxShadow: [
                  BoxShadow(
                    color: SplashColors.purpleMid.withValues(alpha: 0.35),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  Container(
                    width: 46,
                    height: 46,
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: 58,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 42,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 18,
            bottom: 34,
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1A1228),
                border: Border.all(color: SplashColors.purpleMid, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: SplashColors.purpleMid.withValues(alpha: 0.4),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: const Icon(
                Icons.search_rounded,
                color: SplashColors.purpleMid,
                size: 36,
              ),
            ),
          ),
          Positioned(
            right: 36,
            top: 28,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: SplashColors.purpleDeep,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white24),
              ),
              child: const Icon(
                Icons.schedule_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ApprovedArt extends StatelessWidget {
  const _ApprovedArt();

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ListenerProfileStatusScreen._success.withValues(
                    alpha: 0.12,
                  ),
                ),
              ),
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ListenerProfileStatusScreen._success,
                  boxShadow: [
                    BoxShadow(
                      color: ListenerProfileStatusScreen._success.withValues(
                        alpha: 0.45,
                      ),
                      blurRadius: 28,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.verified_user_rounded,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: ListenerProfileStatusScreen._success,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            l10n.listener_profile_approved_badge,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _RejectedArt extends StatelessWidget {
  const _RejectedArt();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 118,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFEF4444), Color(0xFFB91C1C)],
              ),
              boxShadow: [
                BoxShadow(
                  color: ListenerProfileStatusScreen._danger.withValues(
                    alpha: 0.35,
                  ),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 22),
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  width: 54,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 18,
            bottom: 18,
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ListenerProfileStatusScreen._danger,
                border: Border.all(color: const Color(0xFF1A1228), width: 4),
                boxShadow: [
                  BoxShadow(
                    color: ListenerProfileStatusScreen._danger.withValues(
                      alpha: 0.45,
                    ),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: const Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
