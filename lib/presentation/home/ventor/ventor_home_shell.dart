import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_points_scope.dart';
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

  /// Opens the Sessions tab on the Find listeners section.
  static void goToFindListeners(BuildContext context) {
    context
        .findAncestorStateOfType<_VentorHomeShellState>()
        ?.goToFindListenersTab();
  }

  @override
  State<VentorHomeShell> createState() => _VentorHomeShellState();
}

class _VentorHomeShellState extends State<VentorHomeShell> {
  int _index = 0;
  var _points = 0;
  final _dashboardTabKey = GlobalKey<VentorDashboardTabState>();
  final _sessionsTabKey = GlobalKey<VentorSessionsTabState>();
  final _rewardsTabKey = GlobalKey<VentorRewardsTabState>();

  late final List<Widget> _tabs = <Widget>[
    VentorDashboardTab(key: _dashboardTabKey),
    VentorSessionsTab(key: _sessionsTabKey),
    VentorRewardsTab(key: _rewardsTabKey),
    const VentorProfileTab(),
  ];

  void goToTab(int index) {
    if (index < 0 || index >= _tabs.length) return;
    if (index == VentorHomeShell.dashboardTab) {
      _dashboardTabKey.currentState?.onTabOpened();
    }
    if (index == VentorHomeShell.rewardsTab) {
      _rewardsTabKey.currentState?.onTabOpened();
    }
    if (index == _index) return;
    setState(() => _index = index);
  }

  void goToFindListenersTab() {
    _sessionsTabKey.currentState?.showFindSection();
    if (_index != VentorHomeShell.sessionsTab) {
      setState(() => _index = VentorHomeShell.sessionsTab);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return VentorPointsScope(
      points: _points,
      onPointsChanged: (value) => setState(() => _points = value),
      child: Scaffold(
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
            onDestinationSelected: goToTab,
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
      ),
    );
  }
}
