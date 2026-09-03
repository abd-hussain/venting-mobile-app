import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<VentorSessionTimeChoice?> showVentorSessionTimeSheet({
  required BuildContext context,
  required VentorFindListener listener,
  required int durationMinutes,
}) {
  return showModalBottomSheet<VentorSessionTimeChoice>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) =>
        _TimeSheet(listener: listener, durationMinutes: durationMinutes),
  );
}

class _TimeSheet extends StatefulWidget {
  const _TimeSheet({required this.listener, required this.durationMinutes});

  final VentorFindListener listener;
  final int durationMinutes;

  @override
  State<_TimeSheet> createState() => _TimeSheetState();
}

class _TimeSheetState extends State<_TimeSheet> {
  static const _sheetFill = Color(0xFF1C1826);

  late final List<DateTime> _slots;
  late final DateTime? _nearest;
  VentorSessionTimeMode? _mode;
  DateTime? _selectedSlot;

  @override
  void initState() {
    super.initState();
    _slots = VentorSessionsCatalog.availableSlots(
      availability: widget.listener.availability,
      durationMinutes: widget.durationMinutes,
    );
    _nearest = _slots.isEmpty ? null : _slots.first;
    if (_nearest != null) {
      _mode = VentorSessionTimeMode.nearest;
      _selectedSlot = _nearest;
    } else if (_slots.isNotEmpty) {
      _mode = VentorSessionTimeMode.scheduled;
      _selectedSlot = _slots.first;
    }
  }

  bool get _canContinue {
    if (_mode == null) return false;
    return switch (_mode!) {
      VentorSessionTimeMode.nearest => _nearest != null,
      VentorSessionTimeMode.scheduled => _selectedSlot != null,
    };
  }

  VentorSessionTimeChoice? _buildChoice() {
    final mode = _mode;
    if (mode == null) return null;
    switch (mode) {
      case VentorSessionTimeMode.nearest:
        final nearest = _nearest;
        if (nearest == null) return null;
        return VentorSessionTimeChoice.nearest(nearest);
      case VentorSessionTimeMode.scheduled:
        final slot = _selectedSlot;
        if (slot == null) return null;
        return VentorSessionTimeChoice.scheduled(slot);
    }
  }

  String _slotLabel(BuildContext context, DateTime slot) {
    final locale = Localizations.localeOf(context).toString();
    final day = DateFormat.MMMEd(locale).format(slot);
    final time = DateFormat.jm(locale).format(slot);
    return '$day · $time';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final avail = widget.listener.availability;

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: bottomInset + 12),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.82,
        ),
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
        decoration: BoxDecoration(
          color: _sheetFill,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: VentorProfileTheme.cardBorder),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.ventor_sessions_choose_time_title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.ventor_sessions_choose_time_subtitle(
                widget.listener.name,
                l10n.ventor_sessions_duration_minutes(widget.durationMinutes),
              ),
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 13,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.ventor_sessions_choose_time_window(
                '${avail.fromHour} – ${avail.toHour}',
                avail.timeZoneId.replaceAll('_', ' '),
              ),
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 14),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Builder(
                      builder: (context) {
                        final nearest = _nearest;
                        if (nearest == null) return const SizedBox.shrink();
                        return Column(
                          children: [
                            _ModeCard(
                              selected: _mode == VentorSessionTimeMode.nearest,
                              icon: Icons.near_me_rounded,
                              title: l10n.ventor_sessions_time_nearest_title,
                              subtitle: l10n
                                  .ventor_sessions_time_nearest_subtitle(
                                    _slotLabel(context, nearest),
                                  ),
                              onTap: () => setState(() {
                                _mode = VentorSessionTimeMode.nearest;
                                _selectedSlot = nearest;
                              }),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                    _ModeCard(
                      selected: _mode == VentorSessionTimeMode.scheduled,
                      icon: Icons.event_available_rounded,
                      title: l10n.ventor_sessions_time_schedule_title,
                      subtitle: l10n.ventor_sessions_time_schedule_subtitle,
                      onTap: () => setState(() {
                        _mode = VentorSessionTimeMode.scheduled;
                        _selectedSlot ??= _slots.isEmpty ? null : _slots.first;
                      }),
                    ),
                    if (_mode == VentorSessionTimeMode.scheduled) ...[
                      const SizedBox(height: 12),
                      if (_slots.isEmpty)
                        Text(
                          l10n.ventor_sessions_time_no_slots,
                          style: GoogleFonts.inter(
                            color: VentorProfileTheme.muted,
                            fontSize: 13,
                          ),
                        )
                      else
                        for (final slot in _slots.take(12)) ...[
                          _SlotRow(
                            label: _slotLabel(context, slot),
                            selected: _selectedSlot == slot,
                            onTap: () => setState(() {
                              _mode = VentorSessionTimeMode.scheduled;
                              _selectedSlot = slot;
                            }),
                          ),
                          const SizedBox(height: 8),
                        ],
                    ],
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 52,
              child: FilledButton(
                onPressed: !_canContinue
                    ? null
                    : () {
                        final choice = _buildChoice();
                        if (choice == null) return;
                        Navigator.of(context).pop(choice);
                      },
                style: FilledButton.styleFrom(
                  backgroundColor: SplashColors.purpleMid,
                  disabledBackgroundColor: SplashColors.purpleMid.withValues(
                    alpha: 0.35,
                  ),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: Text(l10n.ventor_sessions_continue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  const _ModeCard({
    required this.selected,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final bool selected;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? SplashColors.purpleMid.withValues(alpha: 0.16)
          : const Color(0xFF15101F),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : VentorProfileTheme.cardBorder,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                selected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off_rounded,
                color: selected
                    ? SplashColors.purpleMid
                    : VentorProfileTheme.muted,
                size: 22,
              ),
              const SizedBox(width: 12),
              Icon(
                icon,
                color: selected
                    ? SplashColors.purpleMid
                    : VentorProfileTheme.muted,
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 12,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SlotRow extends StatelessWidget {
  const _SlotRow({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? SplashColors.purpleMid.withValues(alpha: 0.12)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : VentorProfileTheme.cardBorder,
            ),
          ),
          child: Row(
            children: [
              Icon(
                selected ? Icons.check_circle_rounded : Icons.circle_outlined,
                size: 18,
                color: selected
                    ? SplashColors.purpleMid
                    : VentorProfileTheme.muted,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
