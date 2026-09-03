import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:venting_mobile_app/domain/data/api/listener_availability_response_model.dart';

const kListenerWeekDayIds = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

class PreferredSessionLengthSelection {
  const PreferredSessionLengthSelection({this.isAny = true, Set<int>? minutes})
    : minutes = minutes ?? const {};

  final bool isAny;
  final Set<int> minutes;

  static const minuteOptions = [30, 45, 60];
  static const maxMinuteSelections = 2;

  PreferredSessionLengthSelection copyWith({bool? isAny, Set<int>? minutes}) {
    return PreferredSessionLengthSelection(
      isAny: isAny ?? this.isAny,
      minutes: minutes ?? this.minutes,
    );
  }

  bool isMinuteSelected(int value) => !isAny && minutes.contains(value);
}

class ListenerAvailabilitySlot {
  const ListenerAvailabilitySlot({required this.start, required this.end});

  final TimeOfDay start;
  final TimeOfDay end;

  ListenerAvailabilitySlot copyWith({TimeOfDay? start, TimeOfDay? end}) {
    return ListenerAvailabilitySlot(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
}

class ListenerAvailabilityDay {
  const ListenerAvailabilityDay({required this.dayId, required this.slots});

  final String dayId;
  final List<ListenerAvailabilitySlot> slots;

  bool get enabled => slots.isNotEmpty;

  ListenerAvailabilityDay copyWith({
    String? dayId,
    List<ListenerAvailabilitySlot>? slots,
  }) {
    return ListenerAvailabilityDay(
      dayId: dayId ?? this.dayId,
      slots: slots ?? this.slots,
    );
  }
}

class ListenerAvailability {
  const ListenerAvailability({
    required this.sessionLength,
    required this.breakLengthMinutes,
    required this.timeZoneId,
    required this.days,
  });

  final PreferredSessionLengthSelection sessionLength;
  final int breakLengthMinutes;
  final String timeZoneId;
  final List<ListenerAvailabilityDay> days;

  ListenerAvailability copyWith({
    PreferredSessionLengthSelection? sessionLength,
    int? breakLengthMinutes,
    String? timeZoneId,
    List<ListenerAvailabilityDay>? days,
  }) {
    return ListenerAvailability(
      sessionLength: sessionLength ?? this.sessionLength,
      breakLengthMinutes: breakLengthMinutes ?? this.breakLengthMinutes,
      timeZoneId: timeZoneId ?? this.timeZoneId,
      days: days ?? this.days,
    );
  }

  ListenerAvailabilityDay dayById(String dayId) {
    return days.firstWhere(
      (day) => day.dayId == dayId,
      orElse: () => ListenerAvailabilityDay(dayId: dayId, slots: const []),
    );
  }

  ListenerAvailability updateDay(ListenerAvailabilityDay day) {
    final updatedDays = days
        .map((existing) => existing.dayId == day.dayId ? day : existing)
        .toList(growable: false);
    if (updatedDays.any((existing) => existing.dayId == day.dayId)) {
      return copyWith(days: updatedDays);
    }
    return copyWith(days: [...updatedDays, day]);
  }
}

ListenerAvailability listenerAvailabilityFromApi(
  ListenerAvailabilityData data,
) {
  final daysById = <String, ListenerAvailabilityDay>{};
  for (final day in data.days) {
    final dayId = day.day.trim().toLowerCase();
    if (dayId.isEmpty) continue;
    daysById[dayId] = ListenerAvailabilityDay(
      dayId: dayId,
      slots: day.slots
          .map(
            (slot) => ListenerAvailabilitySlot(
              start: timeOfDayFromApi(slot.start),
              end: timeOfDayFromApi(slot.end),
            ),
          )
          .where(_isValidSlot)
          .toList(growable: false),
    );
  }

  return ListenerAvailability(
    sessionLength: preferredSessionLengthFromApi(
      sessionMinutes: data.session_minutes,
      sessionLengthMinutes: data.session_length_minutes,
    ),
    breakLengthMinutes: data.break_length_minutes,
    timeZoneId: data.time_zone_id.trim().isEmpty
        ? defaultListenerTimeZoneId()
        : data.time_zone_id.trim(),
    days: kListenerWeekDayIds
        .map(
          (dayId) =>
              daysById[dayId] ??
              ListenerAvailabilityDay(dayId: dayId, slots: const []),
        )
        .toList(growable: false),
  );
}

PreferredSessionLengthSelection preferredSessionLengthFromApi({
  required Object? sessionMinutes,
  int? sessionLengthMinutes,
}) {
  if (sessionMinutes is List) {
    final minutes = sessionMinutes
        .map((value) {
          if (value is num) return value.toInt();
          return int.tryParse(value.toString());
        })
        .whereType<int>()
        .where(PreferredSessionLengthSelection.minuteOptions.contains)
        .toSet();
    if (minutes.isEmpty) {
      return const PreferredSessionLengthSelection();
    }
    return PreferredSessionLengthSelection(isAny: false, minutes: minutes);
  }

  if (sessionMinutes is num) {
    final minutes = sessionMinutes.toInt();
    if (PreferredSessionLengthSelection.minuteOptions.contains(minutes)) {
      return PreferredSessionLengthSelection(isAny: false, minutes: {minutes});
    }
  }

  if (sessionLengthMinutes != null &&
      PreferredSessionLengthSelection.minuteOptions.contains(
        sessionLengthMinutes,
      )) {
    return PreferredSessionLengthSelection(
      isAny: false,
      minutes: {sessionLengthMinutes},
    );
  }

  return const PreferredSessionLengthSelection();
}

Map<String, dynamic> listenerAvailabilityToApiBody(
  ListenerAvailability availability,
) {
  final sessionMinutes = availability.sessionLength.isAny
      ? <int>[]
      : (availability.sessionLength.minutes.toList()..sort());

  return <String, dynamic>{
    'session_minutes': sessionMinutes,
    'break_length_minutes': availability.breakLengthMinutes,
    'time_zone_id': availability.timeZoneId,
    'days': availability.days
        .map(
          (day) => <String, dynamic>{
            'day': day.dayId,
            'slots': day.slots
                .map(
                  (slot) => <String, dynamic>{
                    'start': timeOfDayToApi(slot.start),
                    'end': timeOfDayToApi(slot.end),
                  },
                )
                .toList(growable: false),
          },
        )
        .toList(growable: false),
  };
}

Map<String, dynamic> listenerAvailabilityDaySlotsToApiBody(
  List<ListenerAvailabilitySlot> slots,
) {
  return <String, dynamic>{
    'slots': slots
        .map(
          (slot) => <String, dynamic>{
            'start': timeOfDayToApi(slot.start),
            'end': timeOfDayToApi(slot.end),
          },
        )
        .toList(growable: false),
  };
}

ListenerAvailabilityDay listenerAvailabilityDayFromApi(
  ListenerAvailabilityDayData data,
) {
  final dayId = data.day.trim().toLowerCase();
  return ListenerAvailabilityDay(
    dayId: dayId,
    slots: data.slots
        .map(
          (slot) => ListenerAvailabilitySlot(
            start: timeOfDayFromApi(slot.start),
            end: timeOfDayFromApi(slot.end),
          ),
        )
        .where(_isValidSlot)
        .toList(growable: false),
  );
}

String timeOfDayToApi(TimeOfDay time) {
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}

TimeOfDay timeOfDayFromApi(String value) {
  final parts = value.trim().split(':');
  if (parts.length < 2) return const TimeOfDay(hour: 9, minute: 0);
  final hour = int.tryParse(parts[0]) ?? 9;
  final minute = int.tryParse(parts[1]) ?? 0;
  return TimeOfDay(hour: hour.clamp(0, 23), minute: minute.clamp(0, 59));
}

bool _isValidSlot(ListenerAvailabilitySlot slot) {
  final start = slot.start.hour * 60 + slot.start.minute;
  final end = slot.end.hour * 60 + slot.end.minute;
  return end > start;
}

String defaultListenerTimeZoneId() {
  tzdata.initializeTimeZones();
  try {
    final local = tz.local;
    if (local.name.isNotEmpty) return local.name;
  } on Object {
    // Fall through to UTC.
  }
  return 'UTC';
}

ListenerAvailabilitySlot listenerAvailabilitySlotFromUi({
  required TimeOfDay start,
  required TimeOfDay end,
}) {
  return ListenerAvailabilitySlot(start: start, end: end);
}
