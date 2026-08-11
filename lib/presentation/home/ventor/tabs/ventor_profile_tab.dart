import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/widgets/edit_ventor_profile_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/widgets/ventor_achievements_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/widgets/ventor_profile_settings_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/widgets/ventor_profile_widgets.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class VentorProfileTab extends StatefulWidget {
  const VentorProfileTab({super.key});

  @override
  State<VentorProfileTab> createState() => _VentorProfileTabState();
}

class _VentorProfileTabState extends State<VentorProfileTab> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  // TODO: Replace mock profile data with API / ventor profile repository.
  static const _mockAvatarUrl =
      'https://i.pravatar.cc/240?u=ventor-alex-profile';
  static const _mockSessions = 12;
  static const _mockStreak = 7;

  var _name = 'Alex';
  String? _avatarFilePath;

  // TODO: Load mood journey from ventor wellness / sessions API.
  static const _mockMoodPoints = <VentorMoodPoint>[
    VentorMoodPoint(dayIndex: 0, mood: 0.35),
    VentorMoodPoint(dayIndex: 1, mood: 0.55),
    VentorMoodPoint(dayIndex: 2, mood: 0.45),
    VentorMoodPoint(dayIndex: 3, mood: 0.7),
    VentorMoodPoint(dayIndex: 4, mood: 0.6),
    VentorMoodPoint(dayIndex: 5, mood: 0.8),
    VentorMoodPoint(dayIndex: 6, mood: 0.75),
  ];

  // TODO: Load favorite listeners from ventor profile API / repository.
  static const _mockListeners = <VentorFavoriteListener>[
    VentorFavoriteListener(
      id: '1',
      name: 'Lina',
      rating: 4.9,
      avatarUrl: 'https://i.pravatar.cc/120?u=listener-lina',
    ),
    VentorFavoriteListener(
      id: '2',
      name: 'Omar',
      rating: 4.8,
      avatarUrl: 'https://i.pravatar.cc/120?u=listener-omar',
    ),
    VentorFavoriteListener(
      id: '3',
      name: 'Sara',
      rating: 5,
      avatarUrl: 'https://i.pravatar.cc/120?u=listener-sara',
    ),
  ];

  void _todoAction(String feature) {
    // TODO: Wire navigation / API for $feature.
    debugPrint('TODO: $feature');
  }

  Future<void> _onEditProfile() async {
    final updated = await showEditVentorProfileBottomSheet(
      context: context,
      initialName: _name,
      initialAvatarUrl: _mockAvatarUrl,
      initialAvatarFilePath: _avatarFilePath,
    );
    if (!mounted || updated == null) return;
    setState(() {
      _name = updated.name;
      if (updated.avatarFilePath != null) {
        _avatarFilePath = updated.avatarFilePath;
      } else if (updated.clearLocalAvatar) {
        _avatarFilePath = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final achievements = ventorMockAchievements(l10n);
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
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
            children: [
              VentorProfileHeader(
                name: _name,
                quote: l10n.ventor_profile_quote,
                anonymousLabel: l10n.ventor_profile_anonymous,
                avatarUrl: _mockAvatarUrl,
                avatarFilePath: _avatarFilePath,
                onEditPhoto: _onEditProfile,
                onEditProfile: _onEditProfile,
                onOpenSettings: () =>
                    openVentorProfileSettingsScreen(context: context),
              ),
              const SizedBox(height: 16),
              VentorStatsRow(
                sessionsLabel: l10n.ventor_profile_sessions,
                sessionsValue: '$_mockSessions',
                streakLabel: l10n.ventor_profile_day_streak,
                streakValue: '$_mockStreak',
              ),
              const SizedBox(height: 14),
              VentorMoodJourneyCard(
                title: l10n.ventor_profile_mood_journey,
                todayLabel: l10n.ventor_profile_today,
                dayLabels: dayLabels,
                points: _mockMoodPoints,
                todayIndex: 6,
              ),
              const SizedBox(height: 18),
              VentorAchievementsSection(
                title: l10n.ventor_profile_achievements,
                seeAllLabel: l10n.ventor_profile_see_all,
                achievements: achievements,
                onSeeAll: () => showVentorAchievementsBottomSheet(
                  context: context,
                  achievements: achievements,
                ),
                onTapAchievement: (item) => showVentorAchievementsBottomSheet(
                  context: context,
                  achievements: achievements,
                  highlightedId: item.id,
                ),
              ),
              const SizedBox(height: 18),
              VentorMyListenersSection(
                title: l10n.ventor_profile_my_listeners,
                seeAllLabel: l10n.ventor_profile_see_all,
                addFavoriteLabel: l10n.ventor_profile_add_favorite,
                listeners: _mockListeners,
                onSeeAll: () => _todoAction('open my listeners see-all'),
                onAddFavorite: () => _todoAction('add favorite listener'),
                onTapListener: (listener) =>
                    _todoAction('open listener ${listener.id}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
