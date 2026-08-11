import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/visible_countries_picker.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/country_display_names.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerPrivacyVisibilitySettings {
  const ListenerPrivacyVisibilitySettings({
    this.showOnlineStatus = true,
    this.showLanguages = true,
    this.showComfortAreas = true,
    this.showExperienceAndRatings = true,
    this.showBoundaries = true,
    this.visibleInAllCountries = true,
    this.visibleCountries = const {},
    this.allowSearchIndexing = false,
  });

  final bool showOnlineStatus;
  final bool showLanguages;
  final bool showComfortAreas;
  final bool showExperienceAndRatings;
  final bool showBoundaries;
  final bool visibleInAllCountries;
  final Set<IsoCode> visibleCountries;
  final bool allowSearchIndexing;

  ListenerPrivacyVisibilitySettings copyWith({
    bool? showOnlineStatus,
    bool? showLanguages,
    bool? showComfortAreas,
    bool? showExperienceAndRatings,
    bool? showBoundaries,
    bool? visibleInAllCountries,
    Set<IsoCode>? visibleCountries,
    bool? allowSearchIndexing,
  }) {
    return ListenerPrivacyVisibilitySettings(
      showOnlineStatus: showOnlineStatus ?? this.showOnlineStatus,
      showLanguages: showLanguages ?? this.showLanguages,
      showComfortAreas: showComfortAreas ?? this.showComfortAreas,
      showExperienceAndRatings:
          showExperienceAndRatings ?? this.showExperienceAndRatings,
      showBoundaries: showBoundaries ?? this.showBoundaries,
      visibleInAllCountries:
          visibleInAllCountries ?? this.visibleInAllCountries,
      visibleCountries: visibleCountries ?? this.visibleCountries,
      allowSearchIndexing: allowSearchIndexing ?? this.allowSearchIndexing,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListenerPrivacyVisibilitySettings &&
        other.showOnlineStatus == showOnlineStatus &&
        other.showLanguages == showLanguages &&
        other.showComfortAreas == showComfortAreas &&
        other.showExperienceAndRatings == showExperienceAndRatings &&
        other.showBoundaries == showBoundaries &&
        other.visibleInAllCountries == visibleInAllCountries &&
        _sameCountries(other.visibleCountries, visibleCountries) &&
        other.allowSearchIndexing == allowSearchIndexing;
  }

  static bool _sameCountries(Set<IsoCode> a, Set<IsoCode> b) {
    if (a.length != b.length) return false;
    return a.containsAll(b);
  }

  @override
  int get hashCode => Object.hash(
    showOnlineStatus,
    showLanguages,
    showComfortAreas,
    showExperienceAndRatings,
    showBoundaries,
    visibleInAllCountries,
    Object.hashAllUnordered(visibleCountries),
    allowSearchIndexing,
  );
}

/// Opens the Privacy & Visibility settings screen.
Future<void> openListenerPrivacyVisibilityScreen({
  required BuildContext context,
  ListenerPrivacyVisibilitySettings? initial,
}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) => ListenerPrivacyVisibilityScreen(
        initial: initial ?? const ListenerPrivacyVisibilitySettings(),
      ),
    ),
  );
}

class ListenerPrivacyVisibilityScreen extends StatefulWidget {
  const ListenerPrivacyVisibilityScreen({
    super.key,
    this.initial = const ListenerPrivacyVisibilitySettings(),
  });

  final ListenerPrivacyVisibilitySettings initial;

  @override
  State<ListenerPrivacyVisibilityScreen> createState() =>
      _ListenerPrivacyVisibilityScreenState();
}

