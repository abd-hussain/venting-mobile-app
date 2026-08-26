import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_boundary_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_boundaries_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/catalog/widgets/catalog_category_widgets.dart';

String _boundaryLabel(CatalogBoundaryModel boundary, Locale locale) {
  if (locale.languageCode.toLowerCase().startsWith('ar')) {
    return boundary.name_ar;
  }
  return boundary.name_en;
}

/// Step 6 — Topics the listener does not want to discuss.
///
/// Boundaries come from `#77 GET /v1/catalog/boundaries`.
class ListenerRegistrationStep6Boundaries extends StatefulWidget {
  const ListenerRegistrationStep6Boundaries({
    super.key,
    required this.onContinue,
    this.initialSelectedIds = const [],
    this.initialOtherText,
  });

  final ValueChanged<ListenerRegistrationStep6Data> onContinue;
  final List<String> initialSelectedIds;
  final String? initialOtherText;

  @override
  State<ListenerRegistrationStep6Boundaries> createState() =>
      _ListenerRegistrationStep6BoundariesState();
}

class _ListenerRegistrationStep6BoundariesState
    extends State<ListenerRegistrationStep6Boundaries> {
  static const _fieldFill = Color(0xFF14101C);

  final Set<String> _selectedIds = {};
  final _otherController = TextEditingController();

  bool _isLoading = true;
  String? _errorMessage;
  List<CatalogBoundaryModel> _boundaries = const [];

  CatalogBoundaryModel? get _customTextBoundary {
    for (final boundary in _boundaries) {
      if (boundary.allows_custom_text && _selectedIds.contains(boundary.id)) {
        return boundary;
      }
    }
    return null;
  }

  bool get _canContinue {
    if (_isLoading) return false;
    if (_selectedIds.isEmpty) return false;
    final custom = _customTextBoundary;
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
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadBoundaries());
  }

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  Future<void> _loadBoundaries() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await diContainer<GetCatalogBoundariesUsecase>()().run();

    if (!mounted) return;

    result.match(
      (error) {
        setState(() {
          _isLoading = false;
          _errorMessage = _mapError(error);
          _boundaries = const [];
        });
      },
      (response) {
        final items = [...response.data.items]
          ..sort((a, b) {
            final order = a.sort_order.compareTo(b.sort_order);
            if (order != 0) return order;
            return a.name_en.compareTo(b.name_en);
          });
        setState(() {
          _isLoading = false;
          _errorMessage = null;
          _boundaries = items;
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
    return VentingMobLocalizations.of(context).catalog_boundaries_load_error;
  }

  void _toggle(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        final wasCustom = _boundaries.any(
          (b) => b.id == id && b.allows_custom_text,
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
      ListenerRegistrationStep6Data(
        boundaryIds: _selectedIds.toList(growable: false),
        boundaryOtherText: other.isEmpty ? null : other,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    final customBoundary = _customTextBoundary;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.listener_reg_boundaries_title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.listener_reg_boundaries_subtitle,
            style: GoogleFonts.inter(
              color: CatalogCategoryTheme.muted,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(child: _buildBody(l10n, locale)),
          if (customBoundary != null)
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
                  hintText: l10n.listener_reg_boundary_other_hint,
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
            onPressed: _loadBoundaries,
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

    if (_boundaries.isEmpty) {
      return Center(
        child: Text(
          l10n.catalog_boundaries_load_error,
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
      itemCount: _boundaries.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final boundary = _boundaries[index];
        final selected = _selectedIds.contains(boundary.id);
        return CatalogCategoryRow(
          label: _boundaryLabel(boundary, locale),
          iconUrl: boundary.icon_url,
          iconEmoji: boundary.icon_emoji,
          selected: selected,
          onTap: () => _toggle(boundary.id),
        );
      },
    );
  }
}
