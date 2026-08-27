// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerProfileResponseModel _$ListenerProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerProfileResponseModel(
  status: json['status'] as String,
  data: ListenerProfileData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerProfileResponseModelToJson(
  _ListenerProfileResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerProfileData _$ListenerProfileDataFromJson(Map<String, dynamic> json) =>
    _ListenerProfileData(
      phone: json['phone'] as String? ?? '',
      phone_country: json['phone_country'] as String? ?? '',
    );

Map<String, dynamic> _$ListenerProfileDataToJson(
  _ListenerProfileData instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'phone_country': instance.phone_country,
};
