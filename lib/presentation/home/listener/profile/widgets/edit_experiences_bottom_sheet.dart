import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class EditExperiencesResult {
  const EditExperiencesResult({
    this.relationshipId,
    required this.familyIds,
    required this.experienceIds,
    required this.customExperiences,
  });

  final String? relationshipId;
  final Set<String> familyIds;
  final Set<String> experienceIds;
  final List<String> customExperiences;

  bool get hasAny =>
      relationshipId != null ||
      familyIds.isNotEmpty ||
      experienceIds.isNotEmpty ||
      customExperiences.isNotEmpty;
}

/// Catalog of life-experience options (same as registration step 4).
abstract final class ListenerExperienceOptions {
  static List<({String id, String label})> relationships(
    VentingMobLocalizations l10n,
  ) => [
    (id: 'single', label: l10n.listener_reg_exp_single),
    (id: 'in_relationship', label: l10n.listener_reg_exp_in_relationship),
    (id: 'married', label: l10n.listener_reg_exp_married),
    (id: 'divorced', label: l10n.listener_reg_exp_divorced),
    (id: 'widowed', label: l10n.listener_reg_exp_widowed),
  ];

  static List<({String id, String label})> family(
    VentingMobLocalizations l10n,
  ) => [
    (id: 'parent', label: l10n.listener_reg_exp_parent),
    (id: 'single_parent', label: l10n.listener_reg_exp_single_parent),
    (id: 'caregiver', label: l10n.listener_reg_exp_caregiver),
  ];

  static List<({String id, String label})> experiences(
    VentingMobLocalizations l10n,
  ) => [
    (id: 'career_change', label: l10n.listener_reg_exp_career_change),
    (id: 'job_loss', label: l10n.listener_reg_exp_job_loss),
    (id: 'startup_founder', label: l10n.listener_reg_exp_startup_founder),
    (id: 'financial_struggle', label: l10n.listener_reg_exp_financial_struggle),
    (id: 'life_stages', label: l10n.listener_reg_exp_life_stages),
    (id: 'grief_loss', label: l10n.listener_reg_exp_grief_loss),
    (id: 'anxiety_stress', label: l10n.listener_reg_exp_anxiety_stress),
    (id: 'health_challenge', label: l10n.listener_reg_exp_health_challenge),
    (id: 'addiction_recovery', label: l10n.listener_reg_exp_addiction_recovery),
  ];

  /// Labels for profile chips from a saved selection.
  static List<String> displayLabels({
    required VentingMobLocalizations l10n,
    required EditExperiencesResult selection,
  }) {
    final labels = <String>[];

    for (final item in relationships(l10n)) {
      if (item.id == selection.relationshipId) labels.add(item.label);
    }
    for (final item in family(l10n)) {
      if (selection.familyIds.contains(item.id)) labels.add(item.label);
    }
    for (final item in experiences(l10n)) {
      if (selection.experienceIds.contains(item.id)) labels.add(item.label);
    }
    labels.addAll(selection.customExperiences);
    return labels;
  }
}

Future<EditExperiencesResult?> showEditExperiencesBottomSheet({
  required BuildContext context,
  EditExperiencesResult? initial,
}) {
  return showModalBottomSheet<EditExperiencesResult>(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: ListenerProfileTheme.cardFill,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) => EditExperiencesBottomSheet(initial: initial),
  );
}

class EditExperiencesBottomSheet extends StatefulWidget {
  const EditExperiencesBottomSheet({super.key, this.initial});

  final EditExperiencesResult? initial;

  static const customMaxLength = 40;

  @override
  State<EditExperiencesBottomSheet> createState() =>
      _EditExperiencesBottomSheetState();
}

