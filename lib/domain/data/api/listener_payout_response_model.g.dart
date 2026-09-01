// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_payout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerPayoutBalancesResponseModel
_$ListenerPayoutBalancesResponseModelFromJson(Map<String, dynamic> json) =>
    _ListenerPayoutBalancesResponseModel(
      status: json['status'] as String,
      data: ListenerPayoutBalancesData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ListenerPayoutBalancesResponseModelToJson(
  _ListenerPayoutBalancesResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerPayoutBalancesData _$ListenerPayoutBalancesDataFromJson(
  Map<String, dynamic> json,
) => _ListenerPayoutBalancesData(
  available: json['available'] as num? ?? 0,
  pending: json['pending'] as num? ?? 0,
  lifetime: json['lifetime'] as num? ?? 0,
);

Map<String, dynamic> _$ListenerPayoutBalancesDataToJson(
  _ListenerPayoutBalancesData instance,
) => <String, dynamic>{
  'available': instance.available,
  'pending': instance.pending,
  'lifetime': instance.lifetime,
};

_ListenerPayoutsListResponseModel _$ListenerPayoutsListResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerPayoutsListResponseModel(
  status: json['status'] as String,
  data: ListenerPayoutsListData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerPayoutsListResponseModelToJson(
  _ListenerPayoutsListResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerPayoutsListData _$ListenerPayoutsListDataFromJson(
  Map<String, dynamic> json,
) => _ListenerPayoutsListData(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => ListenerPayoutItemModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ListenerPayoutItemModel>[],
);

Map<String, dynamic> _$ListenerPayoutsListDataToJson(
  _ListenerPayoutsListData instance,
) => <String, dynamic>{'items': instance.items};

_ListenerPayoutItemModel _$ListenerPayoutItemModelFromJson(
  Map<String, dynamic> json,
) => _ListenerPayoutItemModel(
  id: json['id'] as String? ?? '',
  amount: json['amount'] as num? ?? 0,
  date: json['date'] as String? ?? '',
  status: json['status'] as String? ?? '',
  method_label: json['method_label'] as String? ?? '',
  reference: json['reference'] as String?,
);

Map<String, dynamic> _$ListenerPayoutItemModelToJson(
  _ListenerPayoutItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'date': instance.date,
  'status': instance.status,
  'method_label': instance.method_label,
  'reference': instance.reference,
};

_ListenerPayoutMethodUpdateResponseModel
_$ListenerPayoutMethodUpdateResponseModelFromJson(Map<String, dynamic> json) =>
    _ListenerPayoutMethodUpdateResponseModel(
      status: json['status'] as String,
      data: ListenerPayoutMethodModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ListenerPayoutMethodUpdateResponseModelToJson(
  _ListenerPayoutMethodUpdateResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerPayoutMutationResponseModel
_$ListenerPayoutMutationResponseModelFromJson(Map<String, dynamic> json) =>
    _ListenerPayoutMutationResponseModel(
      status: json['status'] as String,
      data: ListenerPayoutItemModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ListenerPayoutMutationResponseModelToJson(
  _ListenerPayoutMutationResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
