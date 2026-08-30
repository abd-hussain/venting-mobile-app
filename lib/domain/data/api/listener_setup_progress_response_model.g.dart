// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_setup_progress_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerSetupProgressResponseModel
_$ListenerSetupProgressResponseModelFromJson(Map<String, dynamic> json) =>
    _ListenerSetupProgressResponseModel(
      status: json['status'] as String,
      data: ListenerSetupProgressData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ListenerSetupProgressResponseModelToJson(
  _ListenerSetupProgressResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerSetupProgressData _$ListenerSetupProgressDataFromJson(
  Map<String, dynamic> json,
) => _ListenerSetupProgressData(
  profile_approved: json['profile_approved'] as bool? ?? false,
  profile_status: json['profile_status'] as String? ?? 'incomplete',
  can_go_online: json['can_go_online'] as bool? ?? false,
  steps_to_refill:
      (json['steps_to_refill'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  rejection_reason: json['rejection_reason'] as String? ?? '',
  registration_complete: json['registration_complete'] as bool? ?? false,
  progress_percent: (json['progress_percent'] as num?)?.toInt() ?? 0,
  steps:
      (json['steps'] as List<dynamic>?)
          ?.map(
            (e) => ListenerSetupProgressStepModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <ListenerSetupProgressStepModel>[],
);

Map<String, dynamic> _$ListenerSetupProgressDataToJson(
  _ListenerSetupProgressData instance,
) => <String, dynamic>{
  'profile_approved': instance.profile_approved,
  'profile_status': instance.profile_status,
  'can_go_online': instance.can_go_online,
  'steps_to_refill': instance.steps_to_refill,
  'rejection_reason': instance.rejection_reason,
  'registration_complete': instance.registration_complete,
  'progress_percent': instance.progress_percent,
  'steps': instance.steps,
};

_ListenerSetupProgressStepModel _$ListenerSetupProgressStepModelFromJson(
  Map<String, dynamic> json,
) => _ListenerSetupProgressStepModel(
  id: json['id'] as String? ?? '',
  status: json['status'] as String? ?? '',
);

Map<String, dynamic> _$ListenerSetupProgressStepModelToJson(
  _ListenerSetupProgressStepModel instance,
) => <String, dynamic>{'id': instance.id, 'status': instance.status};
