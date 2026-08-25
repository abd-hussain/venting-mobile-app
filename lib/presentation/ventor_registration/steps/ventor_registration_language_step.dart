import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_language_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_languages_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

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
  static const _muted = Color(0xFF9B93AB);
  static const _checkboxBorder = Color(0xFF4A425C);
  static const _searchFill = Color(0xFF14101C);

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
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              IconButton(
                onPressed: widget.onBack,
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              if (!_isSearching)
                IconButton(
                  onPressed: _isLoading ? null : _openSearch,
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_isSearching)
                  _SearchField(
                    controller: _searchController,
                    hint: l10n.ventor_reg_language_search_hint,
                    onClear: _closeSearch,
                    fill: _searchFill,
                    muted: _muted,
                  )
                else ...[
                  Text(
                    l10n.ventor_reg_language_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.ventor_reg_language_subtitle,
                    style: GoogleFonts.inter(
                      color: _muted,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Expanded(child: _buildBody(l10n)),
                const SizedBox(height: 16),
                SizedBox(
                  height: 54,
                  child: FilledButton(
                    onPressed: _canContinue ? _onContinue : null,
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
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),
                    child: Text(
                      l10n.ventor_reg_language_continue.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(VentingMobLocalizations l10n) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.4,
          color: SplashColors.purpleMid,
        ),
      );
    }

    if (_errorMessage != null) {
      return Column(
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
                color: SplashColors.purpleMid,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
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
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final language = items[index];
        final selected = _selectedIds.contains(language.id);
        return _LanguageRow(
          language: language,
          selected: selected,
          rowFill: _rowFill,
          muted: _muted,
          checkboxBorder: _checkboxBorder,
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
    required this.fill,
    required this.muted,
  });

  final TextEditingController controller;
  final String hint;
  final VoidCallback onClear;
  final Color fill;
  final Color muted;

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
      cursorColor: SplashColors.purpleMid,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          color: muted,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(Icons.search_rounded, color: muted),
        suffixIcon: IconButton(
          onPressed: onClear,
          icon: Icon(Icons.close_rounded, color: muted),
        ),
        filled: true,
        fillColor: fill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: SplashColors.purpleMid,
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
    required this.rowFill,
    required this.muted,
    required this.checkboxBorder,
    required this.onTap,
  });

  final CatalogLanguageModel language;
  final bool selected;
  final Color rowFill;
  final Color muted;
  final Color checkboxBorder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: rowFill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : Colors.white.withValues(alpha: 0.06),
              width: selected ? 1.6 : 1,
            ),
          ),
          child: Row(
            children: [
              _FlagAvatar(language: language),
              const SizedBox(width: 12),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: language.name_native,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: ' (${language.name_en})',
                        style: GoogleFonts.inter(
                          color: muted,
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
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: selected ? SplashColors.purpleMid : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: selected ? SplashColors.purpleMid : checkboxBorder,
                    width: 1.6,
                  ),
                ),
                child: selected
                    ? const Icon(
                        Icons.check_rounded,
                        size: 16,
                        color: Colors.white,
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
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.white.withValues(alpha: 0.08),
      backgroundImage: hasUrl ? CachedNetworkImageProvider(url) : null,
      child: hasUrl
          ? null
          : Text(
              language.flag_emoji.isNotEmpty
                  ? language.flag_emoji
                  : language.id.toUpperCase(),
              style: GoogleFonts.inter(
                fontSize: language.flag_emoji.isNotEmpty ? 22 : 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
    );
  }
}
