import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_painters.dart';

enum OnboardingIllustrationKind { brand, listener, privacy, rewards, community }

class OnboardingIllustration extends StatelessWidget {
  const OnboardingIllustration({required this.kind, super.key});

  final OnboardingIllustrationKind kind;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        painter: switch (kind) {
          OnboardingIllustrationKind.brand => const _BrandPainter(),
          OnboardingIllustrationKind.listener => const _ListenerPainter(),
          OnboardingIllustrationKind.privacy => const _PrivacyPainter(),
          OnboardingIllustrationKind.rewards => const _RewardsPainter(),
          OnboardingIllustrationKind.community => const _CommunityPainter(),
        },
      ),
    );
  }
}

class _BrandPainter extends CustomPainter {
  const _BrandPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final logo = SplashLogoPainter(
      outlineProgress: 1,
      fillProgress: 1,
      faceProgress: 1,
      dotsProgress: 1,
      glowProgress: 1,
    );
    logo.paint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ListenerPainter extends CustomPainter {
  const _ListenerPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.shortestSide * 0.38;

    // Soft circular backdrop
    final glow = Paint()
      ..shader = RadialGradient(
        colors: [
          SplashColors.purpleMid.withValues(alpha: 0.35),
          SplashColors.purpleDeep.withValues(alpha: 0.12),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: r * 1.35));
    canvas.drawCircle(center, r * 1.35, glow);

    final disc = Paint()..color = const Color(0xFF1B0F2E);
    canvas.drawCircle(center, r, disc);

    // Person
    final skin = Paint()..color = const Color(0xFFE8C4A8);
    final hair = Paint()..color = const Color(0xFF1A0F24);
    final shirt = Paint()..color = SplashColors.purpleMid;

    final head = Offset(center.dx, center.dy - r * 0.18);
    canvas.drawCircle(head, r * 0.22, skin);

    final hairPath = Path()
      ..moveTo(head.dx - r * 0.24, head.dy)
      ..quadraticBezierTo(
        head.dx - r * 0.35,
        head.dy - r * 0.3,
        head.dx,
        head.dy - r * 0.32,
      )
      ..quadraticBezierTo(
        head.dx + r * 0.35,
        head.dy - r * 0.28,
        head.dx + r * 0.26,
        head.dy + r * 0.08,
      )
      ..quadraticBezierTo(
        head.dx + r * 0.3,
        head.dy + r * 0.45,
        head.dx + r * 0.08,
        head.dy + r * 0.55,
      )
      ..lineTo(head.dx - r * 0.05, head.dy + r * 0.15)
      ..close();
    canvas.drawPath(hairPath, hair);

    // Closed eyes
    final eye = Paint()
      ..color = const Color(0xFF3A254F)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(head.dx - r * 0.08, head.dy + r * 0.02),
        width: r * 0.1,
        height: r * 0.06,
      ),
      0.2,
      math.pi - 0.4,
      false,
      eye,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(head.dx + r * 0.08, head.dy + r * 0.02),
        width: r * 0.1,
        height: r * 0.06,
      ),
      0.2,
      math.pi - 0.4,
      false,
      eye,
    );

    // Shoulders / shirt
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy + r * 0.42),
          width: r * 0.95,
          height: r * 0.55,
        ),
        Radius.circular(r * 0.28),
      ),
      shirt,
    );

    // Mug
    final mug = Paint()..color = const Color(0xFF9B6BFF);
    final mugRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        center.dx + r * 0.05,
        center.dy + r * 0.12,
        r * 0.22,
        r * 0.28,
      ),
      Radius.circular(r * 0.05),
    );
    canvas.drawRRect(mugRect, mug);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(center.dx + r * 0.3, center.dy + r * 0.24),
        width: r * 0.14,
        height: r * 0.16,
      ),
      -1.2,
      2.4,
      false,
      Paint()
        ..color = const Color(0xFF9B6BFF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );

    // Speech bubble
    final bubbleCenter = Offset(center.dx + r * 0.55, center.dy - r * 0.35);
    final bubble = Paint()..color = SplashColors.purpleMid;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: bubbleCenter,
          width: r * 0.42,
          height: r * 0.28,
        ),
        Radius.circular(r * 0.1),
      ),
      bubble,
    );
    final tail = Path()
      ..moveTo(bubbleCenter.dx - r * 0.05, bubbleCenter.dy + r * 0.1)
      ..lineTo(bubbleCenter.dx - r * 0.02, bubbleCenter.dy + r * 0.24)
      ..lineTo(bubbleCenter.dx + r * 0.1, bubbleCenter.dy + r * 0.1)
      ..close();
    canvas.drawPath(tail, bubble);
    final dot = Paint()..color = Colors.white;
    for (var i = -1; i <= 1; i++) {
      canvas.drawCircle(
        Offset(bubbleCenter.dx + i * r * 0.08, bubbleCenter.dy),
        r * 0.028,
        dot,
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
    final center = Offset(size.width / 2, size.height / 2);
    final s = size.shortestSide;

    // Sparkles
    final sparkle = Paint()..color = SplashColors.purpleLight;
    final random = math.Random(3);
    for (var i = 0; i < 18; i++) {
      final angle = random.nextDouble() * math.pi * 2;
      final dist = s * (0.28 + random.nextDouble() * 0.22);
      final p = Offset(
        center.dx + math.cos(angle) * dist,
        center.dy + math.sin(angle) * dist,
      );
      final r = 1.2 + random.nextDouble() * 2.4;
      sparkle.color = SplashColors.purpleLight.withValues(
        alpha: 0.35 + random.nextDouble() * 0.55,
      );
      _drawSpark(canvas, p, r, sparkle);
    }

    // Glow
    canvas.drawCircle(
      center,
      s * 0.28,
      Paint()
        ..color = SplashColors.purpleGlow.withValues(alpha: 0.28)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 28),
    );

    // Shield
    final shieldPath = Path()
      ..moveTo(center.dx, center.dy - s * 0.28)
      ..cubicTo(
        center.dx + s * 0.22,
        center.dy - s * 0.22,
        center.dx + s * 0.26,
        center.dy - s * 0.02,
        center.dx + s * 0.2,
        center.dy + s * 0.14,
      )
      ..cubicTo(
        center.dx + s * 0.1,
        center.dy + s * 0.28,
        center.dx,
        center.dy + s * 0.34,
        center.dx,
        center.dy + s * 0.34,
      )
      ..cubicTo(
        center.dx,
        center.dy + s * 0.34,
        center.dx - s * 0.1,
        center.dy + s * 0.28,
        center.dx - s * 0.2,
        center.dy + s * 0.14,
      )
      ..cubicTo(
        center.dx - s * 0.26,
        center.dy - s * 0.02,
        center.dx - s * 0.22,
        center.dy - s * 0.22,
        center.dx,
        center.dy - s * 0.28,
      )
      ..close();

    canvas.drawPath(
      shieldPath,
      Paint()
        ..shader = ui.Gradient.linear(
          Offset(center.dx, center.dy - s * 0.3),
          Offset(center.dx, center.dy + s * 0.34),
          const [Color(0xFFE0A6FF), Color(0xFFC45CFF), Color(0xFFFF4DB8)],
          const [0.0, 0.5, 1.0],
        ),
    );
    canvas.drawPath(
      shieldPath,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.white.withValues(alpha: 0.35),
    );

    // Lock body
    final lockPaint = Paint()..color = Colors.white;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy + s * 0.04),
          width: s * 0.16,
          height: s * 0.14,
        ),
        Radius.circular(s * 0.03),
      ),
      lockPaint,
    );
    // Shackle
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(center.dx, center.dy - s * 0.04),
        width: s * 0.12,
        height: s * 0.14,
      ),
      math.pi,
      math.pi,
      false,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = s * 0.025
        ..strokeCap = StrokeCap.round,
    );
    // Keyhole
    canvas.drawCircle(
      Offset(center.dx, center.dy + s * 0.02),
      s * 0.018,
      Paint()..color = SplashColors.purpleDeep,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy + s * 0.055),
          width: s * 0.02,
          height: s * 0.035,
        ),
        Radius.circular(s * 0.01),
      ),
      Paint()..color = SplashColors.purpleDeep,
    );
  }

  void _drawSpark(Canvas canvas, Offset c, double size, Paint paint) {
    final path = Path()
      ..moveTo(c.dx, c.dy - size)
      ..lineTo(c.dx + size * 0.25, c.dy - size * 0.25)
      ..lineTo(c.dx + size, c.dy)
      ..lineTo(c.dx + size * 0.25, c.dy + size * 0.25)
      ..lineTo(c.dx, c.dy + size)
      ..lineTo(c.dx - size * 0.25, c.dy + size * 0.25)
      ..lineTo(c.dx - size, c.dy)
      ..lineTo(c.dx - size * 0.25, c.dy - size * 0.25)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _RewardsPainter extends CustomPainter {
  const _RewardsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final s = size.shortestSide;

    canvas.drawCircle(
      center,
      s * 0.32,
      Paint()
        ..color = const Color(0xFFFFB84D).withValues(alpha: 0.16)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 24),
    );

    // Trophy cup
    final gold = Paint()
      ..shader = ui.Gradient.linear(
        Offset(center.dx, center.dy - s * 0.28),
        Offset(center.dx, center.dy + s * 0.2),
        const [Color(0xFFFFE08A), Color(0xFFFFB84D), Color(0xFFE08920)],
        const [0.0, 0.45, 1.0],
      );

    final cup = Path()
      ..moveTo(center.dx - s * 0.14, center.dy - s * 0.18)
      ..lineTo(center.dx + s * 0.14, center.dy - s * 0.18)
      ..quadraticBezierTo(
        center.dx + s * 0.16,
        center.dy + s * 0.02,
        center.dx + s * 0.08,
        center.dy + s * 0.1,
      )
      ..lineTo(center.dx - s * 0.08, center.dy + s * 0.1)
      ..quadraticBezierTo(
        center.dx - s * 0.16,
        center.dy + s * 0.02,
        center.dx - s * 0.14,
        center.dy - s * 0.18,
      )
      ..close();
    canvas.drawPath(cup, gold);

    // Handles
    final handle = Paint()
      ..color = const Color(0xFFFFB84D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.025;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(center.dx - s * 0.18, center.dy - s * 0.06),
        width: s * 0.14,
        height: s * 0.16,
      ),
      math.pi / 2,
      math.pi,
      false,
      handle,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(center.dx + s * 0.18, center.dy - s * 0.06),
        width: s * 0.14,
        height: s * 0.16,
      ),
      -math.pi / 2,
      math.pi,
      false,
      handle,
    );

    // Stem + base
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy + s * 0.16),
          width: s * 0.05,
          height: s * 0.1,
        ),
        Radius.circular(s * 0.02),
      ),
      gold,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy + s * 0.24),
          width: s * 0.2,
          height: s * 0.04,
        ),
        Radius.circular(s * 0.02),
      ),
      gold,
    );

    // Heart on trophy
    final heartPaint = Paint()..color = SplashColors.purpleMid;
    final hp = Path()
      ..moveTo(center.dx, center.dy - s * 0.02)
      ..cubicTo(
        center.dx - s * 0.08,
        center.dy - s * 0.12,
        center.dx - s * 0.1,
        center.dy - s * 0.02,
        center.dx,
        center.dy + s * 0.05,
      )
      ..cubicTo(
        center.dx + s * 0.1,
        center.dy - s * 0.02,
        center.dx + s * 0.08,
        center.dy - s * 0.12,
        center.dx,
        center.dy - s * 0.02,
      );
    canvas.drawPath(hp, heartPaint);

    // Gift box
    final giftOrigin = Offset(center.dx - s * 0.32, center.dy + s * 0.12);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: giftOrigin, width: s * 0.16, height: s * 0.14),
        Radius.circular(s * 0.02),
      ),
      Paint()..color = SplashColors.purpleMid,
    );
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(giftOrigin.dx, giftOrigin.dy - s * 0.02),
        width: s * 0.18,
        height: s * 0.04,
      ),
      Paint()..color = const Color(0xFFFF4DB8),
    );
    canvas.drawRect(
      Rect.fromCenter(center: giftOrigin, width: s * 0.03, height: s * 0.14),
      Paint()..color = const Color(0xFFFFE08A),
    );

    // Coin
    final coin = Offset(center.dx + s * 0.3, center.dy + s * 0.08);
    canvas.drawCircle(coin, s * 0.07, Paint()..color = const Color(0xFFFFD76A));
    canvas.drawCircle(
      coin,
      s * 0.05,
      Paint()
        ..color = const Color(0xFFE08920)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CommunityPainter extends CustomPainter {
  const _CommunityPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final s = size.shortestSide;

    canvas.drawCircle(
      center,
      s * 0.34,
      Paint()
        ..color = SplashColors.purpleMid.withValues(alpha: 0.14)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 22),
    );

    final nodes = <Offset>[
      Offset(center.dx, center.dy - s * 0.22),
      Offset(center.dx - s * 0.22, center.dy - s * 0.02),
      Offset(center.dx + s * 0.22, center.dy - s * 0.02),
      Offset(center.dx - s * 0.12, center.dy + s * 0.22),
      Offset(center.dx + s * 0.12, center.dy + s * 0.22),
      center,
    ];

    final line = Paint()
      ..color = SplashColors.purpleLight.withValues(alpha: 0.45)
      ..strokeWidth = 1.6
      ..style = PaintingStyle.stroke;
    final links = [
      (0, 5),
      (1, 5),
      (2, 5),
      (3, 5),
      (4, 5),
      (0, 1),
      (0, 2),
      (1, 3),
      (2, 4),
    ];
    for (final (a, b) in links) {
      canvas.drawLine(nodes[a], nodes[b], line);
    }

    for (var i = 0; i < nodes.length; i++) {
      final p = nodes[i];
      final radius = i == 5 ? s * 0.09 : s * 0.07;
      canvas.drawCircle(
        p,
        radius,
        Paint()
          ..shader = ui.Gradient.radial(p, radius, [
            SplashColors.purpleLight,
            SplashColors.purpleDeep,
          ]),
      );
      canvas.drawCircle(
        Offset(p.dx, p.dy - radius * 0.15),
        radius * 0.28,
        Paint()..color = const Color(0xFFE8C4A8),
      );
      canvas.drawCircle(
        Offset(p.dx, p.dy + radius * 0.35),
        radius * 0.42,
        Paint()..color = const Color(0xFF2A1A3D),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
