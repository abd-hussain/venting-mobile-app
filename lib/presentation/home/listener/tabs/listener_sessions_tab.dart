import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/listener_sessions.dart'
    as domain;
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_args.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_flow.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/sessions/bloc/listener_sessions/listener_sessions_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/sessions/listener_sessions_widgets.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerSessionsTab extends StatelessWidget {
  const ListenerSessionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          diContainer<ListenerSessionsBloc>()
            ..add(const ListenerSessionsEvent.started()),
      child: const _ListenerSessionsTabView(),
    );
  }
}

class _ListenerSessionsTabView extends StatefulWidget {
  const _ListenerSessionsTabView();

  @override
  State<_ListenerSessionsTabView> createState() =>
      _ListenerSessionsTabViewState();
}

class _ListenerSessionsTabViewState extends State<_ListenerSessionsTabView> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  ListenerSessionFilter _filter = ListenerSessionFilter.upcoming;

  void _onFilterChanged(ListenerSessionFilter filter) {
    setState(() => _filter = filter);
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
          child: BlocConsumer<ListenerSessionsBloc, ListenerSessionsState>(
            listenWhen: (previous, current) =>
                previous.actionFeedback != current.actionFeedback ||
                (previous.errorMessage != current.errorMessage &&
                    current.errorMessage.isNotEmpty &&
                    !current.isProcessingRequest),
            listener: (context, state) {
              if (state.errorMessage.isNotEmpty && !state.isProcessingRequest) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                return;
              }

              switch (state.actionFeedback) {
                case ListenerSessionsActionFeedback.scheduledRequestAccepted:
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l10n.listener_sessions_status_accepted),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                case ListenerSessionsActionFeedback.requestAlreadyTaken:
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l10n.listener_sessions_already_taken),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                case ListenerSessionsActionFeedback.requestDeclined:
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l10n.listener_sessions_status_declined),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                case ListenerSessionsActionFeedback.none:
                  break;
              }
            },
            builder: (context, state) {
              if (state.isLoadingOrInitial) {
                return const _ListenerSessionsShimmer();
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
                          onPressed: () => context
                              .read<ListenerSessionsBloc>()
                              .add(const ListenerSessionsEvent.retryLoad()),
                          child: Text(l10n.common_retry),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final overview = state.overview;
              if (!state.isReady || overview == null) {
                return const SizedBox.shrink();
              }

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ListenerSessionsBloc>().add(
                    const ListenerSessionsEvent.refreshRequested(),
                  );
                  await context.read<ListenerSessionsBloc>().stream.firstWhere(
                    (s) => !s.isLoadingOrInitial,
                  );
                },
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
                  children: [
                    Text(
                      l10n.home_tab_sessions,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListenerSessionsFilterBar(
                      selected: _filter,
                      upcomingLabel: l10n.listener_sessions_filter_upcoming(
                        overview.upcomingSessions.length,
                      ),
                      missedLabel: l10n.listener_sessions_filter_missed(
                        overview.missedSessions.length,
                      ),
                      historyLabel: l10n.listener_sessions_filter_history,
                      onChanged: _onFilterChanged,
                    ),
                    const SizedBox(height: 20),
                    _ListenerSessionsContent(
                      l10n: l10n,
                      filter: _filter,
                      overview: overview,
                      processingRequestId: state.isProcessingRequest
                          ? state.processingRequestId
                          : '',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ListenerSessionsContent extends StatelessWidget {
  const _ListenerSessionsContent({
    required this.l10n,
    required this.filter,
    required this.overview,
    required this.processingRequestId,
  });

  final VentingMobLocalizations l10n;
  final ListenerSessionFilter filter;
  final domain.ListenerSessionsOverview overview;
  final String processingRequestId;

  String _timeLabel(DateTime date) {
    final hour = date.hour;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$displayHour:$minute $period';
  }

  String _dateGroupLabel(BuildContext context, DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);
    if (target == today) return l10n.listener_sessions_today;
    if (target == today.add(const Duration(days: 1))) {
      return l10n.listener_sessions_tomorrow;
    }
    return _shortDateLabel(date);
  }

  String _shortDateLabel(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}';
  }

  String _dateTimeLabel(
    BuildContext context,
    DateTime date, {
    bool canJoinNow = false,
  }) {
    if (canJoinNow) {
      return '${l10n.listener_sessions_now} · ${_timeLabel(date)}';
    }
    return '${_dateGroupLabel(context, date)} · ${_timeLabel(date)}';
  }

  String _timeAgoLabel(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) {
      return l10n.listener_sessions_minutes_ago(0);
    }
    if (diff.inMinutes < 60) {
      return l10n.listener_sessions_minutes_ago(diff.inMinutes);
    }
    if (diff.inHours < 24) {
      return l10n.listener_sessions_hours_ago(diff.inHours);
    }
    return l10n.listener_sessions_days_ago(diff.inDays);
  }

  Map<String, List<domain.ListenerSession>> _groupByDate(
    BuildContext context,
    List<domain.ListenerSession> sessions,
  ) {
    final map = <String, List<domain.ListenerSession>>{};
    for (final session in sessions) {
      final key = _dateGroupLabel(context, session.scheduledAt);
      map.putIfAbsent(key, () => []).add(session);
    }
    return map;
  }

  void _onJoinSession(BuildContext context, domain.ListenerSession session) {
    openListenerCallFlow(
      context: context,
      args: ListenerCallArgs(
        sessionId: session.id,
        ventorName: session.ventorName,
        ventorAvatarUrl: session.ventorAvatarUrl,
        ventorRating: session.ventorRating,
        durationMinutes: session.durationMinutes,
        isVideoCall: session.isVideoCall,
      ),
    );
  }

  void _onAcceptRequest(BuildContext context, String requestId) {
    context.read<ListenerSessionsBloc>().add(
      ListenerSessionsEvent.acceptRequestRequested(requestId: requestId),
    );
  }

  void _onDeclineRequest(BuildContext context, String requestId) {
    context.read<ListenerSessionsBloc>().add(
      ListenerSessionsEvent.declineRequestRequested(requestId: requestId),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _dateHeader(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: ListenerProfileTheme.muted,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  Widget _penaltyNote() {
    return ListenerSessionPenaltyNote(
      message: l10n.listener_sessions_penalty_note,
    );
  }

  Widget _emptySectionMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 4),
      child: Text(
        message,
        style: GoogleFonts.inter(
          color: ListenerProfileTheme.muted,
          fontSize: 13,
        ),
      ),
    );
  }

  String _historyStatusLabel(ListenerSessionHistoryOutcome outcome) {
    return switch (outcome) {
      ListenerSessionHistoryOutcome.accepted =>
        l10n.listener_sessions_status_accepted,
      ListenerSessionHistoryOutcome.declined =>
        l10n.listener_sessions_status_declined,
    };
  }

  ListenerSessionStats _mapStats(domain.ListenerSessionStats stats) {
    return ListenerSessionStats(
      acceptedCount: stats.acceptedCount,
      declinedCount: stats.declinedCount,
      missedCount: stats.missedCount,
    );
  }

  ListenerSessionHistoryOutcome? _mapHistoryOutcome(
    domain.ListenerSessionHistoryOutcome? outcome,
  ) {
    return switch (outcome) {
      domain.ListenerSessionHistoryOutcome.accepted =>
        ListenerSessionHistoryOutcome.accepted,
      domain.ListenerSessionHistoryOutcome.declined =>
        ListenerSessionHistoryOutcome.declined,
      null => null,
    };
  }

  Widget _sessionCard(
    BuildContext context, {
    required domain.ListenerSession session,
    VoidCallback? onJoinNow,
  }) {
    final callModeLabel = session.isVideoCall
        ? l10n.listener_sessions_video_call
        : l10n.listener_sessions_voice_call;
    final String? headerLabel = session.canJoinNow
        ? (session.isVideoCall
              ? l10n.listener_sessions_assigned_video
              : l10n.listener_sessions_assigned_voice)
        : null;
    final historyOutcome = _mapHistoryOutcome(session.historyOutcome);

    return ListenerSessionCard(
      ventorName: session.ventorName,
      ventorAvatarUrl: session.ventorAvatarUrl,
      message: session.message,
      chosenReasonLabel: l10n.listener_sessions_chosen_you,
      chosenReason: session.chosenReason,
      dateTimeLabel: _dateTimeLabel(
        context,
        session.scheduledAt,
        canJoinNow: session.canJoinNow,
      ),
      durationLabel: l10n.listener_avail_min_value(session.durationMinutes),
      tags: session.tags,
      badgeLabel: callModeLabel,
      headerLabel: headerLabel,
      waitingLabel: l10n.listener_sessions_waiting,
      isWaiting: session.isWaiting,
      canJoinNow: session.canJoinNow,
      isVideoCall: session.isVideoCall,
      joinNowLabel: session.canJoinNow ? l10n.listener_sessions_join_now : null,
      onJoinNow: onJoinNow,
      isMissed: session.isMissed,
      historyOutcome: historyOutcome,
      statusLabel: historyOutcome == null
          ? session.statusLabel
          : _historyStatusLabel(historyOutcome),
      penaltyLabel: session.isMissed
          ? l10n.listener_sessions_penalty_deducted(
              _money(session.penaltyAmount),
            )
          : null,
      speechLanguageLabel: session.speechLanguage == null
          ? null
          : l10n.listener_sessions_speech_language,
      speechLanguage: session.speechLanguage,
    );
  }

  Widget _requestCard(
    BuildContext context,
    domain.ListenerSessionRequest request,
  ) {
    final isProcessing = processingRequestId == request.id;
    final callModeLabel = request.isVideoCall
        ? l10n.listener_sessions_video_call
        : l10n.listener_sessions_voice_call;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListenerSessionCard(
        ventorName: request.ventorName,
        ventorAvatarUrl: request.ventorAvatarUrl,
        message: request.message,
        chosenReasonLabel: l10n.listener_sessions_chosen_you,
        chosenReason: request.chosenReason,
        dateTimeLabel: _dateTimeLabel(context, request.scheduledAt),
        durationLabel: l10n.listener_avail_min_value(request.durationMinutes),
        tags: request.tags,
        badgeLabel: callModeLabel,
        headerLabel: l10n.listener_sessions_scheduled_request,
        headerTrailing: _timeAgoLabel(request.receivedAt),
        isVideoCall: request.isVideoCall,
        speechLanguageLabel: l10n.listener_sessions_speech_language,
        speechLanguage: request.speechLanguage,
        declineLabel: l10n.listener_sessions_decline,
        acceptLabel: l10n.listener_sessions_accept,
        onDecline: isProcessing
            ? null
            : () => _onDeclineRequest(context, request.id),
        onAccept: isProcessing
            ? null
            : () => _onAcceptRequest(context, request.id),
      ),
    );
  }

  Widget _buildUpcomingContent(BuildContext context) {
    final requests = overview.requests;
    final upcomingSessions = overview.upcomingSessions;
    final scheduledGrouped = _groupByDate(context, upcomingSessions);
    final hasContent = requests.isNotEmpty || upcomingSessions.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _sectionTitle(l10n.listener_sessions_scheduled_section_title),
        if (!hasContent)
          _emptySectionMessage(l10n.listener_sessions_no_scheduled)
        else ...[
          ...requests.map((r) => _requestCard(context, r)),
          ...scheduledGrouped.entries.expand((entry) {
            return [
              _dateHeader(entry.key),
              ...entry.value.map((session) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _sessionCard(
                    context,
                    session: session,
                    onJoinNow: session.canJoinNow
                        ? () => _onJoinSession(context, session)
                        : null,
                  ),
                );
              }),
            ];
          }),
        ],
      ],
    );
  }

  Widget _buildMissedContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _penaltyNote(),
        if (overview.missedSessions.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              l10n.listener_sessions_no_missed,
              style: GoogleFonts.inter(
                color: ListenerProfileTheme.muted,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          )
        else
          ...overview.missedSessions.map((session) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _sessionCard(context, session: session),
            );
          }),
      ],
    );
  }

  Widget _buildHistoryContent(BuildContext context) {
    final stats = _mapStats(overview.stats);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListenerSessionStatsCard(
          title: l10n.listener_sessions_stats_title,
          acceptedLabel: l10n.listener_sessions_accepted,
          declinedLabel: l10n.listener_sessions_declined,
          missedLabel: l10n.listener_sessions_stats_missed,
          acceptedPercent: stats.acceptedPercent,
          declinedPercent: stats.declinedPercent,
          missedPercent: stats.missedPercent,
          acceptedCount: stats.acceptedCount,
          declinedCount: stats.declinedCount,
          missedCount: stats.missedCount,
        ),
        const SizedBox(height: 16),
        _sectionTitle(l10n.listener_sessions_history_title),
        if (overview.historySessions.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              l10n.listener_sessions_no_history,
              style: GoogleFonts.inter(
                color: ListenerProfileTheme.muted,
                fontSize: 14,
              ),
            ),
          )
        else
          ...overview.historySessions.map((session) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _sessionCard(context, session: session),
            );
          }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (filter) {
      ListenerSessionFilter.upcoming => _buildUpcomingContent(context),
      ListenerSessionFilter.missed => _buildMissedContent(context),
      ListenerSessionFilter.history => _buildHistoryContent(context),
    };
  }
}

class _ListenerSessionsShimmer extends StatelessWidget {
  const _ListenerSessionsShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withValues(alpha: 0.08),
      highlightColor: Colors.white.withValues(alpha: 0.16),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: const [
          _SessionsShimmerLine(width: 150, height: 24),
          SizedBox(height: 16),
          _SessionsShimmerLine(width: double.infinity, height: 44),
          SizedBox(height: 20),
          _SessionsShimmerLine(width: 180, height: 16),
          SizedBox(height: 12),
          _SessionsShimmerCard(height: 168),
          SizedBox(height: 10),
          _SessionsShimmerCard(height: 168),
          SizedBox(height: 16),
          _SessionsShimmerLine(width: 160, height: 16),
          SizedBox(height: 12),
          _SessionsShimmerCard(height: 148),
        ],
      ),
    );
  }
}

class _SessionsShimmerCard extends StatelessWidget {
  const _SessionsShimmerCard({required this.height});

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

class _SessionsShimmerLine extends StatelessWidget {
  const _SessionsShimmerLine({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
