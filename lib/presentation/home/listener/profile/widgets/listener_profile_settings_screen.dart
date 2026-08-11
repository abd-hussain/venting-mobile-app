import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:venting_mobile_app/domain/constants/language_constant.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/edit_phone_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_about_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_change_password_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_destructive_confirm_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_help_support_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_notification_preferences_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_payment_payouts_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_privacy_visibility_screen.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/app_language.dart';

/// Opens the listener Account & Settings screen.
Future<void> openListenerProfileSettingsScreen({
  required BuildContext context,
  String? email,
  String? phoneNumber,
}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) =>
          ListenerProfileSettingsScreen(email: email, phoneNumber: phoneNumber),
    ),
  );
}

class ListenerProfileSettingsScreen extends StatefulWidget {
  const ListenerProfileSettingsScreen({
    super.key,
    this.email,
    this.phoneNumber,
  });

  final String? email;
  final String? phoneNumber;

  @override
  State<ListenerProfileSettingsScreen> createState() =>
      _ListenerProfileSettingsScreenState();
}

class _ListenerProfileSettingsScreenState
    extends State<ListenerProfileSettingsScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  // TODO: Load account details from listener profile API / repository.
  static const _mockPhone = '+1 (555) 123-4567';

  String? _appVersion;
  late String _phone;

  @override
  void initState() {
    super.initState();
    _phone = widget.phoneNumber ?? _mockPhone;
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

  Future<void> _onEditPhone() async {
    final updated = await showEditPhoneBottomSheet(
      context: context,
      initialPhoneDisplay: _phone,
    );
    if (!mounted || updated == null) return;
    setState(() => _phone = updated.displayLabel);
  }

  String get _languageLabel {
    final code = VentingMobLocalizationsHolder.currentLanguageCode;
    for (final language in LanguageConstant.languages) {
      if (language.languageCode == code) return language.name;
    }
    return code == 'ar' ? 'العربية' : 'English';
  }

  Future<void> _onChangeLanguage() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: ListenerProfileTheme.cardFill,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _LanguagePickerSheet(selectedCode: _languageCode),
    );
    if (!mounted || selected == null) return;
    await changeAppLanguage(context, selected);
  }

  String get _languageCode => VentingMobLocalizationsHolder.currentLanguageCode;

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
            l10n.listener_profile_account_settings,
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
              title: l10n.listener_profile_settings_section_account,
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
                ),
                _SettingsTile(
                  icon: Icons.phone_outlined,
                  label: l10n.listener_profile_settings_phone,
                  value: _phone,
                  onTap: _onEditPhone,
                ),
              ],
            ),
            const SizedBox(height: 18),
            _SettingsSection(
              title: l10n.listener_profile_settings_section_preferences,
              children: [
                _SettingsTile(
                  icon: Icons.notifications_none_rounded,
                  label: l10n.listener_profile_notification_preferences,
                  onTap: () => openListenerNotificationPreferencesScreen(
                    context: context,
                  ),
                ),
                _SettingsTile(
                  icon: Icons.gps_fixed_rounded,
                  label: l10n.listener_profile_privacy_visibility,
                  onTap: () =>
                      openListenerPrivacyVisibilityScreen(context: context),
                  showDivider: false,
                ),
              ],
            ),
            const SizedBox(height: 18),
            _SettingsSection(
              title: l10n.listener_profile_settings_section_earnings,
              children: [
                _SettingsTile(
                  icon: Icons.credit_card_rounded,
                  label: l10n.listener_profile_payment_payouts,
                  onTap: () =>
                      openListenerPaymentPayoutsScreen(context: context),
                ),
              ],
            ),
            const SizedBox(height: 18),
            _SettingsSection(
              title: l10n.listener_profile_settings_section_support,
              children: [
                _SettingsTile(
                  icon: Icons.help_outline_rounded,
                  label: l10n.listener_profile_help_support,
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
            _SettingsSection(
              title: l10n.listener_profile_settings_section_account,
              children: [
                _SettingsTile(
                  icon: Icons.logout_rounded,
                  label: l10n.account_tab_logout,
                  onTap: _onLogout,
                  destructive: true,
                  showChevron: false,
                ),
                _SettingsTile(
                  icon: Icons.delete_outline_rounded,
                  label: l10n.account_tab_delete_account,
                  onTap: _onDeleteAccount,
                  destructive: true,
                  showChevron: false,
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

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title, required this.children});

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
              color: SplashColors.purpleMid,
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

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.value,
    this.destructive = false,
    this.showChevron = true,
    this.showDivider = true,
  });

  final IconData icon;
  final String label;
  final String? value;
  final VoidCallback onTap;
  final bool destructive;
  final bool showChevron;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final color = destructive ? const Color(0xFFEF4444) : Colors.white;

    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          leading: Icon(icon, color: color.withValues(alpha: 0.9), size: 22),
          title: Text(
            label,
            style: GoogleFonts.inter(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (value != null) ...[
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 140),
                  child: Text(
                    value!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (showChevron) const SizedBox(width: 6),
              ],
              if (showChevron)
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
                    color: ListenerProfileTheme.muted,
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
