import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_args.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_flow.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/bloc/ventor_find_listeners/ventor_find_listeners_bloc.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_booked_session_details_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_listener_profile_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_filter_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_widgets.dart';
import 'package:venting_mobile_app/presentation/home/ventor/ventor_home_shell.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/phone_country_picker.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

enum _SessionsSection { find, booked }

class VentorSessionsTab extends StatefulWidget {
  const VentorSessionsTab({super.key});

  @override
  State<VentorSessionsTab> createState() => VentorSessionsTabState();
}

class VentorSessionsTabState extends State<VentorSessionsTab> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  final _searchController = TextEditingController();
  final _rng = Random();
  late final VentorFindListenersBloc _findBloc;

  // TODO: Load booked sessions from APIs.
  late List<VentorBookedSession> _bookedSessions;
  var _section = _SessionsSection.find;

  @override
  void initState() {
    super.initState();
    _findBloc = diContainer<VentorFindListenersBloc>()
      ..add(const VentorFindListenersEvent.started());
    _bookedSessions = VentorSessionsCatalog.mockBookedSessions();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _findBloc.close();
    super.dispose();
  }

  /// Switches to the Find listeners section (e.g. from profile favorites).
  void showFindSection() {
    if (_section == _SessionsSection.find) return;
    setState(() => _section = _SessionsSection.find);
  }

  String _topicLabel(VentingMobLocalizations l10n, String id) {
    return switch (id) {
      'anxiety' => l10n.ventor_sessions_topic_anxiety,
      'sadness' => l10n.ventor_sessions_topic_sadness,
      'relationships' => l10n.ventor_sessions_topic_relationships,
      'stress' => l10n.ventor_sessions_topic_stress,
      _ => l10n.ventor_sessions_topic_all,
    };
  }

  String _lifeExperienceLabel(VentingMobLocalizations l10n, String id) {
    return switch (id) {
      'single' => l10n.listener_reg_exp_single,
      'in_relationship' => l10n.listener_reg_exp_in_relationship,
      'married' => l10n.listener_reg_exp_married,
      'divorced' => l10n.listener_reg_exp_divorced,
      'widowed' => l10n.listener_reg_exp_widowed,
      'parent' => l10n.listener_reg_exp_parent,
      'single_parent' => l10n.listener_reg_exp_single_parent,
      'caregiver' => l10n.listener_reg_exp_caregiver,
      'career_change' => l10n.listener_reg_exp_career_change,
      'job_loss' => l10n.listener_reg_exp_job_loss,
      'startup_founder' => l10n.listener_reg_exp_startup_founder,
      'financial_struggle' => l10n.listener_reg_exp_financial_struggle,
      'life_stages' => l10n.listener_reg_exp_life_stages,
      'grief_loss' => l10n.listener_reg_exp_grief_loss,
      'anxiety_stress' => l10n.listener_reg_exp_anxiety_stress,
      'health_challenge' => l10n.listener_reg_exp_health_challenge,
      'addiction_recovery' => l10n.listener_reg_exp_addiction_recovery,
      _ => id,
    };
  }

  String _experienceLabel(
    VentingMobLocalizations l10n,
    VentorFindListener listener,
  ) {
    if (listener.lifeExperiences.isEmpty) {
      return l10n.ventor_sessions_experience_empty;
    }
    return listener.lifeExperiences
        .map((id) => _lifeExperienceLabel(l10n, id))
        .join(' · ');
  }

  String _countryFlag(String isoCode) {
    try {
      return countryFlagEmoji(IsoCode.values.byName(isoCode.toUpperCase()));
    } catch (_) {
      return '🏳️';
    }
  }

  List<VentorBookedSession> get _sortedBooked {
    final list = List.of(_bookedSessions);
    int rank(VentorBookedSessionStatus status) => switch (status) {
      VentorBookedSessionStatus.live => 0,
      VentorBookedSessionStatus.upcoming => 1,
      VentorBookedSessionStatus.completed => 2,
      VentorBookedSessionStatus.cancelled => 3,
    };
    list.sort((a, b) {
      final byStatus = rank(a.status).compareTo(rank(b.status));
      if (byStatus != 0) return byStatus;
      final aTime = a.scheduledAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bTime = b.scheduledAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      if (a.status == VentorBookedSessionStatus.upcoming ||
          a.status == VentorBookedSessionStatus.live) {
        return aTime.compareTo(bTime);
      }
      return bTime.compareTo(aTime);
    });
    return list;
  }

  Future<void> _openFilters(VentorSessionFilters current) async {
    final next = await showVentorSessionsFilterSheet(
      context: context,
      initial: current,
    );
    if (!mounted || next == null) return;
    _findBloc.add(VentorFindListenersEvent.filtersChanged(next));
  }

  void _onSurpriseMe(List<VentorFindListener> listeners) {
    if (listeners.isEmpty) return;
    final pick = listeners[_rng.nextInt(listeners.length)];
    openVentorListenerProfileScreen(
      context: context,
      listener: pick,
      onFavoriteChanged: _onFavoriteChangedFromProfile,
    );
  }

  String _bookedStatusLabel(
    VentingMobLocalizations l10n,
    VentorBookedSessionStatus status,
  ) {
    return switch (status) {
      VentorBookedSessionStatus.upcoming =>
        l10n.ventor_sessions_booked_status_upcoming,
      VentorBookedSessionStatus.live => l10n.ventor_sessions_booked_status_live,
      VentorBookedSessionStatus.completed =>
        l10n.ventor_sessions_booked_status_completed,
      VentorBookedSessionStatus.cancelled =>
        l10n.ventor_sessions_booked_status_cancelled,
    };
  }

  Color _bookedStatusColor(VentorBookedSessionStatus status) {
    return switch (status) {
      VentorBookedSessionStatus.upcoming => SplashColors.purpleMid,
      VentorBookedSessionStatus.live => VentorProfileTheme.success,
      VentorBookedSessionStatus.completed => VentorProfileTheme.muted,
      VentorBookedSessionStatus.cancelled => const Color(0xFFE57373),
    };
  }

  String _bookedWhenLabel(
    VentingMobLocalizations l10n,
    VentorBookedSession session,
  ) {
    if (session.isInstant && session.status == VentorBookedSessionStatus.live) {
      return l10n.ventor_sessions_booked_instant_now;
    }
    final at = session.scheduledAt;
    if (at == null) return l10n.ventor_sessions_time_summary_instant;
    final locale = Localizations.localeOf(context).toString();
    return '${DateFormat.MMMEd(locale).format(at)} · '
        '${DateFormat.jm(locale).format(at)}';
  }

  String _bookedMetaLabel(
    VentingMobLocalizations l10n,
    VentorBookedSession session,
  ) {
    final mode = session.callMode == VentorBookedCallMode.video
        ? l10n.ventor_sessions_call_video
        : l10n.ventor_sessions_call_voice;
    final duration = l10n.ventor_sessions_duration_minutes(
      session.durationMinutes,
    );
    final language = l10n.ventor_sessions_booked_speech_language(
      session.speechLanguage,
    );
    final voice = session.voiceChangeEnabled
        ? l10n.ventor_sessions_booked_voice_change_on
        : null;
    return [duration, mode, language, if (voice != null) voice].join(' · ');
  }

  Future<void> _onBookedTap(VentorBookedSession session) async {
    final l10n = VentingMobLocalizations.of(context);
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
      return;
    }

    if (session.status == VentorBookedSessionStatus.live) {
      await _onJoinLive(session);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          l10n.ventor_sessions_booked_tap_mock(session.listenerName),
        ),
      ),
    );
  }

  Future<void> _onJoinLive(VentorBookedSession session) async {
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
  }

  void _onFavoriteChangedFromProfile(VentorFindListener updated) {
    VentorFindListener? current;
    for (final listener in _findBloc.state.listeners) {
      if (listener.id == updated.id) {
        current = listener;
        break;
      }
    }
    if (current == null || current.isFavorite == updated.isFavorite) {
      _findBloc.add(
        VentorFindListenersEvent.listenerFavoriteUpdated(updated),
      );
      return;
    }
    _findBloc.add(
      VentorFindListenersEvent.favoriteToggled(listenerId: updated.id),
    );
  }

  List<Widget> _findChildren(
    VentingMobLocalizations l10n,
    VentorFindListenersState findState,
  ) {
    final topicLabels = [
      for (final id in VentorSessionsCatalog.topicIds) _topicLabel(l10n, id),
    ];
    final listeners = findState.listeners;

    return [
      Text(
        l10n.ventor_sessions_subtitle,
        style: GoogleFonts.inter(
          color: VentorProfileTheme.muted,
          fontSize: 14,
          height: 1.35,
        ),
      ),
      const SizedBox(height: 16),
      VentorSessionsSearchBar(
        controller: _searchController,
        hint: l10n.ventor_sessions_search_hint,
        onChanged: (value) => _findBloc.add(
          VentorFindListenersEvent.queryChanged(value),
        ),
        onFilterTap: () => _openFilters(findState.filters),
        filterActive: !findState.filters.isDefault,
      ),
      const SizedBox(height: 14),
      VentorTopicChips(
        labels: topicLabels,
        selectedIndex: findState.topicIndex,
        onSelected: (index) => _findBloc.add(
          VentorFindListenersEvent.topicChanged(index),
        ),
      ),
      const SizedBox(height: 20),
      Text(
        l10n.ventor_sessions_top_listeners,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 8),
      if (findState.isLoadingOrInitial)
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: _FindListenersShimmer(),
        )
      else if (findState.isLoadFailure)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28),
          child: Column(
            children: [
              Text(
                findState.errorMessage.isNotEmpty
                    ? findState.errorMessage
                    : l10n.common_unknown_error,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: VentorProfileTheme.muted,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => _findBloc.add(
                  const VentorFindListenersEvent.retryLoad(),
                ),
                child: Text(
                  l10n.common_retry,
                  style: GoogleFonts.inter(
                    color: SplashColors.purpleMid,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        )
      else if (listeners.isEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28),
          child: Column(
            children: [
              const Icon(
                Icons.search_off_rounded,
                color: VentorProfileTheme.muted,
                size: 40,
              ),
              const SizedBox(height: 10),
              Text(
                l10n.ventor_sessions_empty,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: VentorProfileTheme.muted,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ],
          ),
        )
      else
        for (final listener in listeners) ...[
          VentorListenerCard(
            name: listener.name,
            avatarUrl: listener.avatarUrl,
            ratingLabel: listener.rating.toStringAsFixed(1),
            experienceLabel: _experienceLabel(l10n, listener),
            country: listener.country,
            countryFlag: _countryFlag(listener.countryIsoCode),
            languagesLabel: listener.languages.join(' · '),
            topicsLabel: listener.topics.join(' · '),
            isOnline: listener.isOnline,
            isVerified: listener.isVerified,
            isFavorite: listener.isFavorite,
            onTap: () {
              openVentorListenerProfileScreen(
                context: context,
                listener: listener,
                onFavoriteChanged: _onFavoriteChangedFromProfile,
              );
            },
            onFavorite: () {
              _findBloc.add(
                VentorFindListenersEvent.favoriteToggled(
                  listenerId: listener.id,
                ),
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      const SizedBox(height: 8),
      VentorSurpriseMeCard(
        title: l10n.ventor_sessions_surprise_title,
        buttonLabel: l10n.ventor_sessions_surprise_cta,
        onTap: () => _onSurpriseMe(listeners),
      ),
    ];
  }

  List<Widget> _bookedChildren(VentingMobLocalizations l10n) {
    final booked = _sortedBooked;
    return [
      Text(
        l10n.ventor_sessions_booked_subtitle,
        style: GoogleFonts.inter(
          color: VentorProfileTheme.muted,
          fontSize: 14,
          height: 1.35,
        ),
      ),
      const SizedBox(height: 16),
      if (booked.isEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child: Column(
            children: [
              const Icon(
                Icons.event_busy_rounded,
                color: VentorProfileTheme.muted,
                size: 40,
              ),
              const SizedBox(height: 10),
              Text(
                l10n.ventor_sessions_booked_empty,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: VentorProfileTheme.muted,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () =>
                    setState(() => _section = _SessionsSection.find),
                child: Text(
                  l10n.ventor_sessions_booked_empty_cta,
                  style: GoogleFonts.inter(
                    color: SplashColors.purpleMid,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        )
      else
        for (final session in booked) ...[
          VentorBookedSessionCard(
            listenerName: session.listenerName,
            avatarUrl: session.listenerAvatarUrl,
            statusLabel: _bookedStatusLabel(l10n, session.status),
            statusColor: _bookedStatusColor(session.status),
            whenLabel: _bookedWhenLabel(l10n, session),
            metaLabel: _bookedMetaLabel(l10n, session),
            amountLabel: session.status == VentorBookedSessionStatus.cancelled
                ? l10n.ventor_sessions_booked_was_paid(
                    '\$${session.amountPaid.toStringAsFixed(2)}',
                  )
                : l10n.ventor_sessions_booked_paid(
                    '\$${session.amountPaid.toStringAsFixed(2)}',
                  ),
            onTap: () => _onBookedTap(session),
            actionLabel: session.status == VentorBookedSessionStatus.live
                ? l10n.ventor_sessions_booked_join
                : session.status == VentorBookedSessionStatus.upcoming
                ? l10n.ventor_sessions_booked_details
                : null,
            onAction:
                session.status == VentorBookedSessionStatus.live ||
                    session.status == VentorBookedSessionStatus.upcoming
                ? () => _onBookedTap(session)
                : null,
            isCancelled: session.status == VentorBookedSessionStatus.cancelled,
            refundTitle: session.status == VentorBookedSessionStatus.cancelled
                ? l10n.ventor_sessions_cancelled_refund_title(
                    '\$${(session.refundedToBalance ?? session.amountPaid).toStringAsFixed(2)}',
                  )
                : null,
            refundSubtitle:
                session.status == VentorBookedSessionStatus.cancelled
                ? l10n.ventor_sessions_cancelled_refund_subtitle
                : null,
            rebookLabel: session.status == VentorBookedSessionStatus.cancelled
                ? l10n.ventor_sessions_cancelled_rebook
                : null,
            onRebook: session.status == VentorBookedSessionStatus.cancelled
                ? () => setState(() => _section = _SessionsSection.find)
                : null,
          ),
          const SizedBox(height: 12),
        ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return BlocProvider.value(
      value: _findBloc,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _overlayStyle,
        child: SafeArea(
          child: BlocConsumer<VentorFindListenersBloc, VentorFindListenersState>(
            listenWhen: (previous, current) =>
                previous.favoriteErrorMessage != current.favoriteErrorMessage &&
                current.favoriteErrorMessage.isNotEmpty,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.favoriteErrorMessage),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            builder: (context, findState) {
              final children = _section == _SessionsSection.find
                  ? _findChildren(l10n, findState)
                  : _bookedChildren(l10n);

              return RefreshIndicator(
                onRefresh: _section == _SessionsSection.find
                    ? () async {
                        _findBloc.add(
                          const VentorFindListenersEvent.refreshRequested(),
                        );
                        await _findBloc.stream.firstWhere(
                          (s) => !s.isRefreshing,
                        );
                      }
                    : () async {},
                color: SplashColors.purpleMid,
                backgroundColor: const Color(0xFF1C1826),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
                  children: [
                    Text(
                      l10n.ventor_sessions_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 14),
                    VentorSessionsSectionTabs(
                      findSelected: _section == _SessionsSection.find,
                      findLabel: l10n.ventor_sessions_tab_find,
                      bookedLabel: l10n.ventor_sessions_tab_booked,
                      onFind: () =>
                          setState(() => _section = _SessionsSection.find),
                      onBooked: () =>
                          setState(() => _section = _SessionsSection.booked),
                    ),
                    const SizedBox(height: 16),
                    ...children,
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

class _FindListenersShimmer extends StatelessWidget {
  const _FindListenersShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withValues(alpha: 0.08),
      highlightColor: Colors.white.withValues(alpha: 0.16),
      child: Column(
        children: List.generate(
          3,
          (_) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: VentorProfileTheme.cardFill,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
