import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/app_language_selector.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _redirectIfSessionActive(),
    );
  }

  void _redirectIfSessionActive() {
    if (!mounted) return;

    final accessToken = diContainer<VentingPreferences>()
        .getValue(SavedConstants.accessToken, '')
        .trim();
    if (accessToken.isEmpty) return;

    context.go(AppRoutes.initialRoute);
  }

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarContrastEnforced: false,
  );

  static const _muted = Color(0xFF9B93AB);
  static const _ventIconBg = Color(0xFF2A1F3D);
  static const _listenIconBg = Color(0xFF1A2A24);

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundTop,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                SplashColors.backgroundTop,
                SplashColors.backgroundBottom,
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: AppLanguageSelector(showFullName: true),
                  ),
                  const Spacer(flex: 2),
                  const _VentingBrandHeader(),
                  const SizedBox(height: 12),
                  Text(
                    l10n.welcome_tagline,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: _muted,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _WelcomeRoleCard(
                    title: l10n.welcome_i_am_ventor,
                    subtitle: l10n.welcome_vent_subtitle,
                    iconAsset: 'assets/images/ventor_welcome_icon.svg',
                    iconBackground: _ventIconBg,
                    highlighted: true,
                    onTap: () => context.push(AppRoutes.autVentorRegister),
                  ),
                  const SizedBox(height: 14),
                  _WelcomeRoleCard(
                    title: l10n.welcome_i_am_listener,
                    subtitle: l10n.welcome_listen_subtitle,
                    iconAsset: 'assets/images/listener_welcom_icon.svg',
                    iconBackground: _listenIconBg,
                    highlighted: false,
                    onTap: () => context.push(AppRoutes.authListenerRegister),
                  ),
                  const Spacer(flex: 3),
                  Text(
                    l10n.welcome_anonymous_footer,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: _muted.withValues(alpha: 0.85),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VentingBrandHeader extends StatelessWidget {
  const _VentingBrandHeader();

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.inter(
      fontSize: 42,
      fontWeight: FontWeight.w800,
      height: 1,
      letterSpacing: 1.2,
    );

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'VENT',
            style: base.copyWith(color: Colors.white),
          ),
          TextSpan(
            text: 'ING',
            style: base.copyWith(color: SplashColors.purpleMid),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _WelcomeRoleCard extends StatelessWidget {
  const _WelcomeRoleCard({
    required this.title,
    required this.subtitle,
    required this.iconAsset,
    required this.iconBackground,
    required this.highlighted,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String iconAsset;
  final Color iconBackground;
  final bool highlighted;
  final VoidCallback onTap;

  static const _cardFill = Color(0xFF16121F);
  static const _muted = Color(0xFF9B93AB);

  @override
  Widget build(BuildContext context) {
    final borderColor = highlighted
        ? SplashColors.purpleMid
        : Colors.white.withValues(alpha: 0.08);
    final arrowColor = highlighted
        ? SplashColors.purpleMid
        : _muted.withValues(alpha: 0.75);

    return Material(
      color: _cardFill,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: borderColor,
              width: highlighted ? 1.6 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(iconAsset, width: 34, height: 34),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        color: _muted,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_rounded, size: 22, color: arrowColor),
            ],
          ),
        ),
      ),
    );
  }
}
