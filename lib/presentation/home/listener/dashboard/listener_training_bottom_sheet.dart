import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_training_curriculum.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Opens the Active Listening Training sheet after registration setup.
Future<bool?> openListenerTrainingBottomSheet({required BuildContext context}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const ListenerTrainingBottomSheet(),
  );
}

class ListenerTrainingBottomSheet extends StatefulWidget {
  const ListenerTrainingBottomSheet({super.key});

  @override
  State<ListenerTrainingBottomSheet> createState() =>
      _ListenerTrainingBottomSheetState();
}

class _ListenerTrainingBottomSheetState
    extends State<ListenerTrainingBottomSheet> {
  static const _sheetFill = Color(0xFF1C1826);
  static const _rowFill = Color(0xFF15101F);
  static const _lockedIconBg = Color(0xFF2A2436);

  late List<ListenerTrainingModule> _modules;
  var _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;

    final l10n = VentingMobLocalizations.of(context);
    _modules = ListenerTrainingCurriculum.mockModules(
      artOfListening: l10n.listener_training_module_art_of_listening,
      empathy: l10n.listener_training_module_empathy,
      boundaries: l10n.listener_training_module_boundaries,
      difficultSituations: l10n.listener_training_module_difficult_situations,
      crisisAwareness: l10n.listener_training_module_crisis_awareness,
    );
  }

  bool get _allCompleted => _modules.every(
    (module) => module.status == ListenerTrainingModuleStatus.completed,
  );

  String _statusLabel(
    VentingMobLocalizations l10n,
    ListenerTrainingModuleStatus status,
  ) {
    return switch (status) {
      ListenerTrainingModuleStatus.completed =>
        l10n.listener_training_status_completed,
      ListenerTrainingModuleStatus.inProgress =>
        l10n.listener_training_status_in_progress,
      ListenerTrainingModuleStatus.notStarted =>
        l10n.listener_training_status_not_started,
    };
  }

  void _continueLearning() {
    if (_allCompleted) {
      Navigator.of(context).pop(true);
      return;
    }

    setState(() {
      final currentIndex = _modules.indexWhere(
        (module) => module.status == ListenerTrainingModuleStatus.inProgress,
      );

      if (currentIndex >= 0) {
        _modules[currentIndex] = _modules[currentIndex].copyWith(
          status: ListenerTrainingModuleStatus.completed,
        );
        if (currentIndex + 1 < _modules.length) {
          _modules[currentIndex + 1] = _modules[currentIndex + 1].copyWith(
            status: ListenerTrainingModuleStatus.inProgress,
          );
        }
        return;
      }

      final nextLocked = _modules.indexWhere(
        (module) => module.status == ListenerTrainingModuleStatus.notStarted,
      );
      if (nextLocked >= 0) {
        _modules[nextLocked] = _modules[nextLocked].copyWith(
          status: ListenerTrainingModuleStatus.inProgress,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: bottomInset + 12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: SplashColors.purpleMid,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '9',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  l10n.listener_dashboard_setup_training,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.fromLTRB(18, 20, 18, 16),
              decoration: BoxDecoration(
                color: _sheetFill,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: ListenerProfileTheme.cardBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.listener_training_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.listener_training_subtitle,
                    style: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 18),
                  for (var i = 0; i < _modules.length; i++) ...[
                    _TrainingModuleRow(
                      index: i + 1,
                      title: _modules[i].title,
                      status: _modules[i].status,
                      statusLabel: _statusLabel(l10n, _modules[i].status),
                      rowFill: _rowFill,
                      lockedIconBg: _lockedIconBg,
                    ),
                    if (i != _modules.length - 1) const SizedBox(height: 10),
                  ],
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 54,
                    child: FilledButton(
                      onPressed: _continueLearning,
                      style: FilledButton.styleFrom(
                        backgroundColor: SplashColors.purpleMid,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: Text(
                        _allCompleted
                            ? l10n.listener_training_finish
                            : l10n.listener_training_continue_learning,
                      ),
                    ),
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

class _TrainingModuleRow extends StatelessWidget {
  const _TrainingModuleRow({
    required this.index,
    required this.title,
    required this.status,
    required this.statusLabel,
    required this.rowFill,
    required this.lockedIconBg,
  });

  final int index;
  final String title;
  final ListenerTrainingModuleStatus status;
  final String statusLabel;
  final Color rowFill;
  final Color lockedIconBg;

  @override
  Widget build(BuildContext context) {
    final statusColor = switch (status) {
      ListenerTrainingModuleStatus.completed => ListenerProfileTheme.success,
      ListenerTrainingModuleStatus.inProgress => ListenerProfileTheme.muted,
      ListenerTrainingModuleStatus.notStarted => ListenerProfileTheme.muted,
    };

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      decoration: BoxDecoration(
        color: rowFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$index. $title',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  statusLabel,
                  style: GoogleFonts.inter(
                    color: statusColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _ModuleStatusIcon(status: status, lockedIconBg: lockedIconBg),
        ],
      ),
    );
  }
}

class _ModuleStatusIcon extends StatelessWidget {
  const _ModuleStatusIcon({required this.status, required this.lockedIconBg});

  final ListenerTrainingModuleStatus status;
  final Color lockedIconBg;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      ListenerTrainingModuleStatus.completed => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: ListenerProfileTheme.success,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.check_rounded, color: Colors.white, size: 22),
      ),
      ListenerTrainingModuleStatus.inProgress => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: SplashColors.purpleMid,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.stacked_bar_chart_rounded,
          color: Colors.white,
          size: 22,
        ),
      ),
      ListenerTrainingModuleStatus.notStarted => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: lockedIconBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.lock_rounded, color: Colors.white, size: 20),
      ),
    };
  }
}
