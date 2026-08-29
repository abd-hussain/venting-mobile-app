import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_earnings_response_model.freezed.dart';
part 'listener_earnings_response_model.g.dart';

String _stringFromJson(Object? json, {String fallback = ''}) {
  return _optionalStringFromJson(json) ?? fallback;
}

String? _optionalStringFromJson(Object? json) {
  if (json == null) return null;
  if (json is String) return json;
  if (json is num) return json.toString();
  if (json is Map<String, dynamic>) {
    for (final key in const ['id', 'en', 'value', 'name', 'label']) {
      final nested = json[key];
      if (nested is String && nested.trim().isNotEmpty) return nested;
    }
  }
  return null;
}

String? _defaultMethodFromJson(Object? json) {
  if (json == null) return null;
  if (json is String) return json;
  if (json is Map<String, dynamic>) {
    final id = json['id'];
    if (id is String) return id;
    return _optionalStringFromJson(json);
  }
  return null;
}

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

@Freezed(fromJson: false)
abstract class ListenerEarningsTierModel with _$ListenerEarningsTierModel {
  const factory ListenerEarningsTierModel({
    @Default('') String id,
    @Default(0) int min_sessions,
    @Default(0) num min_rating,
    @Default(0) num hourly_rate,
  }) = _ListenerEarningsTierModel;

  factory ListenerEarningsTierModel.fromJson(Map<String, dynamic> json) =>
      ListenerEarningsTierModel(
        id: _stringFromJson(json['id']),
        min_sessions: (json['min_sessions'] as num?)?.toInt() ?? 0,
        min_rating: json['min_rating'] as num? ?? 0,
        hourly_rate: json['hourly_rate'] as num? ?? 0,
      );
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

@Freezed(fromJson: false)
abstract class ListenerEarningsChartPointModel
    with _$ListenerEarningsChartPointModel {
  const factory ListenerEarningsChartPointModel({
    @Default('') String label,
    @Default(0) num amount,
  }) = _ListenerEarningsChartPointModel;

  factory ListenerEarningsChartPointModel.fromJson(Map<String, dynamic> json) =>
      ListenerEarningsChartPointModel(
        label: _stringFromJson(json['label']),
        amount: json['amount'] as num? ?? 0,
      );
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

@Freezed(fromJson: false)
abstract class ListenerPayoutMethodsData with _$ListenerPayoutMethodsData {
  const factory ListenerPayoutMethodsData({
    String? default_method,
    @Default(<ListenerPayoutMethodModel>[])
    List<ListenerPayoutMethodModel> methods,
  }) = _ListenerPayoutMethodsData;

  factory ListenerPayoutMethodsData.fromJson(Map<String, dynamic> json) =>
      ListenerPayoutMethodsData(
        default_method: _defaultMethodFromJson(json['default_method']),
        methods:
            (json['methods'] as List<dynamic>?)
                ?.map(
                  (item) => ListenerPayoutMethodModel.fromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            const <ListenerPayoutMethodModel>[],
      );
}

@Freezed(fromJson: false)
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
      ListenerPayoutMethodModel(
        id: _stringFromJson(json['id']),
        type: _stringFromJson(json['type']),
        label: _stringFromJson(json['label']),
        account_holder_name: _optionalStringFromJson(
          json['account_holder_name'],
        ),
        bank_name: _optionalStringFromJson(json['bank_name']),
        iban_or_account: _optionalStringFromJson(json['iban_or_account']),
        swift_code: _optionalStringFromJson(json['swift_code']),
        paypal_email: _optionalStringFromJson(json['paypal_email']),
      );
}
