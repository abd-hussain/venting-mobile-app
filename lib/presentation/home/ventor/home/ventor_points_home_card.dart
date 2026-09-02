import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_buy_points_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_points_scope.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_widgets.dart';
import 'package:venting_mobile_app/presentation/home/ventor/ventor_home_shell.dart';

class VentorPointsHomeCard extends StatelessWidget {
  const VentorPointsHomeCard({super.key, this.isLoading = false});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final points = VentorPointsScope.of(context).points;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            VentorProfileTheme.gold.withValues(alpha: 0.18),
            const Color(0xFF1A1328),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: VentorProfileTheme.gold.withValues(alpha: 0.35),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: VentorProfileTheme.gold.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.monetization_on_rounded,
                  color: VentorProfileTheme.gold,
                  size: 26,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.ventor_points_home_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (isLoading)
                      Shimmer.fromColors(
                        baseColor: Colors.white.withValues(alpha: 0.08),
                        highlightColor: Colors.white.withValues(alpha: 0.18),
                        child: Container(
                          width: 72,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      )
                    else
                      Text(
                        l10n.ventor_rewards_pts(formatVentorPoints(points)),
                        style: GoogleFonts.inter(
                          color: VentorProfileTheme.gold,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            l10n.ventor_points_home_body,
            style: GoogleFonts.inter(
              color: Colors.white.withValues(alpha: 0.88),
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 42,
                  child: FilledButton(
                    onPressed: () =>
                        showVentorBuyPointsBottomSheet(context: context),
                    style: FilledButton.styleFrom(
                      backgroundColor: VentorProfileTheme.gold,
                      foregroundColor: const Color(0xFF1A1328),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      l10n.ventor_points_home_buy_cta,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 42,
                  child: OutlinedButton(
                    onPressed: () => VentorHomeShell.goToTab(
                      context,
                      VentorHomeShell.rewardsTab,
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(
                        color: Colors.white.withValues(alpha: 0.18),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      l10n.ventor_points_home_redeem_cta,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
