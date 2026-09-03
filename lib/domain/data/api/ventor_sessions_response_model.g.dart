// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_sessions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorSessionsListResponseModel _$VentorSessionsListResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorSessionsListResponseModel(
  status: json['status'] as String,
  data: VentorSessionsListData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorSessionsListResponseModelToJson(
  _VentorSessionsListResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorSessionsListData _$VentorSessionsListDataFromJson(
  Map<String, dynamic> json,
) => _VentorSessionsListData(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => VentorHomeBookedSessionModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <VentorHomeBookedSessionModel>[],
);

Map<String, dynamic> _$VentorSessionsListDataToJson(
  _VentorSessionsListData instance,
) => <String, dynamic>{'items': instance.items};

_VentorBookedSessionDetailResponseModel
_$VentorBookedSessionDetailResponseModelFromJson(Map<String, dynamic> json) =>
    _VentorBookedSessionDetailResponseModel(
      status: json['status'] as String,
      data: VentorBookedSessionDetailDataModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$VentorBookedSessionDetailResponseModelToJson(
  _VentorBookedSessionDetailResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorBookedSessionDetailDataModel
_$VentorBookedSessionDetailDataModelFromJson(Map<String, dynamic> json) =>
    _VentorBookedSessionDetailDataModel(
      session: VentorHomeBookedSessionModel.fromJson(
        json['session'] as Map<String, dynamic>,
      ),
      listener: json['listener'] == null
          ? null
          : VentorBookedSessionListenerSummaryModel.fromJson(
              json['listener'] as Map<String, dynamic>,
            ),
      payment: json['payment'] == null
          ? null
          : VentorBookedSessionPaymentModel.fromJson(
              json['payment'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VentorBookedSessionDetailDataModelToJson(
  _VentorBookedSessionDetailDataModel instance,
) => <String, dynamic>{
  'session': instance.session,
  'listener': instance.listener,
  'payment': instance.payment,
};

_VentorBookedSessionListenerSummaryModel
_$VentorBookedSessionListenerSummaryModelFromJson(
  Map<String, dynamic> json,
) => _VentorBookedSessionListenerSummaryModel(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  avatar_url: json['avatar_url'] as String? ?? '',
  rating: (json['rating'] as num?)?.toDouble() ?? 0,
  is_verified: json['is_verified'] as bool? ?? false,
  topics:
      (json['topics'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  languages:
      (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  country: json['country'] as String? ?? '',
  city: json['city'] as String? ?? '',
  country_iso: json['country_iso'] as String? ?? '',
  rate_per_minute: (json['rate_per_minute'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$VentorBookedSessionListenerSummaryModelToJson(
  _VentorBookedSessionListenerSummaryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatar_url': instance.avatar_url,
  'rating': instance.rating,
  'is_verified': instance.is_verified,
  'topics': instance.topics,
  'languages': instance.languages,
  'country': instance.country,
  'city': instance.city,
  'country_iso': instance.country_iso,
  'rate_per_minute': instance.rate_per_minute,
};

_VentorBookedSessionPaymentModel _$VentorBookedSessionPaymentModelFromJson(
  Map<String, dynamic> json,
) => _VentorBookedSessionPaymentModel(
  amount_paid: json['amount_paid'] as num? ?? 0,
  currency: json['currency'] as String? ?? 'USD',
  voice_change_fee: json['voice_change_fee'] as num? ?? 0,
  discount_amount: json['discount_amount'] as num? ?? 0,
  session_price: json['session_price'] as num?,
);

Map<String, dynamic> _$VentorBookedSessionPaymentModelToJson(
  _VentorBookedSessionPaymentModel instance,
) => <String, dynamic>{
  'amount_paid': instance.amount_paid,
  'currency': instance.currency,
  'voice_change_fee': instance.voice_change_fee,
  'discount_amount': instance.discount_amount,
  'session_price': instance.session_price,
};

_VentorCancelSessionResponseModel _$VentorCancelSessionResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorCancelSessionResponseModel(
  status: json['status'] as String,
  data: VentorCancelSessionData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorCancelSessionResponseModelToJson(
  _VentorCancelSessionResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorCancelSessionData _$VentorCancelSessionDataFromJson(
  Map<String, dynamic> json,
) => _VentorCancelSessionData(
  session: VentorHomeBookedSessionModel.fromJson(
    json['session'] as Map<String, dynamic>,
  ),
  refunded_to_balance: json['refunded_to_balance'] as num?,
);

Map<String, dynamic> _$VentorCancelSessionDataToJson(
  _VentorCancelSessionData instance,
) => <String, dynamic>{
  'session': instance.session,
  'refunded_to_balance': instance.refunded_to_balance,
};
