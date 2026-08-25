import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_category_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_categories_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

/// Result of the interests step — passed to parent for `#8 ventors/register`.
class VentorInterestsSelection {
  const VentorInterestsSelection({
    required this.interestIds,
    this.otherInterestText,
  });

  final List<String> interestIds;
  final String? otherInterestText;
}

/// Ventor registration step 2 — topics they want to vent about.
///
/// Categories come from `#74 GET /v1/catalog/categories?audience=ventor`.
class VentorRegistrationInterestsStep extends StatefulWidget {
  const VentorRegistrationInterestsStep({
    super.key,
    required this.onBack,
    required this.onFinish,
    this.isSubmitting = false,
  });

  final VoidCallback onBack;
  final ValueChanged<VentorInterestsSelection> onFinish;
  final bool isSubmitting;

  @override
  State<VentorRegistrationInterestsStep> createState() =>
      _VentorRegistrationInterestsStepState();
}

class _VentorRegistrationInterestsStepState
    extends State<VentorRegistrationInterestsStep> {
  static const _rowFill = Color(0xFF1C1826);
  static const _iconFill = Color(0xFF2A2140);
  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);
  static const _progressTrack = Color(0xFF3A2F52);
  static const _checkboxBorder = Color(0xFF6B5F82);
  static const _fieldFill = Color(0xFF14101C);
  static const _totalSteps = 3;
  static const _currentStep = 3;

  final Set<String> _selectedIds = {};
  final _otherController = TextEditingController();

  bool _isLoading = true;
  String? _errorMessage;
  List<CatalogCategoryModel> _categories = const [];

  CatalogCategoryModel? get _customTextCategory {
    for (final category in _categories) {
      if (category.allows_custom_text && _selectedIds.contains(category.id)) {
        return category;
      }
    }
    return null;
  }

  bool get _canContinue {
    if (_isLoading || _errorMessage != null || _categories.isEmpty) {
      return false;
    }
    if (_selectedIds.isEmpty) return false;
    final custom = _customTextCategory;
    if (custom != null && _otherController.text.trim().isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    _otherController.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadCategories());
  }

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await diContainer<GetCatalogCategoriesUsecase>()().run();

    if (!mounted) return;

    result.match(
      (error) {
        setState(() {
          _isLoading = false;
          _errorMessage = _mapError(error);
          _categories = const [];
        });
      },
      (response) {
        final items = [...response.data.items]
          ..sort((a, b) => a.sort_order.compareTo(b.sort_order));
        setState(() {
          _isLoading = false;
          _errorMessage = null;
          _categories = items;
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

  String _labelFor(CatalogCategoryModel category, Locale locale) {
    if (locale.languageCode.toLowerCase().startsWith('ar')) {
      return category.name_ar;
    }
    return category.name_en;
  }

  void _toggle(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        final wasCustom = _categories.any(
          (c) => c.id == id && c.allows_custom_text,
        );
        if (wasCustom) {
          _otherController.clear();
        }
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _onFinish() {
    if (!_canContinue || widget.isSubmitting) return;
    final custom = _customTextCategory;
    widget.onFinish(
      VentorInterestsSelection(
        interestIds: _selectedIds.toList(growable: false),
        otherInterestText: custom == null ? null : _otherController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    final customCategory = _customTextCategory;

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
                  onTap: widget.isSubmitting ? null : widget.onBack,
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
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.ventor_reg_interests_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      l10n.ventor_reg_interests_subtitle,
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
              Expanded(child: _buildBody(l10n, locale)),
              if (customCategory != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                  child: TextField(
                    controller: _otherController,
                    autofocus: true,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: _accent,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: l10n.ventor_reg_interest_other_hint,
                      hintStyle: GoogleFonts.inter(
                        color: _muted,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: _fieldFill,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: _accent.withValues(alpha: 0.55),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: _accent,
                          width: 1.4,
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                child: SizedBox(
                  height: 56,
                  child: FilledButton(
                    onPressed: (_canContinue && !widget.isSubmitting)
                        ? _onFinish
                        : null,
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
                    child: widget.isSubmitting
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.2,
                              color: Colors.white,
                            ),
                          )
                        : Text(l10n.ventor_reg_finish),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                child: Text(
                  l10n.ventor_reg_interests_selected_footer(
                    _selectedIds.length,
                  ),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: _muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody(VentingMobLocalizations l10n, Locale locale) {
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
              onPressed: _loadCategories,
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

    if (_categories.isEmpty) {
      return Center(
        child: Text(
          l10n.common_unknown_error,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(color: _muted, fontSize: 14),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      itemCount: _categories.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final category = _categories[index];
        final selected = _selectedIds.contains(category.id);
        return _InterestRow(
          label: _labelFor(category, locale),
          iconUrl: category.icon_url,
          iconEmoji: category.icon_emoji,
          selected: selected,
          onTap: () => _toggle(category.id),
        );
      },
    );
  }
}

class _InterestRow extends StatelessWidget {
  const _InterestRow({
    required this.label,
    required this.iconUrl,
    required this.iconEmoji,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String iconUrl;
  final String iconEmoji;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _VentorRegistrationInterestsStepState._rowFill,
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
                  ? _VentorRegistrationInterestsStepState._accent.withValues(
                      alpha: 0.55,
                    )
                  : Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: Row(
            children: [
              _InterestIcon(url: iconUrl, emoji: iconEmoji, selected: selected),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: selected
                        ? Colors.white
                        : _VentorRegistrationInterestsStepState._muted,
                    fontSize: 15,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
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
                        ? _VentorRegistrationInterestsStepState._accent
                        : _VentorRegistrationInterestsStepState._checkboxBorder,
                    width: 1.5,
                  ),
                ),
                child: selected
                    ? const Icon(
                        Icons.check_rounded,
                        size: 14,
                        color: _VentorRegistrationInterestsStepState._accent,
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

class _InterestIcon extends StatelessWidget {
  const _InterestIcon({
    required this.url,
    required this.emoji,
    required this.selected,
  });

  final String url;
  final String emoji;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final trimmedUrl = url.trim();
    final trimmedEmoji = emoji.trim();
    final hasUrl = trimmedUrl.isNotEmpty;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: _VentorRegistrationInterestsStepState._iconFill,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      child: hasUrl
          ? CachedNetworkImage(
              imageUrl: trimmedUrl,
              fit: BoxFit.cover,
              width: 40,
              height: 40,
              placeholder: (_, _) =>
                  _emojiOrFallback(trimmedEmoji, selected: selected),
              errorWidget: (_, _, _) =>
                  _emojiOrFallback(trimmedEmoji, selected: selected),
            )
          : _emojiOrFallback(trimmedEmoji, selected: selected),
    );
  }

  static Widget _emojiOrFallback(String emoji, {required bool selected}) {
    if (emoji.isNotEmpty) {
      return Text(emoji, style: const TextStyle(fontSize: 20));
    }
    return Icon(
      Icons.category_outlined,
      size: 22,
      color: selected
          ? _VentorRegistrationInterestsStepState._accent
          : _VentorRegistrationInterestsStepState._muted,
    );
  }
}
