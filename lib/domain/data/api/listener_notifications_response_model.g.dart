// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_notifications_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerNotificationsResponseModel
_$ListenerNotificationsResponseModelFromJson(Map<String, dynamic> json) =>
    _ListenerNotificationsResponseModel(
      status: json['status'] as String,
      data: ListenerNotificationsData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ListenerNotificationsResponseModelToJson(
  _ListenerNotificationsResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerNotificationsData _$ListenerNotificationsDataFromJson(
  Map<String, dynamic> json,
) => _ListenerNotificationsData(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => ListenerNotificationItemModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <ListenerNotificationItemModel>[],
);

Map<String, dynamic> _$ListenerNotificationsDataToJson(
  _ListenerNotificationsData instance,
) => <String, dynamic>{'items': instance.items};

_ListenerNotificationItemModel _$ListenerNotificationItemModelFromJson(
  Map<String, dynamic> json,
) => _ListenerNotificationItemModel(
  id: json['id'] as String? ?? '',
  type: json['type'] as String? ?? '',
  title: json['title'] as String? ?? '',
  body: json['body'] as String? ?? '',
  created_at: json['created_at'] as String? ?? '',
  is_read: json['is_read'] as bool? ?? false,
  data: json['data'] as Map<String, dynamic>? ?? const <String, dynamic>{},
);

Map<String, dynamic> _$ListenerNotificationItemModelToJson(
  _ListenerNotificationItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'title': instance.title,
  'body': instance.body,
  'created_at': instance.created_at,
  'is_read': instance.is_read,
  'data': instance.data,
};
