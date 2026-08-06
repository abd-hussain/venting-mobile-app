import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/language_options.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<Set<String>?> showSpokenLanguagesPicker({
  required BuildContext context,
  required Set<String> selectedIds,
}) {
  return showModalBottomSheet<Set<String>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF16121F),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => _SpokenLanguagesPickerSheet(selectedIds: selectedIds),
  );
}

class _SpokenLanguagesPickerSheet extends StatefulWidget {
  const _SpokenLanguagesPickerSheet({required this.selectedIds});

  final Set<String> selectedIds;

  @override
  State<_SpokenLanguagesPickerSheet> createState() =>
      _SpokenLanguagesPickerSheetState();
}

class _SpokenLanguagesPickerSheetState
    extends State<_SpokenLanguagesPickerSheet> {
  static const _muted = Color(0xFF9B93AB);
  static const _fieldFill = Color(0xFF1A1428);

  late final Set<String> _selected;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selected = {...widget.selectedIds};
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;
    final q = _searchController.text.trim().toLowerCase();
    final filtered = spokenLanguages.where((lang) {
      if (q.isEmpty) return true;
      return lang.en.toLowerCase().contains(q) ||
          lang.ar.contains(q) ||
          lang.id.contains(q);
    }).toList();

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.listener_reg_select_languages,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(_selected),
                    child: Text(
                      l10n.listener_reg_done,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchController,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
                cursorColor: SplashColors.purpleMid,
                decoration: InputDecoration(
                  hintText: l10n.listener_reg_search_language,
                  hintStyle: GoogleFonts.inter(color: _muted, fontSize: 14),
                  filled: true,
                  fillColor: _fieldFill,
                  prefixIcon: const Icon(Icons.search, color: _muted),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
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
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final lang = filtered[index];
                  final isSelected = _selected.contains(lang.id);
                  return CheckboxListTile(
                    value: isSelected,
                    activeColor: SplashColors.purpleMid,
                    checkColor: Colors.white,
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(
                      lang.label(languageCode),
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value ?? false) {
                          _selected.add(lang.id);
                        } else {
                          _selected.remove(lang.id);
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
