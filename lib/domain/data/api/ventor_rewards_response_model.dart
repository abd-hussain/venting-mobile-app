import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_rewards_response_model.freezed.dart';
part 'ventor_rewards_response_model.g.dart';

@freezed
abstract class VentorRewardsResponseModel with _$VentorRewardsResponseModel {
  const factory VentorRewardsResponseModel({
    required String status,
    required VentorRewardsData data,
  }) = _VentorRewardsResponseModel;

  factory VentorRewardsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VentorRewardsResponseModelFromJson(json);
}

@freezed
abstract class VentorRewardsData with _$VentorRewardsData {
  const factory VentorRewardsData({
    @Default(0) int points,
    @Default(0) int completed_sessions,
    String? active_offer_id,
    @Default(false) bool welcome_gift_claimed,
    @Default(<VentorRewardOfferItemModel>[])
    List<VentorRewardOfferItemModel> offers,
    VentorRewardEarnRulesModel? earn_rules,
  }) = _VentorRewardsData;

  factory VentorRewardsData.fromJson(Map<String, dynamic> json) =>
      _$VentorRewardsDataFromJson(json);
}

@freezed
abstract class VentorRewardOfferItemModel with _$VentorRewardOfferItemModel {
  const factory VentorRewardOfferItemModel({
    @Default('') String id,
    @Default('') String kind,
    @Default(0) int points_cost,
    int? percent_off,
    int? free_minutes,
    VentorRewardAudienceModel? audience,
    @Default(false) bool is_welcome_gift,
  }) = _VentorRewardOfferItemModel;

  factory VentorRewardOfferItemModel.fromJson(Map<String, dynamic> json) =>
      _$VentorRewardOfferItemModelFromJson(json);
}

@freezed
abstract class VentorRewardAudienceModel with _$VentorRewardAudienceModel {
  const factory VentorRewardAudienceModel({
    String? min_tier,
    String? max_tier,
  }) = _VentorRewardAudienceModel;

  factory VentorRewardAudienceModel.fromJson(Map<String, dynamic> json) =>
      _$VentorRewardAudienceModelFromJson(json);
}

@freezed
abstract class VentorRewardEarnRulesModel with _$VentorRewardEarnRulesModel {
  const factory VentorRewardEarnRulesModel({
    @Default(0) int points_per_session,
    @Default(0) int points_per_friend_register,
    @Default(0) int points_per_invite_first_session,
    @Default(0) int points_per_friend_booking,
  }) = _VentorRewardEarnRulesModel;

  factory VentorRewardEarnRulesModel.fromJson(Map<String, dynamic> json) =>
      _$VentorRewardEarnRulesModelFromJson(json);
}
