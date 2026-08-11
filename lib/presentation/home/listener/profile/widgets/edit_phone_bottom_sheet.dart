import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/phone_country_picker.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class EditPhoneResult {
  const EditPhoneResult({required this.country, required this.nationalNumber});

  final IsoCode country;
  final String nationalNumber;

  String get displayLabel => '+${countryDialCode(country)} $nationalNumber';

  String get e164 {
    try {
      return PhoneNumber.parse(
        nationalNumber,
        callerCountry: country,
        destinationCountry: country,
      ).international;
    } catch (_) {
      return '+${countryDialCode(country)}$nationalNumber';
    }
  }
}

/// Shows a dark sheet to edit the listener phone number.
///
/// Returns the saved phone, or `null` if cancelled.
Future<EditPhoneResult?> showEditPhoneBottomSheet({
  required BuildContext context,
  IsoCode? initialCountry,
  String? initialNationalNumber,
  String? initialPhoneDisplay,
}) {
  return showModalBottomSheet<EditPhoneResult>(
    context: context,
    isScrollControlled: true,
    backgroundColor: ListenerProfileTheme.cardFill,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => EditPhoneBottomSheet(
      initialCountry: initialCountry,
      initialNationalNumber: initialNationalNumber,
      initialPhoneDisplay: initialPhoneDisplay,
    ),
  );
}

class EditPhoneBottomSheet extends StatefulWidget {
  const EditPhoneBottomSheet({
    super.key,
    this.initialCountry,
    this.initialNationalNumber,
    this.initialPhoneDisplay,
  });

  final IsoCode? initialCountry;
  final String? initialNationalNumber;
  final String? initialPhoneDisplay;

  @override
  State<EditPhoneBottomSheet> createState() => _EditPhoneBottomSheetState();
}

class _EditPhoneBottomSheetState extends State<EditPhoneBottomSheet> {
  late final TextEditingController _phoneController;
  final _phoneFocus = FocusNode();

  late IsoCode _country;
  late final String _initialNational;
  late final IsoCode _initialCountry;
  var _submitted = false;

  @override
  void initState() {
    super.initState();
    final parsed = _parseInitial(
      country: widget.initialCountry,
      national: widget.initialNationalNumber,
      display: widget.initialPhoneDisplay,
    );
    _country = parsed.country;
    _initialCountry = parsed.country;
    _initialNational = parsed.national;
    _phoneController = TextEditingController(text: parsed.national);
    _phoneController.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _phoneFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  static ({IsoCode country, String national}) _parseInitial({
    IsoCode? country,
    String? national,
    String? display,
  }) {
    if (national != null && national.trim().isNotEmpty) {
      return (
        country: country ?? IsoCode.JO,
        national: national.replaceAll(RegExp(r'\D'), ''),
      );
    }

    final raw = display?.trim() ?? '';
    if (raw.isNotEmpty) {
      try {
        final phone = PhoneNumber.parse(raw);
        return (country: phone.isoCode, national: phone.nsn);
      } catch (_) {
        final digits = raw.replaceAll(RegExp(r'\D'), '');
        return (country: country ?? IsoCode.US, national: digits);
      }
    }

    return (country: country ?? IsoCode.JO, national: '');
  }

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

  bool get _hasChanges =>
      _country != _initialCountry || _nationalNumber != _initialNational;

  bool get _canSave => _isPhoneValid && _hasChanges;

  Future<void> _pickCountry() async {
    final selected = await showPhoneCountryPicker(
      context: context,
      selected: _country,
    );
    if (selected == null || !mounted) return;
    if (selected == _country) return;
    _phoneController.clear();
    setState(() {
      _country = selected;
      _submitted = false;
    });
  }

  void _onCancel() => Navigator.of(context).pop();

  void _onSave() {
    setState(() => _submitted = true);
    if (!_canSave) return;
    // TODO: Persist phone via listener profile API / repository.
    Navigator.of(
      context,
    ).pop(EditPhoneResult(country: _country, nationalNumber: _nationalNumber));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final dialCode = countryDialCode(_country);
    final showPhoneError = _submitted && !_isPhoneValid;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                l10n.listener_edit_phone_title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.listener_edit_phone_subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                key: ValueKey('phone_${_country.name}'),
                controller: _phoneController,
                focusNode: _phoneFocus,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _onSave(),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(_phoneLimits.max),
                ],
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: SplashColors.purpleMid,
                decoration: InputDecoration(
                  hintText: l10n.listener_reg_phone,
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
                  prefixIcon: InkWell(
                    onTap: _pickCountry,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 12,
                        end: 8,
                      ),
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
                            color: ListenerProfileTheme.muted,
                          ),
                          Container(
                            width: 1,
                            height: 18,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: ListenerProfileTheme.cardBorder,
                          ),
                        ],
                      ),
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: showPhoneError
                          ? const Color(0xFFEF4444).withValues(alpha: 0.7)
                          : ListenerProfileTheme.cardBorder,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: showPhoneError
                          ? const Color(0xFFEF4444)
                          : SplashColors.purpleMid.withValues(alpha: 0.85),
                      width: 1.4,
                    ),
                  ),
                ),
              ),
              if (showPhoneError) ...[
                const SizedBox(height: 8),
                Text(
                  l10n.listener_reg_invalid_phone,
                  style: GoogleFonts.inter(
                    color: const Color(0xFFEF4444),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _onCancel,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                        minimumSize: const Size.fromHeight(52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: Text(l10n.common_cancel),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: _canSave ? _onSave : null,
                      style: FilledButton.styleFrom(
                        backgroundColor: SplashColors.purpleMid,
                        disabledBackgroundColor: SplashColors.purpleMid
                            .withValues(alpha: 0.35),
                        foregroundColor: Colors.white,
                        disabledForegroundColor: Colors.white.withValues(
                          alpha: 0.7,
                        ),
                        elevation: 0,
                        minimumSize: const Size.fromHeight(52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: Text(l10n.common_save),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
