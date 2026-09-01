import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_profile.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/bloc/ventor_profile/ventor_profile_bloc.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/widgets/edit_ventor_profile_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/widgets/ventor_profile_settings_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/widgets/ventor_profile_widgets.dart';
import 'package:venting_mobile_app/presentation/home/ventor/ventor_home_shell.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/api_asset_url.dart';
import 'package:venting_mobile_app/utils/registration_media_storage.dart';

class VentorProfileTab extends StatelessWidget {
  const VentorProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          diContainer<VentorProfileBloc>()
            ..add(const VentorProfileEvent.started()),
      child: const _VentorProfileTabView(),
    );
  }
}

class _VentorProfileTabView extends StatefulWidget {
  const _VentorProfileTabView();

  @override
  State<_VentorProfileTabView> createState() => _VentorProfileTabViewState();
}

class _VentorProfileTabViewState extends State<_VentorProfileTabView> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  void _openFindListeners() {
    VentorHomeShell.goToFindListeners(context);
  }

  Future<void> _onEditProfile(VentorProfileState state) async {
    final overview = state.overview;
    if (overview == null || state.isUpdating) return;

    final profile = overview.profile;
    final avatarUrl = _avatarUrlFor(state, profile);

    final updated = await showEditVentorProfileBottomSheet(
      context: context,
      initialName: profile.nickname,
      initialAvatarUrl: avatarUrl,
      initialAvatarFilePath: state.localAvatarFilePath,
    );
    if (!mounted || updated == null) return;

    final nameChanged = updated.name.trim() != profile.nickname.trim();
    final avatarChanged = updated.avatarFilePath != null;

    if (!nameChanged && !avatarChanged) return;

    String? avatarPath;
    if (avatarChanged) {
      avatarPath = await RegistrationMediaStorage.persistImage(
        updated.avatarFilePath!,
        prefix: 'avatar',
      );
      if (!mounted) return;
    }

    context.read<VentorProfileBloc>().add(
      VentorProfileEvent.profileUpdateRequested(
        nickname: nameChanged ? updated.name.trim() : null,
        avatarFilePath: avatarPath,
      ),
    );
  }

  String? _avatarUrlFor(
    VentorProfileState state,
    VentorProfileSummary profile,
  ) {
    final remote = profile.avatarUrl;
    if (remote == null || remote.isEmpty) return null;
    return withApiAssetCacheBuster(remote, cacheToken: state.avatarCacheToken);
  }

  List<VentorMoodPoint> _moodPoints(List<VentorProfileMoodPoint> points) {
    return [
      for (final point in points)
        VentorMoodPoint(dayIndex: point.dayIndex, mood: point.mood),
    ];
  }

  List<VentorFavoriteListener> _favoriteListeners(
    List<VentorProfileFavoriteListener> listeners,
  ) {
    return [
      for (final listener in listeners)
        VentorFavoriteListener(
          id: listener.id,
          name: listener.name,
          rating: listener.rating,
          avatarUrl: listener.avatarUrl,
        ),
    ];
  }

  int _todayDayIndex() => DateTime.now().weekday - 1;

  Future<void> _onRefresh() async {
    context.read<VentorProfileBloc>().add(
      const VentorProfileEvent.refreshRequested(),
    );
    await context.read<VentorProfileBloc>().stream.firstWhere(
      (state) => !state.isLoadingOrInitial,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final dayLabels = [
      l10n.ventor_profile_day_mon,
      l10n.ventor_profile_day_tue,
      l10n.ventor_profile_day_wed,
      l10n.ventor_profile_day_thu,
      l10n.ventor_profile_day_fri,
      l10n.ventor_profile_day_sat,
      l10n.ventor_profile_day_sun,
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: VentorProfileTheme.backgroundGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: BlocConsumer<VentorProfileBloc, VentorProfileState>(
            listenWhen: (previous, current) =>
                previous.errorMessage != current.errorMessage &&
                current.errorMessage.isNotEmpty &&
                current.status == VentorProfileStatus.ready,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            builder: (context, state) {
              if (state.isLoadingOrInitial) {
                return const _VentorProfileShimmer();
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
                              .read<VentorProfileBloc>()
                              .add(const VentorProfileEvent.retryLoad()),
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

              final profile = overview.profile;
              final listeners = _favoriteListeners(overview.favoriteListeners);
              final moodPoints = _moodPoints(overview.moodPoints);
              final todayIndex = _todayDayIndex();
              final avatarUrl = _avatarUrlFor(state, profile);

              return Stack(
                children: [
                  RefreshIndicator(
                    color: SplashColors.purpleMid,
                    backgroundColor: VentorProfileTheme.cardFill,
                    onRefresh: _onRefresh,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
                      children: [
                        VentorProfileHeader(
                          title: l10n.home_tab_profile,
                          name: profile.nickname,
                          anonymousLabel: l10n.ventor_profile_anonymous,
                          avatarUrl: avatarUrl,
                          avatarFilePath: state.localAvatarFilePath,
                          isAnonymous: profile.isAnonymous,
                          onEditProfile: state.isUpdating
                              ? () {}
                              : () => _onEditProfile(state),
                          onOpenSettings: () =>
                              openVentorProfileSettingsScreen(context: context),
                        ),
                        const SizedBox(height: 20),
                        VentorProgressSummaryCard(
                          title: l10n.ventor_profile_progress_summary,
                          sessionsLabel: l10n.ventor_profile_sessions,
                          sessionsValue: '${profile.sessionsCount}',
                          streakLabel: l10n.ventor_profile_day_streak,
                          streakValue: profile.streakDays.toString().padLeft(
                            2,
                            '0',
                          ),
                        ),
                        const SizedBox(height: 14),
                        VentorMoodJourneyCard(
                          title: l10n.ventor_profile_mood_journey,
                          todayLabel: l10n.ventor_profile_today,
                          dayLabels: dayLabels,
                          points: moodPoints,
                          todayIndex: todayIndex,
                          highlightedDayIndex: todayIndex,
                        ),
                        const SizedBox(height: 20),
                        VentorMyListenersSection(
                          title: l10n.ventor_profile_my_listeners,
                          addFavoriteLabel: l10n.ventor_profile_add_favorite,
                          totalCountLabel: l10n
                              .ventor_profile_add_favorite_total(
                                listeners.length,
                              ),
                          listeners: listeners,
                          onAddFavorite: _openFindListeners,
                          onTapListener: (_) => _openFindListeners(),
                        ),
                      ],
                    ),
                  ),
                  if (state.isUpdating)
                    const Positioned.fill(
                      child: ColoredBox(
                        color: Color(0x33000000),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: SplashColors.purpleMid,
                          ),
                        ),
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

class _VentorProfileShimmer extends StatelessWidget {
  const _VentorProfileShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withValues(alpha: 0.08),
      highlightColor: Colors.white.withValues(alpha: 0.16),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
        children: const [
          _ProfileShimmerLine(width: 80, height: 24),
          SizedBox(height: 24),
          _ProfileShimmerCircle(size: 88),
          SizedBox(height: 12),
          _ProfileShimmerLine(width: 120, height: 20),
          SizedBox(height: 8),
          _ProfileShimmerLine(width: 90, height: 14),
          SizedBox(height: 24),
          _ProfileShimmerCard(height: 96),
          SizedBox(height: 14),
          _ProfileShimmerCard(height: 220),
          SizedBox(height: 20),
          _ProfileShimmerLine(width: 140, height: 14),
          SizedBox(height: 10),
          _ProfileShimmerCard(height: 168),
        ],
      ),
    );
  }
}

class _ProfileShimmerCard extends StatelessWidget {
  const _ProfileShimmerCard({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

class _ProfileShimmerLine extends StatelessWidget {
  const _ProfileShimmerLine({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class _ProfileShimmerCircle extends StatelessWidget {
  const _ProfileShimmerCircle({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
