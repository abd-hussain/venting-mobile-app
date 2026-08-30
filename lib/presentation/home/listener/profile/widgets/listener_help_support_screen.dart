import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/help_topic_opener.dart';
import 'package:venting_mobile_app/utils/static_web_content.dart';

/// Opens the Help & Support screen.
Future<void> openListenerHelpSupportScreen({required BuildContext context}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(builder: (_) => const ListenerHelpSupportScreen()),
  );
}

class ListenerHelpSupportScreen extends StatelessWidget {
  const ListenerHelpSupportScreen({super.key});

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  AppConfig get _config => diContainer<AppConfig>();

  Future<void> _openHelpTopic(
    BuildContext context, {
    required HelpTopicKind topic,
    required String title,
  }) {
    return openHelpTopic(
      context,
      topic: topic,
      title: title,
      useGoRouter: false,
    );
  }

  Future<void> _onWhatsApp(BuildContext context) async {
    final uri = Uri.parse('https://wa.me/${_config.supportWhatsAppNumber}');
    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!context.mounted || opened) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          VentingMobLocalizations.of(context).listener_help_whatsapp_failed,
        ),
      ),
    );
  }

  Future<void> _onEmailSupport(BuildContext context) async {
    final uri = Uri(scheme: 'mailto', path: _config.supportEmail);
    final opened = await launchUrl(uri);
    if (!context.mounted || opened) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          VentingMobLocalizations.of(context).listener_help_email_failed,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

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
            l10n.listener_profile_help_support,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          children: [
            _HelpSection(
              title: l10n.listener_help_topics,
              children: [
                _HelpTile(
                  icon: Icons.info_outline_rounded,
                  label: l10n.listener_help_getting_started,
                  onTap: () => _openHelpTopic(
                    context,
                    topic: HelpTopicKind.gettingStarted,
                    title: l10n.listener_help_getting_started,
                  ),
                ),
                _HelpTile(
                  icon: Icons.forum_outlined,
                  label: l10n.listener_help_managing_sessions,
                  onTap: () => _openHelpTopic(
                    context,
                    topic: HelpTopicKind.managingSessions,
                    title: l10n.listener_help_managing_sessions,
                  ),
                ),
                _HelpTile(
                  icon: Icons.payments_outlined,
                  label: l10n.listener_help_earnings_payouts,
                  onTap: () => _openHelpTopic(
                    context,
                    topic: HelpTopicKind.earningsPayouts,
                    title: l10n.listener_help_earnings_payouts,
                  ),
                ),
                _HelpTile(
                  icon: Icons.person_outline_rounded,
                  label: l10n.listener_help_account_profile,
                  onTap: () => _openHelpTopic(
                    context,
                    topic: HelpTopicKind.accountProfile,
                    title: l10n.listener_help_account_profile,
                  ),
                ),
                _HelpTile(
                  icon: Icons.health_and_safety_outlined,
                  label: l10n.listener_help_safety_boundaries,
                  onTap: () => _openHelpTopic(
                    context,
                    topic: HelpTopicKind.safetyBoundaries,
                    title: l10n.listener_help_safety_boundaries,
                  ),
                ),
                _HelpTile(
                  icon: Icons.menu_book_outlined,
                  label: l10n.listener_help_community_guidelines,
                  onTap: () => _openHelpTopic(
                    context,
                    topic: HelpTopicKind.communityGuidelines,
                    title: l10n.listener_help_community_guidelines,
                  ),
                ),
                _HelpTile(
                  icon: Icons.help_outline_rounded,
                  label: l10n.listener_help_faqs,
                  onTap: () => _openHelpTopic(
                    context,
                    topic: HelpTopicKind.faqs,
                    title: l10n.listener_help_faqs,
                  ),
                ),
                _HelpTile(
                  icon: Icons.build_outlined,
                  label: l10n.listener_help_app_technical,
                  onTap: () => _openHelpTopic(
                    context,
                    topic: HelpTopicKind.appTechnical,
                    title: l10n.listener_help_app_technical,
                  ),
                  showDivider: false,
                ),
              ],
            ),
            const SizedBox(height: 18),
            _HelpSection(
              title: l10n.listener_help_contact_us,
              children: [
                _HelpTile(
                  icon: Icons.chat_rounded,
                  label: l10n.listener_help_whatsapp,
                  subtitle: l10n.listener_help_whatsapp_subtitle,
                  onTap: () => _onWhatsApp(context),
                ),
                _HelpTile(
                  icon: Icons.mail_outline_rounded,
                  label: l10n.listener_help_email_support,
                  subtitle: _config.supportEmail,
                  onTap: () => _onEmailSupport(context),
                  showDivider: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HelpSection extends StatelessWidget {
  const _HelpSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: GoogleFonts.inter(
              color: ListenerProfileTheme.muted,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: ListenerProfileTheme.cardFill,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ListenerProfileTheme.cardBorder),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}

class _HelpTile extends StatelessWidget {
  const _HelpTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.subtitle,
    this.showDivider = true,
  });

  final IconData icon;
  final String label;
  final String? subtitle;
  final VoidCallback onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          leading: Icon(
            icon,
            color: Colors.white.withValues(alpha: 0.9),
            size: 22,
          ),
          title: Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: subtitle == null
              ? null
              : Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    subtitle!,
                    style: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
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
            indent: 52,
            endIndent: 14,
            color: Colors.white.withValues(alpha: 0.06),
          ),
      ],
    );
  }
}
