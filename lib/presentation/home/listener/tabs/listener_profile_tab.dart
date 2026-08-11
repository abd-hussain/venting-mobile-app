import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/edit_about_me_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/edit_boundaries_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/edit_city_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/edit_comfort_areas_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/edit_experiences_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/edit_voice_intro_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_profile_reviews_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_profile_settings_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_profile_widgets.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/country_display_names.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/language_options.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/phone_country_picker.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/spoken_languages_picker.dart';
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
  static const _mockReviewDistribution = [280, 42, 12, 5, 3];

  // TODO: Load reviews from listener profile API / repository.
  static final _mockReviews = <ListenerProfileReview>[
    ListenerProfileReview(
      id: '1',
      reviewerName: 'Sara M.',
      rating: 5,
      comment:
          'Nour made me feel heard without judgment. I left the session lighter and more hopeful.',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    ListenerProfileReview(
      id: '2',
      reviewerName: 'Omar K.',
      rating: 5,
      comment:
          'Really patient listener. Helped me untangle a lot of overthinking around work stress.',
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
    ),
    ListenerProfileReview(
      id: '3',
      reviewerName: 'Lina A.',
      rating: 4,
      comment:
          'Warm and thoughtful. Would have loved a bit more time, but still very helpful.',
      createdAt: DateTime.now().subtract(const Duration(days: 12)),
    ),
    ListenerProfileReview(
      id: '4',
      reviewerName: 'Hassan R.',
      rating: 5,
      comment:
          'Felt safe talking about family pressure. Clear boundaries and genuine empathy.',
      createdAt: DateTime.now().subtract(const Duration(days: 28)),
    ),
    ListenerProfileReview(
      id: '5',
      reviewerName: 'Maya S.',
      rating: 5,
      comment:
          'One of the best listening experiences I have had. Highly recommend.',
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    ListenerProfileReview(
      id: '6',
      reviewerName: 'Yousef T.',
      rating: 4,
      comment: 'Supportive and calm. Helped me process a tough breakup.',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
    ),
  ];

  // TODO: Load location / languages from listener profile API / repository.
  IsoCode _country = IsoCode.JO;
  var _city = 'Amman';
  Set<String> _languageIds = {'en', 'ar'};

  var _aboutExpanded = false;
  var _isPlayingVoice = false;
  String? _aboutMeText;
  String? _voiceFilePath;
  var _voiceDurationLabel = '01:02';
  var _voiceDurationSeconds = 62;
  // TODO: Load experiences from listener profile API / repository.
  EditExperiencesResult _experiences = const EditExperiencesResult(
    relationshipId: 'married',
    familyIds: {'parent'},
    experienceIds: {'anxiety_stress', 'life_stages', 'grief_loss'},
    customExperiences: [],
  );
  // TODO: Load comfort areas from listener profile API / repository.
  EditComfortAreasResult _comfortAreas = const EditComfortAreasResult(
    selectedIds: {'stress_anxiety', 'relationships', 'parenting'},
  );
  // TODO: Load boundaries from listener profile API / repository.
  EditBoundariesResult _boundaries = const EditBoundariesResult(
    selectedIds: {'politics', 'religion'},
  );

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

  Future<void> _onEditExperiences() async {
    final updated = await showEditExperiencesBottomSheet(
      context: context,
      initial: _experiences,
    );
    if (!mounted || updated == null) return;
    setState(() => _experiences = updated);
  }

  Future<void> _onEditComfortAreas() async {
    final updated = await showEditComfortAreasBottomSheet(
      context: context,
      initial: _comfortAreas,
    );
    if (!mounted || updated == null) return;
    setState(() => _comfortAreas = updated);
  }

  Future<void> _onEditBoundaries() async {
    final updated = await showEditBoundariesBottomSheet(
      context: context,
      initial: _boundaries,
    );
    if (!mounted || updated == null) return;
    setState(() => _boundaries = updated);
  }

  Future<void> _onEditCountry() async {
    final selected = await showPhoneCountryPicker(
      context: context,
      selected: _country,
    );
    if (!mounted || selected == null || selected == _country) return;
    // TODO: Persist country via listener profile API / repository.
    setState(() => _country = selected);
  }

  Future<void> _onEditCity() async {
    final updated = await showEditCityBottomSheet(
      context: context,
      initialCity: _city,
    );
    if (!mounted || updated == null) return;
    setState(() => _city = updated);
  }

  Future<void> _onEditLanguages() async {
    final selected = await showSpokenLanguagesPicker(
      context: context,
      selectedIds: _languageIds,
    );
    if (!mounted || selected == null) return;
    if (selected.isEmpty) return;
    // TODO: Persist languages via listener profile API / repository.
    setState(() => _languageIds = {...selected});
  }

  Future<void> _onViewAllReviews() {
    return showListenerProfileReviewsBottomSheet(
      context: context,
      rating: _mockRating,
      reviewCount: _mockReviewCount,
      reviews: _mockReviews,
    );
  }

  Future<void> _onOpenSettings() {
    return openListenerProfileSettingsScreen(
      context: context,
      email: _mockEmail,
      // TODO: Pass real phone from listener profile API / repository.
      phoneNumber: '+1 (555) 123-4567',
    );
  }

  String _countryLabel(BuildContext context) {
    return countryDisplayName(
      _country,
      languageCode: Localizations.localeOf(context).languageCode,
    );
  }

  String _languagesLabel(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final labels = _languageIds
        .map(spokenLanguageById)
        .whereType<SpokenLanguage>()
        .map((lang) => lang.label(languageCode))
        .toList();
    if (labels.isEmpty) return '—';
    return labels.join(', ');
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
              _ProfileTopBar(
                title: l10n.listener_profile_title,
                onSettingsTap: _onOpenSettings,
              ),
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
                        title: l10n.listener_profile_experiences,
                        editLabel: editLabel,
                        emptyLabel: l10n.listener_profile_experiences_empty,
                        tags: ListenerExperienceOptions.displayLabels(
                          l10n: l10n,
                          selection: _experiences,
                        ),
                        onEdit: _onEditExperiences,
                      ),
                      const SizedBox(height: 12),
                      ProfileGoodAtSection(
                        title: l10n.listener_profile_comfort_areas,
                        editLabel: editLabel,
                        emptyLabel: l10n.listener_profile_comfort_areas_empty,
                        tags: ListenerComfortAreaOptions.displayLabels(
                          l10n: l10n,
                          selection: _comfortAreas,
                        ),
                        onEdit: _onEditComfortAreas,
                      ),
                      const SizedBox(height: 12),
                      ProfileGoodAtSection(
                        title: l10n.listener_profile_boundaries,
                        editLabel: editLabel,
                        emptyLabel: l10n.listener_profile_boundaries_empty,
                        tags: ListenerBoundaryOptions.displayLabels(
                          l10n: l10n,
                          selection: _boundaries,
                        ),
                        onEdit: _onEditBoundaries,
                      ),
                      const SizedBox(height: 12),
                      ProfileSectionCard(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            ProfileDetailRow(
                              icon: Icons.public_rounded,
                              label: l10n.listener_profile_country,
                              value: _countryLabel(context),
                              editLabel: editLabel,
                              onEdit: _onEditCountry,
                            ),
                            ProfileDetailRow(
                              icon: Icons.location_city_rounded,
                              label: l10n.listener_profile_city,
                              value: _city,
                              editLabel: editLabel,
                              onEdit: _onEditCity,
                            ),
                            ProfileDetailRow(
                              icon: Icons.language_rounded,
                              label: l10n.listener_profile_languages,
                              value: _languagesLabel(context),
                              editLabel: editLabel,
                              onEdit: _onEditLanguages,
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
                        onViewAll: _onViewAllReviews,
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
  const _ProfileTopBar({required this.title, required this.onSettingsTap});

  final String title;
  final VoidCallback onSettingsTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: SizedBox(
        height: 44,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: IconButton(
                onPressed: onSettingsTap,
                tooltip: VentingMobLocalizations.of(
                  context,
                ).listener_profile_account_settings,
                icon: Icon(
                  Icons.settings_outlined,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
