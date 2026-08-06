import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/phone_country_picker.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Step 1 — Create Account (full name, locked email, phone).
class ListenerRegistrationStep1CreateAccount extends StatefulWidget {
  const ListenerRegistrationStep1CreateAccount({
    super.key,
    required this.email,
    required this.onContinue,
  });

  final String email;
  final VoidCallback onContinue;

  @override
  State<ListenerRegistrationStep1CreateAccount> createState() =>
      _ListenerRegistrationStep1CreateAccountState();
}

class _ListenerRegistrationStep1CreateAccountState
    extends State<ListenerRegistrationStep1CreateAccount> {
  static const _fieldFill = Color(0xFF1A1428);
  static const _fieldBorder = Color(0xFF2A2238);
  static const _muted = Color(0xFF9B93AB);
  static const _label = Color(0xFFC8C0D8);
  static const _disabledFill = Color(0xFF14101C);

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();

  IsoCode _country = IsoCode.JO;
  bool _agreedToTerms = false;
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
    for (final c in [_nameController, _phoneController]) {
      c.addListener(_onChanged);
    }
  }

  @override
  void dispose() {
    for (final c in [_nameController, _emailController, _phoneController]) {
      c.dispose();
    }
    for (final f in [_nameFocus, _phoneFocus]) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged() => setState(() {});

  String get _nationalNumber =>
      _phoneController.text.replaceAll(RegExp(r'\D'), '');

  ({int min, int max}) get _phoneLimits => phoneNationalDigitLimits(_country);

  bool get _isPhoneValid {
    final national = _nationalNumber;
    final limits = _phoneLimits;
    if (national.length < limits.min || national.length > limits.max) {
      return false;
    }
    try {
      final phone = PhoneNumber.parse(
        national,
        callerCountry: _country,
        destinationCountry: _country,
      );
      return phone.isValidLength() &&
          (phone.isValid() || phone.isValid(type: PhoneNumberType.mobile));
    } catch (_) {
      final phone = PhoneNumber(isoCode: _country, nsn: national);
      return phone.isValidLength() && phone.isValid();
    }
  }

  bool get _canContinue =>
      _nameController.text.trim().isNotEmpty &&
      widget.email.trim().isNotEmpty &&
      _isPhoneValid &&
      _agreedToTerms;

  void _applyCountry(IsoCode country) {
    _phoneController.clear();
    setState(() {
      _country = country;
      _submitted = false;
    });
  }

  Future<void> _pickCountry() async {
    final selected = await showPhoneCountryPicker(
      context: context,
      selected: _country,
    );
    if (selected == null || !mounted) return;
    _applyCountry(selected);
  }

  void _submit() {
    setState(() => _submitted = true);
    if (!_canContinue) return;
    widget.onContinue();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final dialCode = countryDialCode(_country);
    final showPhoneError = _submitted && !_isPhoneValid;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.listener_reg_step1_title,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            l10n.listener_reg_step1_subtitle,
                            style: GoogleFonts.inter(
                              color: Colors.white.withValues(alpha: 0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    const _ListenerAvatarBadge(),
                  ],
                ),
                const SizedBox(height: 28),
                _DarkField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  icon: Icons.person_outline_rounded,
                  hint: l10n.listener_reg_full_name,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => _phoneFocus.requestFocus(),
                  inputFormatters: [LengthLimitingTextInputFormatter(50)],
                  maxLength: 50,
                  fill: _fieldFill,
                  border: _fieldBorder,
                  muted: _muted,
                ),
                const SizedBox(height: 14),
                _DarkField(
                  controller: _emailController,
                  focusNode: FocusNode(canRequestFocus: false),
                  icon: Icons.mail_outline_rounded,
                  hint: l10n.listener_reg_email,
                  keyboardType: TextInputType.emailAddress,
                  enabled: false,
                  fill: _disabledFill,
                  border: _fieldBorder,
                  muted: _muted,
                ),
                const SizedBox(height: 14),
                _DarkField(
                  key: ValueKey('phone_${_country.name}'),
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  icon: Icons.phone_outlined,
                  hint: l10n.listener_reg_phone,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _submit(),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(_phoneLimits.max),
                  ],
                  fill: _fieldFill,
                  border: _fieldBorder,
                  muted: _muted,
                  errorText: showPhoneError
                      ? l10n.listener_reg_invalid_phone
                      : null,
                  prefix: InkWell(
                    onTap: _pickCountry,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            countryFlagEmoji(_country),
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '+$dialCode',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18,
                            color: _muted,
                          ),
                          Container(
                            width: 1,
                            height: 18,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: _fieldBorder,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _agreedToTerms,
                        onChanged: (v) {
                          setState(() => _agreedToTerms = v ?? false);
                        },
                        activeColor: SplashColors.purpleMid,
                        checkColor: Colors.white,
                        side: BorderSide(
                          color: _agreedToTerms
                              ? SplashColors.purpleMid
                              : _muted,
                          width: 1.4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          style: GoogleFonts.inter(
                            color: _label,
                            fontSize: 13,
                            height: 1.4,
                          ),
                          children: [
                            TextSpan(text: l10n.listener_reg_agree_prefix),
                            TextSpan(
                              text: l10n.listener_reg_terms,
                              style: GoogleFonts.inter(
                                color: SplashColors.purpleMid,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // TODO: open Terms of Service
                                },
                            ),
                            TextSpan(text: l10n.listener_reg_agree_and),
                            TextSpan(
                              text: l10n.listener_reg_privacy,
                              style: GoogleFonts.inter(
                                color: SplashColors.purpleMid,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // TODO: open Privacy Policy
                                },
                            ),
                            const TextSpan(text: '.'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 54,
                  child: FilledButton(
                    onPressed: _canContinue ? _submit : null,
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
                    child: Text(l10n.listener_reg_continue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ListenerAvatarBadge extends StatelessWidget {
  const _ListenerAvatarBadge();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      height: 88,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  SplashColors.purpleMid.withValues(alpha: 0.45),
                  SplashColors.purpleDeep.withValues(alpha: 0.9),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: SplashColors.purpleGlow.withValues(alpha: 0.35),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Icon(
              Icons.headset_mic_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: SplashColors.purpleMid,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chat_bubble_rounded,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DarkField extends StatelessWidget {
  const _DarkField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.icon,
    required this.hint,
    required this.fill,
    required this.border,
    required this.muted,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.inputFormatters,
    this.maxLength,
    this.prefix,
    this.errorText,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final IconData icon;
  final String hint;
  final Color fill;
  final Color border;
  final Color muted;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Widget? prefix;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          buildCounter: maxLength == null
              ? null
              : (
                  context, {
                  required currentLength,
                  required isFocused,
                  required maxLength,
                }) => null,
          style: GoogleFonts.inter(
            color: enabled ? Colors.white : muted,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: SplashColors.purpleMid,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: muted,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: fill,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 16,
            ),
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 14),
                Icon(icon, size: 22, color: muted),
                const SizedBox(width: 10),
                if (prefix != null) prefix!,
              ],
            ),
            prefixIconConstraints: const BoxConstraints(),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: hasError ? const Color(0xFFE11D48) : border,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: hasError
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
