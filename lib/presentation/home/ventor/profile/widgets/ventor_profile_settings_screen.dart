import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:venting_mobile_app/domain/constants/language_constant.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_about_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_change_password_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_destructive_confirm_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_help_support_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/widgets/ventor_notification_preferences_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/widgets/ventor_privacy_settings_screen.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/app_language.dart';

/// Opens the ventor Settings screen.
Future<void> openVentorProfileSettingsScreen({required BuildContext context}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(builder: (_) => const VentorProfileSettingsScreen()),
  );
}

class VentorProfileSettingsScreen extends StatefulWidget {
  const VentorProfileSettingsScreen({super.key});

  @override
  State<VentorProfileSettingsScreen> createState() =>
      _VentorProfileSettingsScreenState();
}

class _VentorProfileSettingsScreenState
    extends State<VentorProfileSettingsScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  String? _appVersion;

  @override
  void initState() {
    super.initState();
    unawaited(_loadAppVersion());
  }

  Future<void> _loadAppVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      if (!mounted) return;
      setState(() => _appVersion = info.version);
    } catch (_) {
      if (!mounted) return;
      setState(() => _appVersion = '1.2.0');
    }
  }

  void _todoAction(String feature) {
    // TODO: Wire navigation / API for $feature.
    debugPrint('TODO: $feature');
  }

  String get _languageLabel {
    final code = VentingMobLocalizationsHolder.currentLanguageCode;
    for (final language in LanguageConstant.languages) {
      if (language.languageCode == code) return language.name;
    }
    return code == 'ar' ? 'العربية' : 'English';
  }

  String get _languageCode => VentingMobLocalizationsHolder.currentLanguageCode;

  Future<void> _onChangeLanguage() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: VentorProfileTheme.cardFill,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _LanguagePickerSheet(selectedCode: _languageCode),
    );
    if (!mounted || selected == null) return;
    await changeAppLanguage(context, selected);
  }

  Future<void> _onLogout() async {
    final confirmed = await showListenerDestructiveConfirmBottomSheet(
      context: context,
      kind: ListenerDestructiveConfirmKind.logout,
    );
    if (!mounted || confirmed != true) return;
    // TODO: Call logout API / clear session and navigate to auth.
    _todoAction('logout');
  }

  Future<void> _onDeleteAccount() async {
    final confirmed = await showListenerDestructiveConfirmBottomSheet(
      context: context,
      kind: ListenerDestructiveConfirmKind.deleteAccount,
    );
    if (!mounted || confirmed != true) return;
    // TODO: Call delete-account API / clear session and navigate to auth.
    _todoAction('delete account');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final versionLabel = _appVersion == null
        ? '—'
        : l10n.listener_profile_settings_version(_appVersion!);

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
            l10n.ventor_profile_settings_title,
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
            _SettingsSection(
              children: [
                _SettingsTile(
                  icon: Icons.language_rounded,
                  label: l10n.change_language,
                  value: _languageLabel,
                  onTap: _onChangeLanguage,
                ),
                _SettingsTile(
                  icon: Icons.lock_outline_rounded,
                  label: l10n.account_tab_change_password,
                  onTap: () => openListenerChangePasswordScreen(context),
                  showDivider: false,
                ),
              ],
            ),
            const SizedBox(height: 14),
            _SettingsSection(
              children: [
                _SettingsTile(
                  icon: Icons.visibility_outlined,
                  label: l10n.ventor_profile_settings_privacy,
                  subtitle: l10n.ventor_profile_settings_privacy_sub,
                  onTap: () =>
                      openVentorPrivacySettingsScreen(context: context),
                ),
                _SettingsTile(
                  icon: Icons.notifications_none_rounded,
                  label: l10n.ventor_profile_settings_notifications,
                  subtitle: l10n.ventor_profile_settings_notifications_sub,
                  onTap: () =>
                      openVentorNotificationPreferencesScreen(context: context),
                  showDivider: false,
                ),
              ],
            ),
            const SizedBox(height: 14),
            _SettingsSection(
              children: [
                _SettingsTile(
                  icon: Icons.help_outline_rounded,
                  label: l10n.listener_profile_help_support,
                  subtitle: l10n.ventor_profile_settings_help_sub,
                  onTap: () => openListenerHelpSupportScreen(context: context),
                ),
                _SettingsTile(
                  icon: Icons.info_outline_rounded,
                  label: l10n.listener_profile_settings_about,
                  value: versionLabel,
                  onTap: () => openListenerAboutScreen(context: context),
                  showDivider: false,
                ),
              ],
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton.icon(
                onPressed: _onLogout,
                icon: const Icon(Icons.logout_rounded, size: 20),
                label: Text(l10n.account_tab_logout),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFEF4444),
                  side: BorderSide(
                    color: const Color(0xFFEF4444).withValues(alpha: 0.45),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: TextButton(
                onPressed: _onDeleteAccount,
                child: Text(
                  l10n.account_tab_delete_account,
                  style: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Column(children: children),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.subtitle,
    this.value,
    this.showDivider = true,
  });

  final IconData icon;
  final String label;
  final String? subtitle;
  final String? value;
  final VoidCallback onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 2,
          ),
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
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: subtitle == null
              ? null
              : Text(
                  subtitle!,
                  style: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (value != null) ...[
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: Text(
                    value!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.inter(
                      color: VentorProfileTheme.muted,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
              ],
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.white.withValues(alpha: 0.35),
              ),
            ],
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

class _LanguagePickerSheet extends StatelessWidget {
  const _LanguagePickerSheet({required this.selectedCode});

  final String selectedCode;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.change_language,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            for (final language in LanguageConstant.languages)
              ListTile(
                onTap: () => Navigator.of(context).pop(language.languageCode),
                title: Text(
                  language.name,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  language.nameInOtherLang,
                  style: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 12,
                  ),
                ),
                trailing: selectedCode == language.languageCode
                    ? const Icon(
                        Icons.check_rounded,
                        color: SplashColors.purpleMid,
                      )
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}
