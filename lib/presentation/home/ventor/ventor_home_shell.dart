import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/tabs/ventor_dashboard_tab.dart';
import 'package:venting_mobile_app/presentation/home/ventor/tabs/ventor_profile_tab.dart';
import 'package:venting_mobile_app/presentation/home/ventor/tabs/ventor_rewards_tab.dart';
import 'package:venting_mobile_app/presentation/home/ventor/tabs/ventor_sessions_tab.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Ventor main shell: Dashboard, Sessions, Rewards, Profile.
class VentorHomeShell extends StatefulWidget {
  const VentorHomeShell({super.key});

  static const dashboardTab = 0;
  static const sessionsTab = 1;
  static const rewardsTab = 2;
  static const profileTab = 3;

  /// Switch the bottom tab if a [VentorHomeShell] is an ancestor.
  static void goToTab(BuildContext context, int index) {
    context.findAncestorStateOfType<_VentorHomeShellState>()?.goToTab(index);
  }

  static void goToDashboard(BuildContext context) {
    goToTab(context, dashboardTab);
  }

  @override
  State<VentorHomeShell> createState() => _VentorHomeShellState();
}

class _VentorHomeShellState extends State<VentorHomeShell> {
  int _index = 0;

  void goToTab(int index) {
    if (index < 0 || index >= _tabs.length || index == _index) return;
    setState(() => _index = index);
  }

  static const _tabs = <Widget>[
    VentorDashboardTab(),
    VentorSessionsTab(),
    VentorRewardsTab(),
    VentorProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Scaffold(
      backgroundColor: SplashColors.backgroundTop,
      body: IndexedStack(index: _index, children: _tabs),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            final selected = states.contains(WidgetState.selected);
            return GoogleFonts.inter(
              fontSize: 11,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              color: selected
                  ? SplashColors.purpleMid
                  : Colors.white.withValues(alpha: 0.55),
            );
          }),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            final selected = states.contains(WidgetState.selected);
            return IconThemeData(
              size: 22,
              color: selected
                  ? SplashColors.purpleMid
                  : Colors.white.withValues(alpha: 0.55),
            );
          }),
        ),
        child: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (value) => setState(() => _index = value),
          backgroundColor: const Color(0xFF140C22),
          indicatorColor: SplashColors.purpleMid.withValues(alpha: 0.18),
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black45,
          elevation: 8,
          height: 70,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home_rounded),
              label: l10n.home_tab_dashboard,
            ),
            NavigationDestination(
              icon: const Icon(Icons.forum_outlined),
              selectedIcon: const Icon(Icons.forum_rounded),
              label: l10n.home_tab_sessions,
            ),
            NavigationDestination(
              icon: const Icon(Icons.card_giftcard_outlined),
              selectedIcon: const Icon(Icons.card_giftcard_rounded),
              label: l10n.home_tab_rewards,
            ),
            NavigationDestination(
              icon: const Icon(Icons.person_outline_rounded),
              selectedIcon: const Icon(Icons.person_rounded),
              label: l10n.home_tab_profile,
            ),
          ],
        ),
      ),
    );
  }
}
