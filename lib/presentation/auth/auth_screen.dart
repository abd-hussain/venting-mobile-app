import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/auth/auth_navigation.dart';
import 'package:venting_mobile_app/presentation/auth/bloc/auth_bloc.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/app_language_selector.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

enum AuthUserType { ventor, lissener }

class AuthRouteArgs {
  const AuthRouteArgs({required this.userType});

  final AuthUserType userType;
}

/// Auth method picker for ventor or listener (sign-in or create account).
class AuthScreen extends StatelessWidget {
  final AuthUserType userType;
  const AuthScreen({super.key, required this.userType});

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const _titleColor = Color(0xFF1A1228);
  static const _bodyColor = Color(0xFF6B6280);
  static const _border = Color(0xFFE4DCEF);
  static const _error = Color(0xFFE11D48);

  ({String title, String subtitle}) _copy(VentingMobLocalizations l10n) {
    return switch (userType) {
      AuthUserType.ventor => (
        title: l10n.auth_ventor_title,
        subtitle: l10n.auth_ventor_subtitle,
      ),
      AuthUserType.lissener => (
        title: l10n.auth_listener_title,
        subtitle: l10n.auth_listener_subtitle,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => diContainer<AuthBloc>(param1: userType),
      child: _AuthView(userType: userType, copyBuilder: _copy),
    );
  }
}

class _AuthView extends StatelessWidget {
  const _AuthView({required this.userType, required this.copyBuilder});

  final AuthUserType userType;
  final ({String title, String subtitle}) Function(VentingMobLocalizations l10n)
  copyBuilder;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final copy = copyBuilder(l10n);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AuthScreen._overlayStyle,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<AuthBloc, AuthState>(
            listenWhen: (previous, current) =>
                current.destination != null &&
                previous.destination != current.destination,
            listener: (context, state) {
              final destination = state.destination;
              if (destination != null) {
                navigateToAuthDestination(context, destination);
              }
            },
            builder: (context, state) {
              final isBusy = state.isLoadingGoogle || state.isLoadingApple;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: isBusy
                              ? null
                              : () => context.go(AppRoutes.welcome),
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: AuthScreen._titleColor,
                          ),
                        ),
                        const Spacer(),
                        const AppLanguageSelector(),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Text(
                      copy.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: AuthScreen._titleColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      copy.subtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: AuthScreen._bodyColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _AuthButton(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      borderColor: Colors.black,
                      icon: Icons.apple,
                      label: l10n.auth_continue_with_apple,
                      isLoading: state.isLoadingApple,
                      onPressed: isBusy
                          ? null
                          : () => context.read<AuthBloc>().add(
                              const AuthEvent.signInWithApple(),
                            ),
                    ),
                    const SizedBox(height: 12),
                    _AuthButton(
                      backgroundColor: Colors.white,
                      foregroundColor: AuthScreen._titleColor,
                      borderColor: AuthScreen._border,
                      iconWidget: const _GoogleMark(),
                      label: l10n.auth_continue_with_google,
                      isLoading: state.isLoadingGoogle,
                      onPressed: isBusy
                          ? null
                          : () => context.read<AuthBloc>().add(
                              const AuthEvent.signInWithGoogle(),
                            ),
                    ),
                    const SizedBox(height: 12),
                    _AuthButton(
                      backgroundColor: Colors.white,
                      foregroundColor: SplashColors.purpleMid,
                      borderColor: SplashColors.purpleMid.withValues(
                        alpha: 0.55,
                      ),
                      icon: Icons.mail_outline_rounded,
                      label: l10n.auth_continue_with_email,
                      onPressed: isBusy
                          ? null
                          : () {
                              context.push(
                                AppRoutes.emailRegistration,
                                extra: AuthRouteArgs(userType: userType),
                              );
                            },
                    ),
                    if (state.errorMessage.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: AuthScreen._error,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconWidget,
    this.isLoading = false,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Widget? iconWidget;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: backgroundColor.withValues(alpha: 0.7),
          disabledForegroundColor: foregroundColor.withValues(alpha: 0.7),
          side: BorderSide(color: borderColor, width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: foregroundColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconWidget != null)
                    iconWidget!
                  else if (icon != null)
                    Icon(icon, size: 22, color: foregroundColor),
                  const SizedBox(width: 10),
                  Text(label),
                ],
              ),
      ),
    );
  }
}

class _GoogleMark extends StatelessWidget {
  const _GoogleMark();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 22,
      child: CustomPaint(painter: _GoogleGPainter()),
    );
  }
}

class _GoogleGPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(2, 2, size.width - 4, size.height - 4);
    stroke.color = const Color(0xFF4285F4);
    canvas.drawArc(rect, -0.4, 1.6, false, stroke);
    stroke.color = const Color(0xFF34A853);
    canvas.drawArc(rect, 1.2, 1.2, false, stroke);
    stroke.color = const Color(0xFFFBBC05);
    canvas.drawArc(rect, 2.4, 0.9, false, stroke);
    stroke.color = const Color(0xFFEA4335);
    canvas.drawArc(rect, 3.3, 1.2, false, stroke);

    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.5),
      Offset(size.width - 2, size.height * 0.5),
      Paint()
        ..color = const Color(0xFF4285F4)
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
