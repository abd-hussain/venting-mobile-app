import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_args.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_flow.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/sessions/listener_sessions_widgets.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerSessionsTab extends StatefulWidget {
  const ListenerSessionsTab({super.key});

  @override
  State<ListenerSessionsTab> createState() => _ListenerSessionsTabState();
}

class _ListenerSessionsTabState extends State<ListenerSessionsTab> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  ListenerSessionFilter _filter = ListenerSessionFilter.upcoming;

  // TODO: Load session stats from listener sessions API.
  ListenerSessionStats _stats = const ListenerSessionStats(
    acceptedCount: 18,
    declinedCount: 4,
    missedCount: 2,
  );

  // TODO: Load upcoming sessions from API.
  late List<ListenerSessionItem> _upcomingSessions;

  // TODO: Load history sessions from API.
  late List<ListenerSessionItem> _historySessions;

  // TODO: Load missed sessions (forgot to enter) from API.
  late List<ListenerSessionItem> _missedSessions;

  // TODO: Load pending session requests from API.
  late List<ListenerSessionRequest> _requests;

  @override
  void initState() {
    super.initState();
    _upcomingSessions = _buildMockUpcoming();
    _historySessions = _buildMockHistory();
    _missedSessions = _buildMockMissed();
    _requests = _buildMockRequests();
  }

  List<ListenerSessionItem> _buildMockUpcoming() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    return [
      ListenerSessionItem(
        id: 'u0',
        scheduledAt: now,
        durationMinutes: 30,
        ventorName: 'Omar H.',
        ventorAvatarUrl: 'https://i.pravatar.cc/120?u=ventor-omar',
        message:
            'I need someone to listen right now — work stress is overwhelming.',
        chosenReason:
            'You were available for instant sessions and matched my topic.',
        tags: const ['Stress'],
        isWaiting: true,
        canJoinNow: true,
        ventorRating: 4.7,
      ),
      ListenerSessionItem(
        id: 'u0v',
        scheduledAt: now,
        durationMinutes: 30,
        ventorName: 'Maya R.',
        ventorAvatarUrl: 'https://i.pravatar.cc/120?u=ventor-maya',
        message:
            'I prefer video so we can talk face to face about what I am going through.',
        chosenReason:
            'You matched my comfort areas and were available for an instant video session.',
        tags: const ['Relationships'],
        isWaiting: true,
        canJoinNow: true,
        isVideoCall: true,
        ventorRating: 4.9,
      ),
      ListenerSessionItem(
        id: 'u1',
        scheduledAt: today.add(const Duration(hours: 19, minutes: 30)),
        durationMinutes: 30,
        ventorName: 'Alex M.',
        ventorAvatarUrl: 'https://i.pravatar.cc/120?u=ventor-alex',
        message: 'I have exams coming up and my anxiety is getting worse.',
        chosenReason:
            'You specialize in anxiety support and your evening slots match my schedule.',
        tags: const ['Anxiety', 'Overthinking'],
      ),
      ListenerSessionItem(
        id: 'u2',
        scheduledAt: tomorrow.add(const Duration(hours: 18)),
        durationMinutes: 30,
        ventorName: 'Sara K.',
        ventorAvatarUrl: 'https://i.pravatar.cc/120?u=ventor-sara',
        message: 'I have been feeling lonely and need someone to talk to.',
        chosenReason:
            'Your profile mentions experience with loneliness and you speak Arabic.',
        tags: const ['Loneliness'],
      ),
    ];
  }

  List<ListenerSessionItem> _buildMockHistory() {
    final now = DateTime.now();
    return [
      ListenerSessionItem(
        id: 'h1',
        scheduledAt: now.subtract(const Duration(days: 1, hours: 2)),
        durationMinutes: 30,
        ventorName: 'Layla T.',
        ventorAvatarUrl: 'https://i.pravatar.cc/120?u=ventor-layla',
        message: 'Burnout at work is affecting my sleep and mood.',
        chosenReason: 'You had great reviews for stress and burnout sessions.',
        tags: const ['Stress', 'Overthinking'],
        historyOutcome: ListenerSessionHistoryOutcome.accepted,
      ),
      ListenerSessionItem(
        id: 'h2',
        scheduledAt: now.subtract(const Duration(days: 3, hours: 4)),
        durationMinutes: 60,
        ventorName: 'Noor A.',
        ventorAvatarUrl: 'https://i.pravatar.cc/120?u=ventor-noor',
        message: 'Going through a tough time in my relationship.',
        chosenReason:
            'Your comfort areas include relationships and emotional support.',
        tags: const ['Relationships'],
        historyOutcome: ListenerSessionHistoryOutcome.accepted,
      ),
      ListenerSessionItem(
        id: 'h3',
        scheduledAt: now.subtract(const Duration(days: 4, hours: 6)),
        durationMinutes: 30,
        ventorName: 'Karim D.',
        ventorAvatarUrl: 'https://i.pravatar.cc/120?u=ventor-karim',
        message: 'Looking for someone to talk about family pressure.',
        chosenReason: 'Your profile matched my topic but I was not available.',
        tags: const ['Stress', 'Family'],
        historyOutcome: ListenerSessionHistoryOutcome.declined,
      ),
    ];
  }

  List<ListenerSessionItem> _buildMockMissed() {
    final now = DateTime.now();
    return [
      ListenerSessionItem(
        id: 'm1',
        scheduledAt: now.subtract(const Duration(days: 2, hours: 3)),
        durationMinutes: 30,
        ventorName: 'Youssef B.',
        ventorAvatarUrl: 'https://i.pravatar.cc/120?u=ventor-youssef',
        message: 'Needed help calming down before a big presentation.',
        chosenReason:
            'You were listed as available and matched my anxiety topic.',
        tags: const ['Anxiety'],
        sessionCost: 18,
        isMissed: true,
      ),
      ListenerSessionItem(
        id: 'm2',
        scheduledAt: now.subtract(const Duration(days: 5, hours: 1)),
        durationMinutes: 60,
        ventorName: 'Hana S.',
        ventorAvatarUrl: 'https://i.pravatar.cc/120?u=ventor-hana',
        message: 'Could not sleep and wanted to talk about overthinking.',
        chosenReason:
            'Your evening availability and stress support reviews stood out.',
        tags: const ['Overthinking', 'Stress'],
        sessionCost: 36,
        isMissed: true,
      ),
    ];
  }

  List<ListenerSessionRequest> _buildMockRequests() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return [
      ListenerSessionRequest(
        id: 'r1',
        ventorName: 'Maya R.',
        ventorAvatarUrl: 'https://i.pravatar.cc/120?u=ventor-maya',
        message:
            'Can you help me with panic attacks? They have been happening more often.',
        chosenReason:
            'I saw you handle anxiety topics well and I need someone who understands panic.',
        scheduledAt: today.add(const Duration(hours: 20)),
        durationMinutes: 30,
        tags: const ['Anxiety', 'Panic'],
        receivedAt: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
    ];
  }

  String _timeLabel(DateTime date) {
    final hour = date.hour;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$displayHour:$minute $period';
  }

  String _dateGroupLabel(BuildContext context, DateTime date) {
    final l10n = VentingMobLocalizations.of(context);
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

  String _dateTimeLabel(BuildContext context, DateTime date) {
    return '${_dateGroupLabel(context, date)} · ${_timeLabel(date)}';
  }

  String _timeAgoLabel(BuildContext context, DateTime date) {
    final l10n = VentingMobLocalizations.of(context);
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 60) {
      return l10n.listener_sessions_minutes_ago(diff.inMinutes);
    }
    if (diff.inHours < 24) {
      return l10n.listener_sessions_hours_ago(diff.inHours);
    }
    return l10n.listener_sessions_days_ago(diff.inDays);
  }

  Map<String, List<ListenerSessionItem>> _groupByDate(
    BuildContext context,
    List<ListenerSessionItem> sessions,
  ) {
    final map = <String, List<ListenerSessionItem>>{};
    for (final session in sessions) {
      final key = _dateGroupLabel(context, session.scheduledAt);
      map.putIfAbsent(key, () => []).add(session);
    }
    return map;
  }

  void _onFilterChanged(ListenerSessionFilter filter) {
    setState(() => _filter = filter);
  }

  void _onJoinSession(String id) {
    ListenerSessionItem? session;
    for (final s in _upcomingSessions) {
      if (s.id == id) {
        session = s;
        break;
      }
    }
    if (session == null) return;

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

  Future<void> _onAcceptRequest(String id) async {
    // TODO: Call accept session request API.
    setState(() {
      _requests = _requests.where((r) => r.id != id).toList();
      _stats = ListenerSessionStats(
        acceptedCount: _stats.acceptedCount + 1,
        declinedCount: _stats.declinedCount,
        missedCount: _stats.missedCount,
      );
    });
  }

  Future<void> _onDeclineRequest(String id) async {
    // TODO: Call decline session request API.
    setState(() {
      _requests = _requests.where((r) => r.id != id).toList();
      _stats = ListenerSessionStats(
        acceptedCount: _stats.acceptedCount,
        declinedCount: _stats.declinedCount + 1,
        missedCount: _stats.missedCount,
      );
    });
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

  Widget _penaltyNote(VentingMobLocalizations l10n) {
    return ListenerSessionPenaltyNote(
      message: l10n.listener_sessions_penalty_note,
    );
  }

  Widget _sessionCard({
    required VentingMobLocalizations l10n,
    required String ventorName,
    required String? ventorAvatarUrl,
    required String message,
    required String chosenReason,
    required DateTime scheduledAt,
    required int durationMinutes,
    required List<String> tags,
    bool isWaiting = false,
    bool canJoinNow = false,
    bool isMissed = false,
    ListenerSessionHistoryOutcome? historyOutcome,
    String? statusLabel,
    String? penaltyLabel,
    VoidCallback? onJoinNow,
  }) {
    return ListenerSessionCard(
      ventorName: ventorName,
      ventorAvatarUrl: ventorAvatarUrl,
      message: message,
      chosenReasonLabel: l10n.listener_sessions_chosen_you,
      chosenReason: chosenReason,
      dateTimeLabel: _dateTimeLabel(context, scheduledAt),
      durationLabel: l10n.listener_avail_min_value(durationMinutes),
      tags: tags,
      waitingLabel: l10n.listener_sessions_waiting,
      isWaiting: isWaiting,
      canJoinNow: canJoinNow,
      joinNowLabel: canJoinNow ? l10n.listener_sessions_join_now : null,
      onJoinNow: onJoinNow,
      isMissed: isMissed,
      historyOutcome: historyOutcome,
      statusLabel: statusLabel,
      penaltyLabel: penaltyLabel,
    );
  }

  String _historyStatusLabel(
    VentingMobLocalizations l10n,
    ListenerSessionHistoryOutcome outcome,
  ) {
    return switch (outcome) {
      ListenerSessionHistoryOutcome.accepted =>
        l10n.listener_sessions_status_accepted,
      ListenerSessionHistoryOutcome.declined =>
        l10n.listener_sessions_status_declined,
    };
  }

  ListenerSessionStats get _displayStats {
    return ListenerSessionStats(
      acceptedCount: _stats.acceptedCount,
      declinedCount: _stats.declinedCount,
      missedCount: _missedSessions.length,
    );
  }

  Widget _buildUpcomingContent(VentingMobLocalizations l10n) {
    final grouped = _groupByDate(context, _upcomingSessions);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_requests.isNotEmpty) ...[
          _sectionTitle(l10n.listener_sessions_requests_title),
          ..._requests.map((request) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListenerSessionCard(
                ventorName: request.ventorName,
                ventorAvatarUrl: request.ventorAvatarUrl,
                message: request.message,
                chosenReasonLabel: l10n.listener_sessions_chosen_you,
                chosenReason: request.chosenReason,
                dateTimeLabel: _dateTimeLabel(context, request.scheduledAt),
                durationLabel: l10n.listener_avail_min_value(
                  request.durationMinutes,
                ),
                tags: request.tags,
                headerLabel: l10n.listener_sessions_new_request,
                headerTrailing: _timeAgoLabel(context, request.receivedAt),
                declineLabel: l10n.listener_sessions_decline,
                acceptLabel: l10n.listener_sessions_accept,
                onDecline: () => _onDeclineRequest(request.id),
                onAccept: () => _onAcceptRequest(request.id),
              ),
            );
          }),
          const SizedBox(height: 8),
        ],
        _sectionTitle(l10n.listener_sessions_upcoming_title),
        ...grouped.entries.expand((entry) {
          return [
            _dateHeader(entry.key),
            ...entry.value.map((session) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _sessionCard(
                  l10n: l10n,
                  ventorName: session.ventorName,
                  ventorAvatarUrl: session.ventorAvatarUrl,
                  message: session.message,
                  chosenReason: session.chosenReason,
                  scheduledAt: session.scheduledAt,
                  durationMinutes: session.durationMinutes,
                  tags: session.tags,
                  isWaiting: session.isWaiting,
                  canJoinNow: session.canJoinNow,
                  onJoinNow: session.canJoinNow
                      ? () => _onJoinSession(session.id)
                      : null,
                ),
              );
            }),
          ];
        }),
      ],
    );
  }

  Widget _buildMissedContent(VentingMobLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _penaltyNote(l10n),
        if (_missedSessions.isEmpty)
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
          ..._missedSessions.map((session) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _sessionCard(
                l10n: l10n,
                ventorName: session.ventorName,
                ventorAvatarUrl: session.ventorAvatarUrl,
                message: session.message,
                chosenReason: session.chosenReason,
                scheduledAt: session.scheduledAt,
                durationMinutes: session.durationMinutes,
                tags: session.tags,
                isMissed: true,
                statusLabel: l10n.listener_sessions_status_missed,
                penaltyLabel: l10n.listener_sessions_penalty_deducted(
                  _money(session.penaltyAmount),
                ),
              ),
            );
          }),
      ],
    );
  }

  Widget _buildHistoryContent(VentingMobLocalizations l10n) {
    final stats = _displayStats;

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
        if (_historySessions.isEmpty)
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
          ..._historySessions.map((session) {
            final outcome = session.historyOutcome;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _sessionCard(
                l10n: l10n,
                ventorName: session.ventorName,
                ventorAvatarUrl: session.ventorAvatarUrl,
                message: session.message,
                chosenReason: session.chosenReason,
                scheduledAt: session.scheduledAt,
                durationMinutes: session.durationMinutes,
                tags: session.tags,
                historyOutcome: outcome,
                statusLabel: outcome == null
                    ? session.statusLabel
                    : _historyStatusLabel(l10n, outcome),
              ),
            );
          }),
      ],
    );
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
                  _upcomingSessions.length,
                ),
                missedLabel: l10n.listener_sessions_filter_missed(
                  _missedSessions.length,
                ),
                historyLabel: l10n.listener_sessions_filter_history,
                onChanged: _onFilterChanged,
              ),
              const SizedBox(height: 20),
              switch (_filter) {
                ListenerSessionFilter.upcoming => _buildUpcomingContent(l10n),
                ListenerSessionFilter.missed => _buildMissedContent(l10n),
                ListenerSessionFilter.history => _buildHistoryContent(l10n),
              },
            ],
          ),
        ),
      ),
    );
  }
}
