import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/listener_dashboard_setup.dart';
import 'package:venting_mobile_app/domain/usecase/get_cached_auth_me_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/bloc/listener_dashboard/listener_dashboard_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_dashboard_setup_widgets.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_dashboard_widgets.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_first_session_with_us.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_notifications_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_training_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_screen.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_step.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

class ListenerDashboardTab extends StatefulWidget {
  const ListenerDashboardTab({
    super.key,
    this.onOpenSessions,
    this.onOpenAvailability,
  });

  final VoidCallback? onOpenSessions;
  final VoidCallback? onOpenAvailability;

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

  String _userEmail() => diContainer<GetCachedAuthMeUsecase>()()?.email ?? '';

  void _refreshSetup() {
    context.read<ListenerDashboardBloc>().add(
      const ListenerDashboardEvent.setupRefreshRequested(),
    );
  }

  String _greeting(VentingMobLocalizations l10n, String listenerName) {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return l10n.listener_dashboard_greeting_morning(listenerName);
    }
    if (hour < 17) {
      return l10n.listener_dashboard_greeting_afternoon(listenerName);
    }
    return l10n.listener_dashboard_greeting_evening(listenerName);
  }

  Future<void> _openRegistrationStep(ListenerRegistrationStep step) async {
    await context.push(
      AppRoutes.listenerRegistration,
      extra: ListenerRegistrationArgs(email: _userEmail(), initialStep: step),
    );
    if (!mounted) return;
    _refreshSetup();
  }

  Future<void> _handleSetupStep(ListenerDashboardSetupStepId stepId) async {
    final registrationStep = ListenerDashboardSetupProgress.registrationStepFor(
      stepId,
    );
    if (registrationStep != null) {
      await _openRegistrationStep(registrationStep);
      return;
    }

    if (stepId == ListenerDashboardSetupStepId.training) {
      final completed = await openListenerTrainingBottomSheet(context: context);
      if (!mounted || completed != true) return;
      _refreshSetup();
      return;
    }

    if (stepId == ListenerDashboardSetupStepId.bookFirstSession) {
      await openListenerFirstSessionWithUsBottomSheet(
        context: context,
        onEditAvailability: widget.onOpenAvailability,
      );
    }
  }

  Future<void> _onContinueSetup(
    ListenerDashboardSetupProgress? progress,
  ) async {
    final next = progress?.firstActionableStep;
    if (next == null) return;
    await _handleSetupStep(next);
  }

  void _toggleAvailability(
    ListenerDashboardState state,
    ListenerDashboardSetupProgress? progress,
  ) {
    final l10n = VentingMobLocalizations.of(context);
    if (state.isUpdatingOnlineStatus) return;

    final nextOnline = !state.isOnline;
    if (progress != null && !progress.canGoOnline && nextOnline) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.listener_dashboard_go_online_requires_approval),
        ),
      );
      return;
    }

    context.read<ListenerDashboardBloc>().add(
      ListenerDashboardEvent.onlineStatusChanged(isOnline: nextOnline),
    );
  }

  void _onNotifications() {
    openListenerNotificationsScreen(context: context);
  }

  List<Widget> _profileReviewCards(
    VentingMobLocalizations l10n,
    ListenerDashboardSetupProgress? progress,
  ) {
    if (progress == null) return const [];

    if (progress.isProfileRejected) {
      final reason = progress.rejectionReason?.trim();
      return [
        ListenerDashboardProfileRejectedCard(
          title: l10n.listener_dashboard_profile_rejected_title,
          message: reason?.isNotEmpty == true
              ? reason!
              : l10n.listener_dashboard_profile_rejected_message,
        ),
      ];
    }

    if (progress.isProfileUnderReview) {
      return [
        ListenerDashboardProfileUnderReviewCard(
          title: l10n.listener_dashboard_profile_under_review_title,
          message: l10n.listener_dashboard_profile_under_review_message,
        ),
      ];
    }

    if (progress.profileApproved) {
      return [
        ListenerDashboardProfileApprovedCard(
          title: l10n.listener_dashboard_profile_approved_title,
          message: l10n.listener_dashboard_profile_approved_message,
        ),
      ];
    }

    return const [];
  }

  List<Widget> _buildSetupDashboard(
    VentingMobLocalizations l10n,
    ListenerDashboardState state,
  ) {
    final progress = state.setupProgress;
    final showFirstSessionWithUs =
        progress?.isAwaitingFirstSessionWithUs ?? false;

    return [
      ListenerDashboardTitleHeader(
        title: l10n.home_tab_dashboard,
        hasNotifications: true,
        onNotifications: _onNotifications,
      ),
      const SizedBox(height: 20),
      if (showFirstSessionWithUs)
        ListenerFirstSessionWithUsCard(
          onEditAvailability: widget.onOpenAvailability,
        )
      else
        ListenerDashboardSetupSection(
          progress: progress,
          l10n: l10n,
          onContinueSetup: () => _onContinueSetup(progress),
          onStepTap: _handleSetupStep,
        ),
      ..._profileReviewCards(
        l10n,
        progress,
      ).expand((card) => [const SizedBox(height: 14), card]),
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

  List<Widget> _buildLiveDashboard(
    VentingMobLocalizations l10n,
    ListenerDashboardState state,
  ) {
    final progress = state.setupProgress;
    final canGoOnline = progress?.canGoOnline ?? false;
    final displayOnline = canGoOnline && state.isOnline;
    final isProfileUnderReview = progress?.isProfileUnderReview ?? false;
    final nextUpcomingSession = state.nextUpcomingSession;
    final dailyReminder = state.dailyReminder;
    final listenerDisplayName = state.listenerDisplayName;

    return [
      ListenerDashboardHeader(
        greeting: _greeting(l10n, listenerDisplayName),
        subtitle: l10n.listener_dashboard_subtitle,
        hasNotifications: true,
        onNotifications: _onNotifications,
      ),
      const SizedBox(height: 22),
      ..._profileReviewCards(
        l10n,
        progress,
      ).expand((card) => [card, const SizedBox(height: 14)]),
      ListenerDashboardAvailabilityCard(
        isOnline: displayOnline,
        canGoOnline: canGoOnline,
        isUpdating: state.isUpdatingOnlineStatus,
        currentlyLabel: l10n.listener_dashboard_currently,
        availableLabel: l10n.listener_dashboard_available,
        offlineLabel: l10n.listener_dashboard_offline,
        acceptingLabel: l10n.listener_dashboard_accepting,
        pausedLabel: l10n.listener_dashboard_paused,
        goOfflineLabel: l10n.listener_dashboard_go_offline,
        goOnlineLabel: l10n.listener_dashboard_go_online,
        blockedFootnote:
            l10n.listener_dashboard_availability_hidden_until_approved,
        onToggle: state.isUpdatingOnlineStatus
            ? null
            : () => _toggleAvailability(state, progress),
      ),
      const SizedBox(height: 14),
      if (isProfileUnderReview || nextUpcomingSession == null)
        ListenerDashboardUpcomingCard.empty(
          title: l10n.listener_dashboard_upcoming_title,
          emptyMessage: l10n.listener_sessions_no_scheduled,
        )
      else
        ListenerDashboardUpcomingCard(
          title: l10n.listener_dashboard_upcoming_title,
          timeLabel: nextUpcomingSession.whenLabel.isEmpty
              ? l10n.listener_dashboard_at_time('—')
              : nextUpcomingSession.whenLabel,
          durationLabel: l10n.listener_dashboard_session_minutes(
            nextUpcomingSession.durationMinutes,
          ),
          waitingLabel: l10n.listener_dashboard_waiting,
          viewLabel: l10n.listener_dashboard_view,
          avatarUrl: nextUpcomingSession.ventorAvatarUrl,
          ventorName: nextUpcomingSession.ventorName,
          onView: () => widget.onOpenSessions?.call(),
        ),
      const SizedBox(height: 16),
      if (dailyReminder != null) ...[
        ListenerDashboardReminderCard(
          title: dailyReminder.title,
          message: dailyReminder.message,
        ),
        const SizedBox(height: 14),
      ],
    ];
  }

  Widget _buildBody(
    BuildContext context,
    VentingMobLocalizations l10n,
    ListenerDashboardState state,
  ) {
    if (!state.isSetupReady) {
      if (state.isSetupLoadFailure) {
        return _ListenerDashboardError(
          message: state.setupErrorMessage.isNotEmpty
              ? state.setupErrorMessage
              : l10n.common_unknown_error,
          onRetry: () => context.read<ListenerDashboardBloc>().add(
            const ListenerDashboardEvent.retrySetupLoad(),
          ),
        );
      }

      return const _ListenerDashboardShimmer();
    }

    final showLiveDashboard = state.setupProgress?.isComplete ?? false;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
      children: showLiveDashboard
          ? _buildLiveDashboard(l10n, state)
          : _buildSetupDashboard(l10n, state),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return BlocConsumer<ListenerDashboardBloc, ListenerDashboardState>(
      listenWhen: (previous, current) =>
          previous.onlineStatusErrorMessage != current.onlineStatusErrorMessage,
      listener: (context, state) {
        if (state.onlineStatusErrorMessage.isEmpty) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(state.onlineStatusErrorMessage)));
      },
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: _overlayStyle,
          child: Scaffold(
            backgroundColor: SplashColors.backgroundBottom,
            body: SafeArea(child: _buildBody(context, l10n, state)),
          ),
        );
      },
    );
  }
}

