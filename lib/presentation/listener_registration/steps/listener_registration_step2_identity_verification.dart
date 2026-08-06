import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Step 2 — Identity verification intro (ID, selfie, liveness).
class ListenerRegistrationStep2IdentityVerification extends StatelessWidget {
  const ListenerRegistrationStep2IdentityVerification({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  static const _cardFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.listener_reg_identity_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.listener_reg_identity_subtitle,
                    style: GoogleFonts.inter(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 28),
                  _VerificationInfoCard(
                    title: l10n.listener_reg_identity_upload_id_title,
                    subtitle: l10n.listener_reg_identity_upload_id_subtitle,
                    icon: Icons.badge_outlined,
                    cardFill: _cardFill,
                    muted: _muted,
                  ),
                  const SizedBox(height: 12),
                  _VerificationInfoCard(
                    title: l10n.listener_reg_identity_selfie_title,
                    subtitle: l10n.listener_reg_identity_selfie_subtitle,
                    icon: Icons.person_rounded,
                    cardFill: _cardFill,
                    muted: _muted,
                    circularIcon: true,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 54,
            child: FilledButton(
              onPressed: onContinue,
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
              child: Text(l10n.listener_reg_identity_start),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            l10n.listener_reg_identity_secure_note,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white.withValues(alpha: 0.55),
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _VerificationInfoCard extends StatelessWidget {
  const _VerificationInfoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.cardFill,
    required this.muted,
    this.circularIcon = false,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color cardFill;
  final Color muted;
  final bool circularIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardFill,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color: muted,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: SplashColors.purpleMid,
              borderRadius: BorderRadius.circular(circularIcon ? 24 : 14),
            ),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
        ],
      ),
    );
  }
}
