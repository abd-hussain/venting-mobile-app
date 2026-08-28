import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/availability/bloc/listener_availability_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/availability/listener_availability_option_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/availability/listener_availability_widgets.dart';
import 'package:venting_mobile_app/presentation/home/listener/availability/listener_day_schedule_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerAvailabilityTab extends StatelessWidget {
  const ListenerAvailabilityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          diContainer<ListenerAvailabilityBloc>()
            ..add(const ListenerAvailabilityEvent.started()),
      child: const _ListenerAvailabilityTabView(),
    );
  }
}

class _ListenerAvailabilityTabView extends StatefulWidget {
  const _ListenerAvailabilityTabView();

  @override
  State<_ListenerAvailabilityTabView> createState() =>
      _ListenerAvailabilityTabViewState();
}

class _ListenerAvailabilityTabViewState
    extends State<_ListenerAvailabilityTabView> {
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
  static const _breakLengthOptions = [0, 5, 10, 15, 30, 60];

  PreferredSessionLengthSelection _sessionLength =
      const PreferredSessionLengthSelection();
  int _breakLength = 15;

  late List<DaySchedule> _days;

  @override
  void initState() {
    super.initState();
    _days = _buildMockDays();
  }

  List<DaySchedule> _buildMockDays() {
    return [
      const DaySchedule(
        label: 'Mon',
        slots: [
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
      const DaySchedule(
        label: 'Tue',
        slots: [
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
      const DaySchedule(
        label: 'Wed',
        slots: [
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
      const DaySchedule(
        label: 'Thu',
        slots: [
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
      const DaySchedule(
        label: 'Fri',
        slots: [
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
      const DaySchedule(
        label: 'Sat',
        slots: [
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

  String _breakLengthLabel(VentingMobLocalizations l10n, int minutes) {
    if (minutes == 0) return l10n.listener_avail_break_none;
    return l10n.listener_avail_break_minutes(minutes);
  }

  String _sessionLengthLabel(
    VentingMobLocalizations l10n,
    PreferredSessionLengthSelection selection,
  ) {
    if (selection.isAny) return l10n.listener_avail_session_length_any;
    final sorted = selection.minutes.toList()..sort();
    return sorted
        .map((minutes) => l10n.listener_avail_break_minutes(minutes))
        .join(', ');
  }

  Future<void> _onSessionLength() async {
    final l10n = VentingMobLocalizations.of(context);
    final selected = await showPreferredSessionLengthBottomSheet(
      context: context,
      title: l10n.listener_avail_session_length,
      subtitle: l10n.listener_avail_session_length_subtitle,
      anyLabel: l10n.listener_avail_session_length_any,
      minuteLabelOf: l10n.listener_avail_break_minutes,
      doneLabel: l10n.common_save,
      initial: _sessionLength,
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
      labelOf: (minutes) => _breakLengthLabel(l10n, minutes),
    );
    if (!mounted || selected == null) return;
    // TODO: Persist break length via API.
    setState(() => _breakLength = selected);
  }

  void _onInstantCallToggled(bool v) {
    // TODO: Persist instant call preference via API.
    setState(() => _acceptInstantCalls = v);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return BlocListener<ListenerAvailabilityBloc, ListenerAvailabilityState>(
      listenWhen: (previous, current) =>
          current.errorMessage.isNotEmpty &&
          current.errorMessage != previous.errorMessage,
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(state.errorMessage)));
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
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
                BlocBuilder<
                  ListenerAvailabilityBloc,
                  ListenerAvailabilityState
                >(
                  builder: (context, availabilityState) {
                    return OnlineAvailabilitySectionCard(
                      onlineTitle: l10n.listener_avail_online_status,
                      onlineSubtitle: availabilityState.isOnline
                          ? l10n.listener_avail_online_status_hint
                          : l10n.listener_avail_online_status_offline_hint,
                      onlineLabel: l10n.listener_avail_status_online,
                      offlineLabel: l10n.listener_avail_status_offline,
                      isOnline: availabilityState.isOnline,
                      isOnlineLoading: availabilityState.isLoading,
                      isOnlineSaving: availabilityState.isSavingOnline,
                      onOnlineChanged: (value) =>
                          context.read<ListenerAvailabilityBloc>().add(
                            ListenerAvailabilityEvent.onlineStatusChanged(
                              isOnline: value,
                            ),
                          ),
                      instantTitle: l10n.listener_avail_instant_calls,
                      instantSubtitle: l10n.listener_avail_instant_calls_hint,
                      earningsHighlight:
                          l10n.listener_avail_instant_calls_earnings_highlight,
                      acceptInstantCalls: _acceptInstantCalls,
                      onInstantCallsChanged: _onInstantCallToggled,
                    );
                  },
                ),
                const SizedBox(height: 14),
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
                      value: _sessionLengthLabel(l10n, _sessionLength),
                      onTap: _onSessionLength,
                    ),
                    SessionSettingItem(
                      icon: Icons.pause_circle_outline_rounded,
                      label: l10n.listener_avail_break_between,
                      value: _breakLengthLabel(l10n, _breakLength),
                      onTap: _onBreakLength,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
