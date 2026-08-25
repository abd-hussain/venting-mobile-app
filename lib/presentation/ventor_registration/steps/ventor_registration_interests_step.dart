import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_category_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_categories_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/catalog/widgets/catalog_category_widgets.dart';

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
/// Categories come from `#74 GET /v1/catalog/categories`.
class VentorRegistrationInterestsStep extends StatefulWidget {
  const VentorRegistrationInterestsStep({
    super.key,
    required this.onBack,
    required this.onContinue,
    this.initialSelection,
  });

  final VoidCallback onBack;
  final ValueChanged<VentorInterestsSelection> onContinue;
  final VentorInterestsSelection? initialSelection;

  @override
  State<VentorRegistrationInterestsStep> createState() =>
      _VentorRegistrationInterestsStepState();
}

class _VentorRegistrationInterestsStepState
    extends State<VentorRegistrationInterestsStep> {
  static const _rowFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);
  static const _progressTrack = Color(0xFF3A2F52);
  static const _fieldFill = Color(0xFF14101C);
  static const _totalSteps = 4;
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
    final initial = widget.initialSelection;
    if (initial != null) {
      _selectedIds.addAll(initial.interestIds);
      if (initial.otherInterestText != null &&
          initial.otherInterestText!.isNotEmpty) {
        _otherController.text = initial.otherInterestText!;
      }
    }
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
    return VentingMobLocalizations.of(context).catalog_categories_load_error;
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

  void _onContinue() {
    if (!_canContinue) return;
    final custom = _customTextCategory;
    widget.onContinue(
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
                    child: Text(l10n.listener_reg_continue),
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
      return const SingleChildScrollView(child: CatalogCategoriesShimmer());
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
          l10n.catalog_categories_load_error,
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
        return CatalogCategoryRow(
          label: catalogCategoryLabel(category, locale),
          iconUrl: category.icon_url,
          iconEmoji: category.icon_emoji,
          selected: selected,
          onTap: () => _toggle(category.id),
        );
      },
    );
  }
}
