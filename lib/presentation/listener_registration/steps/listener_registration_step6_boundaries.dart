import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class _BoundaryTopic {
  const _BoundaryTopic({
    required this.id,
    required this.label,
    required this.icon,
  });

  final String id;
  final String label;
  final IconData icon;
}

/// Step 6 — Topics the listener does not want to discuss.
class ListenerRegistrationStep6Boundaries extends StatefulWidget {
  const ListenerRegistrationStep6Boundaries({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  State<ListenerRegistrationStep6Boundaries> createState() =>
      _ListenerRegistrationStep6BoundariesState();
}

class _ListenerRegistrationStep6BoundariesState
    extends State<ListenerRegistrationStep6Boundaries> {
  static const _cardFill = Color(0xFF1C1826);
  static const _rowSelected = Color(0xFF2A1F3D);
  static const _muted = Color(0xFF9B93AB);
  static const _checkboxBorder = Color(0xFF4A425C);
  static const _iconBg = Color(0xFF4A2A2A);
  static const _fieldFill = Color(0xFF14101C);
  static const _otherId = 'other';

  final Set<String> _selectedIds = {};
  final _otherController = TextEditingController();

  bool get _isOtherSelected => _selectedIds.contains(_otherId);

  bool get _canContinue {
    if (_isOtherSelected && _otherController.text.trim().isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    _otherController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  void _toggle(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        if (id == _otherId) {
          _otherController.clear();
        }
      } else {
        _selectedIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    final topics = [
      _BoundaryTopic(
        id: 'suicide_self_harm',
        label: l10n.listener_reg_boundary_suicide,
        icon: Icons.heart_broken_outlined,
      ),
      _BoundaryTopic(
        id: 'domestic_violence',
        label: l10n.listener_reg_boundary_domestic_violence,
        icon: Icons.home_outlined,
      ),
      _BoundaryTopic(
        id: 'sexual_topics',
        label: l10n.listener_reg_boundary_sexual,
        icon: Icons.block_flipped,
      ),
      _BoundaryTopic(
        id: 'addiction',
        label: l10n.listener_reg_boundary_addiction,
        icon: Icons.medication_outlined,
      ),
      _BoundaryTopic(
        id: 'politics',
        label: l10n.listener_reg_boundary_politics,
        icon: Icons.account_balance_outlined,
      ),
      _BoundaryTopic(
        id: 'religion',
        label: l10n.listener_reg_boundary_religion,
        icon: Icons.mosque_outlined,
      ),
      _BoundaryTopic(
        id: 'illegal_activities',
        label: l10n.listener_reg_boundary_illegal,
        icon: Icons.gavel_outlined,
      ),
      _BoundaryTopic(
        id: _otherId,
        label: l10n.listener_reg_boundary_other,
        icon: Icons.more_horiz_rounded,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
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
                    l10n.listener_reg_boundaries_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.listener_reg_boundaries_subtitle,
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
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                itemCount: topics.length,
                separatorBuilder: (_, _) => const SizedBox(height: 6),
                itemBuilder: (context, index) {
                  final topic = topics[index];
                  final selected = _selectedIds.contains(topic.id);
                  return _BoundaryRow(
                    label: topic.label,
                    icon: topic.icon,
                    selected: selected,
                    selectedFill: _rowSelected,
                    muted: _muted,
                    checkboxBorder: _checkboxBorder,
                    iconBg: _iconBg,
                    onTap: () => _toggle(topic.id),
                  );
                },
              ),
            ),
            if (_isOtherSelected)
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
                    hintText: l10n.listener_reg_boundary_other_hint,
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
                        color: SplashColors.purpleMid.withValues(alpha: 0.35),
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
            ),
          ],
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
    required this.selectedFill,
    required this.muted,
    required this.checkboxBorder,
    required this.iconBg,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final Color selectedFill;
  final Color muted;
  final Color checkboxBorder;
  final Color iconBg;
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