class _ListenerPrivacyVisibilityScreenState
    extends State<ListenerPrivacyVisibilityScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  late ListenerPrivacyVisibilitySettings _settings;
  late final ListenerPrivacyVisibilitySettings _initial;

  @override
  void initState() {
    super.initState();
    _initial = widget.initial;
    _settings = widget.initial;
  }

  bool get _hasChanges => _settings != _initial;

  String _countriesValueLabel(VentingMobLocalizations l10n) {
    if (_settings.visibleInAllCountries) {
      return l10n.listener_privacy_all_countries;
    }
    final count = _settings.visibleCountries.length;
    if (count == 0) return l10n.listener_privacy_select_countries;
    if (count == 1) {
      return countryDisplayName(
        _settings.visibleCountries.first,
        languageCode: Localizations.localeOf(context).languageCode,
      );
    }
    return l10n.listener_privacy_countries_count(count);
  }

  Future<void> _onEditVisibleCountries() async {
    final result = await showVisibleCountriesPicker(
      context: context,
      allCountries: _settings.visibleInAllCountries,
      selectedCountries: _settings.visibleCountries,
    );
    if (!mounted || result == null) return;
    setState(() {
      _settings = _settings.copyWith(
        visibleInAllCountries: result.allCountries,
        visibleCountries: result.countries,
      );
    });
  }

  void _onSave() {
    if (!_settings.visibleInAllCountries &&
        _settings.visibleCountries.isEmpty) {
      final l10n = VentingMobLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.listener_privacy_countries_required)),
      );
      return;
    }
    if (!_hasChanges) {
      Navigator.of(context).pop();
      return;
    }
    // TODO: Persist privacy & visibility settings via listener profile API.
    debugPrint('TODO: save privacy visibility $_settings');
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
            l10n.listener_profile_privacy_visibility,
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
                    _SectionLabel(
                      label: l10n.listener_privacy_section_visibility,
                    ),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _PreferenceToggle(
                          label: l10n.listener_privacy_online_status,
                          subtitle: l10n.listener_privacy_show_when_online,
                          value: _settings.showOnlineStatus,
                          onChanged: (value) {
                            setState(
                              () => _settings = _settings.copyWith(
                                showOnlineStatus: value,
                              ),
                            );
                          },
                        ),
                        _NavigationTile(
                          label: l10n.listener_privacy_show_profile_in,
                          value: _countriesValueLabel(l10n),
                          onTap: _onEditVisibleCountries,
                          showDivider: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    _SectionLabel(
                      label: l10n.listener_privacy_section_information,
                    ),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _PreferenceToggle(
                          label: l10n.listener_privacy_show_languages,
                          value: _settings.showLanguages,
                          onChanged: (value) {
                            setState(
                              () => _settings = _settings.copyWith(
                                showLanguages: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.listener_privacy_show_comfort_areas,
                          value: _settings.showComfortAreas,
                          onChanged: (value) {
                            setState(
                              () => _settings = _settings.copyWith(
                                showComfortAreas: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.listener_privacy_show_experience_ratings,
                          value: _settings.showExperienceAndRatings,
                          onChanged: (value) {
                            setState(
                              () => _settings = _settings.copyWith(
                                showExperienceAndRatings: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.listener_privacy_show_boundaries,
                          value: _settings.showBoundaries,
                          onChanged: (value) {
                            setState(
                              () => _settings = _settings.copyWith(
                                showBoundaries: value,
                              ),
                            );
                          },
                          showDivider: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    _SectionLabel(
                      label: l10n.listener_privacy_section_activity,
                    ),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _PreferenceToggle(
                          label: l10n.listener_privacy_allow_search_indexing,
                          value: _settings.allowSearchIndexing,
                          onChanged: (value) {
                            setState(
                              () => _settings = _settings.copyWith(
                                allowSearchIndexing: value,
                              ),
                            );
                          },
                          showDivider: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        l10n.listener_privacy_search_indexing_hint,
                        style: GoogleFonts.inter(
                          color: ListenerProfileTheme.muted,
                          fontSize: 12,
                          height: 1.35,
                        ),
                      ),
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
                    child: Text(l10n.listener_privacy_save),
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
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: GoogleFonts.inter(
                          color: ListenerProfileTheme.muted,
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeThumbColor: Colors.white,
                activeTrackColor: SplashColors.purpleMid,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: const Color(0xFF3A3348),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
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

class _NavigationTile extends StatelessWidget {
  const _NavigationTile({
    required this.label,
    required this.value,
    required this.onTap,
    this.showDivider = true,
  });

  final String label;
  final String value;
  final VoidCallback onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 10, 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 140),
                  child: Text(
                    value,
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
                const SizedBox(width: 4),
                Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.white.withValues(alpha: 0.35),
                ),
              ],
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
