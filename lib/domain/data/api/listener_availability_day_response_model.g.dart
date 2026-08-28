// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_availability_day_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerAvailabilityDayResponseModel
_$ListenerAvailabilityDayResponseModelFromJson(Map<String, dynamic> json) =>
    _ListenerAvailabilityDayResponseModel(
      status: json['status'] as String,
      data: ListenerAvailabilityDayData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ListenerAvailabilityDayResponseModelToJson(
  _ListenerAvailabilityDayResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
