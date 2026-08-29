// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_sessions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerSessionsListResponseModel _$ListenerSessionsListResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerSessionsListResponseModel(
  status: json['status'] as String,
  data: ListenerSessionsListData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerSessionsListResponseModelToJson(
  _ListenerSessionsListResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerSessionsListData _$ListenerSessionsListDataFromJson(
  Map<String, dynamic> json,
) => _ListenerSessionsListData(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => ListenerSessionModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ListenerSessionModel>[],
);

Map<String, dynamic> _$ListenerSessionsListDataToJson(
  _ListenerSessionsListData instance,
) => <String, dynamic>{'items': instance.items};

_ListenerSessionModel _$ListenerSessionModelFromJson(
  Map<String, dynamic> json,
) => _ListenerSessionModel(
  id: json['id'] as String? ?? '',
  scheduled_at: json['scheduled_at'] as String? ?? '',
  duration_minutes: (json['duration_minutes'] as num?)?.toInt() ?? 0,
  ventor_name: json['ventor_name'] as String? ?? '',
  ventor_avatar_url: json['ventor_avatar_url'] as String?,
  message: json['message'] as String? ?? '',
  chosen_reason: json['chosen_reason'] as String? ?? '',
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  speech_language: json['speech_language'] as String?,
  is_waiting: json['is_waiting'] as bool? ?? false,
  can_join_now: json['can_join_now'] as bool? ?? false,
  is_instant: json['is_instant'] as bool? ?? false,
  is_video_call: json['is_video_call'] as bool? ?? false,
  ventor_rating: json['ventor_rating'] as num? ?? 0,
  status_label: json['status_label'] as String?,
  session_cost: json['session_cost'] as num?,
  is_missed: json['is_missed'] as bool? ?? false,
  history_outcome: json['history_outcome'] as String?,
);

Map<String, dynamic> _$ListenerSessionModelToJson(
  _ListenerSessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'scheduled_at': instance.scheduled_at,
  'duration_minutes': instance.duration_minutes,
  'ventor_name': instance.ventor_name,
  'ventor_avatar_url': instance.ventor_avatar_url,
  'message': instance.message,
  'chosen_reason': instance.chosen_reason,
  'tags': instance.tags,
  'speech_language': instance.speech_language,
  'is_waiting': instance.is_waiting,
  'can_join_now': instance.can_join_now,
  'is_instant': instance.is_instant,
  'is_video_call': instance.is_video_call,
  'ventor_rating': instance.ventor_rating,
  'status_label': instance.status_label,
  'session_cost': instance.session_cost,
  'is_missed': instance.is_missed,
  'history_outcome': instance.history_outcome,
};

_ListenerSessionStatsResponseModel _$ListenerSessionStatsResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerSessionStatsResponseModel(
  status: json['status'] as String,
  data: ListenerSessionStatsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerSessionStatsResponseModelToJson(
  _ListenerSessionStatsResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerSessionStatsData _$ListenerSessionStatsDataFromJson(
  Map<String, dynamic> json,
) => _ListenerSessionStatsData(
  accepted_count: (json['accepted_count'] as num?)?.toInt() ?? 0,
  declined_count: (json['declined_count'] as num?)?.toInt() ?? 0,
  missed_count: (json['missed_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ListenerSessionStatsDataToJson(
  _ListenerSessionStatsData instance,
) => <String, dynamic>{
  'accepted_count': instance.accepted_count,
  'declined_count': instance.declined_count,
  'missed_count': instance.missed_count,
};

_ListenerSessionRequestsResponseModel
_$ListenerSessionRequestsResponseModelFromJson(Map<String, dynamic> json) =>
    _ListenerSessionRequestsResponseModel(
      status: json['status'] as String,
      data: ListenerSessionRequestsData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ListenerSessionRequestsResponseModelToJson(
  _ListenerSessionRequestsResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerSessionRequestsData _$ListenerSessionRequestsDataFromJson(
  Map<String, dynamic> json,
) => _ListenerSessionRequestsData(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                ListenerSessionRequestModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ListenerSessionRequestModel>[],
);

Map<String, dynamic> _$ListenerSessionRequestsDataToJson(
  _ListenerSessionRequestsData instance,
) => <String, dynamic>{'items': instance.items};

_ListenerSessionRequestModel _$ListenerSessionRequestModelFromJson(
  Map<String, dynamic> json,
) => _ListenerSessionRequestModel(
  id: json['id'] as String? ?? '',
  ventor_name: json['ventor_name'] as String? ?? '',
  ventor_avatar_url: json['ventor_avatar_url'] as String?,
  message: json['message'] as String? ?? '',
  chosen_reason: json['chosen_reason'] as String? ?? '',
  scheduled_at: json['scheduled_at'] as String? ?? '',
  duration_minutes: (json['duration_minutes'] as num?)?.toInt() ?? 0,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  received_at: json['received_at'] as String? ?? '',
  speech_language: json['speech_language'] as String?,
  is_instant: json['is_instant'] as bool? ?? false,
  is_video_call: json['is_video_call'] as bool? ?? false,
  ventor_rating: json['ventor_rating'] as num? ?? 0,
);

Map<String, dynamic> _$ListenerSessionRequestModelToJson(
  _ListenerSessionRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'ventor_name': instance.ventor_name,
  'ventor_avatar_url': instance.ventor_avatar_url,
  'message': instance.message,
  'chosen_reason': instance.chosen_reason,
  'scheduled_at': instance.scheduled_at,
  'duration_minutes': instance.duration_minutes,
  'tags': instance.tags,
  'received_at': instance.received_at,
  'speech_language': instance.speech_language,
  'is_instant': instance.is_instant,
  'is_video_call': instance.is_video_call,
  'ventor_rating': instance.ventor_rating,
};

_ListenerAcceptSessionRequestResponseModel
_$ListenerAcceptSessionRequestResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerAcceptSessionRequestResponseModel(
  status: json['status'] as String,
  data: ListenerAcceptSessionRequestData.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ListenerAcceptSessionRequestResponseModelToJson(
  _ListenerAcceptSessionRequestResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerAcceptSessionRequestData _$ListenerAcceptSessionRequestDataFromJson(
  Map<String, dynamic> json,
) => _ListenerAcceptSessionRequestData(
  session_id: json['session_id'] as String? ?? '',
  status: json['status'] as String? ?? '',
);

Map<String, dynamic> _$ListenerAcceptSessionRequestDataToJson(
  _ListenerAcceptSessionRequestData instance,
) => <String, dynamic>{
  'session_id': instance.session_id,
  'status': instance.status,
};