class _ListenerDashboardShimmer extends StatelessWidget {
  const _ListenerDashboardShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withValues(alpha: 0.08),
      highlightColor: Colors.white.withValues(alpha: 0.16),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
        children: const [
          _DashboardShimmerHeader(),
          SizedBox(height: 20),
          _DashboardShimmerCard(height: 220),
          SizedBox(height: 14),
          _DashboardShimmerCard(height: 120),
          SizedBox(height: 14),
          _DashboardShimmerCard(height: 120),
          SizedBox(height: 14),
          _DashboardShimmerCard(height: 96),
        ],
      ),
    );
  }
}

class _DashboardShimmerHeader extends StatelessWidget {
  const _DashboardShimmerHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DashboardShimmerLine(width: 180, height: 24),
              SizedBox(height: 10),
              _DashboardShimmerLine(width: 220, height: 14),
            ],
          ),
        ),
        SizedBox(width: 12),
        _DashboardShimmerLine(width: 40, height: 40, radius: 20),
      ],
    );
  }
}

class _DashboardShimmerCard extends StatelessWidget {
  const _DashboardShimmerCard({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
    );
  }
}

class _DashboardShimmerLine extends StatelessWidget {
  const _DashboardShimmerLine({
    required this.width,
    required this.height,
    this.radius = 8,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class _ListenerDashboardError extends StatelessWidget {
  const _ListenerDashboardError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              style: FilledButton.styleFrom(
                backgroundColor: SplashColors.purpleMid,
                foregroundColor: Colors.white,
              ),
              child: Text(l10n.common_retry),
            ),
          ],
        ),
      ),
    );
  }
}
