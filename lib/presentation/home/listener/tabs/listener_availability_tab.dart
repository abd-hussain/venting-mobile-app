import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/availability/listener_availability_option_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/availability/listener_availability_widgets.dart';
import 'package:venting_mobile_app/presentation/home/listener/availability/listener_day_schedule_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/language_options.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/spoken_languages_picker.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerAvailabilityTab extends StatefulWidget {
  const ListenerAvailabilityTab({super.key});

  @override
  State<ListenerAvailabilityTab> createState() =>
      _ListenerAvailabilityTabState();
}

class _ListenerAvailabilityTabState extends State<ListenerAvailabilityTab> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  // TODO: Load schedule from listener availability API / repository.
  bool _acceptInstantCalls = true;

  // TODO: Load from API.
  static const _sessionLengthOptions = [30, 60];
  static const _breakLengthOptions = [0, 5, 10, 15, 30];

  int _sessionLength = 30;
  int _breakLength = 15;
  Set<String> _selectedLanguageIds = {'en', 'ar'};

  late List<DaySchedule> _days;

  @override
  void initState() {
    super.initState();
    _days = _buildMockDays();
  }

  List<DaySchedule> _buildMockDays() {
    return [
      DaySchedule(
        label: 'Mon',
        slots: const [
          TimeSlot(
            start: TimeOfDay(hour: 9, minute: 0),
            end: TimeOfDay(hour: 12, minute: 0),
          ),
          TimeSlot(
            start: TimeOfDay(hour: 18, minute: 0),
            end: TimeOfDay(hour: 22, minute: 0),
          ),
        ],
      ),
      DaySchedule(
        label: 'Tue',
        slots: const [
          TimeSlot(
            start: TimeOfDay(hour: 9, minute: 0),
            end: TimeOfDay(hour: 13, minute: 0),
          ),
          TimeSlot(
            start: TimeOfDay(hour: 17, minute: 0),
            end: TimeOfDay(hour: 21, minute: 0),
          ),
        ],
      ),
      DaySchedule(
        label: 'Wed',
        slots: const [
          TimeSlot(
            start: TimeOfDay(hour: 10, minute: 0),
            end: TimeOfDay(hour: 14, minute: 0),
          ),
          TimeSlot(
            start: TimeOfDay(hour: 18, minute: 0),
            end: TimeOfDay(hour: 22, minute: 0),
          ),
        ],
      ),
      DaySchedule(
        label: 'Thu',
        slots: const [
          TimeSlot(
            start: TimeOfDay(hour: 9, minute: 0),
            end: TimeOfDay(hour: 12, minute: 0),
          ),
          TimeSlot(
            start: TimeOfDay(hour: 18, minute: 0),
            end: TimeOfDay(hour: 22, minute: 0),
          ),
        ],
      ),
      DaySchedule(
        label: 'Fri',
        slots: const [
          TimeSlot(
            start: TimeOfDay(hour: 9, minute: 0),
            end: TimeOfDay(hour: 13, minute: 0),
          ),
          TimeSlot(
            start: TimeOfDay(hour: 17, minute: 0),
            end: TimeOfDay(hour: 23, minute: 0),
          ),
        ],
      ),
      DaySchedule(
        label: 'Sat',
        slots: const [
          TimeSlot(
            start: TimeOfDay(hour: 10, minute: 0),
            end: TimeOfDay(hour: 14, minute: 0),
          ),
        ],
      ),
      const DaySchedule(label: 'Sun', slots: [], enabled: false),
    ];
  }

  Future<void> _onDayTap(int dayIndex) async {
    final day = _days[dayIndex];
    final result = await showDayScheduleBottomSheet(
      context: context,
      dayLabel: day.label,
      initial: day,
    );
    if (!mounted || result == null) return;
    // TODO: Persist day schedule via API.
    setState(() {
      _days[dayIndex] = DaySchedule(
        label: day.label,
        slots: result.slots,
        enabled: result.enabled,
      );
    });
  }

  String _languagesLabel(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final labels = _selectedLanguageIds
        .map((id) => spokenLanguageById(id)?.label(languageCode) ?? id)
        .toList();
    if (labels.isEmpty) return '—';
    return labels.join(', ');
  }

  Future<void> _onSessionLength() async {
    final l10n = VentingMobLocalizations.of(context);
    final selected = await showAvailabilityMinutesBottomSheet(
      context: context,
      title: l10n.listener_avail_session_length,
      options: _sessionLengthOptions,
      selected: _sessionLength,
      labelOf: (minutes) => l10n.listener_avail_min_value(minutes),
    );
    if (!mounted || selected == null) return;
    // TODO: Persist session length via API.
    setState(() => _sessionLength = selected);
  }

  Future<void> _onBreakLength() async {
    final l10n = VentingMobLocalizations.of(context);
    final selected = await showAvailabilityMinutesBottomSheet(
      context: context,
      title: l10n.listener_avail_break_between,
      options: _breakLengthOptions,
      selected: _breakLength,
      labelOf: (minutes) => l10n.listener_avail_min_value(minutes),
    );
    if (!mounted || selected == null) return;
    // TODO: Persist break length via API.
    setState(() => _breakLength = selected);
  }

  Future<void> _onLanguages() async {
    final selected = await showSpokenLanguagesPicker(
      context: context,
      selectedIds: _selectedLanguageIds,
    );
    if (!mounted || selected == null) return;
    // TODO: Persist spoken languages via API.
    setState(() => _selectedLanguageIds = selected);
  }

  void _onInstantCallToggled(bool v) {
    // TODO: Persist instant call preference via API.
    setState(() => _acceptInstantCalls = v);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: ListenerProfileTheme.backgroundGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
            children: [
              Text(
                l10n.listener_avail_title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              WeeklyScheduleCard(
                title: l10n.listener_avail_weekly_schedule,
                subtitle: l10n.listener_avail_weekly_subtitle,
                days: _days,
                dayOffLabel: l10n.listener_avail_day_off,
                onDayTap: _onDayTap,
              ),
              const SizedBox(height: 14),
              SessionSettingsCard(
                title: l10n.listener_avail_session_settings,
                items: [
                  SessionSettingItem(
                    icon: Icons.timer_outlined,
                    label: l10n.listener_avail_session_length,
                    value: l10n.listener_avail_min_value(_sessionLength),
                    onTap: _onSessionLength,
                  ),
                  SessionSettingItem(
                    icon: Icons.pause_circle_outline_rounded,
                    label: l10n.listener_avail_break_between,
                    value: l10n.listener_avail_min_value(_breakLength),
                    onTap: _onBreakLength,
                  ),
                  SessionSettingItem(
                    icon: Icons.language_rounded,
                    label: l10n.listener_avail_languages,
                    value: _languagesLabel(context),
                    onTap: _onLanguages,
                  ),
                ],
              ),
              const SizedBox(height: 14),
              InstantCallToggleCard(
                title: l10n.listener_avail_instant_calls,
                subtitle: l10n.listener_avail_instant_calls_hint,
                value: _acceptInstantCalls,
                onChanged: _onInstantCallToggled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
