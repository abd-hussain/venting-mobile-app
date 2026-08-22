import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_args.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_flow.dart';
import 'package:venting_mobile_app/presentation/home/ventor/home/ventor_home_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/home/ventor_points_home_card.dart';
import 'package:venting_mobile_app/presentation/home/ventor/home/ventor_mood_checkin_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_before_connecting_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_booked_session_details_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_session_duration_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/ventor_home_shell.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class VentorDashboardTab extends StatefulWidget {
  const VentorDashboardTab({super.key});

  @override
  State<VentorDashboardTab> createState() => _VentorDashboardTabState();
}

class _VentorDashboardTabState extends State<VentorDashboardTab> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  // TODO: Load check-in / streak from ventor wellness API.
  /// Mon–Sat already checked; Sunday open until today's submit.
  final List<bool> _streakChecked = [true, true, true, true, true, true, false];
  VentorMoodKind? _todayMood;
  String? _todayNote;
  var _streakClaimed = false;
  var _matchingInstant = false;
  late List<VentorBookedSession> _bookedSessions;

  @override
  void initState() {
    super.initState();
    // TODO: Load booked sessions from API for home upcoming card.
    _bookedSessions = VentorSessionsCatalog.mockBookedSessions();
  }

  VentorBookedSession? get _nearestUpcoming {
    final now = DateTime.now();
    final candidates = _bookedSessions.where((s) {
      return s.status == VentorBookedSessionStatus.live ||
          s.status == VentorBookedSessionStatus.upcoming;
    }).toList();
    if (candidates.isEmpty) return null;
    candidates.sort((a, b) {
      int rank(VentorBookedSessionStatus status) => switch (status) {
        VentorBookedSessionStatus.live => 0,
        VentorBookedSessionStatus.upcoming => 1,
        _ => 2,
      };
      final byStatus = rank(a.status).compareTo(rank(b.status));
      if (byStatus != 0) return byStatus;
      final aTime = a.scheduledAt ?? now;
      final bTime = b.scheduledAt ?? now;
      return aTime.compareTo(bTime);
    });
    return candidates.first;
  }

  int get _streakCount => _streakChecked.where((d) => d).length;

  bool get _checkedInToday => _todayMood != null;

  bool get _canClaim => _streakChecked.every((d) => d) && !_streakClaimed;

  String _greeting(VentingMobLocalizations l10n) {
    final hour = DateTime.now().hour;
    if (hour < 12) return l10n.ventor_home_greeting_morning;
    if (hour < 17) return l10n.ventor_home_greeting_afternoon;
    return l10n.ventor_home_greeting_evening;
  }

  String _moodLabel(VentingMobLocalizations l10n, VentorMoodKind kind) {
    return switch (kind) {
      VentorMoodKind.great => l10n.ventor_home_mood_great,
      VentorMoodKind.okay => l10n.ventor_home_mood_okay,
      VentorMoodKind.anxious => l10n.ventor_home_mood_anxious,
      VentorMoodKind.sad => l10n.ventor_home_mood_sad,
      VentorMoodKind.angry => l10n.ventor_home_mood_angry,
    };
  }

  String _recommendation(VentingMobLocalizations l10n, VentorMoodKind? mood) {
    return switch (mood) {
      VentorMoodKind.great => l10n.ventor_home_reco_great,
      VentorMoodKind.okay => l10n.ventor_home_reco_okay,
      VentorMoodKind.anxious => l10n.ventor_home_reco_anxious,
      VentorMoodKind.sad => l10n.ventor_home_reco_sad,
      VentorMoodKind.angry => l10n.ventor_home_reco_angry,
      null => l10n.ventor_home_reco_default,
    };
  }

  Future<void> _onMoodTap(VentorMoodOption option) async {
    if (_checkedInToday) {
      final l10n = VentingMobLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.ventor_home_mood_already_done),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final result = await showVentorMoodCheckInSheet(
      context: context,
      mood: option,
    );
    if (!mounted || result == null) return;

    setState(() {
      _todayMood = result.mood;
      _todayNote = result.note;
      // Mark today's slot (last day in the weekly mock) as complete.
      _streakChecked[6] = true;
    });

    final l10n = VentingMobLocalizations.of(context);
    final completed = _streakChecked.every((d) => d);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          completed
              ? l10n.ventor_home_mood_streak_complete(
                  VentorHomeCatalog.streakDiscountPercent,
                )
              : l10n.ventor_home_mood_saved,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _onClaimStreak() {
    if (!_canClaim) return;
    setState(() => _streakClaimed = true);
    final l10n = VentingMobLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          l10n.ventor_home_streak_claimed(
            VentorHomeCatalog.streakDiscountPercent,
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
    VentorHomeShell.goToTab(context, VentorHomeShell.rewardsTab);
  }

  void _goSessions() {
    VentorHomeShell.goToTab(context, VentorHomeShell.sessionsTab);
  }

  String _upcomingWhenLabel(
    VentingMobLocalizations l10n,
    VentorBookedSession session,
  ) {
    if (session.status == VentorBookedSessionStatus.live) {
      return session.isInstant
          ? l10n.ventor_sessions_booked_instant_now
          : l10n.ventor_home_upcoming_live_now;
    }
    final at = session.scheduledAt;
    if (at == null) return l10n.ventor_sessions_time_summary_instant;
    final locale = Localizations.localeOf(context).toString();
    return '${DateFormat.MMMEd(locale).format(at)} · '
        '${DateFormat.jm(locale).format(at)}';
  }

  Future<void> _onUpcomingTap(VentorBookedSession session) async {
    if (session.status == VentorBookedSessionStatus.live) {
      final listener = VentorSessionsCatalog.listenerById(session.listenerId);
      final completed = await openVentorCallFlow(
        context: context,
        args: VentorCallArgs(
          sessionId: session.id,
          listenerName: session.listenerName,
          listenerAvatarUrl: session.listenerAvatarUrl,
          listenerRating: listener?.rating ?? 4.9,
          durationMinutes: session.durationMinutes,
          isVideoCall: session.callMode == VentorBookedCallMode.video,
          speechLanguage: session.speechLanguage,
        ),
      );
      if (!mounted || completed != true) return;
      setState(() {
        _bookedSessions = [
          for (final item in _bookedSessions)
            if (item.id == session.id)
              item.copyWith(status: VentorBookedSessionStatus.completed)
            else
              item,
        ];
      });
      VentorHomeShell.goToDashboard(context);
      return;
    }

    if (session.status == VentorBookedSessionStatus.upcoming) {
      final updated = await openVentorBookedSessionDetailsScreen(
        context: context,
        session: session,
      );
      if (!mounted || updated == null) return;
      setState(() {
        _bookedSessions = [
          for (final item in _bookedSessions)
            if (item.id == updated.id) updated else item,
        ];
      });
    }
  }

  Future<void> _bookInstantCall() async {
    if (_matchingInstant) return;
    final l10n = VentingMobLocalizations.of(context);
    setState(() => _matchingInstant = true);

    // TODO: Call instant-match API (best available listener for ventor).
    await Future<void>.delayed(const Duration(milliseconds: 1100));
    if (!mounted) return;

    final listener = VentorSessionsCatalog.bestInstantListener();
    setState(() => _matchingInstant = false);

    if (listener == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.ventor_home_instant_none),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final minutes = await showVentorSessionDurationSheet(
      context: context,
      listener: listener,
    );
    if (!mounted || minutes == null) return;

    await openVentorBeforeConnectingScreen(
      context: context,
      listener: listener,
      durationMinutes: minutes,
      timeChoice: const VentorSessionTimeChoice.instant(),
    );
  }

  void _todoFeature(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final name = VentorHomeCatalog.mockUserName;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
          children: [
            // Dashboard sections are ordered by user priority (highest first).
            _HomeHeader(
              greeting: '${_greeting(l10n)}, $name 👋',
              subtitle: l10n.ventor_home_safe_place,
              onNotifications: () =>
                  _todoFeature(l10n.ventor_home_notifications_soon),
            ),
            const SizedBox(height: 22),

            // P1 — Time-sensitive: join live or review upcoming booking.
            if (_nearestUpcoming != null) ...[
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.ventor_home_upcoming_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _goSessions,
                    style: TextButton.styleFrom(
                      foregroundColor: SplashColors.purpleMid,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      l10n.ventor_home_see_all,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _UpcomingSessionCard(
                session: _nearestUpcoming!,
                whenLabel: _upcomingWhenLabel(l10n, _nearestUpcoming!),
                statusLabel:
                    _nearestUpcoming!.status == VentorBookedSessionStatus.live
                    ? l10n.ventor_sessions_booked_status_live
                    : l10n.ventor_sessions_booked_status_upcoming,
                statusColor:
                    _nearestUpcoming!.status == VentorBookedSessionStatus.live
                    ? VentorProfileTheme.success
                    : SplashColors.purpleMid,
                metaLabel: [
                  l10n.ventor_sessions_duration_minutes(
                    _nearestUpcoming!.durationMinutes,
                  ),
                  if (_nearestUpcoming!.callMode == VentorBookedCallMode.video)
                    l10n.ventor_sessions_call_video
                  else
                    l10n.ventor_sessions_call_voice,
                  l10n.ventor_sessions_booked_speech_language(
                    _nearestUpcoming!.speechLanguage,
                  ),
                ].join(' · '),
                actionLabel:
                    _nearestUpcoming!.status == VentorBookedSessionStatus.live
                    ? l10n.ventor_sessions_booked_join
                    : l10n.ventor_sessions_booked_details,
                onAction: () => _onUpcomingTap(_nearestUpcoming!),
              ),
              const SizedBox(height: 22),
            ],

            // P2 — Primary action: connect with a listener now.
            Text(
              l10n.ventor_home_instant_section_title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.ventor_home_instant_section_subtitle,
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 13,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 12),
            _InstantCallCard(
              matching: _matchingInstant,
              title: l10n.ventor_home_instant_title,
              subtitle: l10n.ventor_home_instant_subtitle,
              matchingLabel: l10n.ventor_home_instant_matching,
              ctaLabel: l10n.ventor_home_instant_cta,
              onTap: _bookInstantCall,
            ),
            const SizedBox(height: 22),

            // P3 — Daily mood check-in.
            Text(
              l10n.ventor_home_mood_prompt,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 14),
            _MoodRow(
              selected: _todayMood,
              onTap: _onMoodTap,
              labelFor: (kind) => _moodLabel(l10n, kind),
            ),
            if (_checkedInToday && _todayNote != null) ...[
              const SizedBox(height: 12),
              _TodayNoteCard(note: _todayNote!),
            ],
            const SizedBox(height: 14),

            // P4 — 7-day mood streak (progress from daily check-ins above).
            _StreakCard(
              title: l10n.ventor_home_streak_title(_streakCount),
              subtitle: l10n.ventor_home_streak_subtitle,
              checked: _streakChecked,
              dayLabels: [
                l10n.ventor_home_day_mon,
                l10n.ventor_home_day_tue,
                l10n.ventor_home_day_wed,
                l10n.ventor_home_day_thu,
                l10n.ventor_home_day_fri,
                l10n.ventor_home_day_sat,
                l10n.ventor_home_day_sun,
              ],
              claimLabel: _streakClaimed
                  ? l10n.ventor_home_streak_claimed_badge
                  : l10n.ventor_home_streak_claim,
              canClaim: _canClaim,
              onClaim: _onClaimStreak,
            ),
            const SizedBox(height: 18),

            // P5 — Mood-based listener recommendation.
            _RecommendationCard(
              message: _recommendation(l10n, _todayMood),
              cta: l10n.ventor_home_find_listener,
              onTap: _goSessions,
            ),
            const SizedBox(height: 14),

            // P6 — Points balance and purchase/redemption entry.
            const VentorPointsHomeCard(),
            const SizedBox(height: 22),

            // P7 — Session history preview.
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.ventor_home_recent_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _goSessions,
                  style: TextButton.styleFrom(
                    foregroundColor: SplashColors.purpleMid,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    l10n.ventor_home_see_all,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            for (final session in VentorHomeCatalog.mockRecentSessions) ...[
              _RecentSessionCard(
                listenerName: session.listenerName,
                avatarUrl: session.listenerAvatarUrl,
                meta: l10n.ventor_home_recent_meta(
                  l10n.ventor_home_yesterday,
                  session.durationMinutes,
                ),
                isFavorite: session.isFavorite,
                onTap: _goSessions,
              ),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 8),

            // P8 — Inspirational footer.
            _MotivationCard(quote: l10n.ventor_home_motivation),
          ],
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    required this.greeting,
    required this.subtitle,
    required this.onNotifications,
  });

  final String greeting;
  final String subtitle;
  final VoidCallback onNotifications;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.inter(
                  color: VentorProfileTheme.muted,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onNotifications,
          style: IconButton.styleFrom(
            backgroundColor: VentorProfileTheme.cardFill,
            side: const BorderSide(color: VentorProfileTheme.cardBorder),
          ),
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _MoodRow extends StatelessWidget {
  const _MoodRow({
    required this.selected,
    required this.onTap,
    required this.labelFor,
  });

  final VentorMoodKind? selected;
  final ValueChanged<VentorMoodOption> onTap;
  final String Function(VentorMoodKind) labelFor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final mood in VentorMoodOption.all)
          _MoodAvatar(
            option: mood,
            selected: selected == mood.kind,
            label: selected == mood.kind ? labelFor(mood.kind) : null,
            onTap: () => onTap(mood),
          ),
      ],
    );
  }
}

