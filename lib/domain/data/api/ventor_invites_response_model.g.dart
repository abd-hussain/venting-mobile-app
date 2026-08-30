// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_invites_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorInvitesResponseModel _$VentorInvitesResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorInvitesResponseModel(
  status: json['status'] as String,
  data: VentorInvitesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorInvitesResponseModelToJson(
  _VentorInvitesResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorInvitesData _$VentorInvitesDataFromJson(Map<String, dynamic> json) =>
    _VentorInvitesData(
      invite_code: json['invite_code'] as String? ?? '',
      invite_link: json['invite_link'] as String? ?? '',
      total_invited: (json['total_invited'] as num?)?.toInt() ?? 0,
      invite_points_earned:
          (json['invite_points_earned'] as num?)?.toInt() ?? 0,
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) =>
                    VentorInviteItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <VentorInviteItemModel>[],
    );

Map<String, dynamic> _$VentorInvitesDataToJson(_VentorInvitesData instance) =>
    <String, dynamic>{
      'invite_code': instance.invite_code,
      'invite_link': instance.invite_link,
      'total_invited': instance.total_invited,
      'invite_points_earned': instance.invite_points_earned,
      'items': instance.items,
    };

_VentorInviteItemModel _$VentorInviteItemModelFromJson(
  Map<String, dynamic> json,
) => _VentorInviteItemModel(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  status: json['status'] as String? ?? '',
  points_earned: (json['points_earned'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$VentorInviteItemModelToJson(
  _VentorInviteItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'status': instance.status,
  'points_earned': instance.points_earned,
};
