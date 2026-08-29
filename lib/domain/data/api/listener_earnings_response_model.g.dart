// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_earnings_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerEarningsResponseModel _$ListenerEarningsResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerEarningsResponseModel(
  status: json['status'] as String,
  data: ListenerEarningsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerEarningsResponseModelToJson(
  _ListenerEarningsResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerEarningsData _$ListenerEarningsDataFromJson(
  Map<String, dynamic> json,
) => _ListenerEarningsData(
  total_earnings: json['total_earnings'] as num? ?? 0,
  trend_percent: (json['trend_percent'] as num?)?.toInt() ?? 0,
  sessions: (json['sessions'] as num?)?.toInt() ?? 0,
  hours: json['hours'] as num? ?? 0,
  rating: json['rating'] as num? ?? 0,
  current_tier: json['current_tier'] == null
      ? null
      : ListenerEarningsTierModel.fromJson(
          json['current_tier'] as Map<String, dynamic>,
        ),
  tiers:
      (json['tiers'] as List<dynamic>?)
          ?.map(
            (e) =>
                ListenerEarningsTierModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ListenerEarningsTierModel>[],
);

Map<String, dynamic> _$ListenerEarningsDataToJson(
  _ListenerEarningsData instance,
) => <String, dynamic>{
  'total_earnings': instance.total_earnings,
  'trend_percent': instance.trend_percent,
  'sessions': instance.sessions,
  'hours': instance.hours,
  'rating': instance.rating,
  'current_tier': instance.current_tier,
  'tiers': instance.tiers,
};

_ListenerEarningsTierModel _$ListenerEarningsTierModelFromJson(
  Map<String, dynamic> json,
) => _ListenerEarningsTierModel(
  id: json['id'] as String? ?? '',
  min_sessions: (json['min_sessions'] as num?)?.toInt() ?? 0,
  min_rating: json['min_rating'] as num? ?? 0,
  hourly_rate: json['hourly_rate'] as num? ?? 0,
);

Map<String, dynamic> _$ListenerEarningsTierModelToJson(
  _ListenerEarningsTierModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'min_sessions': instance.min_sessions,
  'min_rating': instance.min_rating,
  'hourly_rate': instance.hourly_rate,
};

_ListenerEarningsChartResponseModel
_$ListenerEarningsChartResponseModelFromJson(Map<String, dynamic> json) =>
    _ListenerEarningsChartResponseModel(
      status: json['status'] as String,
      data: ListenerEarningsChartData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ListenerEarningsChartResponseModelToJson(
  _ListenerEarningsChartResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerEarningsChartData _$ListenerEarningsChartDataFromJson(
  Map<String, dynamic> json,
) => _ListenerEarningsChartData(
  points:
      (json['points'] as List<dynamic>?)
          ?.map(
            (e) => ListenerEarningsChartPointModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <ListenerEarningsChartPointModel>[],
);

Map<String, dynamic> _$ListenerEarningsChartDataToJson(
  _ListenerEarningsChartData instance,
) => <String, dynamic>{'points': instance.points};

_ListenerEarningsChartPointModel _$ListenerEarningsChartPointModelFromJson(
  Map<String, dynamic> json,
) => _ListenerEarningsChartPointModel(
  label: json['label'] as String? ?? '',
  amount: json['amount'] as num? ?? 0,
);

Map<String, dynamic> _$ListenerEarningsChartPointModelToJson(
  _ListenerEarningsChartPointModel instance,
) => <String, dynamic>{'label': instance.label, 'amount': instance.amount};

_ListenerPayoutMethodsResponseModel
_$ListenerPayoutMethodsResponseModelFromJson(Map<String, dynamic> json) =>
    _ListenerPayoutMethodsResponseModel(
      status: json['status'] as String,
      data: ListenerPayoutMethodsData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ListenerPayoutMethodsResponseModelToJson(
  _ListenerPayoutMethodsResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerPayoutMethodsData _$ListenerPayoutMethodsDataFromJson(
  Map<String, dynamic> json,
) => _ListenerPayoutMethodsData(
  default_method: json['default_method'] as String?,
  methods:
      (json['methods'] as List<dynamic>?)
          ?.map(
            (e) =>
                ListenerPayoutMethodModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ListenerPayoutMethodModel>[],
);

Map<String, dynamic> _$ListenerPayoutMethodsDataToJson(
  _ListenerPayoutMethodsData instance,
) => <String, dynamic>{
  'default_method': instance.default_method,
  'methods': instance.methods,
};

_ListenerPayoutMethodModel _$ListenerPayoutMethodModelFromJson(
  Map<String, dynamic> json,
) => _ListenerPayoutMethodModel(
  id: json['id'] as String? ?? '',
  type: json['type'] as String? ?? '',
  label: json['label'] as String? ?? '',
  account_holder_name: json['account_holder_name'] as String?,
  bank_name: json['bank_name'] as String?,
  iban_or_account: json['iban_or_account'] as String?,
  swift_code: json['swift_code'] as String?,
  paypal_email: json['paypal_email'] as String?,
);

Map<String, dynamic> _$ListenerPayoutMethodModelToJson(
  _ListenerPayoutMethodModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'label': instance.label,
  'account_holder_name': instance.account_holder_name,
  'bank_name': instance.bank_name,
  'iban_or_account': instance.iban_or_account,
  'swift_code': instance.swift_code,
  'paypal_email': instance.paypal_email,
};
