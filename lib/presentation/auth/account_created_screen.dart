import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/app_language_selector.dart';

/// Shown after successful email registration while awaiting verification.
class AccountCreatedScreen extends StatefulWidget {
  const AccountCreatedScreen({super.key});

  @override
  State<AccountCreatedScreen> createState() => _AccountCreatedScreenState();
}

class _AccountCreatedScreenState extends State<AccountCreatedScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const _titleColor = Color(0xFF1A1228);
  static const _bodyColor = Color(0xFF6B6280);
  static const _resendSeconds = 45;

  Timer? _timer;
  int _secondsLeft = _resendSeconds;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer?.cancel();
    setState(() => _secondsLeft = _resendSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) {
        timer.cancel();
        setState(() => _secondsLeft = 0);
        return;
      }
      setState(() => _secondsLeft -= 1);
    });
  }

  String get _countdownLabel {
    final minutes = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Future<void> _openEmailApp() async {
    final uri = Uri.parse('mailto:');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _resendEmail() {
    if (_secondsLeft > 0) return;
    // TODO: call resend verification email API
    _startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final canResend = _secondsLeft == 0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: _titleColor,
                      ),
                    ),
                    const Spacer(),
                    const AppLanguageSelector(),
                  ],
                ),
                const Spacer(flex: 2),
                const _EmailSuccessIllustration(),
                const SizedBox(height: 28),
                Text(
                  l10n.account_created_title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: _titleColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.account_created_subtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: _bodyColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.45,
                  ),
                ),
                const Spacer(flex: 3),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton(
                    onPressed: _openEmailApp,
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
                    child: Text(l10n.account_created_check_email),
                  ),
                ),
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: canResend ? _resendEmail : null,
                  child: Text(
                    canResend
                        ? l10n.account_created_resend_email
                        : l10n.account_created_resend_email_countdown(
                            _countdownLabel,
                          ),
                    style: GoogleFonts.inter(
                      color: canResend ? SplashColors.purpleMid : _bodyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailSuccessIllustration extends StatelessWidget {
  const _EmailSuccessIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 120,
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0xFFF0E6FF),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: SplashColors.purpleMid.withValues(alpha: 0.25),
                width: 2,
              ),
            ),
            child: CustomPaint(painter: _EnvelopePainter()),
          ),
          Positioned(
            right: 18,
            bottom: 18,
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xFF22C55E),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EnvelopePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = SplashColors.purpleMid
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeJoin = StrokeJoin.round;

    final flap = Path()
      ..moveTo(size.width * 0.12, size.height * 0.38)
      ..lineTo(size.width * 0.5, size.height * 0.62)
      ..lineTo(size.width * 0.88, size.height * 0.38);
    canvas.drawPath(flap, stroke);

    // Paper peeking out
    final paper = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.28,
        size.height * 0.12,
        size.width * 0.44,
        size.height * 0.34,
      ),
      const Radius.circular(4),
    );
    canvas.drawRRect(paper, Paint()..color = Colors.white);
    canvas.drawRRect(
      paper,
      Paint()
        ..color = SplashColors.purpleMid.withValues(alpha: 0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
