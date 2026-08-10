import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/tabs/listener_availability_tab.dart';
import 'package:venting_mobile_app/presentation/home/listener/tabs/listener_dashboard_tab.dart';
import 'package:venting_mobile_app/presentation/home/listener/tabs/listener_earnings_tab.dart';
import 'package:venting_mobile_app/presentation/home/listener/tabs/listener_profile_tab.dart';
import 'package:venting_mobile_app/presentation/home/listener/tabs/listener_sessions_tab.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Listener main shell: Dashboard, Sessions, Availability, Earnings, Profile.
class ListenerHomeShell extends StatefulWidget {
  const ListenerHomeShell({super.key});

  @override
  State<ListenerHomeShell> createState() => _ListenerHomeShellState();
}

class _ListenerHomeShellState extends State<ListenerHomeShell> {
  int _index = 0;

  static const _tabs = <Widget>[
    ListenerDashboardTab(),
    ListenerSessionsTab(),
    ListenerAvailabilityTab(),
    ListenerEarningsTab(),
    ListenerProfileTab(),
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
              icon: const Icon(Icons.dashboard_outlined),
              selectedIcon: const Icon(Icons.dashboard_rounded),
              label: l10n.home_tab_dashboard,
            ),
            NavigationDestination(
              icon: const Icon(Icons.headphones_outlined),
              selectedIcon: const Icon(Icons.headphones_rounded),
              label: l10n.home_tab_sessions,
            ),
            NavigationDestination(
              icon: const Icon(Icons.calendar_month_outlined),
              selectedIcon: const Icon(Icons.calendar_month_rounded),
              label: l10n.home_tab_availability,
            ),
            NavigationDestination(
              icon: const Icon(Icons.payments_outlined),
              selectedIcon: const Icon(Icons.payments_rounded),
              label: l10n.home_tab_earnings,
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
