import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_invite_friends_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_models.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<void> showVentorEarnPointsBottomSheet({required BuildContext context}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const _VentorEarnPointsBottomSheet(),
  );
}

class _VentorEarnPointsBottomSheet extends StatelessWidget {
  const _VentorEarnPointsBottomSheet();

  static const _sheetFill = Color(0xFF1C1826);

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: bottomInset + 12),
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
        decoration: BoxDecoration(
          color: _sheetFill,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: VentorProfileTheme.cardBorder),
        ),
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
              l10n.ventor_rewards_earn_title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.ventor_rewards_earn_subtitle,
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            _EarnWayRow(
              number: '1',
              title: l10n.ventor_rewards_earn_sessions_title,
              body: l10n.ventor_rewards_earn_sessions_body(
                VentorRewardsCatalog.pointsPerSession,
              ),
              icon: Icons.forum_rounded,
            ),
            const SizedBox(height: 10),
            _EarnWayRow(
              number: '2',
              title: l10n.ventor_rewards_earn_booking_title,
              body: l10n.ventor_rewards_earn_booking_body(
                VentorRewardsCatalog.pointsPerFriendBooking,
              ),
              icon: Icons.phone_in_talk_rounded,
            ),
            const SizedBox(height: 10),
            _EarnWayRow(
              number: '3',
              title: l10n.ventor_rewards_earn_invite_title,
              body: l10n.ventor_rewards_earn_invite_body(
                VentorRewardsCatalog.pointsPerFriendRegister,
                VentorRewardsCatalog.pointsPerInviteFirstSession,
              ),
              icon: Icons.group_add_rounded,
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 52,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  openVentorInviteFriendsScreen(context: context);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: SplashColors.purpleMid,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: Text(l10n.ventor_rewards_earn_invite_cta),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EarnWayRow extends StatelessWidget {
  const _EarnWayRow({
    required this.number,
    required this.title,
    required this.body,
    required this.icon,
  });

  final String number;
  final String title;
  final String body;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF15101F),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: SplashColors.purpleMid,
              shape: BoxShape.circle,
            ),
            child: Text(
              number,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 16, color: SplashColors.purpleMid),
                    const SizedBox(width: 6),
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
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 13,
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
