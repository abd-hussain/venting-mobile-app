import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_numbers_parser/metadata.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/country_display_names.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

String countryFlagEmoji(IsoCode isoCode) {
  final code = isoCode.name;
  if (code.length != 2) return '🏳️';
  return String.fromCharCodes([
    0x1F1E6 + code.codeUnitAt(0) - 65,
    0x1F1E6 + code.codeUnitAt(1) - 65,
  ]);
}

String countryDialCode(IsoCode isoCode) =>
    PhoneNumber(isoCode: isoCode, nsn: '').countryCode;

/// Min/max national significant number lengths for [isoCode].
({int min, int max}) phoneNationalDigitLimits(IsoCode isoCode) {
  final meta = metadataLenghtsByIsoCode[isoCode];
  if (meta == null) return (min: 4, max: 15);

  // Prefer mobile lengths for this registration flow.
  final preferred = <int>{
    ...meta.mobile,
    if (meta.mobile.isEmpty) ...meta.fixedLine,
    if (meta.mobile.isEmpty && meta.fixedLine.isEmpty) ...meta.general,
  };

  final all = <int>{
    ...preferred,
    ...meta.mobile,
    ...meta.fixedLine,
    ...meta.voip,
    ...meta.general,
  };

  if (all.isEmpty) return (min: 4, max: 15);

  final minLen = preferred.isEmpty
      ? all.reduce(math.min)
      : preferred.reduce(math.min);
  final maxLen = all.reduce(math.max);
  return (min: minLen, max: maxLen);
}

Future<IsoCode?> showPhoneCountryPicker({
  required BuildContext context,
  required IsoCode selected,
}) {
  return showModalBottomSheet<IsoCode>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF16121F),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => _PhoneCountryPickerSheet(selected: selected),
  );
}

class _PhoneCountryPickerSheet extends StatefulWidget {
  const _PhoneCountryPickerSheet({required this.selected});

  final IsoCode selected;

  @override
  State<_PhoneCountryPickerSheet> createState() =>
      _PhoneCountryPickerSheetState();
}

class _PhoneCountryPickerSheetState extends State<_PhoneCountryPickerSheet> {
  static const _muted = Color(0xFF9B93AB);
  static const _fieldFill = Color(0xFF1A1428);

  final _searchController = TextEditingController();
  List<IsoCode> _allCountries = const [];
  String _languageCode = 'en';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _languageCode = Localizations.localeOf(context).languageCode;
    _allCountries = [...IsoCode.values]
      ..sort((a, b) {
        if (a == IsoCode.JO) return -1;
        if (b == IsoCode.JO) return 1;
        return countryDisplayName(
          a,
          languageCode: _languageCode,
        ).compareTo(countryDisplayName(b, languageCode: _languageCode));
      });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<IsoCode> get _filtered {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return _allCountries;
    return _allCountries.where((iso) {
      final dial = countryDialCode(iso);
      final name = countryDisplayName(
        iso,
        languageCode: _languageCode,
      ).toLowerCase();
      return name.contains(query) ||
          iso.name.toLowerCase().contains(query) ||
          dial.contains(query) ||
          '+$dial'.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final countries = _filtered;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.72,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    l10n.listener_reg_select_country,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _searchController,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
                  cursorColor: SplashColors.purpleMid,
                  decoration: InputDecoration(
                    hintText: l10n.listener_reg_search_country,
                    hintStyle: GoogleFonts.inter(color: _muted, fontSize: 15),
                    prefixIcon: const Icon(Icons.search, color: _muted),
                    filled: true,
                    fillColor: _fieldFill,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    final iso = countries[index];
                    final dial = countryDialCode(iso);
                    final selected = iso == widget.selected;
                    final name = countryDisplayName(
                      iso,
                      languageCode: _languageCode,
                    );

                    return ListTile(
                      onTap: () => Navigator.of(context).pop(iso),
                      leading: Text(
                        countryFlagEmoji(iso),
                        style: const TextStyle(fontSize: 22),
                      ),
                      title: Text(
                        name,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: selected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                      trailing: Text(
                        '+$dial',
                        style: GoogleFonts.inter(
                          color: selected ? SplashColors.purpleMid : _muted,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      selected: selected,
                      selectedTileColor: SplashColors.purpleMid.withValues(
                        alpha: 0.12,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
