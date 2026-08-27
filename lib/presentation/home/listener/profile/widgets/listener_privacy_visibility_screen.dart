import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/listener_privacy_settings.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/bloc/privacy_visibility/listener_privacy_visibility_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/visible_countries_picker.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/country_display_names.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Opens the Privacy & Visibility settings screen.
Future<void> openListenerPrivacyVisibilityScreen({
  required BuildContext context,
}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) =>
            diContainer<ListenerPrivacyVisibilityBloc>()
              ..add(const ListenerPrivacyVisibilityEvent.started()),
        child: const ListenerPrivacyVisibilityScreen(),
      ),
    ),
  );
}

class ListenerPrivacyVisibilityScreen extends StatefulWidget {
  const ListenerPrivacyVisibilityScreen({super.key});

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

  ListenerPrivacyVisibilitySettings? _settings;
  ListenerPrivacyVisibilitySettings? _initial;

  bool get _hasChanges => _settings != null && _settings != _initial;

  void _applyLoadedSettings(ListenerPrivacyVisibilitySettings settings) {
    if (_settings != null) return;
    setState(() {
      _initial = settings;
      _settings = settings;
    });
  }

  String _countriesValueLabel(VentingMobLocalizations l10n) {
    final settings = _settings;
    if (settings == null) return '';
    if (settings.visibleInAllCountries) {
      return l10n.listener_privacy_all_countries;
    }
    final count = settings.visibleCountries.length;
    if (count == 0) return l10n.listener_privacy_select_countries;
    if (count == 1) {
      return countryDisplayName(
        settings.visibleCountries.first,
        languageCode: Localizations.localeOf(context).languageCode,
      );
    }
    return l10n.listener_privacy_countries_count(count);
  }

  Future<void> _onEditVisibleCountries() async {
    final settings = _settings;
    if (settings == null) return;

    final result = await showVisibleCountriesPicker(
      context: context,
      allCountries: settings.visibleInAllCountries,
      selectedCountries: settings.visibleCountries,
    );
    if (!mounted || result == null) return;
    setState(() {
      _settings = settings.copyWith(
        visibleInAllCountries: result.allCountries,
        visibleCountries: result.countries,
      );
    });
  }

