import 'package:flutter/material.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/widgets/home_tab_placeholder.dart';

class VentorProfileTab extends StatelessWidget {
  const VentorProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    return HomeTabPlaceholder(
      title: l10n.home_tab_profile,
      subtitle: l10n.ventor_home_profile_placeholder,
      icon: Icons.person_rounded,
    );
  }
}
