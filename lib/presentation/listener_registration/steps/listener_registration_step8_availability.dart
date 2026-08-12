import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

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
  });

  final VoidCallback onContinue;

  @override
  State<ListenerRegistrationStep8Availability> createState() =>
      _ListenerRegistrationStep8AvailabilityState();
}

class _ListenerRegistrationStep8AvailabilityState
    extends State<ListenerRegistrationStep8Availability> {
  static const _cardFill = Color(0xFF1C1826);
  static const _fieldFill = Color(0xFF15101F);
  static const _muted = Color(0xFF9B93AB);

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
  bool _acceptInstantCall = true;
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
      backgroundColor: const Color(0xFF16121F),
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
                          cursorColor: SplashColors.purpleMid,
                          decoration: InputDecoration(
                            hintText: searchHint,
                            hintStyle: GoogleFonts.inter(
                              color: _muted,
                              fontSize: 14,
                            ),
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: Color(0xFF9B93AB),
                            ),
                            filled: true,
                            fillColor: _fieldFill,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
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
                                    color: SplashColors.purpleMid,
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
    _timeZoneId = _defaultTimeZoneId(_timeZones);
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
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: SplashColors.purpleMid,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '8',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.listener_reg_step_availability,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: _cardFill,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l10n.listener_reg_avail_title,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.listener_reg_avail_subtitle,
                            style: GoogleFonts.inter(
                              color: Colors.white.withValues(alpha: 0.65),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 22),
                          _FieldLabel(l10n.listener_reg_avail_timezone),
                          const SizedBox(height: 8),
                          _DropdownField(
                            value: timeZoneLabel,
                            fill: _fieldFill,
                            muted: _muted,
                            onTap: _pickTimeZone,
                          ),
                          const SizedBox(height: 18),
                          _FieldLabel(l10n.listener_reg_avail_weekly),
                          const SizedBox(height: 10),
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
                          const SizedBox(height: 18),
                          _FieldLabel(l10n.listener_reg_avail_hours),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: _DropdownField(
                                  value: _fromHour,
                                  fill: _fieldFill,
                                  muted: _muted,
                                  onTap: () => _pickHour(isFrom: true),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
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
                                  fill: _fieldFill,
                                  muted: _muted,
                                  onTap: () => _pickHour(isFrom: false),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: _fieldFill,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        l10n.listener_reg_avail_instant_call,
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        l10n.listener_reg_avail_instant_call_hint,
                                        style: GoogleFonts.inter(
                                          color: _muted,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          height: 1.35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Switch.adaptive(
                                  value: _acceptInstantCall,
                                  activeThumbColor: Colors.white,
                                  activeTrackColor: SplashColors.purpleMid,
                                  inactiveThumbColor: Colors.white70,
                                  inactiveTrackColor: const Color(0xFF3A3348),
                                  onChanged: (value) {
                                    setState(() => _acceptInstantCall = value);
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          _FieldLabel(l10n.listener_reg_avail_session_length),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              for (final minutes in [30, 60]) ...[
                                Expanded(
                                  child: _SessionLengthChip(
                                    label: l10n.listener_reg_avail_session_min(
                                      minutes,
                                    ),
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
                                if (minutes != 60) const SizedBox(width: 8),
                              ],
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                            decoration: BoxDecoration(
                              color: SplashColors.purpleMid.withValues(
                                alpha: 0.12,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: SplashColors.purpleMid.withValues(
                                  alpha: 0.28,
                                ),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: Icon(
                                    Icons.info_outline_rounded,
                                    size: 18,
                                    color: SplashColors.purpleMid,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    l10n.listener_reg_avail_manage_later_note,
                                    style: GoogleFonts.inter(
                                      color: Colors.white.withValues(
                                        alpha: 0.78,
                                      ),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      height: 1.4,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: SizedBox(
                      height: 54,
                      child: FilledButton(
                        onPressed: _canContinue ? widget.onContinue : null,
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
                        child: Text(l10n.listener_reg_continue),
                      ),
                    ),
                  ),
                ],
              ),
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
        color: const Color(0xFF9B93AB),
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  const _DropdownField({
    required this.value,
    required this.fill,
    required this.muted,
    required this.onTap,
  });

  final String value;
  final Color fill;
  final Color muted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: fill,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(Icons.keyboard_arrow_down_rounded, color: muted, size: 22),
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

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? SplashColors.purpleMid : const Color(0xFF2A2436),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 38,
          height: 38,
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? SplashColors.purpleMid.withValues(alpha: 0.16)
          : const Color(0xFF15101F),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : Colors.white.withValues(alpha: 0.08),
              width: selected ? 1.4 : 1,
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
