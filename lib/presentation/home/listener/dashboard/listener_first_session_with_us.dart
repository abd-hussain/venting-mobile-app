import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Opens the first-session-with-us info sheet.
Future<void> openListenerFirstSessionWithUsBottomSheet({
  required BuildContext context,
  VoidCallback? onEditAvailability,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) =>
        ListenerFirstSessionWithUsSheet(onEditAvailability: onEditAvailability),
  );
}

class ListenerFirstSessionWithUsCard extends StatelessWidget {
  const ListenerFirstSessionWithUsCard({super.key, this.onEditAvailability});

  final VoidCallback? onEditAvailability;

  @override
  Widget build(BuildContext context) {
    return ListenerFirstSessionWithUsSheet(
      onEditAvailability: onEditAvailability,
      embedded: true,
    );
  }
}

class ListenerFirstSessionWithUsSheet extends StatelessWidget {
  const ListenerFirstSessionWithUsSheet({
    super.key,
    this.onEditAvailability,
    this.embedded = false,
  });

  final VoidCallback? onEditAvailability;
  final bool embedded;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = embedded ? 0.0 : MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: embedded ? 0 : 16,
        right: embedded ? 0 : 16,
        bottom: embedded ? 0 : bottomInset + 12,
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF2A1848), Color(0xFF14101C)],
            ),
            borderRadius: BorderRadius.circular(embedded ? 18 : 22),
            border: Border.all(color: ListenerProfileTheme.cardBorder),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!embedded)
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
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
                      '11',
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
                      l10n.listener_dashboard_setup_book_first_session,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: embedded ? 17 : 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                  Icons.phone_in_talk_rounded,
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
                icon: Icons.psychology_alt_rounded,
                text: l10n.listener_first_session_bullet_guidelines,
              ),
              const SizedBox(height: 10),
              _InfoBullet(
                icon: Icons.verified_rounded,
                text: l10n.listener_first_session_bullet_available,
              ),
              if (onEditAvailability != null) ...[
                const SizedBox(height: 20),
                TextButton(
                  onPressed: onEditAvailability,
                  child: Text(
                    l10n.listener_dashboard_setup_book_first_session_availability,
                  ),
                ),
              ],
            ],
          ),
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
