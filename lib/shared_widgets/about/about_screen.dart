import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/help_topic_opener.dart';
import 'package:venting_mobile_app/utils/legal_document_opener.dart';
import 'package:venting_mobile_app/utils/static_web_content.dart';

/// Opens the shared About Venting screen (ventor + listener).
Future<void> openAboutScreen({required BuildContext context}) {
  return Navigator.of(
    context,
  ).push<void>(MaterialPageRoute(builder: (_) => const AboutScreen()));
}

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const _muted = Color(0xFF9B93AB);
  static const _cardFill = Color(0xFF1C1826);
  static const _cardBorder = Color(0xFF2A2238);

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

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
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
                  color: _muted,
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
                  color: _muted,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 28),
            DecoratedBox(
              decoration: BoxDecoration(
                color: _cardFill,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _cardBorder),
              ),
              child: Column(
                children: [
                  _AboutTile(
                    label: l10n.listener_about_terms,
                    onTap: () => openLegalDocument(
                      context,
                      kind: LegalDocumentKind.terms,
                      title: l10n.listener_about_terms,
                      useGoRouter: false,
                    ),
                  ),
                  _AboutTile(
                    label: l10n.listener_about_privacy,
                    onTap: () => openLegalDocument(
                      context,
                      kind: LegalDocumentKind.privacy,
                      title: l10n.listener_about_privacy,
                      useGoRouter: false,
                    ),
                  ),
                  _AboutTile(
                    label: l10n.listener_about_community_guidelines,
                    onTap: () => openHelpTopic(
                      context,
                      topic: HelpTopicKind.communityGuidelines,
                      title: l10n.listener_about_community_guidelines,
                      useGoRouter: false,
                    ),
                  ),
                  _AboutTile(
                    label: l10n.listener_about_licenses,
                    onTap: () => openHelpTopic(
                      context,
                      topic: HelpTopicKind.licenses,
                      title: l10n.listener_about_licenses,
                      useGoRouter: false,
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
