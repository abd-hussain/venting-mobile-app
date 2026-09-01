import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_setup_progress_response_model.freezed.dart';
part 'listener_setup_progress_response_model.g.dart';

@freezed
abstract class ListenerSetupProgressResponseModel
    with _$ListenerSetupProgressResponseModel {
  const factory ListenerSetupProgressResponseModel({
    required String status,
    required ListenerSetupProgressData data,
  }) = _ListenerSetupProgressResponseModel;

  factory ListenerSetupProgressResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerSetupProgressResponseModelFromJson(json);
}

@freezed
abstract class ListenerSetupProgressData with _$ListenerSetupProgressData {
  const factory ListenerSetupProgressData({
    @Default(false) bool profile_approved,
    @Default('incomplete') String profile_status,
    @Default(false) bool can_go_online,
    @Default(<String>[]) List<String> steps_to_refill,
    @Default('') String rejection_reason,
    @Default(false) bool registration_complete,
    @Default(0) int progress_percent,
    @Default(<ListenerSetupProgressStepModel>[])
    List<ListenerSetupProgressStepModel> steps,
  }) = _ListenerSetupProgressData;

  factory ListenerSetupProgressData.fromJson(Map<String, dynamic> json) =>
      _$ListenerSetupProgressDataFromJson(json);
}

@freezed
abstract class ListenerSetupProgressStepModel
    with _$ListenerSetupProgressStepModel {
  const factory ListenerSetupProgressStepModel({
    @Default('') String id,
    @Default('') String status,
  }) = _ListenerSetupProgressStepModel;

  factory ListenerSetupProgressStepModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerSetupProgressStepModelFromJson(json);
}
