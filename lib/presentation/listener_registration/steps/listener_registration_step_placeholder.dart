import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_step.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Temporary body for steps 2–12 until each screen is designed.
class ListenerRegistrationStepPlaceholder extends StatelessWidget {
  const ListenerRegistrationStepPlaceholder({
    super.key,
    required this.step,
    required this.onContinue,
  });

  final ListenerRegistrationStep step;
  final VoidCallback onContinue;

  String _title(VentingMobLocalizations l10n) {
    return switch (step) {
      ListenerRegistrationStep.createAccount =>
        l10n.listener_reg_step_create_account,
      ListenerRegistrationStep.verifyEmail =>
        l10n.listener_reg_step_verify_email,
      ListenerRegistrationStep.profilePhoto =>
        l10n.listener_reg_step_profile_photo,
      ListenerRegistrationStep.aboutYou => l10n.listener_reg_step_about_you,
      ListenerRegistrationStep.languages => l10n.listener_reg_step_languages,
      ListenerRegistrationStep.expertise => l10n.listener_reg_step_expertise,
      ListenerRegistrationStep.voiceIntro => l10n.listener_reg_step_voice_intro,
      ListenerRegistrationStep.availability =>
        l10n.listener_reg_step_availability,
      ListenerRegistrationStep.experience => l10n.listener_reg_step_experience,
      ListenerRegistrationStep.guidelines => l10n.listener_reg_step_guidelines,
      ListenerRegistrationStep.identityVerification =>
        l10n.listener_reg_step_identity,
      ListenerRegistrationStep.reviewSubmit =>
        l10n.listener_reg_step_review_submit,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final title = _title(l10n);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
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
            l10n.listener_reg_step_coming_soon,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white.withValues(alpha: 0.65),
              fontSize: 15,
              height: 1.4,
            ),
          ),
          const Spacer(),
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
              child: Text(l10n.listener_reg_continue),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
