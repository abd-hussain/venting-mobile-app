import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_language_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_languages_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/country_display_names.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/phone_country_picker.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/spoken_languages_picker.dart';

/// Step 3 — About You (DOB, country, city, spoken languages).
class ListenerRegistrationStep3AboutYou extends StatefulWidget {
  const ListenerRegistrationStep3AboutYou({
    super.key,
    required this.onContinue,
    this.initialDateOfBirth,
    this.initialCountryIso,
    this.initialCity = '',
    this.initialLanguageIds = const [],
  });

  final ValueChanged<ListenerRegistrationStep3Data> onContinue;
  final DateTime? initialDateOfBirth;
  final String? initialCountryIso;
  final String initialCity;
  final List<String> initialLanguageIds;

  @override
  State<ListenerRegistrationStep3AboutYou> createState() =>
      _ListenerRegistrationStep3AboutYouState();
}

class _ListenerRegistrationStep3AboutYouState
    extends State<ListenerRegistrationStep3AboutYou> {
  static const _fieldFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);
  static const _cityMaxLength = 30;
  static const _minAgeYears = 18;

  final _cityController = TextEditingController();
  final _cityFocus = FocusNode();

  DateTime? _dateOfBirth;
  IsoCode? _country;
  List<CatalogLanguageModel> _selectedLanguages = const [];
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    _dateOfBirth = widget.initialDateOfBirth;
    if (widget.initialCountryIso != null) {
      try {
        _country = IsoCode.values.byName(widget.initialCountryIso!);
      } catch (_) {
        _country = null;
      }
    }
    if (widget.initialCity.isNotEmpty) {
      _cityController.text = widget.initialCity;
    }
    _cityController.addListener(() => setState(() {}));
    if (widget.initialLanguageIds.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _restoreLanguages());
    }
  }

  Future<void> _restoreLanguages() async {
    final result = await diContainer<GetCatalogLanguagesUsecase>()().run();
    if (!mounted) return;
    result.match((_) {}, (response) {
      final byId = {for (final item in response.data.items) item.id: item};
      setState(() {
        _selectedLanguages = widget.initialLanguageIds
            .map((id) => byId[id])
            .whereType<CatalogLanguageModel>()
            .toList(growable: false);
      });
    });
  }

  @override
  void dispose() {
    _cityController.dispose();
    _cityFocus.dispose();
    super.dispose();
  }

  bool _isAtLeast18(DateTime date) {
    final now = DateTime.now();
    var age = now.year - date.year;
    if (now.month < date.month ||
        (now.month == date.month && now.day < date.day)) {
      age -= 1;
    }
    return age >= _minAgeYears;
  }

  bool get _isDobValid => _dateOfBirth != null && _isAtLeast18(_dateOfBirth!);

  bool get _canContinue =>
      _isDobValid &&
      _country != null &&
      _cityController.text.trim().isNotEmpty &&
      _selectedLanguages.isNotEmpty;

  DateTime get _latestAllowedDob {
    final now = DateTime.now();
    return DateTime(now.year - _minAgeYears, now.month, now.day);
  }

  Future<void> _pickDateOfBirth() async {
    final now = DateTime.now();
    final latest = _latestAllowedDob;
    final initial = _dateOfBirth != null && _isAtLeast18(_dateOfBirth!)
        ? _dateOfBirth!
        : DateTime(now.year - 25, now.month, now.day);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial.isAfter(latest) ? latest : initial,
      firstDate: DateTime(now.year - 100),
      lastDate: latest,
      helpText: VentingMobLocalizations.of(context).listener_reg_must_be_18,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: _accent,
              onPrimary: Colors.white,
              surface: _fieldFill,
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
      showDialCode: false,
    );
    if (selected == null || !mounted) return;
    setState(() => _country = selected);
  }

  Future<void> _pickLanguages() async {
    final selected = await showSpokenLanguagesPicker(
      context: context,
      selectedIds: _selectedLanguages.map((e) => e.id).toSet(),
    );
    if (selected == null || !mounted) return;
    setState(() => _selectedLanguages = selected);
  }

  void _removeLanguage(String id) {
    setState(() {
      _selectedLanguages = _selectedLanguages
          .where((lang) => lang.id != id)
          .toList(growable: false);
    });
  }

  String _formatDob(DateTime date, String locale) {
    return DateFormat.yMMMMd(locale).format(date);
  }

  void _onContinue() {
    setState(() => _submitted = true);
    if (!_canContinue) return;
    widget.onContinue(
      ListenerRegistrationStep3Data(
        dateOfBirth: _dateOfBirth!,
        countryIso: _country!.name,
        city: _cityController.text.trim(),
        languageIds: _selectedLanguages
            .map((e) => e.id)
            .toList(growable: false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;

    final countryLabel = _country == null
        ? null
        : countryDisplayName(_country!, languageCode: languageCode);

    final showDobError = _submitted && !_isDobValid;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.listener_reg_about_title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.listener_reg_about_subtitle,
                  style: GoogleFonts.inter(
                    color: _muted,
                    fontSize: 14,
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
                  hasError: showDobError,
                  onTap: _pickDateOfBirth,
                ),
                if (showDobError) ...[
                  const SizedBox(height: 6),
                  Text(
                    l10n.listener_reg_must_be_18,
                    style: GoogleFonts.inter(
                      color: const Color(0xFFE11D48),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                _LabeledSelectField(
                  label: l10n.listener_reg_country,
                  value: countryLabel,
                  placeholder: l10n.listener_reg_select_country,
                  trailing: Icons.keyboard_arrow_down_rounded,
                  onTap: _pickCountry,
                ),
                const SizedBox(height: 16),
                _LabeledTextField(
                  label: l10n.listener_reg_city,
                  controller: _cityController,
                  focusNode: _cityFocus,
                  hint: l10n.listener_reg_enter_city,
                  maxLength: _cityMaxLength,
                ),
                const SizedBox(height: 16),
                _LanguagesField(
                  label: l10n.listener_reg_languages_you_speak,
                  languages: _selectedLanguages,
                  languageCode: languageCode,
                  placeholder: l10n.listener_reg_select_languages,
                  onTap: _pickLanguages,
                  onRemove: _removeLanguage,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
          child: SizedBox(
            height: 56,
            child: FilledButton(
              onPressed: _onContinue,
              style: FilledButton.styleFrom(
                backgroundColor: _canContinue
                    ? _accent
                    : _accent.withValues(alpha: 0.42),
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
      ],
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
  });

  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final int maxLength;

  static const _fieldFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);

  @override
  Widget build(BuildContext context) {
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
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: _accent,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
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
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: _accent.withValues(alpha: 0.55),
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: _accent, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

class _LabeledSelectField extends StatelessWidget {
  const _LabeledSelectField({
    required this.label,
    required this.value,
    required this.placeholder,
    required this.trailing,
    required this.onTap,
    this.hasError = false,
  });

  final String label;
  final String? value;
  final String placeholder;
  final IconData trailing;
  final VoidCallback onTap;
  final bool hasError;

  static const _fieldFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.isNotEmpty;
    final borderColor = hasError
        ? const Color(0xFFE11D48)
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
        Material(
          color: _fieldFill,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: borderColor, width: 1.2),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      hasValue ? value! : placeholder,
                      style: GoogleFonts.inter(
                        color: hasValue
                            ? Colors.white
                            : _muted.withValues(alpha: 0.75),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(trailing, color: _accent, size: 22),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LanguagesField extends StatelessWidget {
  const _LanguagesField({
    required this.label,
    required this.languages,
    required this.languageCode,
    required this.placeholder,
    required this.onTap,
    required this.onRemove,
  });

  final String label;
  final List<CatalogLanguageModel> languages;
  final String languageCode;
  final String placeholder;
  final VoidCallback onTap;
  final ValueChanged<String> onRemove;

  static const _fieldFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);

  @override
  Widget build(BuildContext context) {
    final hasValue = languages.isNotEmpty;

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
        Material(
          color: _fieldFill,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: _accent.withValues(alpha: 0.55),
                  width: 1.2,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: !hasValue
                        ? Text(
                            placeholder,
                            style: GoogleFonts.inter(
                              color: _muted.withValues(alpha: 0.75),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : Wrap(
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
                                    color: _accent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        catalogLanguageLabel(
                                          lang,
                                          languageCode,
                                        ),
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
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: _accent,
                    size: 22,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
