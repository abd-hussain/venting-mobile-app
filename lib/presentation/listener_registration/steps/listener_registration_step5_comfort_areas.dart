import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class _ComfortArea {
  const _ComfortArea({
    required this.id,
    required this.label,
    required this.icon,
  });

  final String id;
  final String label;
  final IconData icon;
}

/// Step 5 — Areas you're comfortable listening to.
class ListenerRegistrationStep5ComfortAreas extends StatefulWidget {
  const ListenerRegistrationStep5ComfortAreas({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  State<ListenerRegistrationStep5ComfortAreas> createState() =>
      _ListenerRegistrationStep5ComfortAreasState();
}

class _ListenerRegistrationStep5ComfortAreasState
    extends State<ListenerRegistrationStep5ComfortAreas> {
  static const _cardFill = Color(0xFF1C1826);
  static const _rowSelected = Color(0xFF2A1F3D);
  static const _muted = Color(0xFF9B93AB);
  static const _checkboxBorder = Color(0xFF4A425C);
  static const _fieldFill = Color(0xFF14101C);
  static const _otherId = 'other';

  final Set<String> _selectedIds = {};
  final _otherController = TextEditingController();

  bool get _isOtherSelected => _selectedIds.contains(_otherId);

  bool get _canContinue {
    if (_selectedIds.isEmpty) return false;
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

    final areas = [
      _ComfortArea(
        id: 'relationships',
        label: l10n.listener_reg_area_relationships,
        icon: Icons.favorite_rounded,
      ),
      _ComfortArea(
        id: 'marriage',
        label: l10n.listener_reg_area_marriage,
        icon: Icons.favorite_border_rounded,
      ),
      _ComfortArea(
        id: 'parenting',
        label: l10n.listener_reg_area_parenting,
        icon: Icons.family_restroom_rounded,
      ),
      _ComfortArea(
        id: 'career_work',
        label: l10n.listener_reg_area_career_work,
        icon: Icons.work_outline_rounded,
      ),
      _ComfortArea(
        id: 'stress_anxiety',
        label: l10n.listener_reg_area_stress_anxiety,
        icon: Icons.psychology_alt_outlined,
      ),
      _ComfortArea(
        id: 'loneliness',
        label: l10n.listener_reg_area_loneliness,
        icon: Icons.person_outline_rounded,
      ),
      _ComfortArea(
        id: 'student_life',
        label: l10n.listener_reg_area_student_life,
        icon: Icons.school_outlined,
      ),
      _ComfortArea(
        id: 'financial_stress',
        label: l10n.listener_reg_area_financial_stress,
        icon: Icons.attach_money_rounded,
      ),
      _ComfortArea(
        id: 'health_wellness',
        label: l10n.listener_reg_area_health_wellness,
        icon: Icons.health_and_safety_outlined,
      ),
      _ComfortArea(
        id: _otherId,
        label: l10n.listener_reg_area_other,
        icon: Icons.add_circle_outline_rounded,
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
                    l10n.listener_reg_areas_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.listener_reg_areas_subtitle,
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
                itemCount: areas.length,
                separatorBuilder: (_, _) => const SizedBox(height: 6),
                itemBuilder: (context, index) {
                  final area = areas[index];
                  final selected = _selectedIds.contains(area.id);
                  return _ComfortAreaRow(
                    label: area.label,
                    icon: area.icon,
                    selected: selected,
                    selectedFill: _rowSelected,
                    muted: _muted,
                    checkboxBorder: _checkboxBorder,
                    onTap: () => _toggle(area.id),
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
                    hintText: l10n.listener_reg_area_other_hint,
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

class _ComfortAreaRow extends StatelessWidget {
  const _ComfortAreaRow({
    required this.label,
    required this.icon,
    required this.selected,
    required this.selectedFill,
    required this.muted,
    required this.checkboxBorder,
    required this.onTap,
  });

  final String label;
  final IconData icon;
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
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: selected
                      ? SplashColors.purpleMid.withValues(alpha: 0.22)
                      : Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 22,
                  color: selected ? SplashColors.purpleMid : muted,
                ),
              ),
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
