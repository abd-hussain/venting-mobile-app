import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_dashboard_setup.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_dashboard_setup_widgets.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_dashboard_widgets.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_first_session_tutorial_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_notifications_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_training_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_screen.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_step.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

class ListenerDashboardTab extends StatefulWidget {
  const ListenerDashboardTab({super.key, this.onOpenSessions});

  final VoidCallback? onOpenSessions;

  @override
  State<ListenerDashboardTab> createState() => _ListenerDashboardTabState();
}

class _ListenerDashboardTabState extends State<ListenerDashboardTab> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  // TODO: Load listener display name from profile API.
  static const _listenerName = 'Lina';

  // TODO: Load setup progress from listener onboarding API.
  ListenerDashboardSetupProgress _setupProgress =
      ListenerDashboardSetupProgress.mockAwaitingTraining;

  ListenerDashboardPeriod _period = ListenerDashboardPeriod.today;
  bool _isOnline = true;

  // TODO: Load today's impact stats / chart from listener dashboard API.
  static const _sessions = 5;
  static const _hours = 4.8;
  static const _peopleHelped = 12;

  static const _chartPoints = <ListenerDashboardImpactPoint>[
    ListenerDashboardImpactPoint(label: '12 AM', value: 1.2),
    ListenerDashboardImpactPoint(label: '6 AM', value: 0.6),
    ListenerDashboardImpactPoint(label: '12 PM', value: 2.8),
    ListenerDashboardImpactPoint(label: '6 PM', value: 4.1),
    ListenerDashboardImpactPoint(label: '12 AM', value: 3.2),
  ];

  // TODO: Load next upcoming session from sessions API.
  static const _upcomingName = 'Emma';
  static const _upcomingAvatar = 'https://i.pravatar.cc/120?u=ventor-emma';
  static const _upcomingTime = '7:30 PM';
  static const _upcomingDuration = 30;

  bool get _setupComplete => _setupProgress.isComplete;

  String _greeting(VentingMobLocalizations l10n) {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return l10n.listener_dashboard_greeting_morning(_listenerName);
    }
    if (hour < 17) {
      return l10n.listener_dashboard_greeting_afternoon(_listenerName);
    }
    return l10n.listener_dashboard_greeting_evening(_listenerName);
  }

  String _periodLabel(VentingMobLocalizations l10n) {
    switch (_period) {
      case ListenerDashboardPeriod.today:
        return l10n.listener_dashboard_period_today;
      case ListenerDashboardPeriod.week:
        return l10n.listener_dashboard_period_week;
      case ListenerDashboardPeriod.month:
        return l10n.listener_dashboard_period_month;
    }
  }

  ListenerRegistrationStep? _registrationStepFor(
    ListenerDashboardSetupStepId id,
  ) {
    return switch (id) {
      ListenerDashboardSetupStepId.identityVerified =>
        ListenerRegistrationStep.identityVerification,
      ListenerDashboardSetupStepId.profileInfo =>
        ListenerRegistrationStep.aboutYou,
      ListenerDashboardSetupStepId.availability =>
        ListenerRegistrationStep.availability,
      ListenerDashboardSetupStepId.training => null,
      ListenerDashboardSetupStepId.firstSessionTutorial => null,
    };
  }

  Future<void> _onContinueSetup() async {
    final next = _setupProgress.firstIncompleteStep;
    if (next == null) return;

    final registrationStep = _registrationStepFor(next);
    if (registrationStep != null) {
      await context.push(
        AppRoutes.listenerRegistration,
        extra: ListenerRegistrationArgs(
          email: '',
          initialStep: registrationStep,
        ),
      );
      return;
    }

    if (next == ListenerDashboardSetupStepId.training) {
      final completed = await openListenerTrainingBottomSheet(context: context);
      if (!mounted || completed != true) return;

      setState(() {
        _setupProgress = ListenerDashboardSetupProgress(
          profileApproved: _setupProgress.profileApproved,
          steps: [
            for (final step in _setupProgress.steps)
              if (step.id == ListenerDashboardSetupStepId.training)
                const ListenerDashboardSetupStep(
                  id: ListenerDashboardSetupStepId.training,
                  status: ListenerDashboardSetupStepStatus.done,
                )
              else if (step.id ==
                  ListenerDashboardSetupStepId.firstSessionTutorial)
                const ListenerDashboardSetupStep(
                  id: ListenerDashboardSetupStepId.firstSessionTutorial,
                  status: ListenerDashboardSetupStepStatus.inProgress,
                )
              else
                step,
          ],
        );
      });
      return;
    }

    if (next == ListenerDashboardSetupStepId.firstSessionTutorial) {
      final acknowledged = await openListenerFirstSessionTutorialBottomSheet(
        context: context,
      );
      if (!mounted || acknowledged != true) return;

      // TODO: Mark first-session tutorial as acknowledged via onboarding API.
      // The live 30-min tutorial call will be assigned separately.
      setState(() {
        _setupProgress = ListenerDashboardSetupProgress(
          profileApproved: _setupProgress.profileApproved,
          steps: [
            for (final step in _setupProgress.steps)
              if (step.id == ListenerDashboardSetupStepId.firstSessionTutorial)
                const ListenerDashboardSetupStep(
                  id: ListenerDashboardSetupStepId.firstSessionTutorial,
                  status: ListenerDashboardSetupStepStatus.done,
                )
              else
                step,
          ],
        );
      });
      return;
    }
  }

  Future<void> _pickPeriod() async {
    final l10n = VentingMobLocalizations.of(context);
    final selected = await showModalBottomSheet<ListenerDashboardPeriod>(
      context: context,
      backgroundColor: const Color(0xFF16121F),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              for (final period in ListenerDashboardPeriod.values)
                ListTile(
                  title: Text(switch (period) {
                    ListenerDashboardPeriod.today =>
                      l10n.listener_dashboard_period_today,
                    ListenerDashboardPeriod.week =>
                      l10n.listener_dashboard_period_week,
                    ListenerDashboardPeriod.month =>
                      l10n.listener_dashboard_period_month,
                  }, style: const TextStyle(color: Colors.white)),
                  trailing: period == _period
                      ? const Icon(
                          Icons.check_rounded,
                          color: SplashColors.purpleMid,
                        )
                      : null,
                  onTap: () => Navigator.of(context).pop(period),
                ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
    if (selected == null || !mounted) return;
    setState(() => _period = selected);
  }

  void _toggleAvailability() {
    // TODO: Update listener online status via availability API.
    setState(() => _isOnline = !_isOnline);
  }

  void _onNotifications() {
    openListenerNotificationsScreen(context: context);
  }

  List<Widget> _buildSetupDashboard(VentingMobLocalizations l10n) {
    return [
      ListenerDashboardTitleHeader(
        title: l10n.home_tab_dashboard,
        hasNotifications: true,
        onNotifications: _onNotifications,
      ),
      const SizedBox(height: 20),
      ListenerDashboardSetupSection(
        progress: _setupProgress,
        l10n: l10n,
        onContinueSetup: _onContinueSetup,
      ),
      if (_setupProgress.profileApproved) ...[
        const SizedBox(height: 14),
        ListenerDashboardProfileApprovedCard(
          title: l10n.listener_dashboard_profile_approved_title,
          message: l10n.listener_dashboard_profile_approved_message,
        ),
      ],
      const SizedBox(height: 14),
      ListenerDashboardLockedFeatureCard(
        title: l10n.listener_dashboard_locked_accept_title,
        subtitle: l10n.listener_dashboard_locked_accept_subtitle,
      ),
      const SizedBox(height: 14),
      ListenerDashboardLockedFeatureCard(
        title: l10n.listener_dashboard_locked_earnings_title,
        subtitle: '',
        value: r'$0.00',
        trailingLockedLabel: l10n.listener_dashboard_setup_locked,
        footnote: l10n.listener_dashboard_locked_earnings_footnote,
        showInfoIcon: true,
      ),
      const SizedBox(height: 14),
      ListenerDashboardEmptyRequestsCard(
        message: l10n.listener_dashboard_no_requests,
      ),
      const SizedBox(height: 14),
      ListenerDashboardHelpfulTipCard(
        title: l10n.listener_dashboard_helpful_tip_title,
        message: l10n.listener_dashboard_helpful_tip_message,
      ),
    ];
  }

  List<Widget> _buildLiveDashboard(VentingMobLocalizations l10n) {
    return [
      ListenerDashboardHeader(
        greeting: _greeting(l10n),
        subtitle: l10n.listener_dashboard_subtitle,
        hasNotifications: true,
        onNotifications: _onNotifications,
      ),
      const SizedBox(height: 22),
      ListenerDashboardImpactCard(
        title: l10n.listener_dashboard_impact_title,
        periodLabel: _periodLabel(l10n),
        onPeriodTap: _pickPeriod,
        sessionsValue: '$_sessions',
        sessionsLabel: l10n.listener_dashboard_sessions,
        hoursValue: _hours.toStringAsFixed(1),
        hoursLabel: l10n.listener_dashboard_hours,
        peopleValue: '$_peopleHelped',
        peopleLabel: l10n.listener_dashboard_people_helped,
        points: _chartPoints,
      ),
      const SizedBox(height: 14),
      ListenerDashboardAvailabilityCard(
        isOnline: _isOnline,
        currentlyLabel: l10n.listener_dashboard_currently,
        availableLabel: l10n.listener_dashboard_available,
        offlineLabel: l10n.listener_dashboard_offline,
        acceptingLabel: l10n.listener_dashboard_accepting,
        pausedLabel: l10n.listener_dashboard_paused,
        goOfflineLabel: l10n.listener_dashboard_go_offline,
        goOnlineLabel: l10n.listener_dashboard_go_online,
        onToggle: _toggleAvailability,
      ),
      const SizedBox(height: 14),
      ListenerDashboardUpcomingCard(
        title: l10n.listener_dashboard_upcoming_title,
        timeLabel: l10n.listener_dashboard_at_time(_upcomingTime),
        durationLabel: l10n.listener_dashboard_session_minutes(
          _upcomingDuration,
        ),
        waitingLabel: l10n.listener_dashboard_waiting,
        viewLabel: l10n.listener_dashboard_view,
        avatarUrl: _upcomingAvatar,
        ventorName: _upcomingName,
        onView: () => widget.onOpenSessions?.call(),
      ),
      const SizedBox(height: 14),
      ListenerDashboardReminderCard(
        title: l10n.listener_dashboard_reminder_title,
        message: l10n.listener_dashboard_reminder_message,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundBottom,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            children: _setupComplete
                ? _buildLiveDashboard(l10n)
                : _buildSetupDashboard(l10n),
          ),
        ),
      ),
    );
  }
}
