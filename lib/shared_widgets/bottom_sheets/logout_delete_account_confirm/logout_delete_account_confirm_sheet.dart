import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/bottom_sheets/logout_delete_account_confirm/bloc/logout_delete_account_confirm_bloc.dart';
import 'package:venting_mobile_app/shared_widgets/bottom_sheets/logout_delete_account_confirm/logout_delete_account_confirm_kind.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

export 'package:venting_mobile_app/shared_widgets/bottom_sheets/logout_delete_account_confirm/logout_delete_account_confirm_kind.dart';

/// Shared logout / delete-account confirmation (ventor + listener).
///
/// On confirm: `#4` logout or `#5` delete-account → clear session → welcome.
Future<void> showLogoutDeleteAccountConfirmBottomSheet({
  required BuildContext context,
  required LogoutDeleteAccountConfirmKind kind,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF12101A),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (sheetContext) => BlocProvider(
      create: (_) => diContainer<LogoutDeleteAccountConfirmBloc>(),
      child: LogoutDeleteAccountConfirmBottomSheet(kind: kind),
    ),
  );
}

class LogoutDeleteAccountConfirmBottomSheet extends StatelessWidget {
  const LogoutDeleteAccountConfirmBottomSheet({super.key, required this.kind});

  final LogoutDeleteAccountConfirmKind kind;

  static const _muted = Color(0xFF9B93AB);
  static const _error = Color(0xFFEF4444);

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final isLogout = kind == LogoutDeleteAccountConfirmKind.logout;

    final title = isLogout
        ? l10n.listener_confirm_logout_title
        : l10n.listener_confirm_delete_title;
    final heading = isLogout
        ? l10n.listener_confirm_logout_heading
        : l10n.listener_confirm_delete_heading;
    final subtitle = isLogout
        ? l10n.listener_confirm_logout_subtitle
        : l10n.listener_confirm_delete_subtitle;
    final confirmLabel = isLogout
        ? l10n.listener_confirm_logout_confirm
        : l10n.listener_confirm_delete_confirm;

    return BlocConsumer<
      LogoutDeleteAccountConfirmBloc,
      LogoutDeleteAccountConfirmState
    >(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == LogoutDeleteAccountConfirmStatus.success,
      listener: (context, state) {
        final router = GoRouter.of(context);
        Navigator.of(context).pop();
        router.go(AppRoutes.welcome);
      },
      builder: (context, state) {
        final isSubmitting = state.isSubmitting;

        return PopScope(
          canPop: !isSubmitting,
          child: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 16 + bottomInset),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 168,
                    height: 148,
                    child: CustomPaint(
                      painter: isLogout
                          ? const _LogoutDoorPainter()
                          : const _DeleteAccountPainter(),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: _muted,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                  if (state.isFailure && state.errorMessage.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _error.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _error.withValues(alpha: 0.45),
                        ),
                      ),
                      child: Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: _error,
                          fontSize: 13,
                          height: 1.35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: FilledButton(
                      onPressed: isSubmitting
                          ? null
                          : () => context
                                .read<LogoutDeleteAccountConfirmBloc>()
                                .add(
                                  LogoutDeleteAccountConfirmEvent.confirm(
                                    kind: kind,
                                  ),
                                ),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFFE11D48),
                        disabledBackgroundColor: const Color(
                          0xFFE11D48,
                        ).withValues(alpha: 0.42),
                        foregroundColor: Colors.white,
                        disabledForegroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: isSubmitting
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.4,
                                color: Colors.white,
                              ),
                            )
                          : Text(confirmLabel),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton(
                      onPressed: isSubmitting
                          ? null
                          : () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.22),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: Text(l10n.listener_confirm_cancel),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LogoutDoorPainter extends CustomPainter {
  const _LogoutDoorPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2 + 4;

    _paintSparks(canvas, size);

    final frameRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(cx - 6, cy), width: 78, height: 108),
      const Radius.circular(10),
    );
    final framePaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFC084FC), SplashColors.purpleMid, Color(0xFF7C3AED)],
      ).createShader(frameRect.outerRect);
    canvas.drawRRect(frameRect, framePaint);

    final inner = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(cx - 6, cy), width: 58, height: 88),
      const Radius.circular(6),
    );
    canvas.drawRRect(
      inner,
      Paint()..color = const Color(0xFF2A1848).withValues(alpha: 0.55),
    );

    final doorPath = Path()
      ..moveTo(cx + 8, cy - 44)
      ..lineTo(cx + 42, cy - 36)
      ..lineTo(cx + 42, cy + 40)
      ..lineTo(cx + 8, cy + 44)
      ..close();
    canvas.drawPath(
      doorPath,
      Paint()
        ..shader = const LinearGradient(
          colors: [Color(0xFFA855F7), Color(0xFF7E22CE)],
        ).createShader(doorPath.getBounds()),
    );
    canvas.drawPath(
      doorPath,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..color = Colors.white.withValues(alpha: 0.18),
    );

    canvas.drawCircle(
      Offset(cx + 34, cy + 2),
      3.2,
      Paint()..color = const Color(0xFFFBBF24),
    );

    final arrowPaint = Paint()
      ..color = SplashColors.purpleLight
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final arrow = Path()
      ..moveTo(cx - 52, cy)
      ..lineTo(cx - 18, cy)
      ..moveTo(cx - 30, cy - 14)
      ..lineTo(cx - 18, cy)
      ..lineTo(cx - 30, cy + 14);
    canvas.drawPath(arrow, arrowPaint);
  }

  void _paintSparks(Canvas canvas, Size size) {
    final rng = math.Random(7);
    final paint = Paint()
      ..color = SplashColors.purpleMid.withValues(alpha: 0.55);
    for (var i = 0; i < 18; i++) {
      final x = rng.nextDouble() * size.width;
      final y = rng.nextDouble() * size.height;
      final r = 0.8 + rng.nextDouble() * 1.8;
      canvas.drawCircle(Offset(x, y), r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DeleteAccountPainter extends CustomPainter {
  const _DeleteAccountPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2 + 6;

    _paintSparks(canvas, size);

    final body = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(cx, cy + 10), width: 72, height: 78),
      const Radius.circular(12),
    );
    canvas.drawRRect(
      body,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFC084FC),
            SplashColors.purpleMid,
            Color(0xFF6D28D9),
          ],
        ).createShader(body.outerRect),
    );

    final lid = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(cx, cy - 36), width: 86, height: 16),
      const Radius.circular(8),
    );
    canvas.drawRRect(lid, Paint()..color = const Color(0xFFE9D5FF));

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx, cy - 48), width: 28, height: 10),
        const Radius.circular(5),
      ),
      Paint()..color = const Color(0xFFF5E1FF),
    );

    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.28)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    for (final dx in [-18.0, 0.0, 18.0]) {
      canvas.drawLine(
        Offset(cx + dx, cy - 8),
        Offset(cx + dx, cy + 34),
        linePaint,
      );
    }
  }

  void _paintSparks(Canvas canvas, Size size) {
    final rng = math.Random(11);
    final paint = Paint()
      ..color = SplashColors.purpleMid.withValues(alpha: 0.5);
    for (var i = 0; i < 16; i++) {
      final x = rng.nextDouble() * size.width;
      final y = rng.nextDouble() * size.height;
      final r = 0.8 + rng.nextDouble() * 1.6;
      canvas.drawCircle(Offset(x, y), r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
