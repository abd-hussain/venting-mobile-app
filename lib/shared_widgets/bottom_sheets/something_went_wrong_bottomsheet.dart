import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

class SomethingWentWrongBottomsheet extends StatelessWidget {
  static const Color _background = Color(0xFF0B0B15);
  static const Color _accent = Color(0xFF6A4BCF);
  static const Color _character = Color(0xFF7B5CE0);

  final VoidCallback onRetry;
  final VoidCallback? onContactSupport;
  final String? title;
  final String? message;

  const SomethingWentWrongBottomsheet({
    super.key,
    required this.onRetry,
    this.onContactSupport,
    this.message,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final resolvedTitle = title ?? l10n.common_something_went_wrong;
    final resolvedMessage = message ?? l10n.common_something_went_wrong_message;

    return Scaffold(
      backgroundColor: _background,
      body: Stack(
        children: [
          const Positioned.fill(child: _ErrorBackdrop()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  const _SadBlobIllustration(color: _character),
                  const SizedBox(height: 36),
                  Text(
                    resolvedTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    resolvedMessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white.withValues(alpha: 0.88),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.55,
                    ),
                  ),
                  const Spacer(flex: 3),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FilledButton(
                      onPressed: onRetry,
                      style: FilledButton.styleFrom(
                        backgroundColor: _accent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.1,
                        ),
                      ),
                      child: Text(l10n.try_again),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: () => onContactSupport?.call(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF14101C),
                        side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.22),
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
                      child: Text(l10n.common_contact_support),
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorBackdrop extends StatelessWidget {
  const _ErrorBackdrop();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.35),
          radius: 0.95,
          colors: [Color(0x332E1B66), Color(0xFF0B0B15)],
          stops: [0, 1],
        ),
      ),
      child: CustomPaint(painter: _PlusStarsPainter()),
    );
  }
}

class _SadBlobIllustration extends StatelessWidget {
  const _SadBlobIllustration({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 190,
      child: CustomPaint(painter: _SadBlobPainter(color: color)),
    );
  }
}