  void _onSave() {
    final settings = _settings;
    if (settings == null) return;

    if (!settings.visibleInAllCountries && settings.visibleCountries.isEmpty) {
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

    context.read<ListenerPrivacyVisibilityBloc>().add(
      ListenerPrivacyVisibilityEvent.saveRequested(settings: settings),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return BlocConsumer<
      ListenerPrivacyVisibilityBloc,
      ListenerPrivacyVisibilityState
    >(
      listenWhen: (previous, current) =>
          previous.status != current.status ||
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.isReady && state.savedSettings != null) {
          _applyLoadedSettings(state.savedSettings!);
        }

        if (state.isSaveSuccess) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state.isLoadFailure) {
          return _buildScaffold(
            l10n: l10n,
            body: _ErrorBody(
              message: state.errorMessage,
              onRetry: () => context.read<ListenerPrivacyVisibilityBloc>().add(
                const ListenerPrivacyVisibilityEvent.started(),
              ),
            ),
          );
        }

        if (state.isLoading || _settings == null) {
          return _buildScaffold(
            l10n: l10n,
            body: const _ListenerPrivacyVisibilityShimmer(),
          );
        }

        final settings = _settings!;
        final isSaving = state.isSaving;

        return _buildScaffold(
          l10n: l10n,
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  children: [
                    if (state.isSaveFailure && state.errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          state.errorMessage,
                          style: GoogleFonts.inter(
                            color: const Color(0xFFEF4444),
                            fontSize: 13,
                            height: 1.35,
                          ),
                        ),
                      ),
                    _SectionLabel(
                      label: l10n.listener_privacy_section_visibility,
                    ),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _PreferenceToggle(
                          label: l10n.listener_privacy_profile_visible,
                          subtitle: l10n.listener_privacy_profile_visible_sub,
                          value: settings.profileVisible,
                          onChanged: isSaving
                              ? null
                              : (value) {
                                  setState(
                                    () => _settings = settings.copyWith(
                                      profileVisible: value,
                                    ),
                                  );
                                },
                        ),
                        _PreferenceToggle(
                          label: l10n.listener_privacy_online_status,
                          subtitle: l10n.listener_privacy_show_when_online,
                          value: settings.showOnlineStatus,
                          onChanged: isSaving || !settings.profileVisible
                              ? null
                              : (value) {
                                  setState(
                                    () => _settings = settings.copyWith(
                                      showOnlineStatus: value,
                                    ),
                                  );
                                },
                        ),
                        _NavigationTile(
                          label: l10n.listener_privacy_show_profile_in,
                          value: _countriesValueLabel(l10n),
                          onTap: isSaving || !settings.profileVisible
                              ? null
                              : _onEditVisibleCountries,
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
                          value: settings.allowSearchIndexing,
                          onChanged: isSaving
                              ? null
                              : (value) {
                                  setState(
                                    () => _settings = settings.copyWith(
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
                    onPressed: isSaving ? null : _onSave,
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: SplashColors.purpleMid
                          .withValues(alpha: 0.55),
                      disabledForegroundColor: Colors.white.withValues(
                        alpha: 0.7,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: isSaving
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.2,
                              color: Colors.white,
                            ),
                          )
                        : Text(l10n.listener_privacy_save),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScaffold({
    required VentingMobLocalizations l10n,
    required Widget body,
  }) {
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
        body: SafeArea(child: body),
      ),
    );
  }
}

class _ListenerPrivacyVisibilityShimmer extends StatelessWidget {
  const _ListenerPrivacyVisibilityShimmer();

  static const _baseColor = Color(0xFF2A2140);
  static const _highlightColor = Color(0xFF3A2F52);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              children: const [
                _ShimmerSectionLabel(width: 108),
                SizedBox(height: 8),
                _ShimmerToggleCard(
                  children: [
                    _ShimmerToggleRow(hasSubtitle: true),
                    _ShimmerDivider(),
                    _ShimmerToggleRow(hasSubtitle: true),
                    _ShimmerDivider(),
                    _ShimmerNavigationRow(),
                  ],
                ),
                SizedBox(height: 22),
                _ShimmerSectionLabel(width: 96),
                SizedBox(height: 8),
                _ShimmerToggleCard(
                  children: [
                    _ShimmerToggleRow(hasSubtitle: false, showDivider: false),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ShimmerLine(width: double.infinity, height: 12),
                      SizedBox(height: 6),
                      _ShimmerLine(width: 220, height: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: _ShimmerLine(
              width: double.infinity,
              height: 54,
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShimmerSectionLabel extends StatelessWidget {
  const _ShimmerSectionLabel({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: _ShimmerLine(
        width: width,
        height: 13,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
    );
  }
}

class _ShimmerToggleCard extends StatelessWidget {
  const _ShimmerToggleCard({required this.children});

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

class _ShimmerToggleRow extends StatelessWidget {
  const _ShimmerToggleRow({required this.hasSubtitle, this.showDivider = true});

  final bool hasSubtitle;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _ShimmerLine(width: 168, height: 14),
                    if (hasSubtitle) ...[
                      const SizedBox(height: 8),
                      const _ShimmerLine(width: 228, height: 11),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const _ShimmerLine(
                width: 46,
                height: 28,
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
            ],
          ),
        ),
        if (showDivider) const _ShimmerDivider(),
      ],
    );
  }
}

class _ShimmerNavigationRow extends StatelessWidget {
  const _ShimmerNavigationRow();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(14, 14, 10, 14),
      child: Row(
        children: [
          Expanded(child: _ShimmerLine(width: 132, height: 14)),
          SizedBox(width: 12),
          _ShimmerLine(width: 72, height: 13),
          SizedBox(width: 8),
          _ShimmerLine(
            width: 18,
            height: 18,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ],
      ),
    );
  }
}

class _ShimmerDivider extends StatelessWidget {
  const _ShimmerDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: 14,
      endIndent: 14,
      color: Colors.white.withValues(alpha: 0.06),
    );
  }
}

class _ShimmerLine extends StatelessWidget {
  const _ShimmerLine({
    required this.width,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
  });

  final double width;
  final double height;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              style: FilledButton.styleFrom(
                backgroundColor: SplashColors.purpleMid,
                foregroundColor: Colors.white,
              ),
              child: Text(l10n.common_retry),
            ),
          ],
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
  final ValueChanged<bool>? onChanged;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final enabled = onChanged != null;

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
                        color: enabled
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.45),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: GoogleFonts.inter(
                          color: ListenerProfileTheme.muted.withValues(
                            alpha: enabled ? 1 : 0.55,
                          ),
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
  final VoidCallback? onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;

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
                      color: enabled
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.45),
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
                      color: ListenerProfileTheme.muted.withValues(
                        alpha: enabled ? 1 : 0.55,
                      ),
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
