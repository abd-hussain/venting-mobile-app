import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/availability/listener_availability_widgets.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class DayScheduleResult {
  const DayScheduleResult({required this.enabled, required this.slots});

  final bool enabled;
  final List<TimeSlot> slots;
}

const _hourOptions = <String>[
  '12:00 AM',
  '01:00 AM',
  '02:00 AM',
  '03:00 AM',
  '04:00 AM',
  '05:00 AM',
  '06:00 AM',
  '07:00 AM',
  '08:00 AM',
  '09:00 AM',
  '10:00 AM',
  '11:00 AM',
  '12:00 PM',
  '01:00 PM',
  '02:00 PM',
  '03:00 PM',
  '04:00 PM',
  '05:00 PM',
  '06:00 PM',
  '07:00 PM',
  '08:00 PM',
  '09:00 PM',
  '10:00 PM',
  '11:00 PM',
];

String timeOfDayToHourLabel(TimeOfDay time) {
  final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return '${hour.toString().padLeft(2, '0')}:$minute $period';
}

TimeOfDay hourLabelToTimeOfDay(String label) {
  final parts = label.split(' ');
  final timeParts = parts[0].split(':');
  var hour = int.parse(timeParts[0]);
  final minute = int.parse(timeParts[1]);
  final isPm = parts[1] == 'PM';
  if (isPm && hour != 12) hour += 12;
  if (!isPm && hour == 12) hour = 0;
  return TimeOfDay(hour: hour, minute: minute);
}

Future<String?> showAvailabilityHourBottomSheet({
  required BuildContext context,
  required String title,
  required String selected,
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF16121F),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _hourOptions.length,
                  itemBuilder: (context, index) {
                    final option = _hourOptions[index];
                    final isSelected = option == selected;
                    return ListTile(
                      title: Text(
                        option,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(
                              Icons.check_rounded,
                              color: SplashColors.purpleMid,
                            )
                          : null,
                      onTap: () => Navigator.of(context).pop(option),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<DayScheduleResult?> showDayScheduleBottomSheet({
  required BuildContext context,
  required String dayLabel,
  required DaySchedule initial,
}) {
  return showModalBottomSheet<DayScheduleResult>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF16121F),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) =>
        _DayScheduleBottomSheet(dayLabel: dayLabel, initial: initial),
  );
}

class _DayScheduleBottomSheet extends StatefulWidget {
  const _DayScheduleBottomSheet({
    required this.dayLabel,
    required this.initial,
  });

  final String dayLabel;
  final DaySchedule initial;

  @override
  State<_DayScheduleBottomSheet> createState() =>
      _DayScheduleBottomSheetState();
}

class _DayScheduleBottomSheetState extends State<_DayScheduleBottomSheet> {
  late bool _enabled;
  late List<TimeSlot> _slots;

  @override
  void initState() {
    super.initState();
    _enabled = widget.initial.enabled;
    _slots = List<TimeSlot>.from(widget.initial.slots);
  }

  Future<void> _pickHour({
    required bool isStart,
    required int slotIndex,
  }) async {
    final l10n = VentingMobLocalizations.of(context);
    final slot = _slots[slotIndex];
    final current = isStart ? slot.start : slot.end;
    final selected = await showAvailabilityHourBottomSheet(
      context: context,
      title: isStart
          ? l10n.listener_reg_avail_from
          : l10n.listener_reg_avail_to,
      selected: timeOfDayToHourLabel(current),
    );
    if (!mounted || selected == null) return;

    setState(() {
      final updated = TimeSlot(
        start: isStart ? hourLabelToTimeOfDay(selected) : slot.start,
        end: isStart ? slot.end : hourLabelToTimeOfDay(selected),
      );
      _slots[slotIndex] = updated;
    });
  }

  void _addSlot() {
    setState(() {
      _slots.add(
        const TimeSlot(
          start: TimeOfDay(hour: 9, minute: 0),
          end: TimeOfDay(hour: 17, minute: 0),
        ),
      );
    });
  }

  void _removeSlot(int index) {
    setState(() => _slots.removeAt(index));
  }

  void _onDone() {
    Navigator.of(context).pop(
      DayScheduleResult(enabled: _enabled, slots: List<TimeSlot>.from(_slots)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.dayLabel,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _onDone,
                      child: Text(
                        l10n.listener_reg_done,
                        style: GoogleFonts.inter(
                          color: SplashColors.purpleMid,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.listener_avail_day_available,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Switch.adaptive(
                      value: _enabled,
                      activeTrackColor: SplashColors.purpleMid,
                      onChanged: (value) {
                        setState(() {
                          _enabled = value;
                          if (value && _slots.isEmpty) {
                            _slots.add(
                              const TimeSlot(
                                start: TimeOfDay(hour: 9, minute: 0),
                                end: TimeOfDay(hour: 17, minute: 0),
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              if (_enabled)
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                    children: [
                      ...List.generate(_slots.length, (index) {
                        final slot = _slots[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: ListenerProfileTheme.cardFill,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: ListenerProfileTheme.cardBorder,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: _HourField(
                                        label: l10n.listener_reg_avail_from,
                                        value: timeOfDayToHourLabel(slot.start),
                                        onTap: () => _pickHour(
                                          isStart: true,
                                          slotIndex: index,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: _HourField(
                                        label: l10n.listener_reg_avail_to,
                                        value: timeOfDayToHourLabel(slot.end),
                                        onTap: () => _pickHour(
                                          isStart: false,
                                          slotIndex: index,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (_slots.length > 1) ...[
                                  const SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton.icon(
                                      onPressed: () => _removeSlot(index),
                                      icon: const Icon(
                                        Icons.delete_outline_rounded,
                                        size: 18,
                                        color: Color(0xFFEF4444),
                                      ),
                                      label: Text(
                                        l10n.listener_avail_remove_slot,
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFFEF4444),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 4),
                      OutlinedButton.icon(
                        onPressed: _addSlot,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: SplashColors.purpleMid,
                          side: BorderSide(
                            color: SplashColors.purpleMid.withValues(
                              alpha: 0.5,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.add_rounded, size: 18),
                        label: Text(
                          l10n.listener_avail_add_slot,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )
              else
                Expanded(
                  child: Center(
                    child: Text(
                      l10n.listener_avail_day_off,
                      style: GoogleFonts.inter(
                        color: ListenerProfileTheme.muted,
                        fontSize: 14,
                      ),
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

class _HourField extends StatelessWidget {
  const _HourField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF15101F),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: GoogleFonts.inter(
                  color: Colors.white,
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
