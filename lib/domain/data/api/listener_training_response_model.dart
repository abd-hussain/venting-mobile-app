import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venting_mobile_app/domain/data/api/listener_setup_progress_response_model.dart';

part 'listener_training_response_model.freezed.dart';
part 'listener_training_response_model.g.dart';

@freezed
abstract class ListenerTrainingResponseModel
    with _$ListenerTrainingResponseModel {
  const factory ListenerTrainingResponseModel({
    required String status,
    required ListenerTrainingData data,
  }) = _ListenerTrainingResponseModel;

  factory ListenerTrainingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerTrainingResponseModelFromJson(json);
}

@freezed
abstract class ListenerTrainingData with _$ListenerTrainingData {
  const factory ListenerTrainingData({
    @Default(<ListenerTrainingModuleModel>[])
    List<ListenerTrainingModuleModel> modules,
    @Default(false) bool all_completed,
    ListenerSetupProgressData? setup_progress,
  }) = _ListenerTrainingData;

  factory ListenerTrainingData.fromJson(Map<String, dynamic> json) =>
      _$ListenerTrainingDataFromJson(json);
}

@freezed
abstract class ListenerTrainingModuleModel with _$ListenerTrainingModuleModel {
  const factory ListenerTrainingModuleModel({
    @Default('') String id,
    @Default('') String title,
    @Default('') String status,
    @Default('') String content_url,
  }) = _ListenerTrainingModuleModel;

  factory ListenerTrainingModuleModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerTrainingModuleModelFromJson(json);
}
