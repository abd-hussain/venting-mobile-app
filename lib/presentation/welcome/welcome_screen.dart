import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/presentation/welcome/widgets/welcome_illustration_painter.dart';
import 'package:venting_mobile_app/shared_widgets/app_language_selector.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarContrastEnforced: false,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: AppLanguageSelector(),
                  ),
                  const SizedBox(height: 12),
                  const _VentingBrandHeader(),
                  const SizedBox(height: 8),
                  Text(
                    l10n.welcome_tagline,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white.withValues(alpha: 0.88),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,
                      height: 1.3,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 0.92,
                        child: CustomPaint(
                          painter: WelcomeIllustrationPainter(),
                        ),
                      ),
                    ),
                  ),
                  _WelcomePrimaryButton(
                    label: l10n.welcome_need_someone_to_talk_to,
                    onPressed: () {
                      context.push(AppRoutes.ventorOnboarding);
                    },
                  ),
                  const SizedBox(height: 12),
                  _WelcomeSecondaryButton(
                    label: l10n.welcome_want_to_be_listener,
                    onPressed: () {
                      context.push(AppRoutes.listenerOnboarding);
                    },
                  ),
                  const SizedBox(height: 20),
                  _SignInPrompt(
                    prompt: l10n.welcome_already_have_account,
                    action: l10n.welcome_sign_in,
                    onSignIn: () {
                      context.push(AppRoutes.authUserUnknown);
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VentingBrandHeader extends StatelessWidget {
  const _VentingBrandHeader();

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.greatVibes(
      fontSize: 56,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0.5,
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          'Venting',
          style: textStyle.copyWith(
            color: SplashColors.purpleGlow.withValues(alpha: 0.35),
            shadows: [
              Shadow(
                color: SplashColors.purpleGlow.withValues(alpha: 0.7),
                blurRadius: 22,
              ),
            ],
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) =>
              SplashColors.brandGradient.createShader(bounds),
          child: Text('Venting', style: textStyle),
        ),
      ],
    );
  }
}

class _WelcomePrimaryButton extends StatelessWidget {
  const _WelcomePrimaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: SplashColors.purpleMid,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

class _WelcomeSecondaryButton extends StatelessWidget {
  const _WelcomeSecondaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF14101C),
          side: BorderSide(
            color: SplashColors.purpleMid.withValues(alpha: 0.55),
            width: 1.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

class _SignInPrompt extends StatelessWidget {
  const _SignInPrompt({
    required this.prompt,
    required this.action,
    required this.onSignIn,
  });

  final String prompt;
  final String action;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          '$prompt ',
          style: GoogleFonts.inter(
            color: Colors.white.withValues(alpha: 0.78),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: onSignIn,
          child: Text(
            action,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
