import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_earnings_response_model.freezed.dart';
part 'listener_earnings_response_model.g.dart';

@freezed
abstract class ListenerEarningsResponseModel
    with _$ListenerEarningsResponseModel {
  const factory ListenerEarningsResponseModel({
    required String status,
    required ListenerEarningsData data,
  }) = _ListenerEarningsResponseModel;

  factory ListenerEarningsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerEarningsResponseModelFromJson(json);
}

@freezed
abstract class ListenerEarningsData with _$ListenerEarningsData {
  const factory ListenerEarningsData({
    @Default(0) num total_earnings,
    @Default(0) int trend_percent,
    @Default(0) int sessions,
    @Default(0) num hours,
    @Default(0) num rating,
    ListenerEarningsTierModel? current_tier,
    @Default(<ListenerEarningsTierModel>[])
    List<ListenerEarningsTierModel> tiers,
  }) = _ListenerEarningsData;

  factory ListenerEarningsData.fromJson(Map<String, dynamic> json) =>
      _$ListenerEarningsDataFromJson(json);
}

@freezed
abstract class ListenerEarningsTierModel with _$ListenerEarningsTierModel {
  const factory ListenerEarningsTierModel({
    @Default('') String id,
    @Default(0) int min_sessions,
    @Default(0) num min_rating,
    @Default(0) num hourly_rate,
  }) = _ListenerEarningsTierModel;

  factory ListenerEarningsTierModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerEarningsTierModelFromJson(json);
}

@freezed
abstract class ListenerEarningsChartResponseModel
    with _$ListenerEarningsChartResponseModel {
  const factory ListenerEarningsChartResponseModel({
    required String status,
    required ListenerEarningsChartData data,
  }) = _ListenerEarningsChartResponseModel;

  factory ListenerEarningsChartResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerEarningsChartResponseModelFromJson(json);
}

@freezed
abstract class ListenerEarningsChartData with _$ListenerEarningsChartData {
  const factory ListenerEarningsChartData({
    @Default(<ListenerEarningsChartPointModel>[])
    List<ListenerEarningsChartPointModel> points,
  }) = _ListenerEarningsChartData;

  factory ListenerEarningsChartData.fromJson(Map<String, dynamic> json) =>
      _$ListenerEarningsChartDataFromJson(json);
}

@freezed
abstract class ListenerEarningsChartPointModel
    with _$ListenerEarningsChartPointModel {
  const factory ListenerEarningsChartPointModel({
    @Default('') String label,
    @Default(0) num amount,
  }) = _ListenerEarningsChartPointModel;

  factory ListenerEarningsChartPointModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerEarningsChartPointModelFromJson(json);
}

@freezed
abstract class ListenerPayoutMethodsResponseModel
    with _$ListenerPayoutMethodsResponseModel {
  const factory ListenerPayoutMethodsResponseModel({
    required String status,
    required ListenerPayoutMethodsData data,
  }) = _ListenerPayoutMethodsResponseModel;

  factory ListenerPayoutMethodsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerPayoutMethodsResponseModelFromJson(json);
}

@freezed
abstract class ListenerPayoutMethodsData with _$ListenerPayoutMethodsData {
  const factory ListenerPayoutMethodsData({
    String? default_method,
    @Default(<ListenerPayoutMethodModel>[])
    List<ListenerPayoutMethodModel> methods,
  }) = _ListenerPayoutMethodsData;

  factory ListenerPayoutMethodsData.fromJson(Map<String, dynamic> json) =>
      _$ListenerPayoutMethodsDataFromJson(json);
}

@freezed
abstract class ListenerPayoutMethodModel with _$ListenerPayoutMethodModel {
  const factory ListenerPayoutMethodModel({
    @Default('') String id,
    @Default('') String type,
    @Default('') String label,
    String? account_holder_name,
    String? bank_name,
    String? iban_or_account,
    String? swift_code,
    String? paypal_email,
  }) = _ListenerPayoutMethodModel;

  factory ListenerPayoutMethodModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerPayoutMethodModelFromJson(json);
}
