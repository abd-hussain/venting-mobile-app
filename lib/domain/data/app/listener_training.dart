import 'package:venting_mobile_app/domain/data/api/listener_training_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_dashboard_setup.dart';

enum ListenerTrainingModuleStatus { completed, inProgress, notStarted }

class ListenerTrainingModule {
  const ListenerTrainingModule({
    required this.id,
    required this.title,
    required this.status,
    required this.contentUrl,
  });

  final String id;
  final String title;
  final ListenerTrainingModuleStatus status;

  /// Tutorial page or video opened when the listener starts this module.
  final String contentUrl;

  ListenerTrainingModule copyWith({
    String? title,
    ListenerTrainingModuleStatus? status,
    String? contentUrl,
  }) {
    return ListenerTrainingModule(
      id: id,
      title: title ?? this.title,
      status: status ?? this.status,
      contentUrl: contentUrl ?? this.contentUrl,
    );
  }
}

class ListenerTrainingProgress {
  const ListenerTrainingProgress({
    required this.modules,
    required this.allCompleted,
    this.setupProgress,
  });

  final List<ListenerTrainingModule> modules;
  final bool allCompleted;
  final ListenerDashboardSetupProgress? setupProgress;
}

ListenerTrainingProgress listenerTrainingProgressFromApi(
  ListenerTrainingData data,
) {
  final modules = [
    for (final module in data.modules) _unlockModuleForPlayback(_moduleFromApi(module)),
  ];

  return ListenerTrainingProgress(
    modules: modules,
    allCompleted: data.all_completed,
    setupProgress: data.setup_progress == null
        ? null
        : listenerDashboardSetupFromApi(data.setup_progress!),
  );
}

ListenerTrainingModule _unlockModuleForPlayback(ListenerTrainingModule module) {
  if (module.status == ListenerTrainingModuleStatus.notStarted) {
    return module.copyWith(status: ListenerTrainingModuleStatus.inProgress);
  }
  return module;
}

ListenerTrainingModule _moduleFromApi(ListenerTrainingModuleModel module) {
  final id = module.id.trim();
  final apiTitle = module.title.trim();

  return ListenerTrainingModule(
    id: id,
    title: apiTitle.isNotEmpty ? apiTitle : id,
    status: _moduleStatusFromApi(module.status),
    contentUrl: module.content_url.trim(),
  );
}

ListenerTrainingModuleStatus _moduleStatusFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'completed' || 'done' => ListenerTrainingModuleStatus.completed,
    'in_progress' || 'in-progress' => ListenerTrainingModuleStatus.inProgress,
    _ => ListenerTrainingModuleStatus.notStarted,
  };
}
