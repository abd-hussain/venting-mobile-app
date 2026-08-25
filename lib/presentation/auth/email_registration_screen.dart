import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/auth/auth_destination.dart';
import 'package:venting_mobile_app/presentation/auth/auth_navigation.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';
import 'package:venting_mobile_app/presentation/auth/bloc/email_registration_bloc.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/app_language_selector.dart';

/// Email auth form for ventor / listener (sign-in or create account).
class EmailRegistrationScreen extends StatelessWidget {
  const EmailRegistrationScreen({super.key, required this.userType});

  final AuthUserType userType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => diContainer<EmailRegistrationBloc>(param1: userType),
      child: _EmailRegistrationView(userType: userType),
    );
  }
}

class _EmailRegistrationView extends StatefulWidget {
  const _EmailRegistrationView({required this.userType});

  final AuthUserType userType;

  @override
  State<_EmailRegistrationView> createState() => _EmailRegistrationViewState();
}

class _EmailRegistrationViewState extends State<_EmailRegistrationView> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const _titleColor = Color(0xFF1A1228);
  static const _bodyColor = Color(0xFF6B6280);
  static const _success = Color(0xFF22C55E);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _obscurePassword = true;
  bool _submitted = false;
  bool _emailEditingComplete = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onEmailTextChanged);
    _passwordController.addListener(_onChanged);
    _emailFocus.addListener(_onEmailFocusChanged);
  }

  @override
  void dispose() {
    _emailFocus.removeListener(_onEmailFocusChanged);
    _emailController.removeListener(_onEmailTextChanged);
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _onChanged() => setState(() {});

  void _onEmailTextChanged() {
    if (_passwordController.text.isNotEmpty) {
      _passwordController.clear();
    }
    setState(() {});
    context.read<EmailRegistrationBloc>().add(
      EmailRegistrationEvent.emailChanged(email: _emailController.text),
    );
  }

  void _onEmailFocusChanged() {
    if (_emailFocus.hasFocus) {
      if (_emailEditingComplete) {
        setState(() => _emailEditingComplete = false);
      }
      return;
    }
    // Disabling the field while checking also unfocuses — don't re-fire.
    if (context.read<EmailRegistrationBloc>().state.isCheckingEmail) {
      return;
    }
    _markEmailEditingCompleteAndCheck();
  }

  void _markEmailEditingCompleteAndCheck() {
    if (!_emailEditingComplete) {
      setState(() => _emailEditingComplete = true);
    }
    if (_isEmailValid) {
      context.read<EmailRegistrationBloc>().add(
        EmailRegistrationEvent.checkEmail(email: _emailController.text),
      );
    }
  }

  bool get _hasMinLength => _passwordController.text.length >= 8;
  bool get _hasUppercase => RegExp('[A-Z]').hasMatch(_passwordController.text);
  bool get _hasNumber => RegExp('[0-9]').hasMatch(_passwordController.text);

  bool get _isEmailValid {
    final email = _emailController.text.trim();
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);
  }

  bool _isPasswordStepReady(EmailRegistrationState blocState) =>
      !blocState.isCheckingEmail &&
      blocState.errorMessage.isEmpty &&
      blocState.authMode != EmailAuthMode.unknown;

  bool _showPasswordComplexity(EmailRegistrationState blocState) {
    if (!_isPasswordStepReady(blocState)) return false;
    return blocState.authMode == EmailAuthMode.register;
  }

  bool _isPasswordValid(EmailRegistrationState blocState) {
    if (!_showPasswordComplexity(blocState)) {
      return _passwordController.text.isNotEmpty;
    }
    return _hasMinLength && _hasUppercase && _hasNumber;
  }

  bool _canSubmit(EmailRegistrationState blocState) {
    if (!_isEmailValid || !_isPasswordValid(blocState)) {
      return false;
    }
    if (blocState.isCheckingEmail || blocState.isSubmitting) {
      return false;
    }
    if (blocState.errorMessage.isNotEmpty) {
      return false;
    }
    return blocState.authMode != EmailAuthMode.unknown;
  }

  ({String title, String subtitle, String passwordHint}) _copy(
    VentingMobLocalizations l10n,
  ) {
    final subtitle = switch (widget.userType) {
      AuthUserType.ventor => l10n.email_registration_ventor_subtitle,
      AuthUserType.lissener => l10n.email_registration_listener_subtitle,
    };

    return (
      title: l10n.email_registration_title,
      subtitle: subtitle,
      passwordHint: l10n.email_registration_password_hint,
    );
  }

  String _buttonLabel(
    VentingMobLocalizations l10n,
    EmailRegistrationState blocState,
  ) {
    if (blocState.isCheckingEmail) {
      return l10n.email_registration_checking_email;
    }
    return switch (blocState.authMode) {
      EmailAuthMode.login => l10n.email_registration_sign_in,
      EmailAuthMode.register ||
      EmailAuthMode.unknown => l10n.email_registration_create_account,
    };
  }

  void _onSubmit(EmailRegistrationState blocState) {
    setState(() => _submitted = true);
    if (!_canSubmit(blocState)) return;

    context.read<EmailRegistrationBloc>().add(
      EmailRegistrationEvent.submit(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  void _navigateToDestination(AuthDestination destination) {
    navigateToAuthDestination(context, destination);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final copy = _copy(l10n);
    final showEmailFormatError =
        _submitted && _emailController.text.isNotEmpty && !_isEmailValid;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<EmailRegistrationBloc, EmailRegistrationState>(
            listenWhen: (previous, current) =>
                (current.destination != null &&
                    previous.destination != current.destination) ||
                (!_isPasswordStepReady(previous) &&
                    _isPasswordStepReady(current)),
            listener: (context, blocState) {
              final destination = blocState.destination;
              if (destination != null) {
                _navigateToDestination(destination);
                return;
              }
              if (!_isPasswordStepReady(blocState)) return;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted || !_isPasswordStepReady(blocState)) return;
                _passwordFocus.requestFocus();
              });
            },
            builder: (context, blocState) {
              final apiError = blocState.errorMessage.isNotEmpty
                  ? blocState.errorMessage
                  : null;
              final emailError = showEmailFormatError
                  ? l10n.email_registration_invalid_email
                  : apiError;
              final passwordError = blocState.submitErrorMessage.isNotEmpty
                  ? blocState.submitErrorMessage
                  : null;
              final fieldsEnabled =
                  !blocState.isCheckingEmail && !blocState.isSubmitting;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: _titleColor,
                          ),
                        ),
                        const Spacer(),
                        const AppLanguageSelector(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            copy.title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: _titleColor,
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
                              color: _bodyColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 32),
                          _FieldLabel(
                            label: l10n.email_registration_email_label,
                          ),
                          const SizedBox(height: 8),
                          _AuthTextField(
                            controller: _emailController,
                            focusNode: _emailFocus,
                            hint: l10n.email_registration_email_hint,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            enabled: fieldsEnabled,
                            onSubmitted: (_) {
                              _markEmailEditingCompleteAndCheck();
                            },
                            errorText: emailError,
                            suffix: blocState.isCheckingEmail
                                ? const Padding(
                                    padding: EdgeInsets.all(14),
                                    child: SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          if (_isPasswordStepReady(blocState)) ...[
                            const SizedBox(height: 20),
                            _FieldLabel(
                              label: l10n.email_registration_password_label,
                            ),
                            const SizedBox(height: 8),
                            _AuthTextField(
                              controller: _passwordController,
                              focusNode: _passwordFocus,
                              hint: copy.passwordHint,
                              obscureText: _obscurePassword,
                              textInputAction: TextInputAction.done,
                              onSubmitted: (_) => _onSubmit(blocState),
                              errorText: passwordError,
                              suffix: IconButton(
                                onPressed: fieldsEnabled
                                    ? () {
                                        setState(
                                          () => _obscurePassword =
                                              !_obscurePassword,
                                        );
                                      }
                                    : null,
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: _bodyColor,
                                  size: 22,
                                ),
                              ),
                            ),
                            if (_showPasswordComplexity(blocState)) ...[
                              const SizedBox(height: 16),
                              Text(
                                l10n.email_registration_password_must_contain,
                                style: GoogleFonts.inter(
                                  color: _titleColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              _PasswordRule(
                                label: l10n.email_registration_rule_min_length,
                                met: _hasMinLength,
                                successColor: _success,
                              ),
                              const SizedBox(height: 8),
                              _PasswordRule(
                                label: l10n.email_registration_rule_uppercase,
                                met: _hasUppercase,
                                successColor: _success,
                              ),
                              const SizedBox(height: 8),
                              _PasswordRule(
                                label: l10n.email_registration_rule_number,
                                met: _hasNumber,
                                successColor: _success,
                              ),
                            ],
                          ],
                          const SizedBox(height: 28),
                          SizedBox(
                            height: 54,
                            child: FilledButton(
                              onPressed: _canSubmit(blocState)
                                  ? () => _onSubmit(blocState)
                                  : null,
                              style: FilledButton.styleFrom(
                                backgroundColor: SplashColors.purpleMid,
                                disabledBackgroundColor: SplashColors.purpleMid
                                    .withValues(alpha: 0.35),
                                foregroundColor: Colors.white,
                                disabledForegroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                textStyle: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              child: blocState.isSubmitting
                                  ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.4,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(_buttonLabel(l10n, blocState)),
                            ),
                          ),
                          const SizedBox(height: 28),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.inter(
        color: const Color(0xFF1A1228),
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _AuthTextField extends StatelessWidget {
  const _AuthTextField({
    required this.controller,
    required this.focusNode,
    required this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.suffix,
    this.errorText,
    this.enabled = true,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final Widget? suffix;
  final String? errorText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          style: GoogleFonts.inter(
            color: const Color(0xFF1A1228),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: SplashColors.purpleMid,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: const Color(0xFF9B93AB),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            suffixIcon: suffix,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: errorText != null
                    ? const Color(0xFFE11D48)
                    : const Color(0xFFE4DCEF),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFE4DCEF)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: errorText != null
                    ? const Color(0xFFE11D48)
                    : SplashColors.purpleMid,
                width: 1.4,
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 6),
          Text(
            errorText!,
            style: GoogleFonts.inter(
              color: const Color(0xFFE11D48),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}

class _PasswordRule extends StatelessWidget {
  const _PasswordRule({
    required this.label,
    required this.met,
    required this.successColor,
  });

  final String label;
  final bool met;
  final Color successColor;

  @override
  Widget build(BuildContext context) {
    final color = met ? successColor : const Color(0xFF9B93AB);

    return Row(
      children: [
        Icon(
          met ? Icons.check_circle_rounded : Icons.radio_button_unchecked,
          size: 18,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
