import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

/// Localized display titles for training module ids from `#71` / `#72`.
abstract final class ListenerTrainingCurriculum {
  static String titleForModuleId(VentingMobLocalizations l10n, String id) {
    return switch (id.trim().toLowerCase()) {
      'art_of_listening' => l10n.listener_training_module_art_of_listening,
      'empathy' => l10n.listener_training_module_empathy,
      'boundaries' => l10n.listener_training_module_boundaries,
      'difficult_situations' =>
        l10n.listener_training_module_difficult_situations,
      'crisis_awareness' => l10n.listener_training_module_crisis_awareness,
      _ => id,
    };
  }
}
