import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/listener_home_shell.dart';
import 'package:venting_mobile_app/presentation/home/ventor/ventor_home_shell.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/router_config.dart';
import 'package:venting_mobile_app/utils/user_type_store.dart';

class HomeScreenArgs {
  const HomeScreenArgs({required this.userType});

  final AuthUserType userType;
}

/// Role-aware root after auth/registration.
///
/// Listener: Dashboard, Sessions, Availability, Earnings, Profile
/// Ventor: Dashboard, Sessions, Rewards, Profile
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.userType});

  /// Optional override from navigation `extra`. Falls back to preferences.
  final AuthUserType? userType;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  AuthUserType? _userType;

  @override
  void initState() {
    super.initState();
    final fromArgs = widget.userType;
    if (fromArgs != null) {
      _userType = fromArgs;
      unawaited(
        UserTypeStore.save(diContainer<VentingPreferences>(), fromArgs),
      );
    } else {
      _userType = UserTypeStore.read(diContainer<VentingPreferences>());
    }

    if (_userType == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        context.go(AppRoutes.welcome);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userType = _userType;
    if (userType == null) {
      return const Scaffold(
        backgroundColor: SplashColors.backgroundTop,
        body: SizedBox.shrink(),
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: switch (userType) {
        AuthUserType.lissener => const ListenerHomeShell(),
        AuthUserType.ventor => const VentorHomeShell(),
      },
    );
  }
}
