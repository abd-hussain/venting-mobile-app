import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_invites_response_model.freezed.dart';
part 'ventor_invites_response_model.g.dart';

@freezed
abstract class VentorInvitesResponseModel with _$VentorInvitesResponseModel {
  const factory VentorInvitesResponseModel({
    required String status,
    required VentorInvitesData data,
  }) = _VentorInvitesResponseModel;

  factory VentorInvitesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VentorInvitesResponseModelFromJson(json);
}

@freezed
abstract class VentorInvitesData with _$VentorInvitesData {
  const factory VentorInvitesData({
    @Default('') String invite_code,
    @Default('') String invite_link,
    @Default(0) int total_invited,
    @Default(0) int invite_points_earned,
    @Default(<VentorInviteItemModel>[]) List<VentorInviteItemModel> items,
  }) = _VentorInvitesData;

  factory VentorInvitesData.fromJson(Map<String, dynamic> json) =>
      _$VentorInvitesDataFromJson(json);
}

@freezed
abstract class VentorInviteItemModel with _$VentorInviteItemModel {
  const factory VentorInviteItemModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String status,
    @Default(0) int points_earned,
  }) = _VentorInviteItemModel;

  factory VentorInviteItemModel.fromJson(Map<String, dynamic> json) =>
      _$VentorInviteItemModelFromJson(json);
}
