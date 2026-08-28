import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/listener_profile.dart';
import 'package:venting_mobile_app/domain/data/app/listener_profile_patch.dart';
import 'package:venting_mobile_app/domain/data/app/listener_review.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_reviews_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/bloc/listener_profile/listener_profile_bloc.dart';
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
import 'package:venting_mobile_app/presentation/listener_registration/widgets/phone_country_picker.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/spoken_languages_picker.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/registration_media_storage.dart';

class ListenerProfileTab extends StatelessWidget {
  const ListenerProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          diContainer<ListenerProfileBloc>()
            ..add(const ListenerProfileEvent.started()),
      child: const _ListenerProfileTabView(),
    );
  }
}

class _ListenerProfileTabView extends StatefulWidget {
  const _ListenerProfileTabView();

  @override
  State<_ListenerProfileTabView> createState() =>
      _ListenerProfileTabViewState();
}

class _ListenerProfileTabViewState extends State<_ListenerProfileTabView> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  final _voicePlayer = AudioPlayer();
  StreamSubscription<void>? _voiceCompleteSub;
  final _imagePicker = ImagePicker();
  var _pickingAvatar = false;

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

  var _aboutExpanded = false;
  var _isPlayingVoice = false;

  void _dispatchProfileFieldsUpdate(
    ListenerProfileSavingTarget target,
    Map<String, dynamic> fields,
  ) {
    context.read<ListenerProfileBloc>().add(
      ListenerProfileEvent.profileFieldsUpdateRequested(
        target: target,
        fields: fields,
      ),
    );
  }

  EditExperiencesResult _experiencesFor(ListenerProfile profile) {
    return EditExperiencesResult(
      relationshipId: profile.experiences.relationshipId,
      familyIds: profile.experiences.familyIds,
      experienceIds: profile.experiences.experienceIds,
      customExperiences: profile.experiences.customExperiences,
    );
  }

  EditComfortAreasResult _comfortAreasFor(ListenerProfile profile) {
    return EditComfortAreasResult(
      selectedIds: profile.comfortAreaIds,
      otherText: profile.comfortAreaOtherText,
    );
  }

  EditBoundariesResult _boundariesFor(ListenerProfile profile) {
    return EditBoundariesResult(
      selectedIds: profile.boundaryIds,
      otherText: profile.boundaryOtherText,
    );
  }

  String _aboutMeFor(ListenerProfile profile) {
    return profile.aboutMe ?? '';
  }

  Future<void> _onEditPhoto() async {
    if (_pickingAvatar) return;

    setState(() => _pickingAvatar = true);
    try {
      final file = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (!mounted || file == null) return;

      final persisted = await RegistrationMediaStorage.persistImage(
        file.path,
        prefix: 'avatar',
      );
      if (!mounted) return;

      context.read<ListenerProfileBloc>().add(
        ListenerProfileEvent.avatarUpdateRequested(avatarFilePath: persisted),
      );
    } catch (_) {
      if (!mounted) return;
      final l10n = VentingMobLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.camera_init_failed_generic)));
    } finally {
      if (mounted) setState(() => _pickingAvatar = false);
    }
  }

  int _voiceDurationSecondsFor(
    ListenerProfile profile,
    ListenerProfileState state,
  ) {
    final pending = state.pendingVoiceDurationSeconds;
    if (state.pendingVoiceFilePath != null && pending != null && pending > 0) {
      return pending;
    }
    return profile.voiceIntroSeconds;
  }

  String _voiceDurationLabelFor(
    ListenerProfile profile,
    ListenerProfileState state,
  ) {
    final seconds = _voiceDurationSecondsFor(profile, state);
    final minutes = seconds ~/ 60;
    final remainder = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${remainder.toString().padLeft(2, '0')}';
  }

  String? _voiceIntroUrlFor(ListenerProfile profile) {
    return profile.voiceIntroUrl;
  }

  String _voicePlaybackUrl(String url, int voiceIntroSeconds) {
    if (voiceIntroSeconds <= 0) return url;
    final separator = url.contains('?') ? '&' : '?';
    return '$url${separator}t=$voiceIntroSeconds';
  }

  String? _voiceFilePathFor(ListenerProfileState state) {
    return state.pendingVoiceFilePath;
  }

  String _statusLabel(VentingMobLocalizations l10n, ListenerProfile profile) {
    return profile.isOnline
        ? l10n.listener_profile_active_now
        : l10n.listener_dashboard_offline;
  }

  Future<void> _onEditAboutMe(ListenerProfile profile) async {
    final updated = await showEditAboutMeBottomSheet(
      context: context,
      initialText: _aboutMeFor(profile),
    );
    if (!mounted || updated == null) return;
    if (updated.trim() == _aboutMeFor(profile).trim()) return;

    context.read<ListenerProfileBloc>().add(
      ListenerProfileEvent.aboutMeUpdateRequested(aboutMe: updated.trim()),
    );
  }

  Future<void> _onEditVoiceIntro(ListenerProfile profile) async {
    if (_isPlayingVoice) {
      await _voicePlayer.stop();
      if (!mounted) return;
      setState(() => _isPlayingVoice = false);
    }

    final result = await showEditVoiceIntroBottomSheet(
      context: context,
      initialFilePath: context
          .read<ListenerProfileBloc>()
          .state
          .pendingVoiceFilePath,
      initialDurationSeconds: _voiceDurationSecondsFor(
        profile,
        context.read<ListenerProfileBloc>().state,
      ),
    );
    if (!mounted || result == null) return;

    try {
      final persisted = await RegistrationMediaStorage.persistAudio(
        result.filePath,
        prefix: 'voice_intro',
      );
      if (!mounted) return;

      context.read<ListenerProfileBloc>().add(
        ListenerProfileEvent.voiceIntroUpdateRequested(
          voiceFilePath: persisted,
          durationSeconds: result.durationSeconds,
        ),
      );
    } catch (_) {
      if (!mounted) return;
      final l10n = VentingMobLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.listener_reg_voice_record_failed)),
      );
    }
  }

  Future<void> _onPlayVoiceToggle(
    ListenerProfile profile,
    ListenerProfileState state,
  ) async {
    final localPath = _voiceFilePathFor(state);
    if (localPath != null && File(localPath).existsSync()) {
      await _toggleLocalVoice(localPath);
      return;
    }

    final remoteUrl = _voiceIntroUrlFor(profile);
    if (remoteUrl == null || remoteUrl.trim().isEmpty) return;

    final playbackUrl = _voicePlaybackUrl(remoteUrl, profile.voiceIntroSeconds);

    try {
      if (_isPlayingVoice) {
        await _voicePlayer.stop();
        if (!mounted) return;
        setState(() => _isPlayingVoice = false);
        return;
      }

      await _voicePlayer.stop();
      await _voicePlayer.play(UrlSource(playbackUrl));
      if (!mounted) return;
      setState(() => _isPlayingVoice = true);
    } catch (_) {
      if (!mounted) return;
      setState(() => _isPlayingVoice = false);
    }
  }

  Future<void> _toggleLocalVoice(String path) async {
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

  Future<void> _onEditExperiences(ListenerProfile profile) async {
    final current = _experiencesFor(profile);
    final updated = await showEditExperiencesBottomSheet(
      context: context,
      initial: current,
    );
    if (!mounted || updated == null) return;
    if (lifeExperienceSelectionEquals(
      relationshipIdA: current.relationshipId,
      familyIdsA: current.familyIds,
      experienceIdsA: current.experienceIds,
      customExperiencesA: current.customExperiences,
      relationshipIdB: updated.relationshipId,
      familyIdsB: updated.familyIds,
      experienceIdsB: updated.experienceIds,
      customExperiencesB: updated.customExperiences,
    )) {
      return;
    }

    _dispatchProfileFieldsUpdate(
      ListenerProfileSavingTarget.experiences,
      patchBodyForExperiences(
        relationshipId: updated.relationshipId,
        familyIds: updated.familyIds,
        experienceIds: updated.experienceIds,
        customExperiences: updated.customExperiences,
      ),
    );
  }

  Future<void> _onEditComfortAreas(ListenerProfile profile) async {
    final current = _comfortAreasFor(profile);
    final updated = await showEditComfortAreasBottomSheet(
      context: context,
      initial: current,
    );
    if (!mounted || updated == null) return;
    if (comfortAreasEqual(
      selectedIdsA: current.selectedIds,
      otherTextA: current.otherText,
      selectedIdsB: updated.selectedIds,
      otherTextB: updated.otherText,
    )) {
      return;
    }

    _dispatchProfileFieldsUpdate(
      ListenerProfileSavingTarget.comfortAreas,
      patchBodyForComfortAreas(
        updated.selectedIds,
        otherText: updated.otherText,
      ),
    );
  }

  Future<void> _onEditBoundaries(ListenerProfile profile) async {
    final current = _boundariesFor(profile);
    final updated = await showEditBoundariesBottomSheet(
      context: context,
      initial: current,
    );
    if (!mounted || updated == null) return;
    if (boundariesEqual(
      selectedIdsA: current.selectedIds,
      otherTextA: current.otherText,
      selectedIdsB: updated.selectedIds,
      otherTextB: updated.otherText,
    )) {
      return;
    }

    _dispatchProfileFieldsUpdate(
      ListenerProfileSavingTarget.boundaries,
      patchBodyForBoundaries(updated.selectedIds, otherText: updated.otherText),
    );
  }

  Future<void> _onEditCountry(ListenerProfile profile) async {
    final selected = await showPhoneCountryPicker(
      context: context,
      selected: profile.countryCode,
      showDialCode: false,
    );
    if (!mounted || selected == null || selected == profile.countryCode) {
      return;
    }

    _dispatchProfileFieldsUpdate(
      ListenerProfileSavingTarget.country,
      patchBodyForCountryIso(selected.name),
    );
  }

  Future<void> _onEditCity(ListenerProfile profile) async {
    final updated = await showEditCityBottomSheet(
      context: context,
      initialCity: profile.city,
    );
    if (!mounted || updated == null) return;
    if (updated.trim() == profile.city.trim()) return;

    _dispatchProfileFieldsUpdate(
      ListenerProfileSavingTarget.city,
      patchBodyForCity(updated),
    );
  }

  Future<void> _onEditLanguages(ListenerProfile profile) async {
    final selected = await showSpokenLanguagesPicker(
      context: context,
      selectedIds: profile.languageIds.toSet(),
    );
    if (!mounted || selected == null || selected.isEmpty) return;

    final updatedIds = selected.map((language) => language.id).toList()..sort();
    final currentIds = List<String>.from(profile.languageIds)..sort();
    if (languageIdsEqual(updatedIds, currentIds)) return;

    _dispatchProfileFieldsUpdate(
      ListenerProfileSavingTarget.languages,
      patchBodyForLanguageIds(updatedIds),
    );
  }

  Future<void> _onViewAllReviews(ListenerProfile profile) async {
    final result = await diContainer<GetListenerReviewsUsecase>()().run();
    if (!mounted) return;

    await result.fold(
      (_) async {
        await showListenerProfileReviewsBottomSheet(
          context: context,
          rating: profile.rating,
          reviewCount: profile.reviewCount,
          reviews: const [],
        );
      },
      (summary) async {
        await showListenerProfileReviewsBottomSheet(
          context: context,
          rating: summary.rating > 0 ? summary.rating : profile.rating,
          reviewCount: summary.reviewCount > 0
              ? summary.reviewCount
              : profile.reviewCount,
          reviews: summary.reviews.map(_mapReview).toList(growable: false),
        );
      },
    );
  }

  ListenerProfileReview _mapReview(ListenerReview review) {
    return ListenerProfileReview(
      id: review.id,
      reviewerName: review.reviewerName,
      rating: review.rating,
      comment: review.comment,
      createdAt: review.createdAt,
    );
  }

  Future<void> _onOpenSettings(ListenerProfile profile) async {
    final updatedPhone = await openListenerProfileSettingsScreen(
      context: context,
      email: profile.email,
      phoneCountryIso: profile.phone.countryIso,
      phoneNationalNumber: profile.phone.nationalNumber,
    );
    if (!mounted) return;
    if (updatedPhone != null) {
      context.read<ListenerProfileBloc>().add(
        const ListenerProfileEvent.refreshRequested(),
      );
    }
  }

  String _countryLabel(BuildContext context, ListenerProfile profile) {
    final localized = countryDisplayName(
      profile.countryCode,
      languageCode: Localizations.localeOf(context).languageCode,
    );
    final countryName = profile.country?.trim();
    if (countryName != null && countryName.isNotEmpty) return countryName;
    return localized;
  }

  String _languagesLabel(BuildContext context, ListenerProfile profile) {
    if (profile.languageIds.isEmpty) return '—';
    final languageCode = Localizations.localeOf(context).languageCode;
    return cachedLanguageLabels(profile.languageIds, languageCode).join(', ');
  }

  Future<void> _onRefresh() async {
    context.read<ListenerProfileBloc>().add(
      const ListenerProfileEvent.refreshRequested(),
    );
    await context.read<ListenerProfileBloc>().stream.firstWhere(
      (state) => !state.isLoading && !state.isRefreshing,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return BlocConsumer<ListenerProfileBloc, ListenerProfileState>(
      listenWhen: (previous, current) =>
          (current.profile != null && previous.profile != current.profile) ||
          (previous.updateErrorMessage != current.updateErrorMessage &&
              current.updateErrorMessage.isNotEmpty),
      listener: (context, state) {
        if (state.updateErrorMessage.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.updateErrorMessage)));
          return;
        }
        setState(() => _aboutExpanded = false);
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const AnnotatedRegion<SystemUiOverlayStyle>(
            value: _overlayStyle,
            child: _ListenerProfileShimmer(),
          );
        }

        if (state.isLoadFailure) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: _overlayStyle,
            child: _ListenerProfileError(
              message: state.errorMessage,
              onRetry: () => context.read<ListenerProfileBloc>().add(
                const ListenerProfileEvent.started(),
              ),
            ),
          );
        }

        final profile = state.profile;
        if (profile == null) {
          return const SizedBox.shrink();
        }

        final editLabel = l10n.listener_profile_edit;
        final experiences = _experiencesFor(profile);
        final comfortAreas = _comfortAreasFor(profile);
        final boundaries = _boundariesFor(profile);

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
                    onSettingsTap: () => _onOpenSettings(profile),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      color: SplashColors.purpleMid,
                      backgroundColor: ListenerProfileTheme.cardFill,
                      onRefresh: _onRefresh,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ProfileHeaderCard(
                              name: profile.fullName,
                              rating: profile.rating,
                              reviewCount: profile.reviewCount,
                              statusLabel: _statusLabel(l10n, profile),
                              isOnline: profile.isOnline,
                              email: profile.email,
                              dateOfBirth: profile.dateOfBirthDisplay,
                              avatarUrl: profile.avatarUrl,
                              avatarFilePath: state.pendingAvatarFilePath,
                              avatarCacheToken: state.avatarCacheToken,
                              isUploadingAvatar:
                                  state.isUploadingAvatar || _pickingAvatar,
                              onEditPhoto: _onEditPhoto,
                            ),
                            const SizedBox(height: 12),
                            ProfileAboutMeSection(
                              title: l10n.listener_profile_about_me,
                              editLabel: editLabel,
                              body: _aboutMeFor(profile),
                              emptyLabel: l10n.listener_profile_about_me_empty,
                              seeMoreLabel: l10n.listener_profile_see_more,
                              seeLessLabel: l10n.listener_profile_see_less,
                              expanded: _aboutExpanded,
                              isSaving: state.isSavingAboutMe,
                              onEdit: state.isSavingAboutMe
                                  ? null
                                  : () => _onEditAboutMe(profile),
                              onToggleExpanded: () {
                                setState(
                                  () => _aboutExpanded = !_aboutExpanded,
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            ProfileVoiceIntroSection(
                              title: l10n.listener_profile_voice_introduction,
                              editLabel: editLabel,
                              durationLabel: _voiceDurationLabelFor(
                                profile,
                                state,
                              ),
                              isPlaying: _isPlayingVoice,
                              isUploading: state.isUploadingVoiceIntro,
                              onEdit: state.isUploadingVoiceIntro
                                  ? null
                                  : () => _onEditVoiceIntro(profile),
                              onPlayToggle: state.isUploadingVoiceIntro
                                  ? null
                                  : () => _onPlayVoiceToggle(profile, state),
                            ),
                            const SizedBox(height: 12),
                            ProfileGoodAtSection(
                              title: l10n.listener_profile_experiences,
                              editLabel: editLabel,
                              emptyLabel:
                                  l10n.listener_profile_experiences_empty,
                              tags: ListenerExperienceOptions.displayLabels(
                                l10n: l10n,
                                selection: experiences,
                              ),
                              isSaving: state.isSavingField(
                                ListenerProfileSavingTarget.experiences,
                              ),
                              onEdit:
                                  state.isSavingField(
                                    ListenerProfileSavingTarget.experiences,
                                  )
                                  ? null
                                  : () => _onEditExperiences(profile),
                            ),
                            const SizedBox(height: 12),
                            ProfileGoodAtSection(
                              title: l10n.listener_profile_comfort_areas,
                              editLabel: editLabel,
                              emptyLabel:
                                  l10n.listener_profile_comfort_areas_empty,
                              tags: ListenerComfortAreaOptions.displayLabels(
                                l10n: l10n,
                                selection: comfortAreas,
                              ),
                              isSaving: state.isSavingField(
                                ListenerProfileSavingTarget.comfortAreas,
                              ),
                              onEdit:
                                  state.isSavingField(
                                    ListenerProfileSavingTarget.comfortAreas,
                                  )
                                  ? null
                                  : () => _onEditComfortAreas(profile),
                            ),
                            const SizedBox(height: 12),
                            ProfileGoodAtSection(
                              title: l10n.listener_profile_boundaries,
                              editLabel: editLabel,
                              emptyLabel:
                                  l10n.listener_profile_boundaries_empty,
                              tags: ListenerBoundaryOptions.displayLabels(
                                l10n: l10n,
                                selection: boundaries,
                              ),
                              isSaving: state.isSavingField(
                                ListenerProfileSavingTarget.boundaries,
                              ),
                              onEdit:
                                  state.isSavingField(
                                    ListenerProfileSavingTarget.boundaries,
                                  )
                                  ? null
                                  : () => _onEditBoundaries(profile),
                            ),
                            const SizedBox(height: 12),
                            ProfileSectionCard(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Column(
                                children: [
                                  ProfileDetailRow(
                                    icon: Icons.public_rounded,
                                    label: l10n.listener_profile_country,
                                    value: _countryLabel(context, profile),
                                    editLabel: editLabel,
                                    isSaving: state.isSavingField(
                                      ListenerProfileSavingTarget.country,
                                    ),
                                    onEdit:
                                        state.isSavingField(
                                          ListenerProfileSavingTarget.country,
                                        )
                                        ? null
                                        : () => _onEditCountry(profile),
                                  ),
                                  ProfileDetailRow(
                                    icon: Icons.location_city_rounded,
                                    label: l10n.listener_profile_city,
                                    value: profile.city.isEmpty
                                        ? '—'
                                        : profile.city,
                                    editLabel: editLabel,
                                    isSaving: state.isSavingField(
                                      ListenerProfileSavingTarget.city,
                                    ),
                                    onEdit:
                                        state.isSavingField(
                                          ListenerProfileSavingTarget.city,
                                        )
                                        ? null
                                        : () => _onEditCity(profile),
                                  ),
                                  ProfileDetailRow(
                                    icon: Icons.language_rounded,
                                    label: l10n.listener_profile_languages,
                                    value: _languagesLabel(context, profile),
                                    editLabel: editLabel,
                                    isSaving: state.isSavingField(
                                      ListenerProfileSavingTarget.languages,
                                    ),
                                    onEdit:
                                        state.isSavingField(
                                          ListenerProfileSavingTarget.languages,
                                        )
                                        ? null
                                        : () => _onEditLanguages(profile),
                                    showDivider: false,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            ProfileReviewsSection(
                              title: l10n.listener_profile_reviews,
                              viewAllLabel: l10n
                                  .listener_profile_view_all_reviews(
                                    profile.reviewCount,
                                  ),
                              rating: profile.rating,
                              reviewCount: profile.reviewCount,
                              distribution: profile.ratingDistribution,
                              onViewAll: () => _onViewAllReviews(profile),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ListenerProfileError extends StatelessWidget {
  const _ListenerProfileError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: ListenerProfileTheme.backgroundGradient,
      ),
      child: SafeArea(
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
        ),
      ),
    );
  }
}

class _ListenerProfileShimmer extends StatelessWidget {
  const _ListenerProfileShimmer();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: ListenerProfileTheme.backgroundGradient,
      ),
      child: SafeArea(
        bottom: false,
        child: Shimmer.fromColors(
          baseColor: Colors.white.withValues(alpha: 0.08),
          highlightColor: Colors.white.withValues(alpha: 0.16),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: ListenerProfileTheme.cardFill,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              const SizedBox(height: 12),
              for (var i = 0; i < 5; i++) ...[
                Container(
                  height: 96,
                  decoration: BoxDecoration(
                    color: ListenerProfileTheme.cardFill,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                const SizedBox(height: 12),
              ],
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
