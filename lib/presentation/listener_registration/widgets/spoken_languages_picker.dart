import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_language_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_languages_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

/// Localized label for a catalog language based on app locale.
String catalogLanguageLabel(
  CatalogLanguageModel language,
  String languageCode,
) {
  if (languageCode.toLowerCase().startsWith('ar')) {
    if (language.name_ar.trim().isNotEmpty) return language.name_ar.trim();
    if (language.name_native.trim().isNotEmpty) {
      return language.name_native.trim();
    }
  }
  if (language.name_en.trim().isNotEmpty) return language.name_en.trim();
  return language.name_native.trim().isNotEmpty
      ? language.name_native.trim()
      : language.id;
}

List<CatalogLanguageModel>? _cachedCatalogLanguages;

/// Resolves labels from the in-memory catalog cache (populated when the picker opens).
List<String> cachedLanguageLabels(
  Iterable<String> languageIds,
  String languageCode,
) {
  final cached = _cachedCatalogLanguages;
  if (cached == null || cached.isEmpty) {
    return languageIds.map((id) => id).toList(growable: false);
  }

  return languageIds
      .map((id) {
        for (final language in cached) {
          if (language.id == id) {
            return catalogLanguageLabel(language, languageCode);
          }
        }
        return id;
      })
      .toList(growable: false);
}

/// Multi-select spoken languages from `#75 GET /v1/catalog/languages`.
Future<List<CatalogLanguageModel>?> showSpokenLanguagesPicker({
  required BuildContext context,
  required Set<String> selectedIds,
}) {
  return showModalBottomSheet<List<CatalogLanguageModel>>(
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
  static const _accent = Color(0xFF8A3CFE);
  static const _iconFill = Color(0xFF2A2140);

  late final Set<String> _selected;
  final _searchController = TextEditingController();

  bool _isLoading = true;
  String? _errorMessage;
  List<CatalogLanguageModel> _languages = const [];

  @override
  void initState() {
    super.initState();
    _selected = {...widget.selectedIds};
    _searchController.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadLanguages());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadLanguages() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await diContainer<GetCatalogLanguagesUsecase>()().run();
    if (!mounted) return;

    result.match(
      (error) {
        setState(() {
          _isLoading = false;
          _errorMessage = _mapError(error);
          _languages = const [];
        });
      },
      (response) {
        final items = [...response.data.items]
          ..sort((a, b) => a.sort_order.compareTo(b.sort_order));
        setState(() {
          _isLoading = false;
          _errorMessage = null;
          _languages = items;
          _cachedCatalogLanguages = items;
          _selected.removeWhere((id) => items.every((item) => item.id != id));
        });
      },
    );
  }

  String _mapError(Object error) {
    if (error is MainAPIException) {
      final localized = error.getLocalizedMessage();
      if (localized.isNotEmpty) return localized;
      if (error.message.isNotEmpty) return error.message;
    }
    return VentingMobLocalizations.of(context).common_unknown_error;
  }

  List<CatalogLanguageModel> get _filtered {
    final q = _searchController.text.trim().toLowerCase();
    if (q.isEmpty) return _languages;
    return _languages
        .where((lang) {
          return lang.name_en.toLowerCase().contains(q) ||
              lang.name_native.toLowerCase().contains(q) ||
              lang.name_ar.toLowerCase().contains(q) ||
              lang.id.toLowerCase().contains(q);
        })
        .toList(growable: false);
  }

  void _onDone() {
    final selected = _languages
        .where((lang) => _selected.contains(lang.id))
        .toList(growable: false);
    Navigator.of(context).pop(selected);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;
    final filtered = _filtered;

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
                    onPressed: _isLoading || _errorMessage != null
                        ? null
                        : _onDone,
                    child: Text(
                      l10n.listener_reg_done,
                      style: GoogleFonts.inter(
                        color: _accent,
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
                enabled: !_isLoading && _errorMessage == null,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
                cursorColor: _accent,
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
            Expanded(child: _buildBody(l10n, languageCode, filtered)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    VentingMobLocalizations l10n,
    String languageCode,
    List<CatalogLanguageModel> filtered,
  ) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2.4, color: _accent),
      );
    }

    if (_errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _errorMessage!,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: const Color(0xFFF87171),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _loadLanguages,
              child: Text(
                l10n.common_retry,
                style: GoogleFonts.inter(
                  color: _accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (filtered.isEmpty) {
      return Center(
        child: Text(
          l10n.ventor_reg_language_empty,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(color: _muted, fontSize: 14),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 16),
      itemCount: filtered.length,
      separatorBuilder: (_, _) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final lang = filtered[index];
        final isSelected = _selected.contains(lang.id);
        return Material(
          color: isSelected
              ? _accent.withValues(alpha: 0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {
              setState(() {
                if (isSelected) {
                  _selected.remove(lang.id);
                } else {
                  _selected.add(lang.id);
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  _FlagAvatar(language: lang),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      catalogLanguageLabel(lang, languageCode),
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: isSelected ? _accent : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: isSelected ? _accent : const Color(0xFF6B5F82),
                        width: 1.5,
                      ),
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check_rounded,
                            size: 14,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FlagAvatar extends StatelessWidget {
  const _FlagAvatar({required this.language});

  final CatalogLanguageModel language;

  @override
  Widget build(BuildContext context) {
    final url = language.flag_url.trim();
    final hasUrl = url.isNotEmpty;

    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: _SpokenLanguagesPickerSheetState._iconFill,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      child: hasUrl
          ? CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              width: 40,
              height: 40,
              placeholder: (_, _) => _fallback(),
              errorWidget: (_, _, _) => _fallback(),
            )
          : _fallback(),
    );
  }

  Widget _fallback() {
    final emoji = language.flag_emoji.trim();
    return Text(
      emoji.isNotEmpty ? emoji : language.id.toUpperCase(),
      style: GoogleFonts.inter(
        fontSize: emoji.isNotEmpty ? 20 : 12,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }
}
