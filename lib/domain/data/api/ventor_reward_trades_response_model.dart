import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_reward_trades_response_model.freezed.dart';
part 'ventor_reward_trades_response_model.g.dart';

@freezed
abstract class VentorRewardTradesResponseModel
    with _$VentorRewardTradesResponseModel {
  const factory VentorRewardTradesResponseModel({
    required String status,
    required VentorRewardTradesData data,
  }) = _VentorRewardTradesResponseModel;

  factory VentorRewardTradesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VentorRewardTradesResponseModelFromJson(json);
}

@freezed
abstract class VentorRewardTradesData with _$VentorRewardTradesData {
  const factory VentorRewardTradesData({
    @Default(<VentorRewardTradeItemModel>[])
    List<VentorRewardTradeItemModel> items,
  }) = _VentorRewardTradesData;

  factory VentorRewardTradesData.fromJson(Map<String, dynamic> json) =>
      _$VentorRewardTradesDataFromJson(json);
}

@freezed
abstract class VentorRewardTradeItemModel with _$VentorRewardTradeItemModel {
  const factory VentorRewardTradeItemModel({
    @Default('') String id,
    @Default('') String offer_id,
    @Default(0) int points_spent,
    @Default('') String traded_at,
    @Default(false) bool is_welcome_gift,
  }) = _VentorRewardTradeItemModel;

  factory VentorRewardTradeItemModel.fromJson(Map<String, dynamic> json) =>
      _$VentorRewardTradeItemModelFromJson(json);
}
