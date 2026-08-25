import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/phone_country_picker.dart';
import 'package:venting_mobile_app/utils/legal_document_opener.dart';
import 'package:venting_mobile_app/utils/registration_media_storage.dart';
import 'package:venting_mobile_app/utils/static_web_content.dart';

/// Step 1 — Create Account (profile photo, full name, locked email, phone).
class ListenerRegistrationStep1CreateAccount extends StatefulWidget {
  const ListenerRegistrationStep1CreateAccount({
    super.key,
    required this.email,
    required this.onContinue,
    this.initialProfilePhotoPath,
    this.initialFullName = '',
    this.initialPhoneNational = '',
    this.initialPhoneCountry,
    this.initialAgreedToTerms = false,
  });

  final String email;
  final ValueChanged<ListenerRegistrationStep1Data> onContinue;
  final String? initialProfilePhotoPath;
  final String initialFullName;
  final String initialPhoneNational;
  final IsoCode? initialPhoneCountry;
  final bool initialAgreedToTerms;

  @override
  State<ListenerRegistrationStep1CreateAccount> createState() =>
      _ListenerRegistrationStep1CreateAccountState();
}

class _ListenerRegistrationStep1CreateAccountState
    extends State<ListenerRegistrationStep1CreateAccount> {
  static const _muted = Color(0xFF9B93AB);
  static const _label = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);
  static const _success = Color(0xFF22C55E);

  final _picker = ImagePicker();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  late final TapGestureRecognizer _termsRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  IsoCode _country = IsoCode.JO;
  String? _profilePhotoPath;
  bool _pickingPhoto = false;
  bool _agreedToTerms = false;
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
    _profilePhotoPath = widget.initialProfilePhotoPath;
    if (widget.initialFullName.isNotEmpty) {
      _nameController.text = widget.initialFullName;
    }
    if (widget.initialPhoneNational.isNotEmpty) {
      _phoneController.text = widget.initialPhoneNational;
    }
    if (widget.initialPhoneCountry != null) {
      _country = widget.initialPhoneCountry!;
    }
    _agreedToTerms = widget.initialAgreedToTerms;
    for (final c in [_nameController, _phoneController]) {
      c.addListener(_onChanged);
    }
    _termsRecognizer = TapGestureRecognizer()..onTap = _openTerms;
    _privacyRecognizer = TapGestureRecognizer()..onTap = _openPrivacy;
  }

  @override
  void dispose() {
    for (final c in [_nameController, _emailController, _phoneController]) {
      c.dispose();
    }
    for (final f in [_nameFocus, _phoneFocus]) {
      f.dispose();
    }
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
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
      _profilePhotoPath != null &&
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

  Future<void> _pickProfilePhoto() async {
    if (_pickingPhoto) return;
    setState(() => _pickingPhoto = true);
    try {
      final file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (!mounted || file == null) return;
      final persisted = await RegistrationMediaStorage.persistImage(
        file.path,
        prefix: 'avatar',
      );
      if (!mounted) return;
      setState(() => _profilePhotoPath = persisted);
    } catch (_) {
      if (!mounted) return;
      final l10n = VentingMobLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.camera_init_failed_generic)));
    } finally {
      if (mounted) setState(() => _pickingPhoto = false);
    }
  }

  Future<void> _openTerms() {
    final l10n = VentingMobLocalizations.of(context);
    return openLegalDocument(
      context,
      kind: LegalDocumentKind.terms,
      title: l10n.listener_reg_terms,
    );
  }

  Future<void> _openPrivacy() {
    final l10n = VentingMobLocalizations.of(context);
    return openLegalDocument(
      context,
      kind: LegalDocumentKind.privacy,
      title: l10n.listener_reg_privacy,
    );
  }

  void _submit() {
    setState(() => _submitted = true);
    if (!_canContinue) return;
    widget.onContinue(
      ListenerRegistrationStep1Data(
        profilePhotoPath: _profilePhotoPath!,
        fullName: _nameController.text.trim(),
        phoneNational: _nationalNumber,
        phoneCountryIso: _country.name,
        agreedToTerms: _agreedToTerms,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final dialCode = countryDialCode(_country);
    final showPhoneError = _submitted && !_isPhoneValid;
    final showPhotoError = _submitted && _profilePhotoPath == null;
    final showNameError = _submitted && _nameController.text.trim().isEmpty;
    final emailVerified = widget.email.trim().isNotEmpty;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
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
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              height: 1.15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            l10n.listener_reg_step1_subtitle,
                            style: GoogleFonts.inter(
                              color: _muted,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    _ProfilePhotoPicker(
                      imagePath: _profilePhotoPath,
                      isLoading: _pickingPhoto,
                      hasError: showPhotoError,
                      onTap: _pickProfilePhoto,
                    ),
                  ],
                ),
                if (showPhotoError) ...[
                  const SizedBox(height: 8),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      l10n.listener_reg_profile_photo_required,
                      style: GoogleFonts.inter(
                        color: const Color(0xFFE11D48),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 28),
                _LabeledField(
                  label: l10n.listener_reg_full_name,
                  controller: _nameController,
                  focusNode: _nameFocus,
                  hint: l10n.listener_reg_full_name_hint,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => _phoneFocus.requestFocus(),
                  inputFormatters: [LengthLimitingTextInputFormatter(50)],
                  maxLength: 50,
                  hasError: showNameError,
                ),
                const SizedBox(height: 16),
                _LabeledField(
                  label: l10n.listener_reg_email,
                  controller: _emailController,
                  focusNode: FocusNode(canRequestFocus: false),
                  hint: l10n.listener_reg_email_hint,
                  keyboardType: TextInputType.emailAddress,
                  enabled: false,
                  forceAccentBorder: emailVerified,
                  trailing: emailVerified
                      ? const Icon(
                          Icons.check_circle_rounded,
                          color: _success,
                          size: 20,
                        )
                      : null,
                ),
                const SizedBox(height: 16),
                _LabeledField(
                  key: ValueKey('phone_${_country.name}'),
                  label: l10n.listener_reg_phone,
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  hint: l10n.listener_reg_phone_hint,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _submit(),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(_phoneLimits.max),
                  ],
                  hasError: showPhoneError,
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
                            color: Colors.white.withValues(alpha: 0.12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _agreedToTerms,
                        onChanged: (v) {
                          setState(() => _agreedToTerms = v ?? false);
                        },
                        activeColor: _accent,
                        checkColor: Colors.white,
                        side: BorderSide(
                          color: _agreedToTerms ? _accent : _muted,
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
                              text: l10n.listener_reg_terms_link,
                              style: GoogleFonts.inter(
                                color: _accent,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: _termsRecognizer,
                            ),
                            TextSpan(text: l10n.listener_reg_agree_and),
                            TextSpan(
                              text: l10n.listener_reg_privacy_link,
                              style: GoogleFonts.inter(
                                color: _accent,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: _privacyRecognizer,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          child: SizedBox(
            height: 56,
            width: double.infinity,
            child: FilledButton(
              onPressed: _canContinue ? _submit : null,
              style: FilledButton.styleFrom(
                backgroundColor: _accent,
                disabledBackgroundColor: _accent.withValues(alpha: 0.42),
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                textStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: Text(l10n.listener_reg_continue),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
          child: Text(
            l10n.listener_reg_step1_footer,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: _muted,
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 1.45,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfilePhotoPicker extends StatelessWidget {
  const _ProfilePhotoPicker({
    required this.imagePath,
    required this.isLoading,
    required this.hasError,
    required this.onTap,
  });

  final String? imagePath;
  final bool isLoading;
  final bool hasError;
  final VoidCallback onTap;

  static const _accent = Color(0xFF8A3CFE);
  static const _fill = Color(0xFF1C1826);

  @override
  Widget build(BuildContext context) {
    final hasPhoto = imagePath != null;
    final borderColor = hasError
        ? const Color(0xFFE11D48)
        : _accent.withValues(alpha: 0.85);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 86,
          height: 86,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(86, 86),
                painter: _DashedCirclePainter(
                  color: borderColor,
                  strokeWidth: 2,
                ),
              ),
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _fill,
                  image: hasPhoto
                      ? DecorationImage(
                          image: FileImage(File(imagePath!)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: hasPhoto
                    ? null
                    : const Icon(
                        Icons.person_rounded,
                        color: Color(0xFF6B5F82),
                        size: 36,
                      ),
              ),
              if (isLoading)
                Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.45),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              else if (!hasPhoto)
                Positioned(
                  right: 6,
                  bottom: 6,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      color: _accent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 14,
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

class _DashedCirclePainter extends CustomPainter {
  const _DashedCirclePainter({required this.color, required this.strokeWidth});

  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    const dashCount = 28;
    const gapFactor = 0.45;
    final sweep = (2 * 3.141592653589793) / dashCount;

    for (var i = 0; i < dashCount; i++) {
      final start = i * sweep;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        start,
        sweep * (1 - gapFactor),
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _DashedCirclePainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    super.key,
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.hint,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.inputFormatters,
    this.maxLength,
    this.prefix,
    this.trailing,
    this.hasError = false,
    this.errorText,
    this.forceAccentBorder = false,
  });

  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Widget? prefix;
  final Widget? trailing;
  final bool hasError;
  final String? errorText;
  final bool forceAccentBorder;

  static const _fieldFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);

  @override
  Widget build(BuildContext context) {
    final borderColor = hasError
        ? const Color(0xFFE11D48)
        : (forceAccentBorder || focusNode.hasFocus)
        ? _accent
        : _accent.withValues(alpha: 0.55);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: _muted,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
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
            color: enabled
                ? Colors.white
                : Colors.white.withValues(alpha: 0.85),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: _accent,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: _muted.withValues(alpha: 0.75),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: _fieldFill,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            prefixIcon: prefix == null
                ? null
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [const SizedBox(width: 12), prefix!],
                  ),
            prefixIconConstraints: const BoxConstraints(),
            suffixIcon: trailing == null
                ? null
                : Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12),
                    child: trailing,
                  ),
            suffixIconConstraints: const BoxConstraints(),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: borderColor, width: 1.2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: borderColor, width: 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: hasError ? const Color(0xFFE11D48) : _accent,
                width: 1.5,
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
