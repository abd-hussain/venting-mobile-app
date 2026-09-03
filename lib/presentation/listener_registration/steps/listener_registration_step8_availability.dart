import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

class _TimeZoneOption {
  const _TimeZoneOption({required this.id, required this.label});

  final String id;
  final String label;
}

class _DayOption {
  const _DayOption({required this.id, required this.label});

  final String id;
  final String label;
}

/// Step 8 — Availability preferences.
class ListenerRegistrationStep8Availability extends StatefulWidget {
  const ListenerRegistrationStep8Availability({
    super.key,
    required this.onContinue,
    this.initialTimeZoneId,
    this.initialSelectedDays = const ['mon', 'tue', 'wed', 'thu', 'fri'],
    this.initialFromHour = '09:00 AM',
    this.initialToHour = '11:00 PM',
    this.initialSessionMinutes = const [30, 60],
  });

  final ValueChanged<ListenerRegistrationStep8Data> onContinue;
  final String? initialTimeZoneId;
  final List<String> initialSelectedDays;
  final String initialFromHour;
  final String initialToHour;
  final List<int> initialSessionMinutes;

  @override
  State<ListenerRegistrationStep8Availability> createState() =>
      _ListenerRegistrationStep8AvailabilityState();
}

class _ListenerRegistrationStep8AvailabilityState
    extends State<ListenerRegistrationStep8Availability> {
  static const _accent = Color(0xFF8A3CFE);
  static const _fieldFill = Color(0xFF14101C);
  static const _chipFill = Color(0xFF14101C);
  static const _muted = Color(0xFF9B93AB);
  static const _sectionLabel = Color(0xFF9B93AB);
  static const _border = Color(0xFF6B4BB8);
  static const _sheetFill = Color(0xFF16121F);

  static List<_TimeZoneOption>? _cachedTimeZones;

  static const _hours = <String>[
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

  late final List<_TimeZoneOption> _timeZones;
  late String _timeZoneId;
  final Set<String> _selectedDays = {'mon', 'tue', 'wed', 'thu', 'fri'};
  String _fromHour = '09:00 AM';
  String _toHour = '11:00 PM';
  final Set<int> _sessionMinutes = {30, 60};

  bool get _canContinue {
    if (_selectedDays.isEmpty) return false;
    if (_sessionMinutes.isEmpty) return false;
    return _hours.indexOf(_fromHour) < _hours.indexOf(_toHour);
  }

  static String _formatGmtOffset(Duration offset) {
    final totalMinutes = offset.inMinutes;
    final sign = totalMinutes >= 0 ? '+' : '-';
    final abs = totalMinutes.abs();
    final hours = abs ~/ 60;
    final minutes = abs % 60;
    if (minutes == 0) return 'GMT$sign$hours';
    return 'GMT$sign$hours:${minutes.toString().padLeft(2, '0')}';
  }

  static List<_TimeZoneOption> _loadAllTimeZones() {
    if (_cachedTimeZones != null) return _cachedTimeZones!;
    tzdata.initializeTimeZones();
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final options =
        tz.timeZoneDatabase.locations.entries.map((entry) {
          final offset = entry.value.timeZone(nowMs).offset;
          return _TimeZoneOption(
            id: entry.key,
            label: '(${_formatGmtOffset(offset)}) ${entry.key}',
          );
        }).toList()..sort((a, b) {
          final byLabel = a.label.compareTo(b.label);
          if (byLabel != 0) return byLabel;
          return a.id.compareTo(b.id);
        });
    _cachedTimeZones = options;
    return options;
  }

  static String _defaultTimeZoneId(List<_TimeZoneOption> zones) {
    const preferred = 'America/Chicago';
    if (zones.any((zone) => zone.id == preferred)) return preferred;

    final localOffset = DateTime.now().timeZoneOffset;
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    for (final zone in zones) {
      final location = tz.getLocation(zone.id);
      if (location.timeZone(nowMs).offset == localOffset) {
        return zone.id;
      }
    }
    return zones.first.id;
  }

  Future<void> _pickTimeZone() async {
    final selected = await _showOptionSheet<_TimeZoneOption>(
      title: VentingMobLocalizations.of(context).listener_reg_avail_timezone,
      searchHint: VentingMobLocalizations.of(
        context,
      ).listener_reg_avail_search_timezone,
      options: _timeZones,
      labelOf: (option) => option.label,
      isSelected: (option) => option.id == _timeZoneId,
      heightFactor: 0.75,
    );
    if (selected == null || !mounted) return;
    setState(() => _timeZoneId = selected.id);
  }

  Future<void> _pickHour({required bool isFrom}) async {
    final selected = await _showOptionSheet<String>(
      title: isFrom
          ? VentingMobLocalizations.of(context).listener_reg_avail_from
          : VentingMobLocalizations.of(context).listener_reg_avail_to,
      options: _hours,
      labelOf: (hour) => hour,
      isSelected: (hour) => hour == (isFrom ? _fromHour : _toHour),
    );
    if (selected == null || !mounted) return;
    setState(() {
      if (isFrom) {
        _fromHour = selected;
      } else {
        _toHour = selected;
      }
    });
  }

  Future<T?> _showOptionSheet<T>({
    required String title,
    required List<T> options,
    required String Function(T) labelOf,
    required bool Function(T) isSelected,
    String? searchHint,
    double heightFactor = 0.55,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: _sheetFill,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        var query = '';
        return SafeArea(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * heightFactor,
            child: StatefulBuilder(
              builder: (context, setModalState) {
                final filtered = query.trim().isEmpty
                    ? options
                    : options
                          .where(
                            (option) => labelOf(option).toLowerCase().contains(
                              query.trim().toLowerCase(),
                            ),
                          )
                          .toList();

                return Column(
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
                    if (searchHint != null)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                        child: TextField(
                          autofocus: true,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          cursorColor: _accent,
                          decoration: InputDecoration(
                            hintText: searchHint,
                            hintStyle: GoogleFonts.inter(
                              color: _muted,
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: _muted.withValues(alpha: 0.9),
                            ),
                            filled: true,
                            fillColor: _fieldFill,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: _border.withValues(alpha: 0.75),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: _accent,
                                width: 1.4,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            setModalState(() => query = value);
                          },
                        ),
                      ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final option = filtered[index];
                          final selected = isSelected(option);
                          return ListTile(
                            title: Text(
                              labelOf(option),
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: selected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                            ),
                            trailing: selected
                                ? const Icon(
                                    Icons.check_rounded,
                                    color: _accent,
                                  )
                                : null,
                            onTap: () => Navigator.of(context).pop(option),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _timeZones = _loadAllTimeZones();
    _timeZoneId = widget.initialTimeZoneId ?? _defaultTimeZoneId(_timeZones);
    _selectedDays
      ..clear()
      ..addAll(widget.initialSelectedDays);
    _fromHour = widget.initialFromHour;
    _toHour = widget.initialToHour;
    _sessionMinutes
      ..clear()
      ..addAll(widget.initialSessionMinutes);
  }

  void _submit() {
    if (!_canContinue) return;
    widget.onContinue(
      ListenerRegistrationStep8Data(
        timeZoneId: _timeZoneId,
        availabilityDays: _selectedDays.toList(growable: false),
        availabilityFrom: _fromHour,
        availabilityTo: _toHour,
        sessionMinutes: _sessionMinutes.toList(growable: false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final timeZoneLabel = _timeZones
        .firstWhere((zone) => zone.id == _timeZoneId)
        .label;

    final days = [
      _DayOption(id: 'mon', label: l10n.listener_reg_avail_day_mon),
      _DayOption(id: 'tue', label: l10n.listener_reg_avail_day_tue),
      _DayOption(id: 'wed', label: l10n.listener_reg_avail_day_wed),
      _DayOption(id: 'thu', label: l10n.listener_reg_avail_day_thu),
      _DayOption(id: 'fri', label: l10n.listener_reg_avail_day_fri),
      _DayOption(id: 'sat', label: l10n.listener_reg_avail_day_sat),
      _DayOption(id: 'sun', label: l10n.listener_reg_avail_day_sun),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.listener_reg_avail_title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.listener_reg_avail_subtitle,
            style: GoogleFonts.inter(
              color: _muted,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _FieldLabel(l10n.listener_reg_avail_timezone),
                  const SizedBox(height: 10),
                  _DropdownField(value: timeZoneLabel, onTap: _pickTimeZone),
                  const SizedBox(height: 20),
                  _FieldLabel(l10n.listener_reg_avail_weekly),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (final day in days)
                        _DayChip(
                          label: day.label,
                          selected: _selectedDays.contains(day.id),
                          onTap: () {
                            setState(() {
                              if (_selectedDays.contains(day.id)) {
                                _selectedDays.remove(day.id);
                              } else {
                                _selectedDays.add(day.id);
                              }
                            });
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _FieldLabel(l10n.listener_reg_avail_hours),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _DropdownField(
                          value: _fromHour,
                          onTap: () => _pickHour(isFrom: true),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          l10n.listener_reg_avail_to,
                          style: GoogleFonts.inter(
                            color: _muted,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: _DropdownField(
                          value: _toHour,
                          onTap: () => _pickHour(isFrom: false),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _FieldLabel(l10n.listener_reg_avail_session_length),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      for (final minutes in [30, 60]) ...[
                        Expanded(
                          child: _SessionLengthChip(
                            label: l10n.listener_reg_avail_session_min(minutes),
                            selected: _sessionMinutes.contains(minutes),
                            onTap: () {
                              setState(() {
                                if (_sessionMinutes.contains(minutes)) {
                                  _sessionMinutes.remove(minutes);
                                } else {
                                  _sessionMinutes.add(minutes);
                                }
                              });
                            },
                          ),
                        ),
                        if (minutes != 60) const SizedBox(width: 12),
                      ],
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                    decoration: BoxDecoration(
                      color: _fieldFill,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: _border.withValues(alpha: 0.45),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Icon(
                            Icons.info_outline_rounded,
                            size: 18,
                            color: _accent.withValues(alpha: 0.9),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            l10n.listener_reg_avail_manage_later_note,
                            style: GoogleFonts.inter(
                              color: _muted,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 56,
            child: FilledButton(
              onPressed: _canContinue ? _submit : null,
              style: FilledButton.styleFrom(
                backgroundColor: _accent,
                disabledBackgroundColor: _accent.withValues(alpha: 0.42),
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
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

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: _ListenerRegistrationStep8AvailabilityState._sectionLabel,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  const _DropdownField({required this.value, required this.onTap});

  final String value;
  final VoidCallback onTap;

  static const _accent = _ListenerRegistrationStep8AvailabilityState._accent;
  static const _fieldFill =
      _ListenerRegistrationStep8AvailabilityState._fieldFill;
  static const _border = _ListenerRegistrationStep8AvailabilityState._border;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _fieldFill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _border.withValues(alpha: 0.75)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: _accent,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  static const _accent = _ListenerRegistrationStep8AvailabilityState._accent;
  static const _chipFill =
      _ListenerRegistrationStep8AvailabilityState._chipFill;
  static const _muted = _ListenerRegistrationStep8AvailabilityState._muted;
  static const _border = _ListenerRegistrationStep8AvailabilityState._border;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? _accent : _chipFill,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected ? _accent : _chipFill,
            border: Border.all(
              color: selected ? _accent : _border.withValues(alpha: 0.75),
              width: 1.2,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: selected ? Colors.white : _muted,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SessionLengthChip extends StatelessWidget {
  const _SessionLengthChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  static const _accent = _ListenerRegistrationStep8AvailabilityState._accent;
  static const _chipFill =
      _ListenerRegistrationStep8AvailabilityState._chipFill;
  static const _border = _ListenerRegistrationStep8AvailabilityState._border;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? _accent.withValues(alpha: 0.18) : _chipFill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? _accent : _border.withValues(alpha: 0.75),
              width: selected ? 1.4 : 1,
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
