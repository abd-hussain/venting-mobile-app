import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Step 4 — Life Experience (relationship, family, experiences).
class ListenerRegistrationStep4LifeExperience extends StatefulWidget {
  const ListenerRegistrationStep4LifeExperience({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  State<ListenerRegistrationStep4LifeExperience> createState() =>
      _ListenerRegistrationStep4LifeExperienceState();
}

class _ListenerRegistrationStep4LifeExperienceState
    extends State<ListenerRegistrationStep4LifeExperience> {
  static const _customMaxLength = 40;

  String? _relationshipId;
  final Set<String> _familyIds = {};
  final Set<String> _experienceIds = {};
  final List<String> _customExperiences = [];

  bool get _canContinue =>
      _relationshipId != null ||
      _familyIds.isNotEmpty ||
      _experienceIds.isNotEmpty ||
      _customExperiences.isNotEmpty;

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

    final experiences = [
      (id: 'career_change', label: l10n.listener_reg_exp_career_change),
      (id: 'job_loss', label: l10n.listener_reg_exp_job_loss),
      (id: 'startup_founder', label: l10n.listener_reg_exp_startup_founder),
      (
        id: 'financial_struggle',
        label: l10n.listener_reg_exp_financial_struggle,
      ),
      (id: 'life_stages', label: l10n.listener_reg_exp_life_stages),
      (id: 'grief_loss', label: l10n.listener_reg_exp_grief_loss),
      (id: 'anxiety_stress', label: l10n.listener_reg_exp_anxiety_stress),
      (id: 'health_challenge', label: l10n.listener_reg_exp_health_challenge),
      (
        id: 'addiction_recovery',
        label: l10n.listener_reg_exp_addiction_recovery,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
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
                  _ChipWrap(
                    children: [
                      for (final item in experiences)
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
          SizedBox(
            height: 54,
            child: FilledButton(
              onPressed: _canContinue ? widget.onContinue : null,
              style: FilledButton.styleFrom(
                backgroundColor: SplashColors.purpleMid,
                disabledBackgroundColor: SplashColors.purpleMid.withValues(
                  alpha: 0.35,
                ),
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
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
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
  static const _chipFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);

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
          hintStyle: GoogleFonts.inter(color: _muted, fontSize: 14),
          filled: true,
          fillColor: _chipFill,
          counterStyle: GoogleFonts.inter(color: _muted, fontSize: 11),
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
            style: GoogleFonts.inter(color: _muted),
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
      color: selected ? SplashColors.purpleMid : const Color(0xFF1C1826),
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
      color: const Color(0xFF1C1826),
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
