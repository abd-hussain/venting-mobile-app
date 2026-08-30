import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';
import 'package:venting_mobile_app/presentation/auth/bloc/forgot_password_bloc.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/app_language_selector.dart';

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({required this.email, required this.userType});

  final String email;
  final AuthUserType userType;
}

/// Confirms the user wants a password-reset email, then calls `#2b`.
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({
    super.key,
    required this.email,
    required this.userType,
  });

  final String email;
  final AuthUserType userType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => diContainer<ForgotPasswordBloc>(
        param1: ForgotPasswordRouteArgs(email: email, userType: userType),
      ),
      child: const _ForgotPasswordView(),
    );
  }
}

class _ForgotPasswordView extends StatelessWidget {
  const _ForgotPasswordView();

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const _accent = Color(0xFF8A3CFE);
  static const _backFill = Color(0xFF1C1826);

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
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
            child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                      child: Row(
                        children: [
                          Material(
                            color: _backFill,
                            shape: const CircleBorder(),
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: state.isSubmitting
                                  ? null
                                  : () => context.pop(),
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
                          const Spacer(),
                          const AppLanguageSelector(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                        child: state.emailSent
                            ? _SuccessContent(email: state.email)
                            : _ConfirmContent(
                                email: state.email,
                                isSubmitting: state.isSubmitting,
                                errorMessage: state.errorMessage,
                                onContinue: () => context
                                    .read<ForgotPasswordBloc>()
                                    .add(const ForgotPasswordEvent.submit()),
                              ),
                      ),
                    ),
                    if (state.emailSent)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                        child: SizedBox(
                          height: 54,
                          child: FilledButton(
                            onPressed: () => context.pop(),
                            style: FilledButton.styleFrom(
                              backgroundColor: _accent,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: const StadiumBorder(),
                              textStyle: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            child: Text(l10n.forgot_password_back_to_sign_in),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ConfirmContent extends StatelessWidget {
  const _ConfirmContent({
    required this.email,
    required this.isSubmitting,
    required this.errorMessage,
    required this.onContinue,
  });

  final String email;
  final bool isSubmitting;
  final String errorMessage;
  final VoidCallback onContinue;

  static const _accent = Color(0xFF8A3CFE);
  static const _muted = Color(0xFF9B93AB);
  static const _fieldFill = Color(0xFF12101A);

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.forgot_password_title,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          l10n.forgot_password_subtitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: _muted,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          l10n.email_registration_email_label,
          style: GoogleFonts.inter(
            color: const Color(0xFFB7AECA),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: _fieldFill,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _accent, width: 1.2),
          ),
          child: Text(
            email,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (errorMessage.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(
            errorMessage,
            style: GoogleFonts.inter(
              color: const Color(0xFFF87171),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
        const SizedBox(height: 28),
        SizedBox(
          height: 54,
          child: FilledButton(
            onPressed: isSubmitting ? null : onContinue,
            style: FilledButton.styleFrom(
              backgroundColor: _accent,
              disabledBackgroundColor: _accent.withValues(alpha: 0.35),
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.white,
              elevation: 0,
              shape: const StadiumBorder(),
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
                : Text(l10n.forgot_password_continue),
          ),
        ),
      ],
    );
  }
}

class _SuccessContent extends StatelessWidget {
  const _SuccessContent({required this.email});

  final String email;

  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Container(
          width: 72,
          height: 72,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _accent.withValues(alpha: 0.18),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.mark_email_read_outlined,
            color: _accent,
            size: 34,
          ),
        ),
        const SizedBox(height: 28),
        Text(
          l10n.forgot_password_sent_title,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          l10n.forgot_password_sent_body(email),
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: _muted,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}
