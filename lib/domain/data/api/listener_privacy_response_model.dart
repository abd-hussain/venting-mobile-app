import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_privacy_response_model.freezed.dart';
part 'listener_privacy_response_model.g.dart';

@freezed
abstract class ListenerPrivacyResponseModel with _$ListenerPrivacyResponseModel {
  const factory ListenerPrivacyResponseModel({
    required String status,
    required ListenerPrivacyData data,
  }) = _ListenerPrivacyResponseModel;

  factory ListenerPrivacyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerPrivacyResponseModelFromJson(json);
}

@freezed
abstract class ListenerPrivacyData with _$ListenerPrivacyData {
  const factory ListenerPrivacyData({
    @Default(true) bool profile_visible,
    @Default(true) bool show_online_status,
    @Default(true) bool visible_in_all_countries,
    @Default(<String>[]) List<String> visible_countries,
    @Default(true) bool allow_search_indexing,
  }) = _ListenerPrivacyData;

  factory ListenerPrivacyData.fromJson(Map<String, dynamic> json) =>
      _$ListenerPrivacyDataFromJson(json);
}
