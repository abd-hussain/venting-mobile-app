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

const _minSlotDurationMinutes = 60;
const _endOfDayMinutes = 23 * 60;

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

int minutesOfDay(TimeOfDay time) => time.hour * 60 + time.minute;

TimeOfDay minutesToTimeOfDay(int minutes) {
  final clamped = minutes.clamp(0, _endOfDayMinutes);
  return TimeOfDay(hour: clamped ~/ 60, minute: clamped % 60);
}

List<TimeSlot> sortSlots(List<TimeSlot> slots) {
  final sorted = List<TimeSlot>.from(slots);
  sorted.sort((a, b) => minutesOfDay(a.start).compareTo(minutesOfDay(b.start)));
  return sorted;
}

bool slotsAreValid(List<TimeSlot> slots) {
  if (slots.isEmpty) return true;

  final sorted = sortSlots(slots);
  for (var i = 0; i < sorted.length; i++) {
    final slot = sorted[i];
    final start = minutesOfDay(slot.start);
    final end = minutesOfDay(slot.end);
    if (end <= start) return false;
    if (i > 0) {
      final previousEnd = minutesOfDay(sorted[i - 1].end);
      if (start < previousEnd) return false;
    }
  }
  return true;
}

bool intervalsOverlap(int startA, int endA, int startB, int endB) {
  return startA < endB && endA > startB;
}

/// Returns hour labels that can be selected without overlapping other slots.
List<String> availableHourLabelsForPick({
  required List<TimeSlot> slots,
  required int slotIndex,
  required bool isStart,
}) {
  final current = slots[slotIndex];
  final currentStart = minutesOfDay(current.start);
  final currentEnd = minutesOfDay(current.end);

  return _hourOptions
      .where((label) {
        final minutes = minutesOfDay(hourLabelToTimeOfDay(label));

        if (isStart) {
          if (minutes >= currentEnd) return false;
          if (minutes + _minSlotDurationMinutes > currentEnd) return false;

          for (var i = 0; i < slots.length; i++) {
            if (i == slotIndex) continue;
            final otherStart = minutesOfDay(slots[i].start);
            final otherEnd = minutesOfDay(slots[i].end);
            if (intervalsOverlap(minutes, currentEnd, otherStart, otherEnd)) {
              return false;
            }
          }
          return true;
        }

        if (minutes <= currentStart) return false;
        if (minutes - currentStart < _minSlotDurationMinutes) return false;

        for (var i = 0; i < slots.length; i++) {
          if (i == slotIndex) continue;
          final otherStart = minutesOfDay(slots[i].start);
          final otherEnd = minutesOfDay(slots[i].end);
          if (intervalsOverlap(currentStart, minutes, otherStart, otherEnd)) {
            return false;
          }
        }
        return true;
      })
      .toList(growable: false);
}

