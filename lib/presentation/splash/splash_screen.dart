import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_animated_content.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/edge_to_edge_handler.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarContrastEnforced: false,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _applyImmersiveSplashUi();
    // Flutter may re-apply edge-to-edge after the first frame; re-assert immersive.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _applyImmersiveSplashUi();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    EdgeToEdgeHandler.enableEdgeToEdge();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _applyImmersiveSplashUi();
    }
  }

  void _applyImmersiveSplashUi() {
    // On iOS this hides the status bar + home indicator for the splash.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(_overlayStyle);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: BlocProvider(
        create: (context) =>
            diContainer<SplashBloc>()
              ..add(const SplashEvent.checkAuthenticationStatus()),
        child: BlocListener<SplashBloc, SplashState>(
          listenWhen: (previous, current) =>
              previous.processState != current.processState,
          listener: (context, state) {
            state.processState.when(
              idle: () =>
                  LoggerManagerBase.logInfo(message: 'SplashScreen: Idle'),
              needOnboarding: () => context.go(AppRoutes.mainOnboarding),
              autherizedForApp: () {
                context.go(AppRoutes.tabHome);
              },
              needAuthenticate: () {
                context.go(AppRoutes.welcome);
              },
              error: () => LoggerManagerBase.logInfo(
                message:
                    'SplashBloc: Authentication check failed - navigating to returning user',
              ),
            );
          },
          child: const Scaffold(
            backgroundColor: SplashColors.backgroundBottom,
            extendBody: true,
            body: ColoredBox(
              color: SplashColors.backgroundBottom,
              child: SplashAnimatedContent(),
            ),
          ),
        ),
      ),
    );
  }
}
