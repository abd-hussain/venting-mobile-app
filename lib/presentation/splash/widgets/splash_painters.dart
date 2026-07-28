import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Paints the Venting heart / face / chat-dots mark with staged opacity.
class SplashLogoPainter extends CustomPainter {
  SplashLogoPainter({
    required this.outlineProgress,
    required this.fillProgress,
    required this.faceProgress,
    required this.dotsProgress,
    required this.glowProgress,
  });

  final double outlineProgress;
  final double fillProgress;
  final double faceProgress;
  final double dotsProgress;
  final double glowProgress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final scale = size.shortestSide / 120;

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(scale);

    final heartPath = _heartPath();

    if (glowProgress > 0) {
      final glowPaint = Paint()
        ..color = SplashColors.purpleGlow.withValues(alpha: 0.35 * glowProgress)
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          18 + 10 * glowProgress,
        );
      canvas.drawPath(heartPath, glowPaint);
    }

    if (outlineProgress > 0 && fillProgress < 0.95) {
      final outlinePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.4
        ..strokeJoin = StrokeJoin.round
        ..color = SplashColors.purpleMid.withValues(
          alpha: 0.55 * outlineProgress * (1 - fillProgress * 0.7),
        )
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
      canvas.drawPath(heartPath, outlinePaint);
    }

    if (fillProgress > 0) {
      final fillPaint = Paint()
        ..shader = ui.Gradient.linear(
          const Offset(-40, -45),
          const Offset(40, 50),
          [
            SplashColors.purpleLight.withValues(alpha: fillProgress),
            SplashColors.purpleMid.withValues(alpha: fillProgress),
            SplashColors.purpleDeep.withValues(alpha: fillProgress),
          ],
          const [0.0, 0.45, 1.0],
        );
      canvas.drawPath(heartPath, fillPaint);

      final rimPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..color = SplashColors.purpleLight.withValues(
          alpha: 0.35 * fillProgress,
        );
      canvas.drawPath(heartPath, rimPaint);
    }

    if (faceProgress > 0) {
      final facePaint = Paint()
        ..color = const Color(0xFF1A0B2E).withValues(alpha: 0.92 * faceProgress)
        ..style = PaintingStyle.fill;
      canvas.drawPath(_facePath(), facePaint);

      // Soft highlight on cheek / jaw for depth.
      final highlight = Paint()
        ..color = SplashColors.purpleLight.withValues(
          alpha: 0.12 * faceProgress,
        )
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
      canvas.drawOval(const Rect.fromLTWH(-28, -8, 14, 22), highlight);
    }

    if (dotsProgress > 0) {
      final dots = [
        const Offset(6, -4),
        const Offset(18, -4),
        const Offset(30, -4),
      ];
      for (var i = 0; i < dots.length; i++) {
        final t = ((dotsProgress * 3) - i).clamp(0.0, 1.0);
        if (t <= 0) continue;
        final paint = Paint()
          ..color = Colors.white.withValues(alpha: 0.95 * t)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 1.5 * t);
        canvas.drawCircle(dots[i], 4.2, paint);
      }
    }

    canvas.restore();
  }

  Path _heartPath() {
    final path = Path();
    // Stylized heart matching the brand mark proportions.
    path.moveTo(0, 42);
    path.cubicTo(-38, 18, -48, -8, -32, -28);
    path.cubicTo(-22, -40, -6, -40, 0, -28);
    path.cubicTo(6, -40, 22, -40, 32, -28);
    path.cubicTo(48, -8, 38, 18, 0, 42);
    path.close();
    return path;
  }

  Path _facePath() {
    final path = Path();
    // Left-side profile silhouette facing right, nested in the heart.
    path.moveTo(-30, -18);
    path.cubicTo(-34, -6, -34, 10, -28, 22);
    path.cubicTo(-24, 28, -18, 30, -12, 28);
    path.cubicTo(-16, 18, -18, 6, -16, -4);
    path.cubicTo(-14, -14, -20, -22, -30, -18);
    path.close();

    // Forehead / nose suggestion.
    path.moveTo(-28, -16);
    path.cubicTo(-26, -22, -20, -24, -14, -18);
    path.cubicTo(-18, -14, -24, -12, -28, -16);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant SplashLogoPainter oldDelegate) {
    return outlineProgress != oldDelegate.outlineProgress ||
        fillProgress != oldDelegate.fillProgress ||
        faceProgress != oldDelegate.faceProgress ||
        dotsProgress != oldDelegate.dotsProgress ||
        glowProgress != oldDelegate.glowProgress;
  }
}

/// Soft glowing wave lines at the bottom of the splash.
class SplashWavePainter extends CustomPainter {
  SplashWavePainter({required this.progress, required this.phase});

  final double progress;
  final double phase;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    for (var i = 0; i < 3; i++) {
      final path = Path();
      final amplitude = 8.0 + i * 4;
      final yBase = size.height * 0.55 + i * 18;
      final frequency = 1.6 + i * 0.25;
      final opacity = (0.45 - i * 0.1) * progress;

      path.moveTo(0, yBase);
      for (var x = 0.0; x <= size.width; x += 4) {
        final y =
            yBase +
            math.sin((x / size.width * frequency * math.pi * 2) + phase + i) *
                amplitude;
        path.lineTo(x, y);
      }

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6 - i * 0.2
        ..color = SplashColors.purpleMid.withValues(alpha: opacity)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3 + i.toDouble());
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant SplashWavePainter oldDelegate) {
    return progress != oldDelegate.progress || phase != oldDelegate.phase;
  }
}

/// Twinkling sparkle particles around the logo / lower half.
class SplashSparklesPainter extends CustomPainter {
  SplashSparklesPainter({required this.progress, required this.seed});

  final double progress;
  final int seed;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final random = math.Random(seed);
    const count = 28;

    for (var i = 0; i < count; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final baseSize = 1.2 + random.nextDouble() * 2.8;
      final twinkle =
          0.45 +
          0.55 *
              math.sin(progress * math.pi * 2 * (1 + random.nextDouble()) + i);
      final alpha = progress * twinkle * (0.35 + random.nextDouble() * 0.55);

      final paint = Paint()
        ..color = SplashColors.purpleLight.withValues(alpha: alpha)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.2);

      _drawSparkle(canvas, Offset(x, y), baseSize * twinkle, paint);
    }
  }

  void _drawSparkle(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path()
      ..moveTo(center.dx, center.dy - size)
      ..lineTo(center.dx + size * 0.25, center.dy - size * 0.25)
      ..lineTo(center.dx + size, center.dy)
      ..lineTo(center.dx + size * 0.25, center.dy + size * 0.25)
      ..lineTo(center.dx, center.dy + size)
      ..lineTo(center.dx - size * 0.25, center.dy + size * 0.25)
      ..lineTo(center.dx - size, center.dy)
      ..lineTo(center.dx - size * 0.25, center.dy - size * 0.25)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant SplashSparklesPainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
