import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_language_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_languages_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

class VentorLanguagesSelection {
  const VentorLanguagesSelection({required this.languageIds});

  final List<String> languageIds;
}

/// Ventor registration — speaking language step (design: Choose your Language).
///
/// Data from `#75 GET /v1/catalog/languages`.
class VentorRegistrationLanguageStep extends StatefulWidget {
  const VentorRegistrationLanguageStep({
    super.key,
    required this.onBack,
    required this.onContinue,
    this.initialSelectedIds = const <String>{},
  });

  final VoidCallback onBack;
  final ValueChanged<VentorLanguagesSelection> onContinue;
  final Set<String> initialSelectedIds;

  @override
  State<VentorRegistrationLanguageStep> createState() =>
      _VentorRegistrationLanguageStepState();
}

class _VentorRegistrationLanguageStepState
    extends State<VentorRegistrationLanguageStep> {
  static const _rowFill = Color(0xFF1C1826);
  static const _iconFill = Color(0xFF2A2140);
  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);
  static const _progressTrack = Color(0xFF3A2F52);
  static const _checkboxBorder = Color(0xFF6B5F82);
  static const _searchFill = Color(0xFF14101C);
  static const _totalSteps = 4;
  static const _currentStep = 2;

  final _searchController = TextEditingController();
  final Set<String> _selectedIds = {};

  bool _isSearching = false;
  bool _isLoading = true;
  String? _errorMessage;
  List<CatalogLanguageModel> _languages = const [];

  bool get _canContinue => !_isLoading && _selectedIds.isNotEmpty;

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

  @override
  void initState() {
    super.initState();
    _selectedIds.addAll(widget.initialSelectedIds);
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
          _selectedIds.removeWhere(
            (id) => items.every((item) => item.id != id),
          );
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

  void _toggle(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _openSearch() {
    setState(() => _isSearching = true);
  }

  void _closeSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
  }

  void _onContinue() {
    if (!_canContinue) return;
    widget.onContinue(
      VentorLanguagesSelection(
        languageIds: _selectedIds.toList(growable: false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Row(
            children: [
              Material(
                color: _rowFill,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: widget.onBack,
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _accent.withValues(alpha: 0.55),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '$_currentStep/$_totalSteps',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: List.generate(_totalSteps, (i) {
                  final active = i == _currentStep - 1;
                  return Padding(
                    padding: EdgeInsetsDirectional.only(start: i == 0 ? 0 : 5),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      width: active ? 28 : 18,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: active ? _accent : _progressTrack,
                      ),
                    ),
                  );
                }),
              ),
              if (!_isSearching) ...[
                const SizedBox(width: 4),
                IconButton(
                  onPressed: _isLoading ? null : _openSearch,
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
                child: _isSearching
                    ? _SearchField(
                        controller: _searchController,
                        hint: l10n.ventor_reg_language_search_hint,
                        onClear: _closeSearch,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.ventor_reg_language_title,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              height: 1.15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            l10n.ventor_reg_language_subtitle,
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
              Expanded(child: _buildBody(l10n)),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
                child: SizedBox(
                  height: 56,
                  child: FilledButton(
                    onPressed: _canContinue ? _onContinue : null,
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
                    child: Text(l10n.ventor_reg_language_continue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody(VentingMobLocalizations l10n) {
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

    final items = _filtered;
    if (items.isEmpty) {
      return Center(
        child: Text(
          l10n.ventor_reg_language_empty,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(color: _muted, fontSize: 14),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final language = items[index];
        final selected = _selectedIds.contains(language.id);
        return _LanguageRow(
          language: language,
          selected: selected,
          onTap: () => _toggle(language.id),
        );
      },
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.hint,
    required this.onClear,
  });

  final TextEditingController controller;
  final String hint;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: _VentorRegistrationLanguageStepState._accent,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          color: _VentorRegistrationLanguageStepState._muted,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: _VentorRegistrationLanguageStepState._muted,
        ),
        suffixIcon: IconButton(
          onPressed: onClear,
          icon: const Icon(
            Icons.close_rounded,
            color: _VentorRegistrationLanguageStepState._muted,
          ),
        ),
        filled: true,
        fillColor: _VentorRegistrationLanguageStepState._searchFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: _VentorRegistrationLanguageStepState._accent.withValues(
              alpha: 0.55,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: _VentorRegistrationLanguageStepState._accent,
            width: 1.4,
          ),
        ),
      ),
    );
  }
}

class _LanguageRow extends StatelessWidget {
  const _LanguageRow({
    required this.language,
    required this.selected,
    required this.onTap,
  });

  final CatalogLanguageModel language;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _VentorRegistrationLanguageStepState._rowFill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected
                  ? _VentorRegistrationLanguageStepState._accent.withValues(
                      alpha: 0.55,
                    )
                  : Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: Row(
            children: [
              _FlagAvatar(language: language),
              const SizedBox(width: 14),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: language.name_native,
                        style: GoogleFonts.inter(
                          color: selected
                              ? Colors.white
                              : _VentorRegistrationLanguageStepState._muted,
                          fontSize: 15,
                          fontWeight: selected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' (${language.name_en})',
                        style: GoogleFonts.inter(
                          color: _VentorRegistrationLanguageStepState._muted
                              .withValues(alpha: selected ? 0.85 : 0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: selected
                        ? _VentorRegistrationLanguageStepState._accent
                        : _VentorRegistrationLanguageStepState._checkboxBorder,
                    width: 1.5,
                  ),
                ),
                child: selected
                    ? const Icon(
                        Icons.check_rounded,
                        size: 14,
                        color: _VentorRegistrationLanguageStepState._accent,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
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
        color: _VentorRegistrationLanguageStepState._iconFill,
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
    return Text(
      language.flag_emoji.isNotEmpty
          ? language.flag_emoji
          : language.id.toUpperCase(),
      style: GoogleFonts.inter(
        fontSize: language.flag_emoji.isNotEmpty ? 20 : 12,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }
}
