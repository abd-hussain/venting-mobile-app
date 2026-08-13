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
    ListenerTrainingModuleStatus? status,
    String? contentUrl,
  }) {
    return ListenerTrainingModule(
      id: id,
      title: title,
      status: status ?? this.status,
      contentUrl: contentUrl ?? this.contentUrl,
    );
  }
}

/// Active-listening curriculum shown after registration.
///
/// Each module opens [ListenerTrainingModule.contentUrl]. Opening marks it done
/// and unlocks the next module. Completing every module passes training.
abstract final class ListenerTrainingCurriculum {
  // TODO: Replace mock tutorial URLs with real Venting training content.
  static const _artOfListeningUrl =
      'https://www.youtube.com/watch?v=7wUCyjiyXdg';
  static const _empathyUrl = 'https://www.youtube.com/watch?v=1Evwgu369Jw';
  static const _boundariesUrl = 'https://www.youtube.com/watch?v=yLx7x7f2c0Q';
  static const _difficultSituationsUrl =
      'https://www.youtube.com/watch?v=saXaZhZ0J0k';
  static const _crisisAwarenessUrl =
      'https://www.youtube.com/watch?v=z-IR48Mb3W0';

  static List<ListenerTrainingModule> mockModules({
    required String artOfListening,
    required String empathy,
    required String boundaries,
    required String difficultSituations,
    required String crisisAwareness,
  }) {
    return [
      ListenerTrainingModule(
        id: 'art_of_listening',
        title: artOfListening,
        status: ListenerTrainingModuleStatus.inProgress,
        contentUrl: _artOfListeningUrl,
      ),
      ListenerTrainingModule(
        id: 'empathy',
        title: empathy,
        status: ListenerTrainingModuleStatus.notStarted,
        contentUrl: _empathyUrl,
      ),
      ListenerTrainingModule(
        id: 'boundaries',
        title: boundaries,
        status: ListenerTrainingModuleStatus.notStarted,
        contentUrl: _boundariesUrl,
      ),
      ListenerTrainingModule(
        id: 'difficult_situations',
        title: difficultSituations,
        status: ListenerTrainingModuleStatus.notStarted,
        contentUrl: _difficultSituationsUrl,
      ),
      ListenerTrainingModule(
        id: 'crisis_awareness',
        title: crisisAwareness,
        status: ListenerTrainingModuleStatus.notStarted,
        contentUrl: _crisisAwarenessUrl,
      ),
    ];
  }
}
