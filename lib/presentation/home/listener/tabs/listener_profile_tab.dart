import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/edit_about_me_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/edit_voice_intro_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_profile_widgets.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerProfileTab extends StatefulWidget {
  const ListenerProfileTab({super.key});

  @override
  State<ListenerProfileTab> createState() => _ListenerProfileTabState();
}

class _ListenerProfileTabState extends State<ListenerProfileTab> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  // TODO: Replace mock profile data with API / listener profile repository.
  static const _mockName = 'Nour';
  static const _mockEmail = 'l@l.com';
  static const _mockDateOfBirth = 'Mar 15, 1995';
  static const _mockRating = 4.9;
  static const _mockReviewCount = 342;
  static const _mockExperienceYears = 4;
  static const _mockResponseMinutes = 2;
  static const _mockLanguages = 'English, Arabic';
  static const _mockUntilTime = '11:00 PM';
  static const _mockTomorrowRange = '10:00 AM – 10:00 PM';
  static const _mockReviewDistribution = [280, 42, 12, 5, 3];

  var _aboutExpanded = false;
  var _isPlayingVoice = false;
  String? _aboutMeText;
  String? _voiceFilePath;
  var _voiceDurationLabel = '01:02';
  var _voiceDurationSeconds = 62;

  final _voicePlayer = AudioPlayer();
  StreamSubscription<void>? _voiceCompleteSub;

  @override
  void initState() {
    super.initState();
    unawaited(_voicePlayer.setReleaseMode(ReleaseMode.stop));
    _voiceCompleteSub = _voicePlayer.onPlayerComplete.listen((_) {
      if (!mounted) return;
      setState(() => _isPlayingVoice = false);
    });
  }

  @override
  void dispose() {
    unawaited(_voiceCompleteSub?.cancel());
    unawaited(_voicePlayer.dispose());
    super.dispose();
  }

  void _todoAction(String feature) {
    // TODO: Wire navigation / API for $feature.
    debugPrint('TODO: $feature');
  }

  String _resolvedAboutMe(VentingMobLocalizations l10n) {
    return _aboutMeText ?? l10n.listener_profile_about_me_body;
  }

  Future<void> _onEditAboutMe() async {
    final l10n = VentingMobLocalizations.of(context);
    final updated = await showEditAboutMeBottomSheet(
      context: context,
      initialText: _resolvedAboutMe(l10n),
    );
    if (!mounted || updated == null) return;
    setState(() {
      _aboutMeText = updated;
      _aboutExpanded = false;
    });
  }

  Future<void> _onEditVoiceIntro() async {
    if (_isPlayingVoice) {
      await _voicePlayer.stop();
      if (!mounted) return;
      setState(() => _isPlayingVoice = false);
    }

    final result = await showEditVoiceIntroBottomSheet(
      context: context,
      initialFilePath: _voiceFilePath,
      initialDurationSeconds: _voiceDurationSeconds,
    );
    if (!mounted || result == null) return;

    setState(() {
      _voiceFilePath = result.filePath;
      _voiceDurationSeconds = result.durationSeconds;
      _voiceDurationLabel = result.durationLabel;
      _isPlayingVoice = false;
    });
  }

  Future<void> _onPlayVoiceToggle() async {
    final path = _voiceFilePath;
    if (path == null || !File(path).existsSync()) {
      // TODO: Play remote voice intro URL when profile API is available.
      setState(() => _isPlayingVoice = !_isPlayingVoice);
      return;
    }

    try {
      if (_isPlayingVoice) {
        await _voicePlayer.stop();
        if (!mounted) return;
        setState(() => _isPlayingVoice = false);
        return;
      }

      await _voicePlayer.stop();
      await _voicePlayer.play(DeviceFileSource(path));
      if (!mounted) return;
      setState(() => _isPlayingVoice = true);
    } catch (_) {
      if (!mounted) return;
      setState(() => _isPlayingVoice = false);
    }
  }

  List<({IconData icon, String label})> _goodAtTags(
    VentingMobLocalizations l10n,
  ) {
    return [
      (
        icon: Icons.psychology_alt_outlined,
        label: l10n.listener_profile_tag_stress_anxiety,
      ),
      (
        icon: Icons.favorite_border_rounded,
        label: l10n.listener_profile_tag_relationships,
      ),
      (icon: Icons.hub_outlined, label: l10n.listener_profile_tag_overthinking),
      (
        icon: Icons.spa_outlined,
        label: l10n.listener_profile_tag_life_transitions,
      ),
      (
        icon: Icons.family_restroom_outlined,
        label: l10n.listener_profile_tag_parenting,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final editLabel = l10n.listener_profile_edit;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: ListenerProfileTheme.backgroundGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ProfileTopBar(title: l10n.listener_profile_title),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ProfileHeaderCard(
                        name: _mockName,
                        rating: _mockRating,
                        reviewCount: _mockReviewCount,
                        statusLabel: l10n.listener_profile_active_now,
                        email: _mockEmail,
                        dateOfBirth: _mockDateOfBirth,
                        onEditPhoto: () => _todoAction('edit profile photo'),
                      ),
                      const SizedBox(height: 12),
                      ProfileAboutMeSection(
                        title: l10n.listener_profile_about_me,
                        editLabel: editLabel,
                        body: _resolvedAboutMe(l10n),
                        seeMoreLabel: l10n.listener_profile_see_more,
                        seeLessLabel: l10n.listener_profile_see_less,
                        expanded: _aboutExpanded,
                        onEdit: _onEditAboutMe,
                        onToggleExpanded: () {
                          setState(() => _aboutExpanded = !_aboutExpanded);
                        },
                      ),
                      const SizedBox(height: 12),
                      ProfileVoiceIntroSection(
                        title: l10n.listener_profile_voice_introduction,
                        editLabel: editLabel,
                        durationLabel: _voiceDurationLabel,
                        isPlaying: _isPlayingVoice,
                        onEdit: _onEditVoiceIntro,
                        onPlayToggle: _onPlayVoiceToggle,
                      ),
                      const SizedBox(height: 12),
                      ProfileGoodAtSection(
                        title: l10n.listener_profile_good_at,
                        editLabel: editLabel,
                        addMoreLabel: l10n.listener_profile_add_more,
                        tags: _goodAtTags(l10n),
                        onEdit: () => _todoAction('edit comfort areas'),
                        onAddMore: () => _todoAction('add comfort area'),
                      ),
                      const SizedBox(height: 12),
                      ProfileSectionCard(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            ProfileDetailRow(
                              icon: Icons.language_rounded,
                              label: l10n.listener_profile_languages,
                              value: _mockLanguages,
                              editLabel: editLabel,
                              onEdit: () => _todoAction('edit languages'),
                            ),
                            ProfileDetailRow(
                              icon: Icons.military_tech_outlined,
                              label: l10n.listener_profile_experience,
                              value: l10n.listener_profile_experience_value(
                                _mockExperienceYears,
                              ),
                              editLabel: editLabel,
                              onEdit: () => _todoAction('edit experience'),
                            ),
                            ProfileDetailRow(
                              icon: Icons.calendar_month_outlined,
                              label: l10n.listener_profile_availability_label,
                              value: l10n.listener_profile_usually_available,
                              editLabel: editLabel,
                              onEdit: () => _todoAction('edit availability'),
                            ),
                            ProfileDetailRow(
                              icon: Icons.schedule_rounded,
                              label: l10n.listener_profile_response_time,
                              value: l10n.listener_profile_response_within(
                                _mockResponseMinutes,
                              ),
                              editLabel: editLabel,
                              onEdit: () => _todoAction('edit response time'),
                              showDivider: false,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      ProfileReviewsSection(
                        title: l10n.listener_profile_reviews,
                        viewAllLabel: l10n.listener_profile_view_all_reviews(
                          _mockReviewCount,
                        ),
                        rating: _mockRating,
                        reviewCount: _mockReviewCount,
                        distribution: _mockReviewDistribution,
                        onViewAll: () => _todoAction('view all reviews'),
                      ),
                      const SizedBox(height: 12),
                      ProfileNextAvailabilitySection(
                        title: l10n.listener_profile_next_availability,
                        editLabel: editLabel,
                        availableNowLabel: l10n.listener_profile_available_now,
                        untilLabel: l10n.listener_profile_until_time(
                          _mockUntilTime,
                        ),
                        tomorrowLabel: l10n.listener_profile_tomorrow,
                        tomorrowTimeRange: _mockTomorrowRange,
                        onEdit: () => _todoAction('edit next availability'),
                      ),
                      const SizedBox(height: 12),
                      ProfileSettingsSection(
                        title: l10n.listener_profile_account_settings,
                        items: [
                          (
                            icon: Icons.notifications_none_rounded,
                            label:
                                l10n.listener_profile_notification_preferences,
                            onTap: () =>
                                _todoAction('notification preferences'),
                          ),
                          (
                            icon: Icons.visibility_outlined,
                            label: l10n.listener_profile_privacy_visibility,
                            onTap: () => _todoAction('privacy & visibility'),
                          ),
                          (
                            icon: Icons.account_balance_wallet_outlined,
                            label: l10n.listener_profile_payment_payouts,
                            onTap: () => _todoAction('payment & payouts'),
                          ),
                          (
                            icon: Icons.help_outline_rounded,
                            label: l10n.listener_profile_help_support,
                            onTap: () => _todoAction('help & support'),
                          ),
                        ],
                      ),
                    ],
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

class _ProfileTopBar extends StatelessWidget {
  const _ProfileTopBar({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
