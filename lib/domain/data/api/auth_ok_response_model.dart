import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_ok_response_model.freezed.dart';
part 'auth_ok_response_model.g.dart';

@freezed
abstract class AuthOkResponseModel with _$AuthOkResponseModel {
  const factory AuthOkResponseModel({
    required String status,
    required AuthOkData data,
  }) = _AuthOkResponseModel;

  factory AuthOkResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthOkResponseModelFromJson(json);
}

@freezed
abstract class AuthOkData with _$AuthOkData {
  const factory AuthOkData({@Default(true) bool ok}) = _AuthOkData;

  factory AuthOkData.fromJson(Map<String, dynamic> json) =>
      _$AuthOkDataFromJson(json);
}
