import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Opens the Change Password screen.
Future<void> openListenerChangePasswordScreen(BuildContext context) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(builder: (_) => const ListenerChangePasswordScreen()),
  );
}

class ListenerChangePasswordScreen extends StatefulWidget {
  const ListenerChangePasswordScreen({super.key});

  @override
  State<ListenerChangePasswordScreen> createState() =>
      _ListenerChangePasswordScreenState();
}

class _ListenerChangePasswordScreenState
    extends State<ListenerChangePasswordScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  final _currentFocus = FocusNode();
  final _newFocus = FocusNode();
  final _confirmFocus = FocusNode();

  var _obscureCurrent = true;
  var _obscureNew = true;
  var _obscureConfirm = true;
  var _submitted = false;

  @override
  void initState() {
    super.initState();
    for (final controller in [
      _currentController,
      _newController,
      _confirmController,
    ]) {
      controller.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    _currentFocus.dispose();
    _newFocus.dispose();
    _confirmFocus.dispose();
    super.dispose();
  }

  bool get _hasMinLength => _newController.text.length >= 8;

  bool get _hasNumber => RegExp(r'\d').hasMatch(_newController.text);

  bool get _hasSymbol => RegExp(
    r'[!@#$%^&*(),.?":{}|<>_\-+=\[\]\\;/`]',
  ).hasMatch(_newController.text);

  bool get _newPasswordValid => _hasMinLength && _hasNumber && _hasSymbol;

  bool get _passwordsMatch =>
      _newController.text.isNotEmpty &&
      _newController.text == _confirmController.text;

  bool get _canSubmit =>
      _currentController.text.isNotEmpty &&
      _newPasswordValid &&
      _passwordsMatch &&
      _currentController.text != _newController.text;

  String? get _currentError {
    if (!_submitted) return null;
    if (_currentController.text.isEmpty) {
      return VentingMobLocalizations.of(
        context,
      ).listener_change_password_current_required;
    }
    return null;
  }

  String? get _newError {
    if (!_submitted) return null;
    if (!_newPasswordValid) {
      return VentingMobLocalizations.of(
        context,
      ).listener_change_password_rule_hint;
    }
    if (_currentController.text.isNotEmpty &&
        _currentController.text == _newController.text) {
      return VentingMobLocalizations.of(
        context,
      ).listener_change_password_same_as_current;
    }
    return null;
  }

  String? get _confirmError {
    if (!_submitted) return null;
    if (!_passwordsMatch) {
      return VentingMobLocalizations.of(
        context,
      ).listener_change_password_mismatch;
    }
    return null;
  }

  Future<void> _onUpdate() async {
    setState(() => _submitted = true);
    if (!_canSubmit) return;

    // TODO: Call change-password API with current + new password.
    if (!mounted) return;
    final l10n = VentingMobLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.change_password_success_message),
        behavior: SnackBarBehavior.floating,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundBottom,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: SplashColors.backgroundBottom,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
            color: Colors.white,
          ),
          title: Text(
            l10n.account_tab_change_password,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                  children: [
                    _PasswordField(
                      label: l10n.listener_change_password_current_label,
                      hint: l10n.listener_change_password_current_hint,
                      controller: _currentController,
                      focusNode: _currentFocus,
                      obscureText: _obscureCurrent,
                      textInputAction: TextInputAction.next,
                      errorText: _currentError,
                      onToggleObscure: () {
                        setState(() => _obscureCurrent = !_obscureCurrent);
                      },
                      onSubmitted: (_) => _newFocus.requestFocus(),
                    ),
                    const SizedBox(height: 20),
                    _PasswordField(
                      label: l10n.listener_change_password_new_label,
                      hint: l10n.listener_change_password_new_hint,
                      controller: _newController,
                      focusNode: _newFocus,
                      obscureText: _obscureNew,
                      textInputAction: TextInputAction.next,
                      errorText: _newError,
                      helperText: l10n.listener_change_password_rule_hint,
                      onToggleObscure: () {
                        setState(() => _obscureNew = !_obscureNew);
                      },
                      onSubmitted: (_) => _confirmFocus.requestFocus(),
                    ),
                    const SizedBox(height: 20),
                    _PasswordField(
                      label: l10n.listener_change_password_confirm_label,
                      hint: l10n.listener_change_password_confirm_hint,
                      controller: _confirmController,
                      focusNode: _confirmFocus,
                      obscureText: _obscureConfirm,
                      textInputAction: TextInputAction.done,
                      errorText: _confirmError,
                      onToggleObscure: () {
                        setState(() => _obscureConfirm = !_obscureConfirm);
                      },
                      onSubmitted: (_) => _onUpdate(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton(
                    onPressed: _onUpdate,
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text(l10n.listener_change_password_update),
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

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.focusNode,
    required this.obscureText,
    required this.onToggleObscure,
    required this.textInputAction,
    this.helperText,
    this.errorText,
    this.onSubmitted,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;
  final VoidCallback onToggleObscure;
  final TextInputAction textInputAction;
  final String? helperText;
  final String? errorText;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: SplashColors.purpleMid,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: ListenerProfileTheme.muted.withValues(alpha: 0.75),
              fontSize: 15,
            ),
            filled: true,
            fillColor: const Color(0xFF14101C),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 16,
            ),
            suffixIcon: IconButton(
              onPressed: onToggleObscure,
              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: ListenerProfileTheme.muted,
                size: 22,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: hasError
                    ? const Color(0xFFEF4444).withValues(alpha: 0.7)
                    : ListenerProfileTheme.cardBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: hasError
                    ? const Color(0xFFEF4444)
                    : SplashColors.purpleMid.withValues(alpha: 0.85),
                width: 1.4,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFEF4444)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFEF4444),
                width: 1.4,
              ),
            ),
          ),
        ),
        if (helperText != null && errorText == null) ...[
          const SizedBox(height: 8),
          Text(
            helperText!,
            style: GoogleFonts.inter(
              color: ListenerProfileTheme.muted,
              fontSize: 12,
              height: 1.3,
            ),
          ),
        ],
        if (errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            errorText!,
            style: GoogleFonts.inter(
              color: const Color(0xFFEF4444),
              fontSize: 12,
              height: 1.3,
            ),
          ),
        ],
      ],
    );
  }
}
