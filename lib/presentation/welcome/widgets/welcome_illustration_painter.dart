import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Calm welcome illustration: seated figure, plants, stars, speech bubble.
class WelcomeIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final cx = w * 0.5;

    _paintGlow(canvas, size);
    _paintStars(canvas, size);
    _paintGround(canvas, Offset(cx, h * 0.82), w * 0.38);
    _paintPlant(canvas, Offset(cx - w * 0.28, h * 0.72), w * 0.14, flip: false);
    _paintPlant(canvas, Offset(cx + w * 0.30, h * 0.70), w * 0.13, flip: true);
    _paintFigure(canvas, Offset(cx, h * 0.58), w * 0.42);
    _paintSpeechBubble(canvas, Offset(cx + w * 0.12, h * 0.22), w * 0.12);
  }

  void _paintGlow(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader =
          RadialGradient(
            colors: [
              SplashColors.purpleMid.withValues(alpha: 0.22),
              SplashColors.purpleDeep.withValues(alpha: 0.08),
              Colors.transparent,
            ],
            stops: const [0, 0.45, 1],
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width * 0.5, size.height * 0.55),
              radius: size.shortestSide * 0.55,
            ),
          );
    canvas.drawRect(Offset.zero & size, paint);
  }

  void _paintStars(Canvas canvas, Size size) {
    final random = math.Random(7);
    final paint = Paint()..color = Colors.white;
    for (var i = 0; i < 36; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.75;
      final r = 0.6 + random.nextDouble() * 1.4;
      paint.color = Colors.white.withValues(
        alpha: 0.25 + random.nextDouble() * 0.55,
      );
      canvas.drawCircle(Offset(x, y), r, paint);
    }
  }

  void _paintGround(Canvas canvas, Offset center, double radius) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF3A1F5C),
          const Color(0xFF1A0B2E).withValues(alpha: 0.85),
          Colors.transparent,
        ],
        stops: const [0, 0.65, 1],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawOval(
      Rect.fromCenter(
        center: center,
        width: radius * 2.1,
        height: radius * 0.55,
      ),
      paint,
    );
  }

  void _paintPlant(
    Canvas canvas,
    Offset base,
    double scale, {
    required bool flip,
  }) {
    canvas.save();
    canvas.translate(base.dx, base.dy);
    if (flip) canvas.scale(-1, 1);

    final stem = Paint()
      ..color = const Color(0xFF6B3FA0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = scale * 0.08
      ..strokeCap = StrokeCap.round;

    final leaf = Paint()
      ..color = const Color(0xFF8B5CF6).withValues(alpha: 0.85);

    final stemPath = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(
        scale * 0.15,
        -scale * 0.55,
        scale * 0.05,
        -scale * 1.35,
      );
    canvas.drawPath(stemPath, stem);

    void drawLeaf(Offset tip, double angle, double size) {
      canvas.save();
      canvas.translate(tip.dx, tip.dy);
      canvas.rotate(angle);
      final path = Path()
        ..moveTo(0, 0)
        ..quadraticBezierTo(size * 0.55, -size * 0.2, size, 0)
        ..quadraticBezierTo(size * 0.55, size * 0.35, 0, 0)
        ..close();
      canvas.drawPath(path, leaf);
      canvas.restore();
    }

    drawLeaf(Offset(scale * 0.08, -scale * 0.45), -0.9, scale * 0.55);
    drawLeaf(Offset(scale * 0.02, -scale * 0.85), -0.35, scale * 0.48);
    drawLeaf(Offset(scale * 0.12, -scale * 1.15), -1.15, scale * 0.4);

    canvas.restore();
  }

  void _paintFigure(Canvas canvas, Offset center, double size) {
    final shirt = Paint()..color = const Color(0xFF9B6BFF);
    final pants = Paint()..color = const Color(0xFF2A1A3D);
    final skin = Paint()..color = const Color(0xFFE8C4A8);
    final hair = Paint()..color = const Color(0xFF1A0F24);

    // Legs / seated base
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy + size * 0.28),
          width: size * 0.55,
          height: size * 0.22,
        ),
        Radius.circular(size * 0.12),
      ),
      pants,
    );

    // Torso curled over knees
    final torso = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(center.dx, center.dy + size * 0.02),
            width: size * 0.42,
            height: size * 0.48,
          ),
          Radius.circular(size * 0.18),
        ),
      );
    canvas.drawPath(torso, shirt);

    // Arms hugging knees
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy + size * 0.12),
          width: size * 0.5,
          height: size * 0.16,
        ),
        Radius.circular(size * 0.08),
      ),
      shirt,
    );

    // Head
    final headCenter = Offset(center.dx + size * 0.02, center.dy - size * 0.28);
    canvas.drawCircle(headCenter, size * 0.13, skin);

    // Hair
    final hairPath = Path()
      ..moveTo(headCenter.dx - size * 0.14, headCenter.dy)
      ..quadraticBezierTo(
        headCenter.dx - size * 0.22,
        headCenter.dy - size * 0.2,
        headCenter.dx,
        headCenter.dy - size * 0.22,
      )
      ..quadraticBezierTo(
        headCenter.dx + size * 0.2,
        headCenter.dy - size * 0.18,
        headCenter.dx + size * 0.16,
        headCenter.dy + size * 0.05,
      )
      ..quadraticBezierTo(
        headCenter.dx + size * 0.28,
        headCenter.dy + size * 0.35,
        headCenter.dx + size * 0.12,
        headCenter.dy + size * 0.55,
      )
      ..quadraticBezierTo(
        headCenter.dx + size * 0.08,
        headCenter.dy + size * 0.2,
        headCenter.dx + size * 0.1,
        headCenter.dy,
      )
      ..close();
    canvas.drawPath(hairPath, hair);

    // Soft fringe over forehead
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(headCenter.dx, headCenter.dy - size * 0.04),
        width: size * 0.26,
        height: size * 0.16,
      ),
      hair,
    );
  }

  void _paintSpeechBubble(Canvas canvas, Offset center, double size) {
    final bubble = Paint()..color = SplashColors.purpleMid;
    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: size * 1.5, height: size * 0.95),
      Radius.circular(size * 0.45),
    );
    canvas.drawRRect(rect, bubble);

    final tail = Path()
      ..moveTo(center.dx - size * 0.15, center.dy + size * 0.35)
      ..lineTo(center.dx - size * 0.05, center.dy + size * 0.7)
      ..lineTo(center.dx + size * 0.2, center.dy + size * 0.35)
      ..close();
    canvas.drawPath(tail, bubble);

    final dot = Paint()..color = Colors.white;
    for (var i = -1; i <= 1; i++) {
      canvas.drawCircle(
        Offset(center.dx + i * size * 0.28, center.dy - size * 0.02),
        size * 0.09,
        dot,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
