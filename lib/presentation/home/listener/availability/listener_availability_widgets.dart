import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';

// ---------------------------------------------------------------------------
// Data models
// ---------------------------------------------------------------------------

class TimeSlot {
  const TimeSlot({required this.start, required this.end});

  final TimeOfDay start;
  final TimeOfDay end;

  String format(BuildContext context) {
    String _fmt(TimeOfDay t) {
      final hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
      final min = t.minute.toString().padLeft(2, '0');
      final period = t.period == DayPeriod.am ? 'AM' : 'PM';
      return '$hour:$min $period';
    }

    return '${_fmt(start)} \u2013 ${_fmt(end)}';
  }
}

class DaySchedule {
  const DaySchedule({
    required this.label,
    required this.slots,
    this.enabled = true,
  });

  final String label;
  final List<TimeSlot> slots;
  final bool enabled;
}

// ---------------------------------------------------------------------------
// Weekly Schedule Card
// ---------------------------------------------------------------------------

class WeeklyScheduleCard extends StatelessWidget {
  const WeeklyScheduleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.days,
    required this.dayOffLabel,
    required this.onDayTap,
  });

  final String title;
  final String subtitle;
  final List<DaySchedule> days;
  final String dayOffLabel;
  final void Function(int dayIndex) onDayTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              color: ListenerProfileTheme.muted,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(days.length, (i) {
            final day = days[i];
            return _DayRow(
              day: day,
              dayOffLabel: dayOffLabel,
              onTap: () => onDayTap(i),
            );
          }),
        ],
      ),
    );
  }
}

class _DayRow extends StatelessWidget {
  const _DayRow({
    required this.day,
    required this.dayOffLabel,
    required this.onTap,
  });

  final DaySchedule day;
  final String dayOffLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  day.label,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: !day.enabled || day.slots.isEmpty
                    ? Text(
                        dayOffLabel,
                        style: GoogleFonts.inter(
                          color: ListenerProfileTheme.muted,
                          fontSize: 13,
                        ),
                      )
                    : Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: day.slots
                            .map(
                              (slot) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.06),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  slot.format(context),
                                  style: GoogleFonts.inter(
                                    color: Colors.white.withValues(alpha: 0.85),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: ListenerProfileTheme.muted,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Session Settings Card
// ---------------------------------------------------------------------------

class SessionSettingsCard extends StatelessWidget {
  const SessionSettingsCard({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<SessionSettingItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(items.length, (i) {
            return Column(
              children: [
                if (i > 0)
                  const Divider(
                    color: ListenerProfileTheme.cardBorder,
                    height: 1,
                  ),
                _SessionSettingRow(item: items[i]),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class SessionSettingItem {
  const SessionSettingItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;
}

class _SessionSettingRow extends StatelessWidget {
  const _SessionSettingRow({required this.item});

  final SessionSettingItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(item.icon, color: ListenerProfileTheme.muted, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.label,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
              ),
            ),
            Text(
              item.value,
              style: GoogleFonts.inter(
                color: ListenerProfileTheme.muted,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.chevron_right_rounded,
              color: ListenerProfileTheme.muted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Instant Call Toggle
// ---------------------------------------------------------------------------

class InstantCallToggleCard extends StatelessWidget {
  const InstantCallToggleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color: ListenerProfileTheme.muted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: const Color(0xFF22C55E),
          ),
        ],
      ),
    );
  }
}
