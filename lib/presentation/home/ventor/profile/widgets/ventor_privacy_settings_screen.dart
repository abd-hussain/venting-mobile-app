import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class VentorPrivacySettings {
  const VentorPrivacySettings({
    this.showMoodJourney = true,
    this.showStats = true,
    this.showFavoriteListeners = true,
    this.allowListenerDiscovery = true,
  });

  final bool showMoodJourney;
  final bool showStats;
  final bool showFavoriteListeners;
  final bool allowListenerDiscovery;

  VentorPrivacySettings copyWith({
    bool? showMoodJourney,
    bool? showStats,
    bool? showFavoriteListeners,
    bool? allowListenerDiscovery,
  }) {
    return VentorPrivacySettings(
      showMoodJourney: showMoodJourney ?? this.showMoodJourney,
      showStats: showStats ?? this.showStats,
      showFavoriteListeners:
          showFavoriteListeners ?? this.showFavoriteListeners,
      allowListenerDiscovery:
          allowListenerDiscovery ?? this.allowListenerDiscovery,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VentorPrivacySettings &&
        other.showMoodJourney == showMoodJourney &&
        other.showStats == showStats &&
        other.showFavoriteListeners == showFavoriteListeners &&
        other.allowListenerDiscovery == allowListenerDiscovery;
  }

  @override
  int get hashCode => Object.hash(
    showMoodJourney,
    showStats,
    showFavoriteListeners,
    allowListenerDiscovery,
  );
}

/// Opens ventor Privacy management screen.
Future<void> openVentorPrivacySettingsScreen({
  required BuildContext context,
  VentorPrivacySettings? initial,
}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) => VentorPrivacySettingsScreen(
        initial: initial ?? const VentorPrivacySettings(),
      ),
    ),
  );
}

class VentorPrivacySettingsScreen extends StatefulWidget {
  const VentorPrivacySettingsScreen({
    super.key,
    this.initial = const VentorPrivacySettings(),
  });

  final VentorPrivacySettings initial;

  @override
  State<VentorPrivacySettingsScreen> createState() =>
      _VentorPrivacySettingsScreenState();
}

class _VentorPrivacySettingsScreenState
    extends State<VentorPrivacySettingsScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  late VentorPrivacySettings _settings;
  late final VentorPrivacySettings _initial;

  @override
  void initState() {
    super.initState();
    _initial = widget.initial;
    _settings = widget.initial;
  }

  bool get _hasChanges => _settings != _initial;

  void _onSave() {
    if (!_hasChanges) {
      Navigator.of(context).pop();
      return;
    }
    // TODO: Persist privacy settings via ventor profile API.
    debugPrint('TODO: save ventor privacy settings $_settings');
    Navigator.of(context).pop();
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
            l10n.ventor_profile_settings_privacy,
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
                    _SectionLabel(label: l10n.ventor_privacy_section_profile),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _PreferenceToggle(
                          label: l10n.ventor_privacy_show_mood_journey,
                          value: _settings.showMoodJourney,
                          onChanged: (value) {
                            setState(
                              () => _settings = _settings.copyWith(
                                showMoodJourney: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.ventor_privacy_show_stats,
                          value: _settings.showStats,
                          onChanged: (value) {
                            setState(
                              () => _settings = _settings.copyWith(
                                showStats: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.ventor_privacy_show_favorite_listeners,
                          value: _settings.showFavoriteListeners,
                          onChanged: (value) {
                            setState(
                              () => _settings = _settings.copyWith(
                                showFavoriteListeners: value,
                              ),
                            );
                          },
                          showDivider: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    _SectionLabel(label: l10n.ventor_privacy_section_discovery),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _PreferenceToggle(
                          label: l10n.ventor_privacy_allow_discovery,
                          subtitle: l10n.ventor_privacy_allow_discovery_sub,
                          value: _settings.allowListenerDiscovery,
                          onChanged: (value) {
                            setState(
                              () => _settings = _settings.copyWith(
                                allowListenerDiscovery: value,
                              ),
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
                    child: Text(l10n.ventor_privacy_save),
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
    this.subtitle,
    this.showDivider = true,
  });

  final String label;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile.adaptive(
          value: value,
          onChanged: onChanged,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          activeThumbColor: Colors.white,
          activeTrackColor: SplashColors.purpleMid,
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
              : Text(
                  subtitle!,
                  style: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 12,
                    height: 1.3,
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
