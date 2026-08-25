import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_category_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_categories_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/catalog/widgets/catalog_category_widgets.dart';

/// Step 5 — Areas you're comfortable listening to.
///
/// Categories come from `#74 GET /v1/catalog/categories`.
class ListenerRegistrationStep5ComfortAreas extends StatefulWidget {
  const ListenerRegistrationStep5ComfortAreas({
    super.key,
    required this.onContinue,
    this.initialSelectedIds = const [],
    this.initialOtherText,
  });

  final ValueChanged<ListenerRegistrationStep5Data> onContinue;
  final List<String> initialSelectedIds;
  final String? initialOtherText;

  @override
  State<ListenerRegistrationStep5ComfortAreas> createState() =>
      _ListenerRegistrationStep5ComfortAreasState();
}

class _ListenerRegistrationStep5ComfortAreasState
    extends State<ListenerRegistrationStep5ComfortAreas> {
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
    _selectedIds.addAll(widget.initialSelectedIds);
    if (widget.initialOtherText != null &&
        widget.initialOtherText!.isNotEmpty) {
      _otherController.text = widget.initialOtherText!;
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

  void _submit() {
    if (!_canContinue) return;
    final other = _otherController.text.trim();
    widget.onContinue(
      ListenerRegistrationStep5Data(
        comfortAreaIds: _selectedIds.toList(growable: false),
        comfortAreaOtherText: other.isEmpty ? null : other,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    final customCategory = _customTextCategory;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.listener_reg_areas_title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.listener_reg_areas_subtitle,
            style: GoogleFonts.inter(
              color: CatalogCategoryTheme.muted,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(child: _buildBody(l10n, locale)),
          if (customCategory != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextField(
                controller: _otherController,
                autofocus: true,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: CatalogCategoryTheme.accent,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: l10n.listener_reg_area_other_hint,
                  hintStyle: GoogleFonts.inter(
                    color: CatalogCategoryTheme.muted,
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
                      color: CatalogCategoryTheme.accent.withValues(
                        alpha: 0.55,
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: CatalogCategoryTheme.accent,
                      width: 1.4,
                    ),
                  ),
                ),
              ),
            ),
          Text(
            l10n.listener_reg_areas_topics_selected(_selectedIds.length),
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: CatalogCategoryTheme.muted,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 56,
            child: FilledButton(
              onPressed: _canContinue ? _submit : null,
              style: FilledButton.styleFrom(
                backgroundColor: CatalogCategoryTheme.accent,
                disabledBackgroundColor: CatalogCategoryTheme.accent.withValues(
                  alpha: 0.42,
                ),
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
        ],
      ),
    );
  }

  Widget _buildBody(VentingMobLocalizations l10n, Locale locale) {
    if (_isLoading) {
      return const SingleChildScrollView(
        child: CatalogCategoriesShimmer(padding: EdgeInsets.zero),
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
              color: CatalogCategoryTheme.muted,
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
                color: CatalogCategoryTheme.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    }

    if (_categories.isEmpty) {
      return Center(
        child: Text(
          l10n.catalog_categories_load_error,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: CatalogCategoryTheme.muted,
            fontSize: 14,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
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
