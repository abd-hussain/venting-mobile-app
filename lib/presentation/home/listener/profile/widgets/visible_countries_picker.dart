import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/country_display_names.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/phone_country_picker.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class VisibleCountriesResult {
  const VisibleCountriesResult({
    required this.allCountries,
    required this.countries,
  });

  final bool allCountries;
  final Set<IsoCode> countries;
}

/// Picker to choose all countries or a specific set for profile visibility.
Future<VisibleCountriesResult?> showVisibleCountriesPicker({
  required BuildContext context,
  required bool allCountries,
  required Set<IsoCode> selectedCountries,
}) {
  return showModalBottomSheet<VisibleCountriesResult>(
    context: context,
    isScrollControlled: true,
    backgroundColor: ListenerProfileTheme.cardFill,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => _VisibleCountriesPickerSheet(
      allCountries: allCountries,
      selectedCountries: selectedCountries,
    ),
  );
}

class _VisibleCountriesPickerSheet extends StatefulWidget {
  const _VisibleCountriesPickerSheet({
    required this.allCountries,
    required this.selectedCountries,
  });

  final bool allCountries;
  final Set<IsoCode> selectedCountries;

  @override
  State<_VisibleCountriesPickerSheet> createState() =>
      _VisibleCountriesPickerSheetState();
}

class _VisibleCountriesPickerSheetState
    extends State<_VisibleCountriesPickerSheet> {
  late bool _allCountries;
  late final Set<IsoCode> _selected;
  final _searchController = TextEditingController();
  late final List<IsoCode> _all;

  @override
  void initState() {
    super.initState();
    _allCountries = widget.allCountries;
    _selected = {...widget.selectedCountries};
    _all = [...IsoCode.values]
      ..sort((a, b) {
        if (a == IsoCode.JO) return -1;
        if (b == IsoCode.JO) return 1;
        return a.name.compareTo(b.name);
      });
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<IsoCode> get _filtered {
    final q = _searchController.text.trim().toLowerCase();
    if (q.isEmpty) return _all;
    final languageCode = Localizations.localeOf(context).languageCode;
    return _all.where((iso) {
      final name = countryDisplayName(iso, languageCode: languageCode);
      return name.toLowerCase().contains(q) ||
          iso.name.toLowerCase().contains(q) ||
          countryDialCode(iso).contains(q);
    }).toList();
  }

  void _onDone() {
    if (!_allCountries && _selected.isEmpty) {
      final l10n = VentingMobLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.listener_privacy_countries_required)),
      );
      return;
    }
    Navigator.of(context).pop(
      VisibleCountriesResult(
        allCountries: _allCountries,
        countries: {..._selected},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;
    final filtered = _filtered;

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.82,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 8, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.listener_privacy_visible_countries_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _onDone,
                    child: Text(
                      l10n.common_save,
                      style: GoogleFonts.inter(
                        color: SplashColors.purpleMid,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _ModeTile(
                    label: l10n.listener_privacy_all_countries,
                    selected: _allCountries,
                    onTap: () => setState(() => _allCountries = true),
                  ),
                  const SizedBox(height: 8),
                  _ModeTile(
                    label: l10n.listener_privacy_specific_countries,
                    selected: !_allCountries,
                    onTap: () => setState(() => _allCountries = false),
                  ),
                ],
              ),
            ),
            if (!_allCountries) ...[
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _searchController,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
                  cursorColor: SplashColors.purpleMid,
                  decoration: InputDecoration(
                    hintText: l10n.listener_reg_search_country,
                    hintStyle: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: ListenerProfileTheme.muted,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF14101C),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final iso = filtered[index];
                    final selected = _selected.contains(iso);
                    return CheckboxListTile(
                      value: selected,
                      onChanged: (checked) {
                        setState(() {
                          if (checked == true) {
                            _selected.add(iso);
                          } else {
                            _selected.remove(iso);
                          }
                        });
                      },
                      activeColor: SplashColors.purpleMid,
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Row(
                        children: [
                          Text(
                            countryFlagEmoji(iso),
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              countryDisplayName(
                                iso,
                                languageCode: languageCode,
                              ),
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ] else
              const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _ModeTile extends StatelessWidget {
  const _ModeTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? SplashColors.purpleMid.withValues(alpha: 0.18)
          : const Color(0xFF14101C),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : ListenerProfileTheme.cardBorder,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                selected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off_rounded,
                color: selected
                    ? SplashColors.purpleMid
                    : ListenerProfileTheme.muted,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