class _MoodAvatar extends StatelessWidget {
  const _MoodAvatar({
    required this.option,
    required this.selected,
    required this.onTap,
    this.label,
  });

  final VentorMoodOption option;
  final bool selected;
  final String? label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = Color(option.color);
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: selected ? 62 : 54,
              height: selected ? 62 : 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withValues(alpha: selected ? 0.22 : 0.12),
                border: Border.all(
                  color: selected ? color : color.withValues(alpha: 0.35),
                  width: selected ? 2.5 : 1.5,
                ),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: color.withValues(alpha: 0.45),
                          blurRadius: 16,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              alignment: Alignment.center,
              child: Text(
                option.emoji,
                style: TextStyle(fontSize: selected ? 28 : 24),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 16,
          child: label == null
              ? const SizedBox.shrink()
              : Text(
                  label!,
                  style: GoogleFonts.inter(
                    color: color,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ),
      ],
    );
  }
}

class _TodayNoteCard extends StatelessWidget {
  const _TodayNoteCard({required this.note});

  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Text(
        note,
        style: GoogleFonts.inter(
          color: Colors.white.withValues(alpha: 0.9),
          fontSize: 13,
          height: 1.4,
        ),
      ),
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({
    required this.message,
    required this.cta,
    required this.onTap,
  });

