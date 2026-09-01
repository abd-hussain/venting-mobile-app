import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_notification_preferences.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/bloc/notification_preferences/ventor_notification_preferences_bloc.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Opens ventor Notification management screen.
Future<void> openVentorNotificationPreferencesScreen({
  required BuildContext context,
}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) =>
            diContainer<VentorNotificationPreferencesBloc>()
              ..add(const VentorNotificationPreferencesEvent.started()),
        child: const VentorNotificationPreferencesScreen(),
      ),
    ),
  );
}

class VentorNotificationPreferencesScreen extends StatefulWidget {
  const VentorNotificationPreferencesScreen({super.key});

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

  VentorNotificationPreferences? _prefs;
  VentorNotificationPreferences? _initial;

  bool get _hasChanges => _prefs != null && _prefs != _initial;

  void _applyLoadedPreferences(VentorNotificationPreferences preferences) {
    if (_prefs != null) return;
    setState(() {
      _initial = preferences;
      _prefs = preferences;
    });
  }

  void _onSave() {
    final prefs = _prefs;
    if (prefs == null) return;

    if (!_hasChanges) {
      Navigator.of(context).pop();
      return;
    }

    context.read<VentorNotificationPreferencesBloc>().add(
      VentorNotificationPreferencesEvent.saveRequested(preferences: prefs),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return BlocConsumer<
      VentorNotificationPreferencesBloc,
      VentorNotificationPreferencesState
    >(
      listenWhen: (previous, current) =>
          previous.status != current.status ||
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.isReady && state.savedPreferences != null) {
          _applyLoadedPreferences(state.savedPreferences!);
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
              onRetry: () => context
                  .read<VentorNotificationPreferencesBloc>()
                  .add(const VentorNotificationPreferencesEvent.started()),
            ),
          );
        }

        if (state.isLoading || _prefs == null) {
          return _buildScaffold(
            l10n: l10n,
            body: const _VentorNotificationPreferencesShimmer(),
          );
        }

        final prefs = _prefs!;
        final categoriesEnabled = prefs.pushEnabled;
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
                    _SectionLabel(label: l10n.ventor_notif_section_push),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _PreferenceToggle(
                          label: l10n.ventor_notif_receive_push,
                          value: prefs.pushEnabled,
                          onChanged: isSaving
                              ? null
                              : (value) {
                                  setState(
                                    () => _prefs = prefs.copyWith(
                                      pushEnabled: value,
                                    ),
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
                          value: prefs.sessionReminder30Min,
                          enabled: categoriesEnabled && !isSaving,
                          onChanged: (value) {
                            setState(
                              () => _prefs = prefs.copyWith(
                                sessionReminder30Min: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.ventor_notif_session_reminder_15,
                          value: prefs.sessionReminder15Min,
                          enabled: categoriesEnabled && !isSaving,
                          onChanged: (value) {
                            setState(
                              () => _prefs = prefs.copyWith(
                                sessionReminder15Min: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.ventor_notif_session_reminder_10,
                          value: prefs.sessionReminder10Min,
                          enabled: categoriesEnabled && !isSaving,
                          onChanged: (value) {
                            setState(
                              () => _prefs = prefs.copyWith(
                                sessionReminder10Min: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.ventor_notif_session_reminder_5,
                          value: prefs.sessionReminder5Min,
                          enabled: categoriesEnabled && !isSaving,
                          onChanged: (value) {
                            setState(
                              () => _prefs = prefs.copyWith(
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
                          value: prefs.rewardsUpdates,
                          enabled: categoriesEnabled && !isSaving,
                          onChanged: (value) {
                            setState(
                              () => _prefs = prefs.copyWith(
                                rewardsUpdates: value,
                              ),
                            );
                          },
                        ),
                        _PreferenceToggle(
                          label: l10n.ventor_notif_promotions,
                          value: prefs.promotionsUpdates,
                          enabled: categoriesEnabled && !isSaving,
                          onChanged: (value) {
                            setState(
                              () => _prefs = prefs.copyWith(
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
                          value: prefs.emailEnabled,
                          onChanged: isSaving
                              ? null
                              : (value) {
                                  setState(
                                    () => _prefs = prefs.copyWith(
                                      emailEnabled: value,
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
                    onPressed: isSaving ? null : _onSave,
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      disabledBackgroundColor: SplashColors.purpleMid
                          .withValues(alpha: 0.5),
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
                    child: isSaving
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          )
                        : Text(l10n.ventor_notif_save),
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
            l10n.ventor_profile_settings_notifications,
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

class _VentorNotificationPreferencesShimmer extends StatelessWidget {
  const _VentorNotificationPreferencesShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF2A2438),
      highlightColor: const Color(0xFF3A3348),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        children: const [
          _ShimmerLine(width: 120, height: 14),
          SizedBox(height: 8),
          _ShimmerToggleCard(rows: 1),
          SizedBox(height: 22),
          _ShimmerLine(width: 140, height: 14),
          SizedBox(height: 8),
          _ShimmerToggleCard(rows: 4),
          SizedBox(height: 22),
          _ShimmerLine(width: 100, height: 14),
          SizedBox(height: 8),
          _ShimmerToggleCard(rows: 2),
          SizedBox(height: 22),
          _ShimmerLine(width: 80, height: 14),
          SizedBox(height: 8),
          _ShimmerToggleCard(rows: 1),
        ],
      ),
    );
  }
}

class _ShimmerToggleCard extends StatelessWidget {
  const _ShimmerToggleCard({required this.rows});

  final int rows;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Column(
        children: [
          for (var i = 0; i < rows; i++)
            _ShimmerToggleRow(showDivider: i < rows - 1),
        ],
      ),
    );
  }
}

class _ShimmerToggleRow extends StatelessWidget {
  const _ShimmerToggleRow({required this.showDivider});

  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Expanded(child: _ShimmerLine(width: 180, height: 14)),
              SizedBox(width: 12),
              _ShimmerLine(
                width: 46,
                height: 28,
                borderRadius: BorderRadius.all(Radius.circular(14)),
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
  final ValueChanged<bool>? onChanged;
  final bool enabled;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final interactive = enabled && onChanged != null;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: interactive
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.4),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Switch(
                value: value,
                onChanged: interactive ? onChanged : null,
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
