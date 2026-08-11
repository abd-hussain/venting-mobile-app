import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class VentorNotificationPreferences {
  const VentorNotificationPreferences({
    this.pushEnabled = true,
    this.sessionReminder30Min = true,
    this.sessionReminder15Min = true,
    this.sessionReminder10Min = true,
    this.sessionReminder5Min = true,
    this.rewardsUpdates = true,
    this.promotionsUpdates = false,
    this.emailEnabled = true,
  });

  final bool pushEnabled;
  final bool sessionReminder30Min;
  final bool sessionReminder15Min;
  final bool sessionReminder10Min;
  final bool sessionReminder5Min;
  final bool rewardsUpdates;
  final bool promotionsUpdates;
  final bool emailEnabled;

  VentorNotificationPreferences copyWith({
    bool? pushEnabled,
    bool? sessionReminder30Min,
    bool? sessionReminder15Min,
    bool? sessionReminder10Min,
    bool? sessionReminder5Min,
    bool? rewardsUpdates,
    bool? promotionsUpdates,
    bool? emailEnabled,
  }) {
    return VentorNotificationPreferences(
      pushEnabled: pushEnabled ?? this.pushEnabled,
      sessionReminder30Min: sessionReminder30Min ?? this.sessionReminder30Min,
      sessionReminder15Min: sessionReminder15Min ?? this.sessionReminder15Min,
      sessionReminder10Min: sessionReminder10Min ?? this.sessionReminder10Min,
      sessionReminder5Min: sessionReminder5Min ?? this.sessionReminder5Min,
      rewardsUpdates: rewardsUpdates ?? this.rewardsUpdates,
      promotionsUpdates: promotionsUpdates ?? this.promotionsUpdates,
      emailEnabled: emailEnabled ?? this.emailEnabled,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VentorNotificationPreferences &&
        other.pushEnabled == pushEnabled &&
        other.sessionReminder30Min == sessionReminder30Min &&
        other.sessionReminder15Min == sessionReminder15Min &&
        other.sessionReminder10Min == sessionReminder10Min &&
        other.sessionReminder5Min == sessionReminder5Min &&
        other.rewardsUpdates == rewardsUpdates &&
        other.promotionsUpdates == promotionsUpdates &&
        other.emailEnabled == emailEnabled;
  }

  @override
  int get hashCode => Object.hash(
    pushEnabled,
    sessionReminder30Min,
    sessionReminder15Min,
    sessionReminder10Min,
    sessionReminder5Min,
    rewardsUpdates,
    promotionsUpdates,
    emailEnabled,
  );
}

/// Opens ventor Notification management screen.
Future<void> openVentorNotificationPreferencesScreen({
  required BuildContext context,
  VentorNotificationPreferences? initial,
}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) => VentorNotificationPreferencesScreen(
        initial: initial ?? const VentorNotificationPreferences(),
      ),
    ),
  );
}

class VentorNotificationPreferencesScreen extends StatefulWidget {
  const VentorNotificationPreferencesScreen({
    super.key,
    this.initial = const VentorNotificationPreferences(),
  });

  final VentorNotificationPreferences initial;

  @override
  State<VentorNotificationPreferencesScreen> createState() =>
      _VentorNotificationPreferencesScreenState();
}

class _VentorNotificationPreferencesScreenState
    extends State<VentorNotificationPreferencesScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  late VentorNotificationPreferences _prefs;
  late final VentorNotificationPreferences _initial;

  @override
  void initState() {
    super.initState();
    _initial = widget.initial;
    _prefs = widget.initial;
  }

  bool get _hasChanges => _prefs != _initial;

  void _onSave() {
    if (!_hasChanges) {
      Navigator.of(context).pop();
      return;
    }
    // TODO: Persist notification preferences via ventor profile API.
    debugPrint('TODO: save ventor notification preferences $_prefs');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final categoriesEnabled = _prefs.pushEnabled;

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
            l10n.ventor_profile_settings_notifications,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  children: [
                    _SectionLabel(label: l10n.ventor_notif_section_push),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _PreferenceToggle(
                          label: l10n.ventor_notif_receive_push,
                          value: _prefs.pushEnabled,
                          onChanged: (value) {
                            setState(
                              () =>
                                  _prefs = _prefs.copyWith(pushEnabled: value),
                            );
                          },
                          showDivider: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    _SectionLabel(
                      label: l10n.ventor_notif_section_session_reminders,
                    ),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _PreferenceToggle(
                          label: l10n.ventor_notif_session_reminder_30,
                          value: _prefs.sessionReminder30Min,
                          enabled: categoriesEnabled,
                          onChanged: (value) {
                            setState(
                              () => _prefs = _prefs.copyWith(
                                sessionReminder30Min: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.ventor_notif_session_reminder_15,
                          value: _prefs.sessionReminder15Min,
                          enabled: categoriesEnabled,
                          onChanged: (value) {
                            setState(
                              () => _prefs = _prefs.copyWith(
                                sessionReminder15Min: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.ventor_notif_session_reminder_10,
                          value: _prefs.sessionReminder10Min,
                          enabled: categoriesEnabled,
                          onChanged: (value) {
                            setState(
                              () => _prefs = _prefs.copyWith(
                                sessionReminder10Min: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.ventor_notif_session_reminder_5,
                          value: _prefs.sessionReminder5Min,
                          enabled: categoriesEnabled,
                          onChanged: (value) {
                            setState(
                              () => _prefs = _prefs.copyWith(
                                sessionReminder5Min: value,
                              ),
                            );
                          },
                          showDivider: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    _SectionLabel(label: l10n.ventor_notif_section_activity),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _PreferenceToggle(
                          label: l10n.ventor_notif_rewards_updates,
                          value: _prefs.rewardsUpdates,
                          enabled: categoriesEnabled,
                          onChanged: (value) {
                            setState(
                              () => _prefs = _prefs.copyWith(
                                rewardsUpdates: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.ventor_notif_promotions,
                          value: _prefs.promotionsUpdates,
                          enabled: categoriesEnabled,
                          onChanged: (value) {
                            setState(
                              () => _prefs = _prefs.copyWith(
                                promotionsUpdates: value,
                              ),
                            );
                          },
                          showDivider: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    _SectionLabel(label: l10n.ventor_notif_section_email),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _PreferenceToggle(
                          label: l10n.ventor_notif_receive_email,
                          value: _prefs.emailEnabled,
                          onChanged: (value) {
                            setState(
                              () =>
                                  _prefs = _prefs.copyWith(emailEnabled: value),
                            );
                          },
                          showDivider: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton(
                    onPressed: _onSave,
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text(l10n.ventor_notif_save),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: Colors.white.withValues(alpha: 0.85),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ToggleCard extends StatelessWidget {
  const _ToggleCard({required this.children});

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

class _PreferenceToggle extends StatelessWidget {
  const _PreferenceToggle({
    required this.label,
    required this.value,
    required this.onChanged,
    this.enabled = true,
    this.showDivider = true,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool enabled;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile.adaptive(
          value: value,
          onChanged: enabled ? onChanged : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          activeThumbColor: Colors.white,
          activeTrackColor: SplashColors.purpleMid,
          title: Text(
            label,
            style: GoogleFonts.inter(
              color: enabled
                  ? Colors.white
                  : Colors.white.withValues(alpha: 0.45),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 14,
            endIndent: 14,
            color: Colors.white.withValues(alpha: 0.06),
          ),
      ],
    );
  }
}