  final String message;
  final String cta;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            SplashColors.purpleMid.withValues(alpha: 0.28),
            const Color(0xFF1A1328),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: SplashColors.purpleMid.withValues(alpha: 0.35),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 40,
                  child: FilledButton(
                    onPressed: onTap,
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    child: Text(
                      cta,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              color: SplashColors.purpleMid.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.headset_mic_rounded,
              color: SplashColors.purpleMid,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class _StreakCard extends StatelessWidget {
  const _StreakCard({
    required this.title,
    required this.subtitle,
    required this.checked,
    required this.dayLabels,
    required this.claimLabel,
    required this.canClaim,
    required this.onClaim,
  });

  final String title;
  final String subtitle;
  final List<bool> checked;
  final List<String> dayLabels;
  final String claimLabel;
  final bool canClaim;
  final VoidCallback onClaim;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 36,
                child: FilledButton.icon(
                  onPressed: canClaim ? onClaim : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: canClaim
                        ? SplashColors.purpleMid
                        : Colors.white.withValues(alpha: 0.08),
                    disabledBackgroundColor: Colors.white.withValues(
                      alpha: 0.08,
                    ),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: VentorProfileTheme.muted,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  icon: Icon(
                    canClaim
                        ? Icons.card_giftcard_rounded
                        : Icons.check_rounded,
                    size: 16,
                  ),
                  label: Text(
                    claimLabel,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < checked.length; i++)
                Column(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: checked[i]
                            ? SplashColors.purpleMid.withValues(alpha: 0.22)
                            : Colors.white.withValues(alpha: 0.05),
                        border: Border.all(
                          color: checked[i]
                              ? SplashColors.purpleMid
                              : VentorProfileTheme.cardBorder,
                        ),
                      ),
                      child: Icon(
                        checked[i] ? Icons.check_rounded : Icons.remove,
                        size: 16,
                        color: checked[i]
                            ? SplashColors.purpleMid
                            : VentorProfileTheme.muted,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      dayLabels[i],
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InstantCallCard extends StatelessWidget {
  const _InstantCallCard({
    required this.matching,
    required this.title,
    required this.subtitle,
    required this.matchingLabel,
    required this.ctaLabel,
    required this.onTap,
  });

  final bool matching;
  final String title;
  final String subtitle;
  final String matchingLabel;
  final String ctaLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: matching ? null : onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                SplashColors.purpleMid.withValues(alpha: 0.32),
                const Color(0xFF1A1328),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: SplashColors.purpleMid.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: SplashColors.purpleMid.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: matching
                    ? const Padding(
                        padding: EdgeInsets.all(14),
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: SplashColors.purpleMid,
                        ),
                      )
                    : const Icon(
                        Icons.bolt_rounded,
                        color: SplashColors.purpleMid,
                        size: 30,
                      ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      matching ? matchingLabel : title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 12,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              if (!matching)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: SplashColors.purpleMid,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    ctaLabel,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UpcomingSessionCard extends StatelessWidget {
  const _UpcomingSessionCard({
    required this.session,
    required this.whenLabel,
    required this.statusLabel,
    required this.statusColor,
    required this.metaLabel,
    required this.actionLabel,
    required this.onAction,
  });

  final VentorBookedSession session;
  final String whenLabel;
  final String statusLabel;
  final Color statusColor;
  final String metaLabel;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    final isLive = session.status == VentorBookedSessionStatus.live;

    return Material(
      color: VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onAction,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isLive
                  ? VentorProfileTheme.success.withValues(alpha: 0.45)
                  : VentorProfileTheme.cardBorder,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(session.listenerAvatarUrl),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          session.listenerName,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          whenLabel,
                          style: GoogleFonts.inter(
                            color: VentorProfileTheme.muted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      statusLabel,
                      style: GoogleFonts.inter(
                        color: statusColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                metaLabel,
                style: GoogleFonts.inter(
                  color: Colors.white.withValues(alpha: 0.88),
                  fontSize: 12,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 42,
                child: FilledButton(
                  onPressed: onAction,
                  style: FilledButton.styleFrom(
                    backgroundColor: isLive
                        ? VentorProfileTheme.success
                        : SplashColors.purpleMid,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    actionLabel,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecentSessionCard extends StatelessWidget {
  const _RecentSessionCard({
    required this.listenerName,
    required this.avatarUrl,
    required this.meta,
    required this.isFavorite,
    required this.onTap,
  });

  final String listenerName;
  final String avatarUrl;
  final String meta;
  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    return Material(
      color: VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: VentorProfileTheme.cardBorder),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.ventor_home_recent_with(listenerName),
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      meta,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                isFavorite ? Icons.favorite_rounded : Icons.favorite_border,
                color: SplashColors.purpleMid,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MotivationCard extends StatelessWidget {
  const _MotivationCard({required this.quote});

  final String quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SplashColors.purpleMid.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: SplashColors.purpleMid.withValues(alpha: 0.28),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.format_quote_rounded,
            color: SplashColors.purpleMid,
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              quote,
              style: GoogleFonts.inter(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 13,
                height: 1.4,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
