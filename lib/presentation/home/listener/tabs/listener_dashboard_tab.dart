import 'package:flutter/material.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/widgets/home_tab_placeholder.dart';

class ListenerDashboardTab extends StatelessWidget {
  const ListenerDashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    return HomeTabPlaceholder(
      title: l10n.home_tab_dashboard,
      subtitle: l10n.listener_home_dashboard_placeholder,
      icon: Icons.dashboard_rounded,
    );
  }
}