class _PlusStarsPainter extends CustomPainter {
  const _PlusStarsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF9B8AD9).withValues(alpha: 0.28)
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;

    const positions = <Offset>[
      Offset(0.20, 0.20),
      Offset(0.76, 0.18),
      Offset(0.14, 0.40),
      Offset(0.86, 0.36),
      Offset(0.28, 0.30),
      Offset(0.70, 0.44),
      Offset(0.48, 0.16),
      Offset(0.58, 0.52),
    ];

    for (var i = 0; i < positions.length; i++) {
      final center = Offset(
        size.width * positions[i].dx,
        size.height * positions[i].dy,
      );
      final arm = 4.0 + (i % 3);
      canvas.drawLine(
        Offset(center.dx - arm, center.dy),
        Offset(center.dx + arm, center.dy),
        paint,
      );
      canvas.drawLine(
        Offset(center.dx, center.dy - arm),
        Offset(center.dx, center.dy + arm),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SadBlobPainter extends CustomPainter {
  const _SadBlobPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final blobCenter = Offset(size.width * 0.46, size.height * 0.52);
    final radius = size.width * 0.32;

    // Soft glow
    canvas.drawCircle(
      blobCenter,
      radius * 1.35,
      Paint()
        ..shader =
            RadialGradient(
              colors: [color.withValues(alpha: 0.40), Colors.transparent],
            ).createShader(
              Rect.fromCircle(center: blobCenter, radius: radius * 1.35),
            ),
    );

    // Shadow
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(blobCenter.dx, blobCenter.dy + radius * 0.95),
        width: radius * 1.5,
        height: radius * 0.35,
      ),
      Paint()
        ..color = Colors.black.withValues(alpha: 0.28)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),
    );

    // Body
    final bodyPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF8B74EF), Color(0xFF6A4BCF), Color(0xFF5A3DB8)],
      ).createShader(Rect.fromCircle(center: blobCenter, radius: radius));
    canvas.drawCircle(blobCenter, radius, bodyPaint);

    // Highlight
    canvas.drawCircle(
      Offset(blobCenter.dx - radius * 0.22, blobCenter.dy - radius * 0.28),
      radius * 0.38,
      Paint()
        ..shader =
            RadialGradient(
              colors: [
                Colors.white.withValues(alpha: 0.28),
                Colors.white.withValues(alpha: 0),
              ],
            ).createShader(
              Rect.fromCircle(
                center: Offset(
                  blobCenter.dx - radius * 0.22,
                  blobCenter.dy - radius * 0.28,
                ),
                radius: radius * 0.38,
              ),
            ),
    );

    // Feet
    final footPaint = Paint()..color = const Color(0xFF5A3DB8);
    final footY = blobCenter.dy + radius * 0.78;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(blobCenter.dx - radius * 0.28, footY),
          width: radius * 0.34,
          height: radius * 0.28,
        ),
        Radius.circular(radius * 0.14),
      ),
      footPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(blobCenter.dx + radius * 0.28, footY),
          width: radius * 0.34,
          height: radius * 0.28,
        ),
        Radius.circular(radius * 0.14),
      ),
      footPaint,
    );

    // Face
    final eyePaint = Paint()..color = const Color(0xFF2A1A55);
    canvas.drawCircle(
      Offset(blobCenter.dx - radius * 0.22, blobCenter.dy - radius * 0.06),
      radius * 0.07,
      eyePaint,
    );
    canvas.drawCircle(
      Offset(blobCenter.dx + radius * 0.22, blobCenter.dy - radius * 0.06),
      radius * 0.07,
      eyePaint,
    );

    final mouthPaint = Paint()
      ..color = const Color(0xFF2A1A55)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = radius * 0.08;
    final mouthPath = Path()
      ..moveTo(blobCenter.dx - radius * 0.18, blobCenter.dy + radius * 0.28)
      ..quadraticBezierTo(
        blobCenter.dx,
        blobCenter.dy + radius * 0.12,
        blobCenter.dx + radius * 0.18,
        blobCenter.dy + radius * 0.28,
      );
    canvas.drawPath(mouthPath, mouthPaint);

    // Speech bubble with "?"
    final bubbleCenter = Offset(
      blobCenter.dx + radius * 0.95,
      blobCenter.dy - radius * 0.95,
    );
    final bubbleRadius = radius * 0.38;

    canvas.drawCircle(
      Offset(bubbleCenter.dx, bubbleCenter.dy + 3),
      bubbleRadius,
      Paint()
        ..color = Colors.black.withValues(alpha: 0.22)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );

    canvas.drawCircle(
      bubbleCenter,
      bubbleRadius,
      Paint()
        ..shader =
            const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF4A3A78), Color(0xFF2E2450)],
            ).createShader(
              Rect.fromCircle(center: bubbleCenter, radius: bubbleRadius),
            ),
    );

    // Bubble tail
    final tail = Path()
      ..moveTo(
        bubbleCenter.dx - bubbleRadius * 0.55,
        bubbleCenter.dy + bubbleRadius * 0.55,
      )
      ..lineTo(blobCenter.dx + radius * 0.55, blobCenter.dy - radius * 0.45)
      ..lineTo(
        bubbleCenter.dx - bubbleRadius * 0.05,
        bubbleCenter.dy + bubbleRadius * 0.75,
      )
      ..close();
    canvas.drawPath(tail, Paint()..color = const Color(0xFF2E2450));

    final questionPainter = TextPainter(
      text: TextSpan(
        text: '?',
        style: TextStyle(
          color: Colors.white,
          fontSize: bubbleRadius * 1.15,
          fontWeight: FontWeight.w700,
          height: 1,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    questionPainter.paint(
      canvas,
      Offset(
        bubbleCenter.dx - questionPainter.width / 2,
        bubbleCenter.dy - questionPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant _SadBlobPainter oldDelegate) =>
      oldDelegate.color != color;
}
