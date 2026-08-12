import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class _VentorInterest {
  const _VentorInterest({
    required this.id,
    required this.label,
    required this.icon,
  });

  final String id;
  final String label;
  final IconData icon;
}

/// Ventor registration step 2 — topics they want to vent about.
class VentorRegistrationInterestsStep extends StatefulWidget {
  const VentorRegistrationInterestsStep({
    super.key,
    required this.onBack,
    required this.onFinish,
  });

  final VoidCallback onBack;
  final VoidCallback onFinish;

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

    final interests = [
      _VentorInterest(
        id: 'relationships',
        label: l10n.ventor_reg_interest_relationships,
        icon: Icons.favorite_rounded,
      ),
      _VentorInterest(
        id: 'marriage',
        label: l10n.ventor_reg_interest_marriage,
        icon: Icons.favorite_border_rounded,
      ),
      _VentorInterest(
        id: 'parenting',
        label: l10n.ventor_reg_interest_parenting,
        icon: Icons.family_restroom_rounded,
      ),
      _VentorInterest(
        id: 'career_work',
        label: l10n.ventor_reg_interest_career_work,
        icon: Icons.work_outline_rounded,
      ),
      _VentorInterest(
        id: 'stress_anxiety',
        label: l10n.ventor_reg_interest_stress_anxiety,
        icon: Icons.psychology_alt_outlined,
      ),
      _VentorInterest(
        id: 'loneliness',
        label: l10n.ventor_reg_interest_loneliness,
        icon: Icons.person_outline_rounded,
      ),
      _VentorInterest(
        id: 'student_life',
        label: l10n.ventor_reg_interest_student_life,
        icon: Icons.school_outlined,
      ),
      _VentorInterest(
        id: 'financial_stress',
        label: l10n.ventor_reg_interest_financial_stress,
        icon: Icons.attach_money_rounded,
      ),
      _VentorInterest(
        id: 'health_wellness',
        label: l10n.ventor_reg_interest_health_wellness,
        icon: Icons.health_and_safety_outlined,
      ),
      _VentorInterest(
        id: _otherId,
        label: l10n.ventor_reg_interest_other,
        icon: Icons.add_circle_outline_rounded,
      ),
    ];

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
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      itemCount: interests.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 6),
                      itemBuilder: (context, index) {
                        final interest = interests[index];
                        final selected = _selectedIds.contains(interest.id);
                        return _InterestRow(
                          label: interest.label,
                          icon: interest.icon,
                          selected: selected,
                          selectedFill: _rowSelected,
                          muted: _muted,
                          checkboxBorder: _checkboxBorder,
                          onTap: () => _toggle(interest.id),
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
                        onPressed: _canContinue ? widget.onFinish : null,
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
}

class _InterestRow extends StatelessWidget {
  const _InterestRow({
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
