import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/country_display_names.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/language_options.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/phone_country_picker.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/spoken_languages_picker.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Step 3 — About You (DOB, country, city, spoken languages).
class ListenerRegistrationStep3AboutYou extends StatefulWidget {
  const ListenerRegistrationStep3AboutYou({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  State<ListenerRegistrationStep3AboutYou> createState() =>
      _ListenerRegistrationStep3AboutYouState();
}

class _ListenerRegistrationStep3AboutYouState
    extends State<ListenerRegistrationStep3AboutYou> {
  static const _fieldFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);
  static const _cityMaxLength = 30;

  final _cityController = TextEditingController();
  final _cityFocus = FocusNode();

  DateTime? _dateOfBirth;
  IsoCode? _country;
  final Set<String> _languageIds = {};

  @override
  void initState() {
    super.initState();
    _cityController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _cityController.dispose();
    _cityFocus.dispose();
    super.dispose();
  }

  bool get _canContinue =>
      _dateOfBirth != null &&
      _country != null &&
      _cityController.text.trim().isNotEmpty &&
      _languageIds.isNotEmpty;

  Future<void> _pickDateOfBirth() async {
    final now = DateTime.now();
    final initial = _dateOfBirth ?? DateTime(now.year - 25, now.month, now.day);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year - 100),
      lastDate: DateTime(now.year - 18, now.month, now.day),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: SplashColors.purpleMid,
              onPrimary: Colors.white,
              surface: Color(0xFF1C1826),
            ),
            dialogTheme: const DialogThemeData(
              backgroundColor: Color(0xFF16121F),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked == null || !mounted) return;
    setState(() => _dateOfBirth = picked);
  }

  Future<void> _pickCountry() async {
    final selected = await showPhoneCountryPicker(
      context: context,
      selected: _country ?? IsoCode.JO,
    );
    if (selected == null || !mounted) return;
    setState(() => _country = selected);
  }

  Future<void> _pickLanguages() async {
    final selected = await showSpokenLanguagesPicker(
      context: context,
      selectedIds: _languageIds,
    );
    if (selected == null || !mounted) return;
    setState(() {
      _languageIds
        ..clear()
        ..addAll(selected);
    });
  }

  void _removeLanguage(String id) {
    setState(() => _languageIds.remove(id));
  }

  String _formatDob(DateTime date, String locale) {
    return DateFormat.yMMMMd(locale).format(date);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;

    final countryLabel = _country == null
        ? null
        : countryDisplayName(_country!, languageCode: languageCode);

    final selectedLanguages = _languageIds
        .map(spokenLanguageById)
        .whereType<SpokenLanguage>()
        .toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.listener_reg_about_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.listener_reg_about_subtitle,
                    style: GoogleFonts.inter(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 28),
                  _LabeledSelectField(
                    label: l10n.listener_reg_date_of_birth,
                    value: _dateOfBirth == null
                        ? null
                        : _formatDob(_dateOfBirth!, locale.toString()),
                    placeholder: l10n.listener_reg_select_date,
                    trailing: Icons.calendar_today_outlined,
                    fill: _fieldFill,
                    muted: _muted,
                    onTap: _pickDateOfBirth,
                  ),
                  const SizedBox(height: 12),
                  _LabeledSelectField(
                    label: l10n.listener_reg_country,
                    value: countryLabel,
                    placeholder: l10n.listener_reg_select_country,
                    trailing: Icons.keyboard_arrow_down_rounded,
                    fill: _fieldFill,
                    muted: _muted,
                    onTap: _pickCountry,
                  ),
                  const SizedBox(height: 12),
                  _LabeledTextField(
                    label: l10n.listener_reg_city,
                    controller: _cityController,
                    focusNode: _cityFocus,
                    hint: l10n.listener_reg_enter_city,
                    maxLength: _cityMaxLength,
                    fill: _fieldFill,
                    muted: _muted,
                  ),
                  const SizedBox(height: 12),
                  _LanguagesField(
                    label: l10n.listener_reg_languages_you_speak,
                    languages: selectedLanguages,
                    languageCode: languageCode,
                    placeholder: l10n.listener_reg_select_languages,
                    fill: _fieldFill,
                    muted: _muted,
                    onTap: _pickLanguages,
                    onRemove: _removeLanguage,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 54,
            child: FilledButton(
              onPressed: _canContinue ? widget.onContinue : null,
              style: FilledButton.styleFrom(
                backgroundColor: SplashColors.purpleMid,
                disabledBackgroundColor: SplashColors.purpleMid.withValues(
                  alpha: 0.35,
                ),
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
    );
  }
}

class _LabeledTextField extends StatelessWidget {
  const _LabeledTextField({
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.hint,
    required this.maxLength,
    required this.fill,
    required this.muted,
  });

  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final int maxLength;
  final Color fill;
  final Color muted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              color: muted,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextField(
            controller: controller,
            focusNode: focusNode,
            maxLength: maxLength,
            inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
            buildCounter:
                (
                  context, {
                  required currentLength,
                  required isFocused,
                  required maxLength,
                }) => null,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: SplashColors.purpleMid,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              isDense: true,
              hintText: hint,
              hintStyle: GoogleFonts.inter(
                color: muted.withValues(alpha: 0.85),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 4, bottom: 4),
            ),
          ),
        ],
      ),
    );
  }
}

class _LabeledSelectField extends StatelessWidget {
  const _LabeledSelectField({
    required this.label,
    required this.value,
    required this.placeholder,
    required this.trailing,
    required this.fill,
    required this.muted,
    required this.onTap,
  });

  final String label;
  final String? value;
  final String placeholder;
  final IconData trailing;
  final Color fill;
  final Color muted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.isNotEmpty;

    return Material(
      color: fill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.inter(
                        color: muted,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hasValue ? value! : placeholder,
                      style: GoogleFonts.inter(
                        color: hasValue
                            ? Colors.white
                            : muted.withValues(alpha: 0.85),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(trailing, color: muted, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguagesField extends StatelessWidget {
  const _LanguagesField({
    required this.label,
    required this.languages,
    required this.languageCode,
    required this.placeholder,
    required this.fill,
    required this.muted,
    required this.onTap,
    required this.onRemove,
  });

  final String label;
  final List<SpokenLanguage> languages;
  final String languageCode;
  final String placeholder;
  final Color fill;
  final Color muted;
  final VoidCallback onTap;
  final ValueChanged<String> onRemove;

  @override
  Widget build(BuildContext context) {
    final hasValue = languages.isNotEmpty;

    return Material(
      color: fill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.inter(
                        color: muted,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (!hasValue)
                      Text(
                        placeholder,
                        style: GoogleFonts.inter(
                          color: muted.withValues(alpha: 0.85),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    else
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final lang in languages)
                            Container(
                              padding: const EdgeInsetsDirectional.only(
                                start: 12,
                                end: 6,
                                top: 6,
                                bottom: 6,
                              ),
                              decoration: BoxDecoration(
                                color: SplashColors.purpleMid,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    lang.label(languageCode),
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  GestureDetector(
                                    onTap: () => onRemove(lang.id),
                                    behavior: HitTestBehavior.opaque,
                                    child: const Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Icon(
                                        Icons.close_rounded,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: hasValue ? 18 : 8),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: muted,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