Future<String?> showAvailabilityHourBottomSheet({
  required BuildContext context,
  required String title,
  required String selected,
  List<String>? options,
}) {
  final hourOptions = options ?? _hourOptions;
  final effectiveSelected = hourOptions.contains(selected)
      ? selected
      : (hourOptions.isNotEmpty ? hourOptions.first : selected);

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
                child: hourOptions.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            VentingMobLocalizations.of(
                              context,
                            ).listener_avail_slot_overlap_error,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: ListenerProfileTheme.muted,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: hourOptions.length,
                        itemBuilder: (context, index) {
                          final option = hourOptions[index];
                          final isSelected = option == effectiveSelected;
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
    _slots = sortSlots(widget.initial.slots);
  }

  int _minStartMinutes(int slotIndex) {
    if (slotIndex <= 0) return 0;
    return minutesOfDay(_slots[slotIndex - 1].end);
  }

  int _maxEndMinutes(int slotIndex) {
    if (slotIndex >= _slots.length - 1) return _endOfDayMinutes;
    return minutesOfDay(_slots[slotIndex + 1].start);
  }

  TimeSlot _normalizeSlot(TimeSlot slot, {required int slotIndex}) {
    var start = minutesOfDay(slot.start);
    var end = minutesOfDay(slot.end);

    if (slotIndex > 0) {
      final minStart = _minStartMinutes(slotIndex);
      if (start < minStart) start = minStart;
    }
    if (slotIndex < _slots.length - 1) {
      final maxEnd = _maxEndMinutes(slotIndex);
      if (end > maxEnd) end = maxEnd;
    }

    if (end <= start) {
      final maxEnd = slotIndex < _slots.length - 1
          ? _maxEndMinutes(slotIndex)
          : _endOfDayMinutes;
      end = (start + _minSlotDurationMinutes).clamp(0, maxEnd);
    }

    return TimeSlot(
      start: minutesToTimeOfDay(start),
      end: minutesToTimeOfDay(end),
    );
  }

  Future<void> _pickHour({
    required bool isStart,
    required int slotIndex,
  }) async {
    final l10n = VentingMobLocalizations.of(context);
    final slot = _slots[slotIndex];
    final current = isStart ? slot.start : slot.end;

    final options = availableHourLabelsForPick(
      slots: _slots,
      slotIndex: slotIndex,
      isStart: isStart,
    );

    if (options.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(l10n.listener_avail_slot_overlap_error)),
        );
      return;
    }

    final selected = await showAvailabilityHourBottomSheet(
      context: context,
      title: isStart
          ? l10n.listener_reg_avail_from
          : l10n.listener_reg_avail_to,
      selected: timeOfDayToHourLabel(current),
      options: options,
    );
    if (!mounted || selected == null) return;

    setState(() {
      final picked = hourLabelToTimeOfDay(selected);
      final updated = TimeSlot(
        start: isStart ? picked : slot.start,
        end: isStart ? slot.end : picked,
      );
      _slots[slotIndex] = updated;
      _slots = sortSlots(_slots);
      final newIndex = _slots.indexWhere(
        (candidate) =>
            minutesOfDay(candidate.start) == minutesOfDay(updated.start) &&
            minutesOfDay(candidate.end) == minutesOfDay(updated.end),
      );
      if (newIndex != -1) {
        _slots[newIndex] = _normalizeSlot(
          _slots[newIndex],
          slotIndex: newIndex,
        );
      }
      _slots = sortSlots(_slots);
    });
  }

  void _addSlot() {
    setState(() {
      if (_slots.isEmpty) {
        _slots = const [
          TimeSlot(
            start: TimeOfDay(hour: 9, minute: 0),
            end: TimeOfDay(hour: 17, minute: 0),
          ),
        ];
        return;
      }

      final sorted = sortSlots(_slots);
      final lastSlot = sorted.last;
      final newStartMinutes = minutesOfDay(lastSlot.end);
      final preferredEndMinutes =
          newStartMinutes + (_minSlotDurationMinutes * 4);
      final newEndMinutes = preferredEndMinutes <= _endOfDayMinutes
          ? preferredEndMinutes
          : (newStartMinutes + _minSlotDurationMinutes).clamp(
              0,
              _endOfDayMinutes,
            );

      if (newEndMinutes <= newStartMinutes) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                VentingMobLocalizations.of(
                  context,
                ).listener_avail_slot_overlap_error,
              ),
            ),
          );
        return;
      }

      _slots = [
        ...sorted,
        TimeSlot(
          start: minutesToTimeOfDay(newStartMinutes),
          end: minutesToTimeOfDay(newEndMinutes),
        ),
      ];
    });
  }

  void _removeSlot(int index) {
    setState(() => _slots.removeAt(index));
  }

  void _onDone() {
    final l10n = VentingMobLocalizations.of(context);
    final normalized = sortSlots(_slots);

    if (_enabled && !slotsAreValid(normalized)) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(l10n.listener_avail_slot_overlap_error)),
        );
      return;
    }

    Navigator.of(context).pop(
      DayScheduleResult(
        enabled: _enabled,
        slots: _enabled ? normalized : const [],
      ),
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
                            _slots = const [
                              TimeSlot(
                                start: TimeOfDay(hour: 9, minute: 0),
                                end: TimeOfDay(hour: 17, minute: 0),
                              ),
                            ];
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
                        onPressed: _canAddAnotherSlot ? _addSlot : null,
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

  bool get _canAddAnotherSlot {
    if (_slots.isEmpty) return true;
    final sorted = sortSlots(_slots);
    final lastEnd = minutesOfDay(sorted.last.end);
    return lastEnd + _minSlotDurationMinutes <= _endOfDayMinutes;
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
