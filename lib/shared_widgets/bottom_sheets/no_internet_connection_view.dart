import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection/internet_connection_checkup.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

class NoInternetConnectionView extends StatefulWidget {
  final Future<bool> Function() onRetry;

  const NoInternetConnectionView({super.key, required this.onRetry});

  @override
  State<NoInternetConnectionView> createState() =>
      _NoInternetConnectionViewState();
}

class _NoInternetConnectionViewState extends State<NoInternetConnectionView> {
  static const Color _background = Color(0xFF0B0B15);
  static const Color _accent = Color(0xFF6A4BCF);
  static const Color _cloud = Color(0xFF7B5CE0);

  StreamSubscription<bool>? _networkSubscription;
  bool _isRetrying = false;
  bool _isDismissing = false;

  @override
  void initState() {
    super.initState();
    _networkSubscription = NetworkUseCase.networkStateStream.listen((
      hasInternet,
    ) {
      if (hasInternet && mounted) {
        unawaited(_handleConnectivityRestored());
      }
    });
  }

  @override
  void dispose() {
    _networkSubscription?.cancel();
    super.dispose();
  }

  Future<void> _dismissIfRestored(Future<bool> Function() check) async {
    if (_isDismissing) {
      return;
    }

    _isDismissing = true;
    try {
      final restored = await check();
      if (restored && mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      } else {
        _isDismissing = false;
      }
    } catch (_) {
      _isDismissing = false;
      rethrow;
    }
  }

  Future<void> _handleConnectivityRestored() async {
    await _dismissIfRestored(widget.onRetry);
  }

  Future<void> _onTryAgain() async {
    if (_isRetrying || _isDismissing) {
      return;
    }

    setState(() => _isRetrying = true);
    try {
      await _dismissIfRestored(widget.onRetry);
    } finally {
      if (mounted && !_isDismissing) {
        setState(() => _isRetrying = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: _background,
        body: Stack(
          children: [
            const Positioned.fill(child: _OfflineBackdrop()),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    const _SadCloudIllustration(cloudColor: _cloud),
                    const SizedBox(height: 40),
                    Text(
                      l10n.common_connectionLost,
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
                      l10n.common_connectionLostMessage,
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
                        onPressed: _isRetrying ? null : _onTryAgain,
                        style: FilledButton.styleFrom(
                          backgroundColor: _accent,
                          disabledBackgroundColor: _accent.withValues(
                            alpha: 0.7,
                          ),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          textStyle: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.1,
                          ),
                        ),
                        child: _isRetrying
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.4,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : Text(l10n.try_again),
                      ),
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OfflineBackdrop extends StatelessWidget {
  const _OfflineBackdrop();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.35),
          radius: 0.95,
          colors: [Color(0x332E1B66), Color(0xFF0B0B15)],
          stops: [0.0, 1.0],
        ),
      ),
      child: CustomPaint(painter: _PlusStarsPainter()),
    );
  }
}

class _SadCloudIllustration extends StatelessWidget {
  const _SadCloudIllustration({required this.cloudColor});

  final Color cloudColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 170,
      child: CustomPaint(painter: _SadCloudPainter(cloudColor: cloudColor)),
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
      Offset(0.18, 0.18),
      Offset(0.78, 0.16),
      Offset(0.12, 0.38),
      Offset(0.88, 0.34),
      Offset(0.22, 0.55),
      Offset(0.82, 0.52),
      Offset(0.30, 0.28),
      Offset(0.70, 0.42),
      Offset(0.48, 0.14),
      Offset(0.58, 0.58),
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

class _SadCloudPainter extends CustomPainter {
  const _SadCloudPainter({required this.cloudColor});

  final Color cloudColor;

  @override
  void paint(Canvas canvas, Size size) {
    final cloudPath = _buildCloudPath(size);

    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.28)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18);
    canvas.save();
    canvas.translate(0, 10);
    canvas.drawPath(cloudPath, shadowPaint);
    canvas.restore();

    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [cloudColor.withValues(alpha: 0.45), Colors.transparent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.48),
      size.width * 0.42,
      glowPaint,
    );

    final cloudPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF8B74EF), Color(0xFF6A4BCF), Color(0xFF5A3DB8)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(cloudPath, cloudPaint);

    final highlightPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white.withValues(alpha: 0.22),
          Colors.white.withValues(alpha: 0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height * 0.55));
    canvas.save();
    canvas.clipPath(cloudPath);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height * 0.55),
      highlightPaint,
    );
    canvas.restore();

    final eyePaint = Paint()
      ..color = const Color(0xFF2A1A55)
      ..style = PaintingStyle.fill;

    final leftEye = Offset(size.width * 0.38, size.height * 0.48);
    final rightEye = Offset(size.width * 0.58, size.height * 0.48);
    canvas.drawCircle(leftEye, 4, eyePaint);
    canvas.drawCircle(rightEye, 4, eyePaint);

    final mouthPaint = Paint()
      ..color = const Color(0xFF2A1A55)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.4;

    final mouthPath = Path()
      ..moveTo(size.width * 0.40, size.height * 0.62)
      ..quadraticBezierTo(
        size.width * 0.48,
        size.height * 0.54,
        size.width * 0.56,
        size.height * 0.62,
      );
    canvas.drawPath(mouthPath, mouthPaint);

    final badgeCenter = Offset(size.width * 0.78, size.height * 0.72);
    final badgeRadius = size.width * 0.105;

    canvas.drawCircle(
      Offset(badgeCenter.dx, badgeCenter.dy + 3),
      badgeRadius,
      Paint()
        ..color = Colors.black.withValues(alpha: 0.25)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );

    canvas.drawCircle(
      badgeCenter,
      badgeRadius,
      Paint()
        ..shader =
            const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF5B3BC4), Color(0xFF3D278A)],
            ).createShader(
              Rect.fromCircle(center: badgeCenter, radius: badgeRadius),
            ),
    );

    final xPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.6
      ..strokeCap = StrokeCap.round;
    final xSize = badgeRadius * 0.42;
    canvas.drawLine(
      Offset(badgeCenter.dx - xSize, badgeCenter.dy - xSize),
      Offset(badgeCenter.dx + xSize, badgeCenter.dy + xSize),
      xPaint,
    );
    canvas.drawLine(
      Offset(badgeCenter.dx + xSize, badgeCenter.dy - xSize),
      Offset(badgeCenter.dx - xSize, badgeCenter.dy + xSize),
      xPaint,
    );
  }

  Path _buildCloudPath(Size size) {
    final w = size.width;
    final h = size.height;

    return Path()
      ..moveTo(w * 0.22, h * 0.62)
      ..cubicTo(w * 0.10, h * 0.62, w * 0.06, h * 0.42, w * 0.20, h * 0.36)
      ..cubicTo(w * 0.22, h * 0.18, w * 0.42, h * 0.12, w * 0.50, h * 0.24)
      ..cubicTo(w * 0.58, h * 0.10, w * 0.78, h * 0.14, w * 0.82, h * 0.32)
      ..cubicTo(w * 0.96, h * 0.34, w * 0.98, h * 0.58, w * 0.84, h * 0.64)
      ..cubicTo(w * 0.78, h * 0.78, w * 0.30, h * 0.80, w * 0.22, h * 0.62)
      ..close();
  }

  @override
  bool shouldRepaint(covariant _SadCloudPainter oldDelegate) =>
      oldDelegate.cloudColor != cloudColor;
}
