enum ListenerTrainingModuleStatus { completed, inProgress, notStarted }

class ListenerTrainingModule {
  const ListenerTrainingModule({
    required this.id,
    required this.title,
    required this.status,
  });

  final String id;
  final String title;
  final ListenerTrainingModuleStatus status;

  ListenerTrainingModule copyWith({ListenerTrainingModuleStatus? status}) {
    return ListenerTrainingModule(
      id: id,
      title: title,
      status: status ?? this.status,
    );
  }
}

/// Mock active-listening curriculum shown after registration.
abstract final class ListenerTrainingCurriculum {
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
        status: ListenerTrainingModuleStatus.completed,
      ),
      ListenerTrainingModule(
        id: 'empathy',
        title: empathy,
        status: ListenerTrainingModuleStatus.completed,
      ),
      ListenerTrainingModule(
        id: 'boundaries',
        title: boundaries,
        status: ListenerTrainingModuleStatus.inProgress,
      ),
      ListenerTrainingModule(
        id: 'difficult_situations',
        title: difficultSituations,
        status: ListenerTrainingModuleStatus.notStarted,
      ),
      ListenerTrainingModule(
        id: 'crisis_awareness',
        title: crisisAwareness,
        status: ListenerTrainingModuleStatus.notStarted,
      ),
    ];
  }
}
