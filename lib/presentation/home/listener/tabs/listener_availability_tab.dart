import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/listener_availability.dart';
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

class _ListenerAvailabilityTabView extends StatelessWidget {
  const _ListenerAvailabilityTabView();

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const _breakLengthOptions = [0, 5, 10, 15, 30, 60];

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

  String _dayLabel(VentingMobLocalizations l10n, String dayId) {
    return switch (dayId) {
      'mon' => l10n.ventor_profile_day_mon,
      'tue' => l10n.ventor_profile_day_tue,
      'wed' => l10n.ventor_profile_day_wed,
      'thu' => l10n.ventor_profile_day_thu,
      'fri' => l10n.ventor_profile_day_fri,
      'sat' => l10n.ventor_profile_day_sat,
      'sun' => l10n.ventor_profile_day_sun,
      _ => dayId,
    };
  }

  List<DaySchedule> _mapDays(
    VentingMobLocalizations l10n,
    ListenerAvailability availability,
  ) {
    return availability.days
        .map(
          (day) => DaySchedule(
            dayId: day.dayId,
            label: _dayLabel(l10n, day.dayId),
            slots: day.slots
                .map((slot) => TimeSlot(start: slot.start, end: slot.end))
                .toList(growable: false),
            enabled: day.enabled,
          ),
        )
        .toList(growable: false);
  }

  Future<void> _onDayTap(
    BuildContext context,
    VentingMobLocalizations l10n,
    List<DaySchedule> days,
    int dayIndex,
  ) async {
    final bloc = context.read<ListenerAvailabilityBloc>();
    if (bloc.state.savingTarget != null) return;

    final day = days[dayIndex];
    final result = await showDayScheduleBottomSheet(
      context: context,
      dayLabel: day.label,
      initial: day,
    );
    if (!context.mounted || result == null) return;

    bloc.add(
      ListenerAvailabilityEvent.dayScheduleChanged(
        dayId: day.dayId,
        enabled: result.enabled,
        slots: result.slots,
      ),
    );
  }

  Future<void> _onSessionLength(BuildContext context) async {
    final bloc = context.read<ListenerAvailabilityBloc>();
    final availability = bloc.state.availability;
    if (!bloc.state.isReady ||
        availability == null ||
        bloc.state.savingTarget != null) {
      return;
    }

    final l10n = VentingMobLocalizations.of(context);
    final selected = await showPreferredSessionLengthBottomSheet(
      context: context,
      title: l10n.listener_avail_session_length,
      subtitle: l10n.listener_avail_session_length_subtitle,
      anyLabel: l10n.listener_avail_session_length_any,
      minuteLabelOf: l10n.listener_avail_break_minutes,
      doneLabel: l10n.common_save,
      initial: availability.sessionLength,
    );
    if (!context.mounted || selected == null) return;

    bloc.add(
      ListenerAvailabilityEvent.sessionLengthChanged(sessionLength: selected),
    );
  }

  Future<void> _onBreakLength(BuildContext context) async {
    final bloc = context.read<ListenerAvailabilityBloc>();
    final availability = bloc.state.availability;
    if (!bloc.state.isReady ||
        availability == null ||
        bloc.state.savingTarget != null) {
      return;
    }

    final l10n = VentingMobLocalizations.of(context);
    final selected = await showAvailabilityMinutesBottomSheet(
      context: context,
      title: l10n.listener_avail_break_between,
      options: _breakLengthOptions,
      selected: availability.breakLengthMinutes,
      labelOf: (minutes) => _breakLengthLabel(l10n, minutes),
    );
    if (!context.mounted || selected == null) return;

    bloc.add(
      ListenerAvailabilityEvent.breakLengthChanged(
        breakLengthMinutes: selected,
      ),
    );
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
            child: BlocBuilder<ListenerAvailabilityBloc, ListenerAvailabilityState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.isLoadFailure) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.errorMessage.isNotEmpty
                                ? state.errorMessage
                                : l10n.common_unknown_error,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(color: Colors.white),
                          ),
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: () =>
                                context.read<ListenerAvailabilityBloc>().add(
                                  const ListenerAvailabilityEvent.retryLoad(),
                                ),
                            child: Text(l10n.common_retry),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                final availability = state.availability;
                if (!state.isReady || availability == null) {
                  return const SizedBox.shrink();
                }

                final days = _mapDays(l10n, availability);
                final isSavingSettings = state.savingTarget != null;

                return ListView(
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
                    OnlineAvailabilitySectionCard(
                      onlineTitle: l10n.listener_avail_online_status,
                      onlineSubtitle: state.isOnline
                          ? l10n.listener_avail_online_status_hint
                          : l10n.listener_avail_online_status_offline_hint,
                      onlineLabel: l10n.listener_avail_status_online,
                      offlineLabel: l10n.listener_avail_status_offline,
                      isOnline: state.isOnline,
                      isOnlineLoading: false,
                      isOnlineSaving: state.isSavingOnline,
                      onOnlineChanged: state.savingTarget == null
                          ? (value) =>
                                context.read<ListenerAvailabilityBloc>().add(
                                  ListenerAvailabilityEvent.onlineStatusChanged(
                                    isOnline: value,
                                  ),
                                )
                          : null,
                    ),
                    const SizedBox(height: 14),
                    WeeklyScheduleCard(
                      title: l10n.listener_avail_weekly_schedule,
                      subtitle: l10n.listener_avail_weekly_subtitle,
                      days: days,
                      dayOffLabel: l10n.listener_avail_day_off,
                      savingDayId: state.savingDayId,
                      onDayTap: isSavingSettings
                          ? null
                          : (dayIndex) =>
                                _onDayTap(context, l10n, days, dayIndex),
                    ),
                    const SizedBox(height: 14),
                    SessionSettingsCard(
                      title: l10n.listener_avail_session_settings,
                      items: [
                        SessionSettingItem(
                          icon: Icons.timer_outlined,
                          label: l10n.listener_avail_session_length,
                          value: _sessionLengthLabel(
                            l10n,
                            availability.sessionLength,
                          ),
                          isSaving: state.isSavingSessionLength,
                          onTap: isSavingSettings
                              ? null
                              : () => _onSessionLength(context),
                        ),
                        SessionSettingItem(
                          icon: Icons.pause_circle_outline_rounded,
                          label: l10n.listener_avail_break_between,
                          value: _breakLengthLabel(
                            l10n,
                            availability.breakLengthMinutes,
                          ),
                          isSaving: state.isSavingBreakLength,
                          onTap: isSavingSettings
                              ? null
                              : () => _onBreakLength(context),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
