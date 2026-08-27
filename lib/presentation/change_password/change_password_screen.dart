import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/change_password/bloc/change_password_bloc.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Opens the shared Change Password screen (ventor + listener).
Future<void> openChangePasswordScreen(BuildContext context) {
  return Navigator.of(
    context,
  ).push<void>(MaterialPageRoute(builder: (_) => const ChangePasswordScreen()));
}

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => diContainer<ChangePasswordBloc>(),
      child: const _ChangePasswordView(),
    );
  }
}

class _ChangePasswordView extends StatefulWidget {
  const _ChangePasswordView();

  @override
  State<_ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<_ChangePasswordView> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const _muted = Color(0xFF9B93AB);
  static const _cardBorder = Color(0xFF2A2238);
  static const _fieldFill = Color(0xFF14101C);
  static const _error = Color(0xFFEF4444);

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
      controller.addListener(() {
        if (mounted) setState(() {});
      });
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

  bool _canSubmit(bool isSubmitting) =>
      !isSubmitting &&
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

  void _onUpdate({required bool isSubmitting}) {
    setState(() => _submitted = true);
    if (!_canSubmit(isSubmitting)) return;

    FocusManager.instance.primaryFocus?.unfocus();

    context.read<ChangePasswordBloc>().add(
      ChangePasswordEvent.submit(
        currentPassword: _currentController.text,
        newPassword: _newController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        listenWhen: (previous, current) =>
            previous.status != current.status &&
            current.status == ChangePasswordStatus.success,
        listener: (context, state) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(l10n.change_password_success_message),
                behavior: SnackBarBehavior.floating,
              ),
            );
          Navigator.of(context).pop();
        },
        builder: (context, state) {
          final isSubmitting = state.isSubmitting;

          return Scaffold(
            backgroundColor: SplashColors.backgroundBottom,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: SplashColors.backgroundBottom,
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              leading: IconButton(
                onPressed: isSubmitting
                    ? null
                    : () => Navigator.of(context).pop(),
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
                          enabled: !isSubmitting,
                          textInputAction: TextInputAction.next,
                          errorText: _currentError,
                          muted: _muted,
                          cardBorder: _cardBorder,
                          fieldFill: _fieldFill,
                          errorColor: _error,
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
                          enabled: !isSubmitting,
                          textInputAction: TextInputAction.next,
                          errorText: _newError,
                          helperText: l10n.listener_change_password_rule_hint,
                          muted: _muted,
                          cardBorder: _cardBorder,
                          fieldFill: _fieldFill,
                          errorColor: _error,
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
                          enabled: !isSubmitting,
                          textInputAction: TextInputAction.done,
                          errorText: _confirmError,
                          muted: _muted,
                          cardBorder: _cardBorder,
                          fieldFill: _fieldFill,
                          errorColor: _error,
                          onToggleObscure: () {
                            setState(() => _obscureConfirm = !_obscureConfirm);
                          },
                          // Do not auto-submit here — unfocus + submit can
                          // re-enter and queue endless API calls.
                          onSubmitted: (_) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                        ),
                        if (state.isFailure &&
                            state.errorMessage.isNotEmpty) ...[
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
                              style: GoogleFonts.inter(
                                color: _error,
                                fontSize: 13,
                                height: 1.35,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: FilledButton(
                        onPressed: isSubmitting
                            ? null
                            : () => _onUpdate(isSubmitting: isSubmitting),
                        style: FilledButton.styleFrom(
                          backgroundColor: SplashColors.purpleMid,
                          disabledBackgroundColor: SplashColors.purpleMid
                              .withValues(alpha: 0.42),
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
                            : Text(l10n.listener_change_password_update),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
    required this.muted,
    required this.cardBorder,
    required this.fieldFill,
    required this.errorColor,
    this.enabled = true,
    this.helperText,
    this.errorText,
    this.onSubmitted,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;
  final bool enabled;
  final VoidCallback onToggleObscure;
  final TextInputAction textInputAction;
  final Color muted;
  final Color cardBorder;
  final Color fieldFill;
  final Color errorColor;
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
          enabled: enabled,
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
              color: muted.withValues(alpha: 0.75),
              fontSize: 15,
            ),
            filled: true,
            fillColor: fieldFill,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 16,
            ),
            suffixIcon: IconButton(
              onPressed: enabled ? onToggleObscure : null,
              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: muted,
                size: 22,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: hasError
                    ? errorColor.withValues(alpha: 0.7)
                    : cardBorder,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: cardBorder.withValues(alpha: 0.6)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: hasError
                    ? errorColor
                    : SplashColors.purpleMid.withValues(alpha: 0.85),
                width: 1.4,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: errorColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: errorColor, width: 1.4),
            ),
          ),
        ),
        if (helperText != null && errorText == null) ...[
          const SizedBox(height: 8),
          Text(
            helperText!,
            style: GoogleFonts.inter(color: muted, fontSize: 12, height: 1.3),
          ),
        ],
        if (errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            errorText!,
            style: GoogleFonts.inter(
              color: errorColor,
              fontSize: 12,
              height: 1.3,
            ),
          ),
        ],
      ],
    );
  }
}
