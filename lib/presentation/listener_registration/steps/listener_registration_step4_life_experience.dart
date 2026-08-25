import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_life_experience_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_life_experiences_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

/// Step 4 — Life Experience (relationship, family, experiences).
///
/// Life experience chips come from `#76 GET /v1/catalog/life-experiences`.
class ListenerRegistrationStep4LifeExperience extends StatefulWidget {
  const ListenerRegistrationStep4LifeExperience({
    super.key,
    required this.onContinue,
    this.initialRelationshipId,
    this.initialFamilyIds = const [],
    this.initialExperienceIds = const [],
    this.initialCustomExperiences = const [],
  });

  final ValueChanged<ListenerRegistrationStep4Data> onContinue;
  final String? initialRelationshipId;
  final List<String> initialFamilyIds;
  final List<String> initialExperienceIds;
  final List<String> initialCustomExperiences;

  @override
  State<ListenerRegistrationStep4LifeExperience> createState() =>
      _ListenerRegistrationStep4LifeExperienceState();
}

class _ListenerRegistrationStep4LifeExperienceState
    extends State<ListenerRegistrationStep4LifeExperience> {
  static const _customMaxLength = 40;
  static const _chipFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);
  static const _sectionLabel = Color(0xFFB7AEC9);

  String? _relationshipId;
  final Set<String> _familyIds = {};
  final Set<String> _experienceIds = {};
  final List<String> _customExperiences = [];

  bool _isLoadingExperiences = true;
  String? _experiencesError;
  List<CatalogLifeExperienceModel> _experiences = const [];

  bool get _canContinue =>
      _relationshipId != null ||
      _familyIds.isNotEmpty ||
      _experienceIds.isNotEmpty ||
      _customExperiences.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _relationshipId = widget.initialRelationshipId;
    _familyIds
      ..clear()
      ..addAll(widget.initialFamilyIds);
    _experienceIds
      ..clear()
      ..addAll(widget.initialExperienceIds);
    _customExperiences
      ..clear()
      ..addAll(widget.initialCustomExperiences);
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadExperiences());
  }

  Future<void> _loadExperiences() async {
    setState(() {
      _isLoadingExperiences = true;
      _experiencesError = null;
    });

    final result = await diContainer<GetCatalogLifeExperiencesUsecase>()()
        .run();

    if (!mounted) return;

    result.match(
      (error) {
        setState(() {
          _isLoadingExperiences = false;
          _experiencesError = _mapError(error);
          _experiences = const [];
        });
      },
      (response) {
        final items = [...response.data.items]
          ..sort((a, b) => a.sort_order.compareTo(b.sort_order));
        setState(() {
          _isLoadingExperiences = false;
          _experiencesError = null;
          _experiences = items;
          _experienceIds.removeWhere(
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
    return VentingMobLocalizations.of(context).listener_reg_exp_load_error;
  }

  String _labelFor(CatalogLifeExperienceModel item, Locale locale) {
    if (locale.languageCode.toLowerCase().startsWith('ar')) {
      return item.name_ar;
    }
    return item.name_en;
  }

  void _selectRelationship(String id) {
    setState(() {
      _relationshipId = _relationshipId == id ? null : id;
    });
  }

  void _toggleFamily(String id) {
    setState(() {
      if (_familyIds.contains(id)) {
        _familyIds.remove(id);
      } else {
        _familyIds.add(id);
      }
    });
  }

  void _toggleExperience(String id) {
    setState(() {
      if (_experienceIds.contains(id)) {
        _experienceIds.remove(id);
      } else {
        _experienceIds.add(id);
      }
    });
  }

  void _removeCustom(String value) {
    setState(() => _customExperiences.remove(value));
  }

  void _submit() {
    if (!_canContinue) return;
    widget.onContinue(
      ListenerRegistrationStep4Data(
        relationshipId: _relationshipId,
        familyIds: _familyIds.toList(growable: false),
        experienceIds: _experienceIds.toList(growable: false),
        customExperiences: List<String>.from(_customExperiences),
      ),
    );
  }

  Future<void> _addCustomExperience() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) =>
          const _AddExperienceDialog(maxLength: _customMaxLength),
    );
    if (result == null || !mounted) return;

    final exists = _customExperiences.any(
      (e) => e.toLowerCase() == result.toLowerCase(),
    );
    if (exists) return;
    setState(() => _customExperiences.add(result));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final locale = Localizations.localeOf(context);

    final relationships = [
      (id: 'single', label: l10n.listener_reg_exp_single),
      (id: 'in_relationship', label: l10n.listener_reg_exp_in_relationship),
      (id: 'married', label: l10n.listener_reg_exp_married),
      (id: 'divorced', label: l10n.listener_reg_exp_divorced),
      (id: 'widowed', label: l10n.listener_reg_exp_widowed),
    ];

    final family = [
      (id: 'parent', label: l10n.listener_reg_exp_parent),
      (id: 'single_parent', label: l10n.listener_reg_exp_single_parent),
      (id: 'caregiver', label: l10n.listener_reg_exp_caregiver),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.listener_reg_experience_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.listener_reg_experience_subtitle,
                    style: GoogleFonts.inter(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 28),
                  _SectionTitle(l10n.listener_reg_exp_section_relationship),
                  const SizedBox(height: 12),
                  _ChipWrap(
                    children: [
                      for (final item in relationships)
                        _SelectableChip(
                          label: item.label,
                          selected: _relationshipId == item.id,
                          onTap: () => _selectRelationship(item.id),
                        ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _SectionTitle(l10n.listener_reg_exp_section_family),
                  const SizedBox(height: 12),
                  _ChipWrap(
                    children: [
                      for (final item in family)
                        _SelectableChip(
                          label: item.label,
                          selected: _familyIds.contains(item.id),
                          onTap: () => _toggleFamily(item.id),
                        ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _SectionTitle(l10n.listener_reg_exp_section_experiences),
                  const SizedBox(height: 12),
                  if (_isLoadingExperiences)
                    const _ExperiencesShimmer()
                  else if (_experiencesError != null)
                    _ExperiencesError(
                      message: _experiencesError!,
                      onRetry: _loadExperiences,
                    )
                  else
                    _ChipWrap(
                      children: [
                        for (final item in _experiences)
                          _SelectableChip(
                            label: _labelFor(item, locale),
                            selected: _experienceIds.contains(item.id),
                            onTap: () => _toggleExperience(item.id),
                          ),
                        for (final custom in _customExperiences)
                          _SelectableChip(
                            label: custom,
                            selected: true,
                            onTap: () => _removeCustom(custom),
                            showClose: true,
                          ),
                        _AddMoreChip(
                          label: l10n.listener_reg_exp_add_more,
                          onTap: _addCustomExperience,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 56,
            child: FilledButton(
              onPressed: _canContinue ? _submit : null,
              style: FilledButton.styleFrom(
                backgroundColor: _canContinue
                    ? _accent
                    : _accent.withValues(alpha: 0.42),
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
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: _ListenerRegistrationStep4LifeExperienceState._sectionLabel,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _ExperiencesShimmer extends StatelessWidget {
  const _ExperiencesShimmer();

  static const _widths = <double>[112, 88, 104, 128, 118, 72, 96, 120];

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF2A2140),
      highlightColor: const Color(0xFF3A2F52),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          for (final width in _widths)
            Container(
              width: width,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
        ],
      ),
    );
  }
}

class _ExperiencesError extends StatelessWidget {
  const _ExperiencesError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message,
          style: GoogleFonts.inter(
            color: _ListenerRegistrationStep4LifeExperienceState._muted,
            fontSize: 14,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: onRetry,
          style: TextButton.styleFrom(
            foregroundColor:
                _ListenerRegistrationStep4LifeExperienceState._accent,
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            l10n.common_retry,
            style: GoogleFonts.inter(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class _AddExperienceDialog extends StatefulWidget {
  const _AddExperienceDialog({required this.maxLength});

  final int maxLength;

  @override
  State<_AddExperienceDialog> createState() => _AddExperienceDialogState();
}

class _AddExperienceDialogState extends State<_AddExperienceDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final trimmed = _controller.text.trim();
    if (trimmed.isEmpty) return;
    Navigator.of(context).pop(trimmed);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return AlertDialog(
      backgroundColor: const Color(0xFF16121F),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        l10n.listener_reg_add_experience_title,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: TextField(
        controller: _controller,
        autofocus: true,
        maxLength: widget.maxLength,
        inputFormatters: [LengthLimitingTextInputFormatter(widget.maxLength)],
        style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
        cursorColor: _ListenerRegistrationStep4LifeExperienceState._accent,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: l10n.listener_reg_add_experience_hint,
          hintStyle: GoogleFonts.inter(
            color: _ListenerRegistrationStep4LifeExperienceState._muted,
            fontSize: 14,
          ),
          filled: true,
          fillColor: _ListenerRegistrationStep4LifeExperienceState._chipFill,
          counterStyle: GoogleFonts.inter(
            color: _ListenerRegistrationStep4LifeExperienceState._muted,
            fontSize: 11,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            l10n.listener_reg_cancel,
            style: GoogleFonts.inter(
              color: _ListenerRegistrationStep4LifeExperienceState._muted,
            ),
          ),
        ),
        TextButton(
          onPressed: _submit,
          child: Text(
            l10n.listener_reg_add,
            style: GoogleFonts.inter(
              color: _ListenerRegistrationStep4LifeExperienceState._accent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _ChipWrap extends StatelessWidget {
  const _ChipWrap({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 10, runSpacing: 10, children: children);
  }
}

class _SelectableChip extends StatelessWidget {
  const _SelectableChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.showClose = false,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool showClose;

  @override
  Widget build(BuildContext context) {
    final borderColor = selected
        ? _ListenerRegistrationStep4LifeExperienceState._accent
        : Colors.white.withValues(alpha: 0.08);

    return Material(
      color: _ListenerRegistrationStep4LifeExperienceState._chipFill,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: EdgeInsetsDirectional.only(
            start: 14,
            end: showClose ? 8 : 14,
            top: 10,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: borderColor, width: selected ? 1.5 : 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (showClose) ...[
                const SizedBox(width: 4),
                const Icon(Icons.close_rounded, size: 16, color: Colors.white),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _AddMoreChip extends StatelessWidget {
  const _AddMoreChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _ListenerRegistrationStep4LifeExperienceState._chipFill,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: _ListenerRegistrationStep4LifeExperienceState._accent
                  .withValues(alpha: 0.55),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.add_rounded,
                size: 18,
                color: _ListenerRegistrationStep4LifeExperienceState._accent,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: _ListenerRegistrationStep4LifeExperienceState._accent,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
