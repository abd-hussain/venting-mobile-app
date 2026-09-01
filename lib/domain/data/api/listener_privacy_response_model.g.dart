// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_privacy_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerPrivacyResponseModel _$ListenerPrivacyResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerPrivacyResponseModel(
  status: json['status'] as String,
  data: ListenerPrivacyData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerPrivacyResponseModelToJson(
  _ListenerPrivacyResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerPrivacyData _$ListenerPrivacyDataFromJson(Map<String, dynamic> json) =>
    _ListenerPrivacyData(
      profile_visible: json['profile_visible'] as bool? ?? true,
      show_online_status: json['show_online_status'] as bool? ?? true,
      visible_in_all_countries:
          json['visible_in_all_countries'] as bool? ?? true,
      visible_countries:
          (json['visible_countries'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      allow_search_indexing: json['allow_search_indexing'] as bool? ?? true,
    );

Map<String, dynamic> _$ListenerPrivacyDataToJson(
  _ListenerPrivacyData instance,
) => <String, dynamic>{
  'profile_visible': instance.profile_visible,
  'show_online_status': instance.show_online_status,
  'visible_in_all_countries': instance.visible_in_all_countries,
  'visible_countries': instance.visible_countries,
  'allow_search_indexing': instance.allow_search_indexing,
};
