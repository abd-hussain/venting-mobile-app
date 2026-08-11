import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';
import 'package:venting_mobile_app/presentation/homescreen.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_screen.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/presentation/ventor_registration/ventor_registration_screen.dart';
import 'package:venting_mobile_app/shared_widgets/app_language_selector.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

/// Email auth form for sign-in or registration (ventor / listener).
class EmailRegistrationScreen extends StatefulWidget {
  const EmailRegistrationScreen({
    super.key,
    required this.userType,
    required this.authType,
  });

  final AuthUserType userType;
  final AuthType authType;

  @override
  State<EmailRegistrationScreen> createState() =>
      _EmailRegistrationScreenState();
}

class _EmailRegistrationScreenState extends State<EmailRegistrationScreen> {
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

  bool get _isLogin =>
      widget.authType == AuthType.login ||
      widget.userType == AuthUserType.unknown;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onChanged);
    _passwordController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _onChanged() => setState(() {});

  bool get _hasMinLength => _passwordController.text.length >= 8;
  bool get _hasUppercase => RegExp('[A-Z]').hasMatch(_passwordController.text);
  bool get _hasNumber => RegExp('[0-9]').hasMatch(_passwordController.text);

  bool get _isPasswordValid {
    if (_isLogin) {
      return _passwordController.text.isNotEmpty;
    }
    return _hasMinLength && _hasUppercase && _hasNumber;
  }

  bool get _isEmailValid {
    final email = _emailController.text.trim();
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);
  }

  bool get _canSubmit => _isEmailValid && _isPasswordValid;

  ({String title, String subtitle, String passwordHint, String button}) _copy(
    VentingMobLocalizations l10n,
  ) {
    if (_isLogin) {
      return (
        title: l10n.email_sign_in_title,
        subtitle: l10n.email_sign_in_subtitle,
        passwordHint: l10n.email_sign_in_password_hint,
        button: l10n.email_sign_in_button,
      );
    }

    final subtitle = switch (widget.userType) {
      AuthUserType.ventor => l10n.email_registration_ventor_subtitle,
      AuthUserType.lissener => l10n.email_registration_listener_subtitle,
      AuthUserType.unknown => l10n.email_registration_subtitle,
    };

    return (
      title: l10n.email_registration_title,
      subtitle: subtitle,
      passwordHint: l10n.email_registration_password_hint,
      button: l10n.email_registration_create_account,
    );
  }

  void _onSubmit() {
    setState(() => _submitted = true);
    if (!_canSubmit) return;

    if (widget.authType == AuthType.register) {
      if (widget.userType == AuthUserType.lissener) {
        context.push(
          AppRoutes.listenerRegistration,
          extra: ListenerRegistrationArgs(email: _emailController.text.trim()),
        );
        return;
      }
      if (widget.userType == AuthUserType.ventor) {
        context.push(
          AppRoutes.ventorRegistration,
          extra: VentorRegistrationArgs(email: _emailController.text.trim()),
        );
        return;
      }
    }

    if (_isLogin) {
      // TODO(temp-mock): remove when real email/password sign-in API exists.
      // Temporary role shortcuts for local testing:
      //   v@v.com → ventor home
      //   l@l.com → listener home
      final email = _emailController.text.trim().toLowerCase();
      final mockRole = switch (email) {
        'v@v.com' => AuthUserType.ventor,
        'l@l.com' => AuthUserType.lissener,
        _ => null,
      };
      if (mockRole != null) {
        context.go(
          AppRoutes.tabHome,
          extra: HomeScreenArgs(userType: mockRole),
        );
        return;
      }
    }

    // TODO: call sign-in or register API based on authType / userType
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final copy = _copy(l10n);
    final showEmailError =
        _submitted && _emailController.text.isNotEmpty && !_isEmailValid;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
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
                      _FieldLabel(label: l10n.email_registration_email_label),
                      const SizedBox(height: 8),
                      _AuthTextField(
                        controller: _emailController,
                        focusNode: _emailFocus,
                        hint: l10n.email_registration_email_hint,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) => _passwordFocus.requestFocus(),
                        errorText: showEmailError
                            ? l10n.email_registration_invalid_email
                            : null,
                      ),
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
                        onSubmitted: (_) => _onSubmit(),
                        suffix: IconButton(
                          onPressed: () {
                            setState(
                              () => _obscurePassword = !_obscurePassword,
                            );
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: _bodyColor,
                            size: 22,
                          ),
                        ),
                      ),
                      if (!_isLogin) ...[
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
                      const SizedBox(height: 28),
                      SizedBox(
                        height: 54,
                        child: FilledButton(
                          onPressed: _canSubmit ? _onSubmit : null,
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
                          child: Text(copy.button),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          focusNode: focusNode,
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
