import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:venting_mobile_app/domain/constants/language_constant.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/change_password/change_password_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_help_support_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/widgets/ventor_notification_preferences_screen.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/about/about_screen.dart';
import 'package:venting_mobile_app/shared_widgets/bottom_sheets/logout_delete_account_confirm/logout_delete_account_confirm_sheet.dart';
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

  static const _logoutColor = Color(0xFFE86B7A);

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
    await showLogoutDeleteAccountConfirmBottomSheet(
      context: context,
      kind: LogoutDeleteAccountConfirmKind.logout,
    );
  }

  Future<void> _onDeleteAccount() async {
    await showLogoutDeleteAccountConfirmBottomSheet(
      context: context,
      kind: LogoutDeleteAccountConfirmKind.deleteAccount,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final versionLabel = _appVersion == null
        ? '—'
        : l10n.ventor_profile_settings_version(_appVersion!);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundBottom,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 16, 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      l10n.ventor_profile_settings_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                  children: [
                    _SettingsSection(
                      title: l10n.ventor_profile_settings_section_preferences,
                      children: [
                        _SettingsTile(
                          icon: Icons.language_rounded,
                          label: l10n.change_language,
                          value: _languageLabel,
                          onTap: _onChangeLanguage,
                          showDivider: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    _SettingsSection(
                      title: l10n.ventor_profile_settings_section_security,
                      children: [
                        _SettingsTile(
                          icon: Icons.lock_outline_rounded,
                          label: l10n.account_tab_change_password,
                          onTap: () => openChangePasswordScreen(context),
                        ),
                        _SettingsTile(
                          icon: Icons.notifications_none_rounded,
                          label: l10n.ventor_profile_settings_notifications,
                          value: l10n.ventor_profile_settings_notifications_sub,
                          onTap: () => openVentorNotificationPreferencesScreen(
                            context: context,
                          ),
                          showDivider: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    _SettingsSection(
                      title: l10n.ventor_profile_settings_section_support,
                      children: [
                        _SettingsTile(
                          icon: Icons.help_outline_rounded,
                          label: l10n.listener_profile_help_support,
                          value: l10n.ventor_profile_settings_help_sub,
                          onTap: () =>
                              openListenerHelpSupportScreen(context: context),
                        ),
                        _SettingsTile(
                          icon: Icons.info_outline_rounded,
                          label: l10n.listener_profile_settings_about,
                          value: versionLabel,
                          onTap: () => openAboutScreen(context: context),
                          showDivider: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _onLogout,
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _logoutColor.withValues(alpha: 0.7),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.logout_rounded,
                                size: 22,
                                color: _logoutColor,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  l10n.account_tab_logout,
                                  style: GoogleFonts.inter(
                                    color: _logoutColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: _logoutColor.withValues(alpha: 0.7),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Center(
                      child: TextButton(
                        onPressed: _onDeleteAccount,
                        style: TextButton.styleFrom(
                          foregroundColor: VentorProfileTheme.muted,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          l10n.account_tab_delete_account,
                          style: GoogleFonts.inter(
                            color: VentorProfileTheme.muted,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Text(
            title,
            style: GoogleFonts.inter(
              color: VentorProfileTheme.muted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: VentorProfileTheme.cardFill,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: VentorProfileTheme.cardBorder),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.value,
    this.showDivider = true,
  });

  final IconData icon;
  final String label;
  final String? value;
  final VoidCallback onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white.withValues(alpha: 0.92),
                  size: 22,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    label,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (value != null) ...[
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 130),
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
                  const SizedBox(width: 6),
                ],
                Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.white.withValues(alpha: 0.45),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 52,
            endIndent: 16,
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
