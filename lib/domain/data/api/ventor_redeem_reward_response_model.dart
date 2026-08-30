import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_reward_trades_response_model.dart';

part 'ventor_redeem_reward_response_model.freezed.dart';
part 'ventor_redeem_reward_response_model.g.dart';

@freezed
abstract class VentorRedeemRewardResponseModel
    with _$VentorRedeemRewardResponseModel {
  const factory VentorRedeemRewardResponseModel({
    required String status,
    required VentorRedeemRewardData data,
  }) = _VentorRedeemRewardResponseModel;

  factory VentorRedeemRewardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VentorRedeemRewardResponseModelFromJson(json);
}

@freezed
abstract class VentorRedeemRewardData with _$VentorRedeemRewardData {
  const factory VentorRedeemRewardData({
    @Default(0) int points_remaining,
    VentorRewardTradeItemModel? trade,
    String? active_offer_id,
  }) = _VentorRedeemRewardData;

  factory VentorRedeemRewardData.fromJson(Map<String, dynamic> json) =>
      _$VentorRedeemRewardDataFromJson(json);
}
