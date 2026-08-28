part of 'listener_training_bloc.dart';

enum ListenerTrainingLoadStatus { initial, loading, ready, loadFailure }

@freezed
sealed class ListenerTrainingState with _$ListenerTrainingState {
  const factory ListenerTrainingState({
    @Default(ListenerTrainingLoadStatus.initial)
    ListenerTrainingLoadStatus loadStatus,
    @Default(<ListenerTrainingModule>[]) List<ListenerTrainingModule> modules,
    @Default(false) bool allCompleted,
    @Default(false) bool isCompletingModule,
    @Default('') String completingModuleId,
    @Default('') String errorMessage,
  }) = _ListenerTrainingState;

  const ListenerTrainingState._();

  bool get isLoading => loadStatus == ListenerTrainingLoadStatus.loading;

  bool get isLoadFailure =>
      loadStatus == ListenerTrainingLoadStatus.loadFailure;
}
