import 'package:flutter/material.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

enum ListenerOnboardingIllustrationKind {
  makeDifference,
  listenWithEmpathy,
  buildProfile,
  flexibleSupport,
}

class ListenerOnboardingIllustration extends StatelessWidget {
  const ListenerOnboardingIllustration({super.key, required this.kind});

  final ListenerOnboardingIllustrationKind kind;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: switch (kind) {
        ListenerOnboardingIllustrationKind.makeDifference =>
          const _MakeDifferencePainter(),
        ListenerOnboardingIllustrationKind.listenWithEmpathy =>
          const _ListenWithEmpathyPainter(),
        ListenerOnboardingIllustrationKind.buildProfile =>
          const _BuildProfilePainter(),
        ListenerOnboardingIllustrationKind.flexibleSupport =>
          const _FlexibleSupportPainter(),
      },
      child: const SizedBox.expand(),
    );
  }
}

class _MakeDifferencePainter extends CustomPainter {
  const _MakeDifferencePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width * 0.5;
    final cy = size.height * 0.42;

    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.32,
      Paint()..color = SplashColors.purpleMid.withValues(alpha: 0.12),
    );

    // Head with headphones
    canvas.drawCircle(
      Offset(cx, cy - 4),
      size.width * 0.14,
      Paint()..color = const Color(0xFFE8C4A8),
    );
    final hp = Paint()
      ..color = SplashColors.purpleDeep
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy - 4), radius: size.width * 0.17),
      3.6,
      2.2,
      false,
      hp,
    );
    canvas.drawCircle(
      Offset(cx - size.width * 0.17, cy),
      13,
      Paint()..color = SplashColors.purpleMid,
    );
    canvas.drawCircle(
      Offset(cx + size.width * 0.17, cy),
      13,
      Paint()..color = SplashColors.purpleMid,
    );

    // Body
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, cy + size.height * 0.24),
          width: size.width * 0.36,
          height: size.height * 0.28,
        ),
        const Radius.circular(28),
      ),
      Paint()..color = SplashColors.purpleMid,
    );

    // Soft heart accent
    final heartPaint = Paint()
      ..color = const Color(0xFFFF8BC8).withValues(alpha: 0.75);
    canvas.drawCircle(Offset(cx - size.width * 0.28, cy - 28), 7, heartPaint);
    canvas.drawCircle(Offset(cx + size.width * 0.3, cy + 8), 5, heartPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ListenWithEmpathyPainter extends CustomPainter {
  const _ListenWithEmpathyPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;

    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.34,
      Paint()..color = SplashColors.purpleMid.withValues(alpha: 0.1),
    );

    void person(double x, Color bodyColor, Color skinColor) {
      canvas.drawCircle(
        Offset(x, cy - size.height * 0.08),
        size.width * 0.1,
        Paint()..color = skinColor,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(x, cy + size.height * 0.16),
            width: size.width * 0.26,
            height: size.height * 0.24,
          ),
          const Radius.circular(22),
        ),
        Paint()..color = bodyColor,
      );
    }

    person(
      cx - size.width * 0.18,
      const Color(0xFF3A2F55),
      const Color(0xFFD4A574),
    );
    person(
      cx + size.width * 0.18,
      SplashColors.purpleMid,
      const Color(0xFFE8C4A8),
    );

    // Connection heart between them
    canvas.drawCircle(
      Offset(cx, cy - size.height * 0.02),
      10,
      Paint()..color = const Color(0xFFFF8BC8),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BuildProfilePainter extends CustomPainter {
  const _BuildProfilePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;

    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.34,
      Paint()..color = SplashColors.purpleMid.withValues(alpha: 0.1),
    );

    final card = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(cx, cy),
        width: size.width * 0.58,
        height: size.height * 0.52,
      ),
      const Radius.circular(20),
    );
    canvas.drawRRect(card, Paint()..color = Colors.white);
    canvas.drawRRect(
      card,
      Paint()
        ..color = Colors.black.withValues(alpha: 0.06)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    canvas.drawCircle(
      Offset(cx, cy - size.height * 0.1),
      size.width * 0.1,
      Paint()..color = SplashColors.purpleLight,
    );

    // Name bar
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, cy + size.height * 0.04),
          width: size.width * 0.32,
          height: 10,
        ),
        const Radius.circular(6),
      ),
      Paint()..color = SplashColors.purpleMid.withValues(alpha: 0.35),
    );

    // Stars
    final starPaint = Paint()..color = const Color(0xFFFFB800);
    for (var i = 0; i < 5; i++) {
      canvas.drawCircle(
        Offset(cx - 24 + i * 12.0, cy + size.height * 0.14),
        3,
        starPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FlexibleSupportPainter extends CustomPainter {
  const _FlexibleSupportPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;

    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.34,
      Paint()..color = SplashColors.purpleMid.withValues(alpha: 0.1),
    );

    // Calendar / schedule card
    final card = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(cx, cy),
        width: size.width * 0.5,
        height: size.height * 0.48,
      ),
      const Radius.circular(18),
    );
    canvas.drawRRect(card, Paint()..color = Colors.white);
    canvas.drawRRect(
      card,
      Paint()
        ..color = Colors.black.withValues(alpha: 0.06)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    // Header strip
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(
          cx - size.width * 0.25,
          cy - size.height * 0.24,
          size.width * 0.5,
          size.height * 0.12,
        ),
        topLeft: const Radius.circular(18),
        topRight: const Radius.circular(18),
      ),
      Paint()..color = SplashColors.purpleMid,
    );

    // Grid dots (availability)
    final active = Paint()..color = SplashColors.purpleMid;
    final idle = Paint()
      ..color = SplashColors.purpleMid.withValues(alpha: 0.22);
    for (var row = 0; row < 3; row++) {
      for (var col = 0; col < 4; col++) {
        final isActive = (row + col).isEven;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: Offset(cx - 36 + col * 24.0, cy - 8 + row * 26.0),
              width: 16,
              height: 16,
            ),
            const Radius.circular(4),
          ),
          isActive ? active : idle,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
