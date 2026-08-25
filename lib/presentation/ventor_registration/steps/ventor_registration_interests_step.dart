import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_category_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_categories_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

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
  });

  final VoidCallback onBack;
  final ValueChanged<VentorInterestsSelection> onFinish;

  @override
  State<VentorRegistrationInterestsStep> createState() =>
      _VentorRegistrationInterestsStepState();
}

class _VentorRegistrationInterestsStepState
    extends State<VentorRegistrationInterestsStep> {
  static const _cardFill = Color(0xFF1C1826);
  static const _rowSelected = Color(0xFF2A1F3D);
  static const _muted = Color(0xFF9B93AB);
  static const _checkboxBorder = Color(0xFF4A425C);
  static const _fieldFill = Color(0xFF14101C);

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
    if (!_canContinue) return;
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
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: IconButton(
            onPressed: widget.onBack,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Container(
              decoration: BoxDecoration(
                color: _cardFill,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.ventor_reg_interests_title,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.ventor_reg_interests_subtitle,
                          style: GoogleFonts.inter(
                            color: Colors.white.withValues(alpha: 0.65),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: _buildBody(l10n, locale)),
                  if (customCategory != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                      child: TextField(
                        controller: _otherController,
                        autofocus: true,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorColor: SplashColors.purpleMid,
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
                              color: SplashColors.purpleMid.withValues(
                                alpha: 0.35,
                              ),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: SplashColors.purpleMid,
                              width: 1.4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: SizedBox(
                      height: 54,
                      child: FilledButton(
                        onPressed: _canContinue ? _onFinish : null,
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
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        child: Text(l10n.ventor_reg_finish),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(VentingMobLocalizations l10n, Locale locale) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.4,
          color: SplashColors.purpleMid,
        ),
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
                  color: SplashColors.purpleMid,
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
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      itemCount: _categories.length,
      separatorBuilder: (_, _) => const SizedBox(height: 6),
      itemBuilder: (context, index) {
        final category = _categories[index];
        final selected = _selectedIds.contains(category.id);
        return _InterestRow(
          label: _labelFor(category, locale),
          iconUrl: category.icon_url,
          selected: selected,
          selectedFill: _rowSelected,
          muted: _muted,
          checkboxBorder: _checkboxBorder,
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
    required this.selected,
    required this.selectedFill,
    required this.muted,
    required this.checkboxBorder,
    required this.onTap,
  });

  final String label;
  final String iconUrl;
  final bool selected;
  final Color selectedFill;
  final Color muted;
  final Color checkboxBorder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? selectedFill : Colors.transparent,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              _InterestIcon(url: iconUrl, selected: selected, muted: muted),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: selected ? Colors.white : muted,
                    fontSize: 15,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
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

class _InterestIcon extends StatelessWidget {
  const _InterestIcon({
    required this.url,
    required this.selected,
    required this.muted,
  });

  final String url;
  final bool selected;
  final Color muted;

  @override
  Widget build(BuildContext context) {
    final trimmed = url.trim();
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: selected
            ? SplashColors.purpleMid.withValues(alpha: 0.22)
            : Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: trimmed.isEmpty
          ? Icon(
              Icons.category_outlined,
              size: 22,
              color: selected ? SplashColors.purpleMid : muted,
            )
          : CachedNetworkImage(
              imageUrl: trimmed,
              fit: BoxFit.cover,
              placeholder: (_, _) => Icon(
                Icons.category_outlined,
                size: 22,
                color: muted.withValues(alpha: 0.6),
              ),
              errorWidget: (_, _, _) => Icon(
                Icons.category_outlined,
                size: 22,
                color: selected ? SplashColors.purpleMid : muted,
              ),
            ),
    );
  }
}
