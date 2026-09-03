import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_end_response_model.freezed.dart';
part 'session_end_response_model.g.dart';

@freezed
abstract class SessionEndResponseModel with _$SessionEndResponseModel {
  const factory SessionEndResponseModel({
    required String status,
    required SessionEndData data,
  }) = _SessionEndResponseModel;

  factory SessionEndResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SessionEndResponseModelFromJson(json);
}

@freezed
abstract class SessionEndData with _$SessionEndData {
  const factory SessionEndData({
    @Default('') String session_id,
    @Default('completed') String status,
  }) = _SessionEndData;

  factory SessionEndData.fromJson(Map<String, dynamic> json) =>
      _$SessionEndDataFromJson(json);
}