class _EditExperiencesBottomSheetState
    extends State<EditExperiencesBottomSheet> {
  String? _relationshipId;
  late final Set<String> _familyIds;
  late final Set<String> _experienceIds;
  late final List<String> _customExperiences;

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;
    _relationshipId = initial?.relationshipId;
    _familyIds = {...?initial?.familyIds};
    _experienceIds = {...?initial?.experienceIds};
    _customExperiences = [...?initial?.customExperiences];
  }

  bool get _canSave {
    final hasAny =
        _relationshipId != null ||
        _familyIds.isNotEmpty ||
        _experienceIds.isNotEmpty ||
        _customExperiences.isNotEmpty;
    if (!hasAny) return false;

    final initial = widget.initial;
    if (initial == null) return true;

    return _relationshipId != initial.relationshipId ||
        !_setEquals(_familyIds, initial.familyIds) ||
        !_setEquals(_experienceIds, initial.experienceIds) ||
        !_listEquals(_customExperiences, initial.customExperiences);
  }

  bool _setEquals(Set<String> a, Set<String> b) =>
      a.length == b.length && a.containsAll(b);

  bool _listEquals(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  void _selectRelationship(String id) {
    setState(() => _relationshipId = _relationshipId == id ? null : id);
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

  Future<void> _addCustomExperience() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => const _AddExperienceDialog(
        maxLength: EditExperiencesBottomSheet.customMaxLength,
      ),
    );
    if (result == null || !mounted) return;

    final exists = _customExperiences.any(
      (e) => e.toLowerCase() == result.toLowerCase(),
    );
    if (exists) return;
    setState(() => _customExperiences.add(result));
  }

  void _onCancel() => Navigator.of(context).pop();

  void _onSave() {
    if (!_canSave) return;
    Navigator.of(context).pop(
      EditExperiencesResult(
        relationshipId: _relationshipId,
        familyIds: {..._familyIds},
        experienceIds: {..._experienceIds},
        customExperiences: [..._customExperiences],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final maxHeight = MediaQuery.sizeOf(context).height * 0.82;

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: 20 + MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                l10n.listener_profile_edit_experiences_title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.listener_profile_edit_experiences_subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _SectionTitle(l10n.listener_reg_exp_section_relationship),
                      const SizedBox(height: 12),
                      _ChipWrap(
                        children: [
                          for (final item
                              in ListenerExperienceOptions.relationships(l10n))
                            _SelectableChip(
                              label: item.label,
                              selected: _relationshipId == item.id,
                              onTap: () => _selectRelationship(item.id),
                            ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      _SectionTitle(l10n.listener_reg_exp_section_family),
                      const SizedBox(height: 12),
                      _ChipWrap(
                        children: [
                          for (final item in ListenerExperienceOptions.family(
                            l10n,
                          ))
                            _SelectableChip(
                              label: item.label,
                              selected: _familyIds.contains(item.id),
                              onTap: () => _toggleFamily(item.id),
                            ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      _SectionTitle(l10n.listener_reg_exp_section_experiences),
                      const SizedBox(height: 12),
                      _ChipWrap(
                        children: [
                          for (final item
                              in ListenerExperienceOptions.experiences(l10n))
                            _SelectableChip(
                              label: item.label,
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _onCancel,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                        minimumSize: const Size.fromHeight(52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: Text(l10n.common_cancel),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: _canSave ? _onSave : null,
                      style: FilledButton.styleFrom(
                        backgroundColor: SplashColors.purpleMid,
                        disabledBackgroundColor: SplashColors.purpleMid
                            .withValues(alpha: 0.35),
                        foregroundColor: Colors.white,
                        disabledForegroundColor: Colors.white.withValues(
                          alpha: 0.7,
                        ),
                        elevation: 0,
                        minimumSize: const Size.fromHeight(52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: Text(l10n.common_save),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
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
    return Material(
      color: selected ? SplashColors.purpleMid : const Color(0xFF14101C),
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
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : Colors.white.withValues(alpha: 0.08),
            ),
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
      color: const Color(0xFF14101C),
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: SplashColors.purpleMid.withValues(alpha: 0.55),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.add_rounded,
                size: 18,
                color: SplashColors.purpleMid,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: SplashColors.purpleMid,
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
        cursorColor: SplashColors.purpleMid,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: l10n.listener_reg_add_experience_hint,
          hintStyle: GoogleFonts.inter(
            color: ListenerProfileTheme.muted,
            fontSize: 14,
          ),
          filled: true,
          fillColor: const Color(0xFF1C1826),
          counterStyle: GoogleFonts.inter(
            color: ListenerProfileTheme.muted,
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
            l10n.common_cancel,
            style: GoogleFonts.inter(color: ListenerProfileTheme.muted),
          ),
        ),
        TextButton(
          onPressed: _submit,
          child: Text(
            l10n.listener_reg_add,
            style: GoogleFonts.inter(
              color: SplashColors.purpleMid,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
