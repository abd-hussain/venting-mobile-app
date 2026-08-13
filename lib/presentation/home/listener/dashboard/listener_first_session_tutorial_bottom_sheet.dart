import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Opens the first-session tutorial info sheet (final onboarding step).
Future<bool?> openListenerFirstSessionTutorialBottomSheet({
  required BuildContext context,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const ListenerFirstSessionTutorialBottomSheet(),
  );
}

class ListenerFirstSessionTutorialBottomSheet extends StatelessWidget {
  const ListenerFirstSessionTutorialBottomSheet({super.key});

  static const _sheetFill = Color(0xFF1C1826);

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: bottomInset + 12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
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
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: SplashColors.purpleMid,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '10',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    l10n.listener_dashboard_setup_tutorial,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.fromLTRB(18, 20, 18, 16),
              decoration: BoxDecoration(
                color: _sheetFill,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: ListenerProfileTheme.cardBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: SplashColors.purpleMid.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: SplashColors.purpleMid.withValues(alpha: 0.45),
                      ),
                    ),
                    child: const Icon(
                      Icons.celebration_rounded,
                      color: ListenerProfileTheme.gold,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.listener_first_session_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.listener_first_session_body,
                    style: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _InfoBullet(
                    icon: Icons.schedule_rounded,
                    text: l10n.listener_first_session_bullet_call,
                  ),
                  const SizedBox(height: 10),
                  _InfoBullet(
                    icon: Icons.menu_book_rounded,
                    text: l10n.listener_first_session_bullet_guidelines,
                  ),
                  const SizedBox(height: 10),
                  _InfoBullet(
                    icon: Icons.phone_in_talk_rounded,
                    text: l10n.listener_first_session_bullet_available,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 54,
                    child: FilledButton(
                      onPressed: () => Navigator.of(context).pop(true),
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
                      child: Text(l10n.listener_first_session_cta),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBullet extends StatelessWidget {
  const _InfoBullet({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: const Color(0xFF15101F),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: SplashColors.purpleMid, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 13,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
