import 'package:flutter/material.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

enum VentorOnboardingIllustrationKind {
  safePlace,
  expressYourself,
  findListener,
  privacy,
}

class VentorOnboardingIllustration extends StatelessWidget {
  const VentorOnboardingIllustration({super.key, required this.kind});

  final VentorOnboardingIllustrationKind kind;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: switch (kind) {
        VentorOnboardingIllustrationKind.safePlace => const _SafePlacePainter(),
        VentorOnboardingIllustrationKind.expressYourself =>
          const _ExpressYourselfPainter(),
        VentorOnboardingIllustrationKind.findListener =>
          const _FindListenerPainter(),
        VentorOnboardingIllustrationKind.privacy => const _PrivacyPainter(),
      },
      child: const SizedBox.expand(),
    );
  }
}

class _SafePlacePainter extends CustomPainter {
  const _SafePlacePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width * 0.5;
    final cy = size.height * 0.42;

    // Soft glow
    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.32,
      Paint()..color = SplashColors.purpleMid.withValues(alpha: 0.12),
    );

    // Heart body
    final heartPath = Path();
    final heartW = size.width * 0.34;
    final heartH = size.height * 0.3;
    final top = cy - heartH * 0.35;
    heartPath.moveTo(cx, top + heartH * 0.35);
    heartPath.cubicTo(
      cx - heartW * 0.15,
      top,
      cx - heartW,
      top + heartH * 0.1,
      cx - heartW * 0.55,
      top + heartH * 0.55,
    );
    heartPath.cubicTo(
      cx - heartW * 0.25,
      top + heartH * 0.85,
      cx,
      top + heartH,
      cx,
      top + heartH,
    );
    heartPath.cubicTo(
      cx,
      top + heartH,
      cx + heartW * 0.25,
      top + heartH * 0.85,
      cx + heartW * 0.55,
      top + heartH * 0.55,
    );
    heartPath.cubicTo(
      cx + heartW,
      top + heartH * 0.1,
      cx + heartW * 0.15,
      top,
      cx,
      top + heartH * 0.35,
    );
    canvas.drawPath(
      heartPath,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [SplashColors.purpleLight, SplashColors.purpleMid],
        ).createShader(Rect.fromLTWH(cx - heartW, top, heartW * 2, heartH)),
    );

    // Speech bubble inside heart
    final bubble = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(cx, top + heartH * 0.42),
        width: heartW * 0.55,
        height: heartH * 0.28,
      ),
      const Radius.circular(12),
    );
    canvas.drawRRect(bubble, Paint()..color = Colors.white);
    final dotsY = top + heartH * 0.42;
    for (var i = -1; i <= 1; i++) {
      canvas.drawCircle(
        Offset(cx + i * 10, dotsY),
        2.5,
        Paint()..color = SplashColors.purpleMid,
      );
    }

    // Floating mini hearts
    final mini = Paint()
      ..color = const Color(0xFFFF8BC8).withValues(alpha: 0.7);
    canvas.drawCircle(Offset(cx - size.width * 0.28, cy - 20), 6, mini);
    canvas.drawCircle(Offset(cx + size.width * 0.3, cy + 10), 5, mini);
    canvas.drawCircle(Offset(cx + size.width * 0.22, cy - 40), 4, mini);

    // Person silhouette (simple)
    final personPaint = Paint()..color = const Color(0xFF2D2348);
    canvas.drawCircle(
      Offset(cx - size.width * 0.08, size.height * 0.72),
      size.width * 0.07,
      personPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx - size.width * 0.08, size.height * 0.86),
          width: size.width * 0.2,
          height: size.height * 0.16,
        ),
        const Radius.circular(20),
      ),
      personPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ExpressYourselfPainter extends CustomPainter {
  const _ExpressYourselfPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;

    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.34,
      Paint()..color = SplashColors.purpleMid.withValues(alpha: 0.1),
    );

    // Head
    canvas.drawCircle(
      Offset(cx, cy - size.height * 0.08),
      size.width * 0.14,
      Paint()..color = const Color(0xFFE8C4A8),
    );
    // Hair
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(cx, cy - size.height * 0.1),
        radius: size.width * 0.15,
      ),
      3.4,
      2.5,
      false,
      Paint()
        ..color = const Color(0xFF2D2348)
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.08
        ..strokeCap = StrokeCap.round,
    );
    // Body / sweater
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, cy + size.height * 0.2),
          width: size.width * 0.36,
          height: size.height * 0.28,
        ),
        const Radius.circular(28),
      ),
      Paint()..color = SplashColors.purpleMid,
    );

    // Speech bubbles
    void bubble(Offset c, double w, double h) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: c, width: w, height: h),
          const Radius.circular(14),
        ),
        Paint()..color = const Color(0xFFF0E8FF),
      );
    }

    bubble(Offset(cx - size.width * 0.28, cy - size.height * 0.22), 44, 28);
    bubble(Offset(cx + size.width * 0.3, cy - size.height * 0.12), 36, 24);
    bubble(Offset(cx + size.width * 0.26, cy + size.height * 0.08), 30, 20);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FindListenerPainter extends CustomPainter {
  const _FindListenerPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width * 0.42;
    final cy = size.height * 0.5;

    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.32,
      Paint()..color = SplashColors.purpleMid.withValues(alpha: 0.1),
    );

    // Head + headphones
    canvas.drawCircle(
      Offset(cx, cy - 10),
      size.width * 0.13,
      Paint()..color = const Color(0xFFD4A574),
    );
    final hp = Paint()
      ..color = SplashColors.purpleDeep
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy - 10), radius: size.width * 0.16),
      3.6,
      2.2,
      false,
      hp,
    );
    canvas.drawCircle(
      Offset(cx - size.width * 0.16, cy - 6),
      12,
      Paint()..color = SplashColors.purpleMid,
    );
    canvas.drawCircle(
      Offset(cx + size.width * 0.16, cy - 6),
      12,
      Paint()..color = SplashColors.purpleMid,
    );

    // Body
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, cy + size.height * 0.22),
          width: size.width * 0.34,
          height: size.height * 0.26,
        ),
        const Radius.circular(24),
      ),
      Paint()..color = const Color(0xFF3A2F55),
    );

    // Floating listener card
    final cardRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.58,
        size.height * 0.28,
        size.width * 0.34,
        size.height * 0.28,
      ),
      const Radius.circular(16),
    );
    canvas.drawRRect(
      cardRect,
      Paint()
        ..color = Colors.white
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0),
    );
    canvas.drawRRect(
      cardRect,
      Paint()
        ..color = Colors.black.withValues(alpha: 0.06)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
    canvas.drawCircle(
      Offset(size.width * 0.68, size.height * 0.38),
      14,
      Paint()..color = SplashColors.purpleLight,
    );
    // stars
    final starPaint = Paint()..color = const Color(0xFFFFB800);
    for (var i = 0; i < 5; i++) {
      canvas.drawCircle(
        Offset(size.width * 0.64 + i * 8, size.height * 0.48),
        2.5,
        starPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PrivacyPainter extends CustomPainter {
  const _PrivacyPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;

    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.34,
      Paint()..color = SplashColors.purpleMid.withValues(alpha: 0.1),
    );

    // Shield
    final shield = Path()
      ..moveTo(cx, cy - size.height * 0.28)
      ..lineTo(cx + size.width * 0.22, cy - size.height * 0.16)
      ..lineTo(cx + size.width * 0.22, cy + size.height * 0.06)
      ..quadraticBezierTo(
        cx,
        cy + size.height * 0.32,
        cx - size.width * 0.22,
        cy + size.height * 0.06,
      )
      ..lineTo(cx - size.width * 0.22, cy - size.height * 0.16)
      ..close();

    canvas.drawPath(
      shield,
      Paint()
        ..shader =
            const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFD4A0FF), SplashColors.purpleMid],
            ).createShader(
              Rect.fromCenter(
                center: Offset(cx, cy),
                width: size.width * 0.5,
                height: size.height * 0.6,
              ),
            ),
    );

    // Lock
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx, cy + 8), width: 36, height: 28),
        const Radius.circular(6),
      ),
      Paint()..color = Colors.white,
    );
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx, cy - 6), width: 22, height: 22),
      3.14,
      3.14,
      false,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4,
    );

    // Decorative dots
    final deco = Paint()
      ..color = SplashColors.purpleLight.withValues(alpha: 0.7);
    canvas.drawCircle(Offset(cx - size.width * 0.32, cy - 30), 5, deco);
    canvas.drawCircle(Offset(cx + size.width * 0.34, cy + 20), 6, deco);
    canvas.drawCircle(Offset(cx + size.width * 0.28, cy - 50), 4, deco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
