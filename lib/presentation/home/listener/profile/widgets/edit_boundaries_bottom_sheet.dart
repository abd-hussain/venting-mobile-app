import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class EditBoundariesResult {
  const EditBoundariesResult({required this.selectedIds, this.otherText});

  final Set<String> selectedIds;
  final String? otherText;

  bool get hasAny => selectedIds.isNotEmpty;

  bool get requiresOtherText => selectedIds.contains('other');
}

class BoundaryTopic {
  const BoundaryTopic({
    required this.id,
    required this.label,
    required this.icon,
  });

  final String id;
  final String label;
  final IconData icon;
}

/// Catalog of boundary topics (same as registration step 6).
abstract final class ListenerBoundaryOptions {
  static List<BoundaryTopic> topics(VentingMobLocalizations l10n) => [
    BoundaryTopic(
      id: 'suicide_self_harm',
      label: l10n.listener_reg_boundary_suicide,
      icon: Icons.heart_broken_outlined,
    ),
    BoundaryTopic(
      id: 'domestic_violence',
      label: l10n.listener_reg_boundary_domestic_violence,
      icon: Icons.home_outlined,
    ),
    BoundaryTopic(
      id: 'sexual_topics',
      label: l10n.listener_reg_boundary_sexual,
      icon: Icons.block_flipped,
    ),
    BoundaryTopic(
      id: 'addiction',
      label: l10n.listener_reg_boundary_addiction,
      icon: Icons.medication_outlined,
    ),
    BoundaryTopic(
      id: 'politics',
      label: l10n.listener_reg_boundary_politics,
      icon: Icons.account_balance_outlined,
    ),
    BoundaryTopic(
      id: 'religion',
      label: l10n.listener_reg_boundary_religion,
      icon: Icons.mosque_outlined,
    ),
    BoundaryTopic(
      id: 'illegal_activities',
      label: l10n.listener_reg_boundary_illegal,
      icon: Icons.gavel_outlined,
    ),
    BoundaryTopic(
      id: 'other',
      label: l10n.listener_reg_boundary_other,
      icon: Icons.more_horiz_rounded,
    ),
  ];

  static List<String> displayLabels({
    required VentingMobLocalizations l10n,
    required EditBoundariesResult selection,
  }) {
    return [
      for (final topic in topics(l10n))
        if (selection.selectedIds.contains(topic.id))
          if (topic.id == 'other' &&
              selection.otherText?.trim().isNotEmpty == true)
            selection.otherText!.trim()
          else
            topic.label,
    ];
  }
}

Future<EditBoundariesResult?> showEditBoundariesBottomSheet({
  required BuildContext context,
  EditBoundariesResult? initial,
}) {
  return showModalBottomSheet<EditBoundariesResult>(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: ListenerProfileTheme.cardFill,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) => EditBoundariesBottomSheet(initial: initial),
  );
}

class EditBoundariesBottomSheet extends StatefulWidget {
  const EditBoundariesBottomSheet({super.key, this.initial});

  final EditBoundariesResult? initial;

  @override
  State<EditBoundariesBottomSheet> createState() =>
      _EditBoundariesBottomSheetState();
}

class _EditBoundariesBottomSheetState extends State<EditBoundariesBottomSheet> {
  static const _rowSelected = Color(0xFF2A1F3D);
  static const _checkboxBorder = Color(0xFF4A425C);
  static const _iconBg = Color(0xFF4A2A2A);
  static const _fieldFill = Color(0xFF1A1428);

  late final Set<String> _selectedIds;
  late final TextEditingController _otherController;

  @override
  void initState() {
    super.initState();
    _selectedIds = {...?widget.initial?.selectedIds};
    _otherController = TextEditingController(
      text: widget.initial?.otherText ?? '',
    );
    _otherController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  bool get _requiresOtherText => _selectedIds.contains('other');

  bool get _canSave {
    final initial = widget.initial;
    final initialIds = initial?.selectedIds ?? const <String>{};
    if (_selectedIds.isEmpty) return false;
    if (_requiresOtherText && _otherController.text.trim().isEmpty) {
      return false;
    }

    final other = _otherController.text.trim();
    final initialOther = initial?.otherText?.trim() ?? '';
    return _selectedIds.length != initialIds.length ||
        !_selectedIds.containsAll(initialIds) ||
        other != initialOther;
  }

  void _toggle(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        if (id == 'other') {
          _otherController.clear();
        }
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _onCancel() => Navigator.of(context).pop();

  void _onSave() {
    if (!_canSave) return;
    final other = _otherController.text.trim();
    Navigator.of(context).pop(
      EditBoundariesResult(
        selectedIds: {..._selectedIds},
        otherText: other.isEmpty ? null : other,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final topics = ListenerBoundaryOptions.topics(l10n);
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
                l10n.listener_profile_edit_boundaries_title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.listener_profile_edit_boundaries_subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: topics.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 6),
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    final selected = _selectedIds.contains(topic.id);
                    return _BoundaryRow(
                      label: topic.label,
                      icon: topic.icon,
                      selected: selected,
                      onTap: () => _toggle(topic.id),
                      selectedFill: _rowSelected,
                      checkboxBorder: _checkboxBorder,
                      iconBg: _iconBg,
                    );
                  },
                ),
              ),
              if (_requiresOtherText) ...[
                const SizedBox(height: 12),
                TextField(
                  controller: _otherController,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorColor: SplashColors.purpleMid,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: l10n.listener_reg_boundary_other_hint,
                    hintStyle: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 15,
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
                        color: SplashColors.purpleMid.withValues(alpha: 0.55),
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
              ],
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

class _BoundaryRow extends StatelessWidget {
  const _BoundaryRow({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
    required this.selectedFill,
    required this.checkboxBorder,
    required this.iconBg,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  final Color selectedFill;
  final Color checkboxBorder;
  final Color iconBg;

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
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 22, color: const Color(0xFFE8B4B4)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: Colors.white,
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
