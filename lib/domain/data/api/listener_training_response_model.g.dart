// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_training_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerTrainingResponseModel _$ListenerTrainingResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerTrainingResponseModel(
  status: json['status'] as String,
  data: ListenerTrainingData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerTrainingResponseModelToJson(
  _ListenerTrainingResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerTrainingData _$ListenerTrainingDataFromJson(
  Map<String, dynamic> json,
) => _ListenerTrainingData(
  modules:
      (json['modules'] as List<dynamic>?)
          ?.map(
            (e) =>
                ListenerTrainingModuleModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ListenerTrainingModuleModel>[],
  all_completed: json['all_completed'] as bool? ?? false,
  setup_progress: json['setup_progress'] == null
      ? null
      : ListenerSetupProgressData.fromJson(
          json['setup_progress'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ListenerTrainingDataToJson(
  _ListenerTrainingData instance,
) => <String, dynamic>{
  'modules': instance.modules,
  'all_completed': instance.all_completed,
  'setup_progress': instance.setup_progress,
};

_ListenerTrainingModuleModel _$ListenerTrainingModuleModelFromJson(
  Map<String, dynamic> json,
) => _ListenerTrainingModuleModel(
  id: json['id'] as String? ?? '',
  title: json['title'] as String? ?? '',
  status: json['status'] as String? ?? '',
  content_url: json['content_url'] as String? ?? '',
);

Map<String, dynamic> _$ListenerTrainingModuleModelToJson(
  _ListenerTrainingModuleModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'status': instance.status,
  'content_url': instance.content_url,
};
