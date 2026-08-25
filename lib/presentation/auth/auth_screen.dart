import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/auth/auth_navigation.dart';
import 'package:venting_mobile_app/presentation/auth/bloc/auth_bloc.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/app_webview_screen.dart';
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
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const _muted = Color(0xFF9B93AB);
  static const _socialFill = Color(0xFF16121F);
  static const _socialBorder = Color(0xFF2A2438);
  static const _backFill = Color(0xFF1C1826);
  static const _error = Color(0xFFF87171);

  String _subtitle(VentingMobLocalizations l10n) {
    return switch (userType) {
      AuthUserType.ventor => l10n.auth_ventor_subtitle,
      AuthUserType.lissener => l10n.auth_listener_subtitle,
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => diContainer<AuthBloc>(param1: userType),
      child: _AuthView(userType: userType, subtitleBuilder: _subtitle),
    );
  }
}

class _AuthView extends StatelessWidget {
  const _AuthView({required this.userType, required this.subtitleBuilder});

  final AuthUserType userType;
  final String Function(VentingMobLocalizations l10n) subtitleBuilder;

  void _openTerms(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final config = diContainer<AppConfig>();
    context.push(
      AppRoutes.webView,
      extra: AppWebViewArgs(
        title: l10n.listener_reg_terms,
        url: config.termsOfServiceUrl,
      ),
    );
  }

  void _openPrivacy(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final config = diContainer<AppConfig>();
    context.push(
      AppRoutes.webView,
      extra: AppWebViewArgs(
        title: l10n.listener_reg_privacy,
        url: config.privacyPolicyUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final subtitle = subtitleBuilder(l10n);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AuthScreen._overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundTop,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                SplashColors.backgroundTop,
                SplashColors.backgroundBottom,
              ],
            ),
          ),
          child: SafeArea(
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
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Material(
                          color: AuthScreen._backFill,
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: isBusy
                                ? null
                                : () => context.go(AppRoutes.welcome),
                            child: const SizedBox(
                              width: 42,
                              height: 42,
                              child: Icon(
                                Icons.arrow_back_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                      const _VentingBrandHeader(),
                      const SizedBox(height: 12),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: AuthScreen._muted,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 36),
                      _AuthButton(
                        backgroundColor: AuthScreen._socialFill,
                        foregroundColor: Colors.white,
                        borderColor: AuthScreen._socialBorder,
                        iconAsset: 'assets/images/sign_apple_icon.svg',
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
                        backgroundColor: AuthScreen._socialFill,
                        foregroundColor: Colors.white,
                        borderColor: AuthScreen._socialBorder,
                        iconAsset: 'assets/images/sign_google_icon.svg',
                        label: l10n.auth_continue_with_google,
                        isLoading: state.isLoadingGoogle,
                        onPressed: isBusy
                            ? null
                            : () => context.read<AuthBloc>().add(
                                const AuthEvent.signInWithGoogle(),
                              ),
                      ),
                      const SizedBox(height: 20),
                      _OrDivider(label: l10n.auth_or_divider),
                      const SizedBox(height: 20),
                      _AuthButton(
                        backgroundColor: SplashColors.purpleMid,
                        foregroundColor: Colors.white,
                        borderColor: SplashColors.purpleMid,
                        iconAsset: 'assets/images/sign_email_icon.svg',
                        label: l10n.auth_continue_with_email,
                        filled: true,
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
                      const Spacer(flex: 3),
                      Text(
                        l10n.welcome_anonymous_footer,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: AuthScreen._muted.withValues(alpha: 0.9),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          _LegalLink(
                            label: l10n.listener_reg_terms,
                            onTap: isBusy ? null : () => _openTerms(context),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              '·',
                              style: GoogleFonts.inter(
                                color: SplashColors.purpleMid,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          _LegalLink(
                            label: l10n.listener_reg_privacy,
                            onTap: isBusy ? null : () => _openPrivacy(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _VentingBrandHeader extends StatelessWidget {
  const _VentingBrandHeader();

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.inter(
      fontSize: 40,
      fontWeight: FontWeight.w800,
      height: 1,
      letterSpacing: 1.2,
    );

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'VENT',
            style: base.copyWith(color: Colors.white),
          ),
          TextSpan(
            text: 'ING',
            style: base.copyWith(color: SplashColors.purpleMid),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final line = Expanded(
      child: Container(height: 1, color: Colors.white.withValues(alpha: 0.1)),
    );

    return Row(
      children: [
        line,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: AuthScreen._muted,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.6,
            ),
          ),
        ),
        line,
      ],
    );
  }
}

class _LegalLink extends StatelessWidget {
  const _LegalLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: SplashColors.purpleMid,
          fontSize: 13,
          fontWeight: FontWeight.w600,
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
    required this.iconAsset,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.filled = false,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final String iconAsset;
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    );
    final textStyle = GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );

    final child = isLoading
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
              SvgPicture.asset(iconAsset, width: 22, height: 22),
              const SizedBox(width: 10),
              Text(label),
            ],
          );

    return SizedBox(
      height: 54,
      width: double.infinity,
      child: filled
          ? FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                disabledBackgroundColor: backgroundColor.withValues(
                  alpha: 0.45,
                ),
                disabledForegroundColor: foregroundColor.withValues(alpha: 0.7),
                elevation: 0,
                shape: shape,
                textStyle: textStyle,
              ),
              child: child,
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                disabledBackgroundColor: backgroundColor.withValues(alpha: 0.7),
                disabledForegroundColor: foregroundColor.withValues(alpha: 0.7),
                side: BorderSide(color: borderColor, width: 1.2),
                shape: shape,
                textStyle: textStyle,
              ),
              child: child,
            ),
    );
  }
}
