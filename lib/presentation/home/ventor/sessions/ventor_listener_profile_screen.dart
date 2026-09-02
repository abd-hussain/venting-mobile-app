import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/bloc/ventor_listener_profile/ventor_listener_profile_bloc.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_before_connecting_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_session_duration_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_session_time_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<void> openVentorListenerProfileScreen({
  required BuildContext context,
  required VentorFindListener listener,
  required ValueChanged<VentorFindListener> onFavoriteChanged,
}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) =>
            diContainer<VentorListenerProfileBloc>(param1: listener)
              ..add(const VentorListenerProfileEvent.started()),
        child: VentorListenerProfileScreen(
          onFavoriteChanged: onFavoriteChanged,
        ),
      ),
    ),
  );
}

class VentorListenerProfileScreen extends StatefulWidget {
  const VentorListenerProfileScreen({
    super.key,
    required this.onFavoriteChanged,
  });

  final ValueChanged<VentorFindListener> onFavoriteChanged;

  @override
  State<VentorListenerProfileScreen> createState() =>
      _VentorListenerProfileScreenState();
}

class _VentorListenerProfileScreenState
    extends State<VentorListenerProfileScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  final _voicePlayer = AudioPlayer();
  StreamSubscription<void>? _voiceCompleteSub;
  var _playing = false;

  @override
  void initState() {
    super.initState();
    unawaited(_voicePlayer.setReleaseMode(ReleaseMode.stop));
    _voiceCompleteSub = _voicePlayer.onPlayerComplete.listen((_) {
      if (!mounted) return;
      setState(() => _playing = false);
    });
  }

  @override
  void dispose() {
    unawaited(_voiceCompleteSub?.cancel());
    unawaited(_voicePlayer.dispose());
    super.dispose();
  }

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  String _formatCount(int value) {
    final digits = value.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      final fromEnd = digits.length - i;
      buffer.write(digits[i]);
      if (fromEnd > 1 && fromEnd % 3 == 1) buffer.write(',');
    }
    return buffer.toString();
  }

  String _voiceLabel(int seconds) {
    final m = seconds ~/ 60;
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  String _availabilityHoursLabel(VentorFindListener listener) {
    final from = listener.availability.fromHour.trim();
    final to = listener.availability.toHour.trim();
    if (from.isEmpty && to.isEmpty) return '—';
    if (from.isEmpty) return to;
    if (to.isEmpty) return from;
    return '$from – $to';
  }

  String _timezoneLabel(VentorFindListener listener) {
    final zone = listener.availability.timeZoneId.trim();
    if (zone.isEmpty) return '—';
    return zone.replaceAll('_', ' ');
  }

  String _voicePlaybackUrl(String url, int voicePreviewSeconds) {
    if (voicePreviewSeconds <= 0) return url;
    final separator = url.contains('?') ? '&' : '?';
    return '$url${separator}t=$voicePreviewSeconds';
  }

  Future<void> _onPlayVoiceToggle(VentorFindListener listener) async {
    final url = listener.voiceIntroUrl.trim();
    if (url.isEmpty) return;

    try {
      if (_playing) {
        await _voicePlayer.stop();
        if (!mounted) return;
        setState(() => _playing = false);
        return;
      }

      await _voicePlayer.stop();
      await _voicePlayer.play(
        UrlSource(_voicePlaybackUrl(url, listener.voicePreviewSeconds)),
      );
      if (!mounted) return;
      setState(() => _playing = true);
    } catch (_) {
      if (!mounted) return;
      setState(() => _playing = false);
    }
  }

  String _genderLabel(VentingMobLocalizations l10n, VentorListenerGender g) {
    return switch (g) {
      VentorListenerGender.female => l10n.ventor_sessions_gender_female,
      VentorListenerGender.male => l10n.ventor_sessions_gender_male,
      VentorListenerGender.preferNotToSay =>
        l10n.ventor_sessions_gender_prefer_not,
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

  String _boundaryLabel(VentingMobLocalizations l10n, String id) {
    return switch (id) {
      'suicide_self_harm' => l10n.listener_reg_boundary_suicide,
      'domestic_violence' => l10n.listener_reg_boundary_domestic_violence,
      'sexual_topics' => l10n.listener_reg_boundary_sexual,
      'addiction' => l10n.listener_reg_boundary_addiction,
      'politics' => l10n.listener_reg_boundary_politics,
      'religion' => l10n.listener_reg_boundary_religion,
      'illegal_activities' => l10n.listener_reg_boundary_illegal,
      'other' => l10n.listener_reg_boundary_other,
      _ => id,
    };
  }

  String _dayLabel(VentingMobLocalizations l10n, String id) {
    return switch (id) {
      'mon' => l10n.ventor_sessions_day_mon,
      'tue' => l10n.ventor_sessions_day_tue,
      'wed' => l10n.ventor_sessions_day_wed,
      'thu' => l10n.ventor_sessions_day_thu,
      'fri' => l10n.ventor_sessions_day_fri,
      'sat' => l10n.ventor_sessions_day_sat,
      'sun' => l10n.ventor_sessions_day_sun,
      _ => id,
    };
  }

  Future<void> _onContinue(VentorFindListener listener) async {
    final minutes = await showVentorSessionDurationSheet(
      context: context,
      listener: listener,
    );
    if (!mounted || minutes == null) return;
    final timeChoice = await showVentorSessionTimeSheet(
      context: context,
      listener: listener,
      durationMinutes: minutes,
    );
    if (!mounted || timeChoice == null) return;
    await openVentorBeforeConnectingScreen(
      context: context,
      listener: listener,
      durationMinutes: minutes,
      timeChoice: timeChoice,
    );
  }

  void _openAvatarZoom(BuildContext context, VentorFindListener listener) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        opaque: false,
        barrierColor: Colors.black.withValues(alpha: 0.92),
        barrierDismissible: true,
        pageBuilder: (context, animation, secondaryAnimation) {
          return _ListenerAvatarZoomPage(
            avatarUrl: listener.avatarUrl,
            heroTag: 'ventor_listener_avatar_${listener.id}',
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundBottom,
        body: SafeArea(
          child: BlocConsumer<VentorListenerProfileBloc, VentorListenerProfileState>(
            listenWhen: (previous, current) =>
                previous.favoriteSyncToken != current.favoriteSyncToken ||
                (previous.status != current.status &&
                    current.status == VentorListenerProfileStatus.ready) ||
                (previous.favoriteErrorMessage !=
                        current.favoriteErrorMessage &&
                    current.favoriteErrorMessage.isNotEmpty),
            listener: (context, state) {
              if (state.favoriteErrorMessage.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.favoriteErrorMessage),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                return;
              }
              widget.onFavoriteChanged(state.listener);
            },
            builder: (context, state) {
              if (state.isLoading ||
                  state.status == VentorListenerProfileStatus.initial) {
                return _ProfileLoadingView(
                  onBack: () => Navigator.of(context).pop(),
                );
              }

              if (state.isLoadFailure) {
                return _ProfileErrorView(
                  message: state.errorMessage.isNotEmpty
                      ? state.errorMessage
                      : l10n.common_unknown_error,
                  onBack: () => Navigator.of(context).pop(),
                  onRetry: () => context.read<VentorListenerProfileBloc>().add(
                    const VentorListenerProfileEvent.retryLoad(),
                  ),
                );
              }

              final listener = state.listener;
              final totalReviews = listener.ratingBreakdown.values.fold<int>(
                0,
                (a, b) => a + b,
              );

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: state.isUpdatingFavorite
                              ? null
                              : () => context.read<VentorListenerProfileBloc>().add(
                                  const VentorListenerProfileEvent.favoriteToggled(),
                                ),
                          icon: Icon(
                            listener.isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: listener.isFavorite
                                ? SplashColors.purpleMid
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () => _openAvatarZoom(context, listener),
                            child: Hero(
                              tag: 'ventor_listener_avatar_${listener.id}',
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 72,
                                    backgroundImage:
                                        listener.avatarUrl.trim().isEmpty
                                        ? null
                                        : NetworkImage(listener.avatarUrl),
                                    backgroundColor: SplashColors.purpleMid
                                        .withValues(alpha: 0.25),
                                    child: listener.avatarUrl.trim().isEmpty
                                        ? const Icon(
                                            Icons.person_rounded,
                                            color: Colors.white,
                                            size: 64,
                                          )
                                        : null,
                                  ),
                                  if (listener.isOnline)
                                    Positioned(
                                      right: 8,
                                      bottom: 8,
                                      child: Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          color: VentorProfileTheme.success,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color:
                                                SplashColors.backgroundBottom,
                                            width: 3,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                listener.name,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  height: 1.15,
                                ),
                              ),
                            ),
                            if (listener.isVerified) ...[
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.verified_rounded,
                                color: SplashColors.purpleMid,
                                size: 22,
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              listener.rating.toStringAsFixed(1),
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.star_rounded,
                              color: VentorProfileTheme.gold,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(${_formatCount(listener.reviewCount)})',
                              style: GoogleFonts.inter(
                                color: VentorProfileTheme.muted,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                '·',
                                style: GoogleFonts.inter(
                                  color: VentorProfileTheme.muted,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                l10n.ventor_sessions_sessions_count(
                                  _formatCount(listener.sessionCount),
                                ),
                                style: GoogleFonts.inter(
                                  color: VentorProfileTheme.muted,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        if (listener.topics.isNotEmpty) ...[
                          const SizedBox(height: 14),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (final topic in listener.topics)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 7,
                                  ),
                                  decoration: BoxDecoration(
                                    color: VentorProfileTheme.cardFill,
                                    borderRadius: BorderRadius.circular(999),
                                    border: Border.all(
                                      color: VentorProfileTheme.cardBorder,
                                    ),
                                  ),
                                  child: Text(
                                    topic,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                        const SizedBox(height: 24),
                        _SectionTitle(l10n.ventor_sessions_about_me),
                        const SizedBox(height: 8),
                        Text(
                          listener.bio,
                          style: GoogleFonts.inter(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: 14,
                            height: 1.45,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _SectionTitle(l10n.ventor_sessions_help_with),
                        const SizedBox(height: 10),
                        for (final item in listener.helpWith) ...[
                          Row(
                            children: [
                              const Icon(
                                Icons.check_circle_rounded,
                                color: SplashColors.purpleMid,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  item,
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                        const SizedBox(height: 10),
                        _SectionTitle(l10n.ventor_sessions_languages),
                        const SizedBox(height: 8),
                        Text(
                          listener.languages.join(' · '),
                          style: GoogleFonts.inter(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _SectionTitle(l10n.ventor_sessions_details_title),
                        const SizedBox(height: 10),
                        _InfoRow(
                          icon: Icons.person_outline_rounded,
                          label: l10n.ventor_sessions_gender_label,
                          value: _genderLabel(l10n, listener.gender),
                        ),
                        _InfoRow(
                          icon: Icons.public_rounded,
                          label: l10n.ventor_sessions_country_label,
                          value: listener.country,
                        ),
                        _InfoRow(
                          icon: Icons.location_city_outlined,
                          label: l10n.ventor_sessions_city_label,
                          value: listener.city,
                        ),
                        const SizedBox(height: 12),
                        _SectionTitle(
                          l10n.ventor_sessions_life_experience_title,
                        ),
                        const SizedBox(height: 10),
                        if (listener.lifeExperiences.isEmpty)
                          Text(
                            l10n.ventor_sessions_experience_empty,
                            style: GoogleFonts.inter(
                              color: VentorProfileTheme.muted,
                              fontSize: 13,
                            ),
                          )
                        else
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (final id in listener.lifeExperiences)
                                _ChipTag(label: _lifeExperienceLabel(l10n, id)),
                            ],
                          ),
                        const SizedBox(height: 20),
                        _SectionTitle(l10n.ventor_sessions_boundaries_title),
                        const SizedBox(height: 6),
                        Text(
                          l10n.ventor_sessions_boundaries_subtitle,
                          style: GoogleFonts.inter(
                            color: VentorProfileTheme.muted,
                            fontSize: 12,
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (listener.boundaries.isEmpty)
                          Text(
                            l10n.ventor_sessions_boundaries_none,
                            style: GoogleFonts.inter(
                              color: VentorProfileTheme.muted,
                              fontSize: 13,
                            ),
                          )
                        else
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (final id in listener.boundaries)
                                _ChipTag(
                                  label: _boundaryLabel(l10n, id),
                                  icon: Icons.block_flipped,
                                  muted: true,
                                ),
                            ],
                          ),
                        const SizedBox(height: 20),
                        _SectionTitle(l10n.ventor_sessions_availability_title),
                        const SizedBox(height: 10),
                        Text(
                          l10n.ventor_sessions_availability_days,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (listener.availability.days.isEmpty)
                          Text(
                            '—',
                            style: GoogleFonts.inter(
                              color: VentorProfileTheme.muted,
                              fontSize: 13,
                            ),
                          )
                        else
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (final day in listener.availability.days)
                                _ChipTag(label: _dayLabel(l10n, day)),
                            ],
                          ),
                        const SizedBox(height: 12),
                        _InfoRow(
                          icon: Icons.schedule_rounded,
                          label: l10n.ventor_sessions_availability_hours,
                          value: _availabilityHoursLabel(listener),
                        ),
                        _InfoRow(
                          icon: Icons.travel_explore_rounded,
                          label: l10n.ventor_sessions_availability_timezone,
                          value: _timezoneLabel(listener),
                        ),
                        _InfoRow(
                          icon: Icons.flash_on_rounded,
                          label: l10n.ventor_sessions_availability_instant,
                          value: listener.availability.acceptInstantCall
                              ? l10n.ventor_sessions_availability_instant_yes
                              : l10n.ventor_sessions_availability_instant_no,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.ventor_sessions_session_lengths,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (listener.availability.sessionMinutes.isEmpty)
                          Text(
                            '—',
                            style: GoogleFonts.inter(
                              color: VentorProfileTheme.muted,
                              fontSize: 13,
                            ),
                          )
                        else
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (final minutes
                                  in listener.availability.sessionMinutes)
                                _ChipTag(
                                  label: l10n.ventor_sessions_duration_minutes(
                                    minutes,
                                  ),
                                ),
                            ],
                          ),
                        const SizedBox(height: 20),
                        _SectionTitle(l10n.ventor_sessions_listen_voice),
                        const SizedBox(height: 10),
                        if (listener.voiceIntroUrl.trim().isEmpty)
                          Text(
                            '—',
                            style: GoogleFonts.inter(
                              color: VentorProfileTheme.muted,
                              fontSize: 13,
                            ),
                          )
                        else
                          _VoiceStrip(
                            durationLabel: _voiceLabel(
                              listener.voicePreviewSeconds,
                            ),
                            isPlaying: _playing,
                            onTap: () =>
                                unawaited(_onPlayVoiceToggle(listener)),
                          ),
                        const SizedBox(height: 22),
                        _SectionTitle(l10n.ventor_sessions_reviews_title),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  listener.rating.toStringAsFixed(1),
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Icon(
                                  Icons.star_rounded,
                                  color: VentorProfileTheme.gold,
                                  size: 20,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  l10n.ventor_sessions_reviews(totalReviews),
                                  style: GoogleFonts.inter(
                                    color: VentorProfileTheme.muted,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                children: [
                                  for (var star = 5; star >= 1; star--)
                                    _RatingBarRow(
                                      star: star,
                                      ratio: totalReviews == 0
                                          ? 0
                                          : (listener.ratingBreakdown[star] ??
                                                    0) /
                                                totalReviews,
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                    decoration: BoxDecoration(
                      color: SplashColors.backgroundBottom,
                      border: Border(
                        top: BorderSide(
                          color: Colors.white.withValues(alpha: 0.08),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.ventor_sessions_rate_per_min(
                              _money(listener.ratePerMinute),
                            ),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                          child: FilledButton(
                            onPressed: () => _onContinue(listener),
                            style: FilledButton.styleFrom(
                              backgroundColor: SplashColors.purpleMid,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              textStyle: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            child: Text(l10n.ventor_sessions_choose_duration),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ProfileLoadingView extends StatelessWidget {
  const _ProfileLoadingView({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: onBack,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Colors.white.withValues(alpha: 0.08),
            highlightColor: Colors.white.withValues(alpha: 0.16),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                const SizedBox(height: 12),
                Center(
                  child: Container(
                    width: 144,
                    height: 144,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 160,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                for (var i = 0; i < 5; i++) ...[
                  Container(
                    height: 16,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    height: 72,
                    margin: const EdgeInsets.only(bottom: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileErrorView extends StatelessWidget {
  const _ProfileErrorView({
    required this.message,
    required this.onBack,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onBack;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: onBack,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: VentorProfileTheme.muted,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: onRetry,
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
            ),
          ),
        ),
      ],
    );
  }
}

class _ListenerAvatarZoomPage extends StatelessWidget {
  const _ListenerAvatarZoomPage({
    required this.avatarUrl,
    required this.heroTag,
  });

  final String avatarUrl;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                behavior: HitTestBehavior.opaque,
                child: const SizedBox.expand(),
              ),
            ),
            Center(
              child: Hero(
                tag: heroTag,
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 4,
                  child: ClipOval(
                    child: Image.network(
                      avatarUrl,
                      width: MediaQuery.sizeOf(context).width * 0.86,
                      height: MediaQuery.sizeOf(context).width * 0.86,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        width: MediaQuery.sizeOf(context).width * 0.86,
                        height: MediaQuery.sizeOf(context).width * 0.86,
                        color: SplashColors.purpleMid.withValues(alpha: 0.3),
                        child: const Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                          size: 72,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 8,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close_rounded, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: VentorProfileTheme.muted),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChipTag extends StatelessWidget {
  const _ChipTag({required this.label, this.icon, this.muted = false});

  final String label;
  final IconData? icon;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 14,
              color: muted ? VentorProfileTheme.muted : Colors.white,
            ),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: GoogleFonts.inter(
              color: muted ? VentorProfileTheme.muted : Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _VoiceStrip extends StatelessWidget {
  const _VoiceStrip({
    required this.durationLabel,
    required this.isPlaying,
    required this.onTap,
  });

  final String durationLabel;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 14, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: VentorProfileTheme.cardBorder),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: SplashColors.purpleMid,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [
                        SplashColors.purpleMid.withValues(alpha: 0.25),
                        SplashColors.purpleMid.withValues(alpha: 0.7),
                        SplashColors.purpleMid.withValues(alpha: 0.25),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                durationLabel,
                style: GoogleFonts.inter(
                  color: VentorProfileTheme.muted,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RatingBarRow extends StatelessWidget {
  const _RatingBarRow({required this.star, required this.ratio});

  final int star;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 14,
            child: Text(
              '$star',
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: ratio.clamp(0.0, 1.0),
                minHeight: 7,
                backgroundColor: Colors.white.withValues(alpha: 0.08),
                color: SplashColors.purpleMid,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
