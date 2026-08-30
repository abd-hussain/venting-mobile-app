part of 'listener_training_bloc.dart';

@freezed
sealed class ListenerTrainingEvent with _$ListenerTrainingEvent {
  const factory ListenerTrainingEvent.started() = _Started;

  const factory ListenerTrainingEvent.retryLoad() = _RetryLoad;

  const factory ListenerTrainingEvent.moduleCompleted({
    required String moduleId,
  }) = _ModuleCompleted;
}
