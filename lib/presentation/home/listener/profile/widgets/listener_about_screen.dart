import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/whats_new_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/app_webview_screen.dart';

/// Opens the About Venting screen.
Future<void> openListenerAboutScreen({required BuildContext context}) {
  return Navigator.of(
    context,
  ).push<void>(MaterialPageRoute(builder: (_) => const ListenerAboutScreen()));
}

class ListenerAboutScreen extends StatefulWidget {
  const ListenerAboutScreen({super.key});

  @override
  State<ListenerAboutScreen> createState() => _ListenerAboutScreenState();
}

class _ListenerAboutScreenState extends State<ListenerAboutScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  String? _version;
  String? _buildNumber;

  @override
  void initState() {
    super.initState();
    unawaited(_loadVersion());
  }

  Future<void> _loadVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      if (!mounted) return;
      setState(() {
        _version = info.version;
        _buildNumber = info.buildNumber;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _version = '1.2.0';
        _buildNumber = '120';
      });
    }
  }

  Future<void> _openWebView({required String title, required String url}) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => AppWebViewScreen(title: title, url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final config = diContainer<AppConfig>();
    final helpBase = config.helpCenterBaseUrl;
    final versionLabel = _version == null || _buildNumber == null
        ? null
        : l10n.listener_about_version(_version!, _buildNumber!);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundBottom,
        appBar: AppBar(
          backgroundColor: SplashColors.backgroundBottom,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
            color: Colors.white,
          ),
          title: Text(
            l10n.listener_profile_settings_about,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: SplashColors.brandGradient,
                  boxShadow: [
                    BoxShadow(
                      color: SplashColors.purpleGlow.withValues(alpha: 0.28),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Venting',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                height: 1.1,
              ),
            ),
            if (versionLabel != null) ...[
              const SizedBox(height: 8),
              Text(
                versionLabel,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                l10n.listener_about_tagline,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 28),
            DecoratedBox(
              decoration: BoxDecoration(
                color: ListenerProfileTheme.cardFill,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ListenerProfileTheme.cardBorder),
              ),
              child: Column(
                children: [
                  _AboutTile(
                    label: l10n.listener_about_whats_new,
                    onTap: () => showWhatsNewBottomSheet(context: context),
                  ),
                  _AboutTile(
                    label: l10n.listener_about_terms,
                    onTap: () => _openWebView(
                      title: l10n.listener_about_terms,
                      url: config.termsOfServiceUrl,
                    ),
                  ),
                  _AboutTile(
                    label: l10n.listener_about_privacy,
                    onTap: () => _openWebView(
                      title: l10n.listener_about_privacy,
                      url: config.privacyPolicyUrl,
                    ),
                  ),
                  _AboutTile(
                    label: l10n.listener_about_community_guidelines,
                    onTap: () => _openWebView(
                      title: l10n.listener_about_community_guidelines,
                      url: '$helpBase/community-guidelines',
                    ),
                  ),
                  _AboutTile(
                    label: l10n.listener_about_licenses,
                    onTap: () => _openWebView(
                      title: l10n.listener_about_licenses,
                      url: '$helpBase/licenses',
                    ),
                    showDivider: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutTile extends StatelessWidget {
  const _AboutTile({
    required this.label,
    required this.onTap,
    this.showDivider = true,
  });

  final String label;
  final VoidCallback onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right_rounded,
            color: Colors.white.withValues(alpha: 0.35),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: Colors.white.withValues(alpha: 0.06),
          ),
      ],
    );
  }
}
