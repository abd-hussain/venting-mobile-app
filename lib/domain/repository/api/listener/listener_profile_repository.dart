import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_profile_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/listener_reviews_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/listener_voice_intro_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';
import 'package:venting_mobile_app/utils/registration_media_storage.dart';

class ListenerProfileRepository extends BaseRepository {
  const ListenerProfileRepository(super.apiClient);

  TaskEither<Exception, ListenerProfileResponseModel> getProfile() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/listeners/me'),
        fromJson: ListenerProfileResponseModel.fromJson,
      );

  TaskEither<Exception, ListenerReviewsResponseModel> getReviews({
    int page = 1,
    int pageSize = 50,
  }) => executeRequest(
    request: apiClient.get<Object?>(
      'v1/listeners/me/reviews',
      queryParams: <String, Object?>{'page': page, 'page_size': pageSize},
    ),
    fromJson: ListenerReviewsResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerProfileResponseModel> updateAvatar({
    required String avatarFilePath,
  }) {
    return TaskEither(() async {
      try {
        final formData = FormData();
        await _addLocalFile(formData, 'avatar', avatarFilePath);
        return await executeRequest(
          request: apiClient.post<Object?>(
            'v1/listeners/me/avatar',
            data: formData,
          ),
          fromJson: ListenerProfileResponseModel.fromJson,
        ).run();
      } on MainAPIException catch (error) {
        return Left(error);
      } on Object catch (error, stackTrace) {
        return Left(mapUnknownErrorToException(error, stackTrace));
      }
    });
  }

  TaskEither<Exception, ListenerProfileResponseModel> updatePhone({
    required String phone,
    required String phoneCountry,
  }) => executeRequest(
    request: apiClient.patch<Object?>(
      'v1/listeners/me',
      data: <String, dynamic>{'phone': phone, 'phone_country': phoneCountry},
    ),
    fromJson: ListenerProfileResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerProfileResponseModel> updateAboutMe({
    required String aboutMe,
  }) => patchProfile(fields: <String, dynamic>{'about_me': aboutMe});

  TaskEither<Exception, ListenerProfileResponseModel> patchProfile({
    required Map<String, dynamic> fields,
  }) => executeRequest(
    request: apiClient.patch<Object?>('v1/listeners/me', data: fields),
    fromJson: ListenerProfileResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerVoiceIntroResponseModel> updateVoiceIntro({
    required String voiceFilePath,
    required int durationSeconds,
  }) {
    return TaskEither(() async {
      try {
        final formData = FormData();
        await _addLocalFile(formData, 'audio', voiceFilePath);
        if (durationSeconds > 0) {
          formData.fields.add(
            MapEntry('voice_intro_seconds', '$durationSeconds'),
          );
        }
        return await executeRequest(
          request: apiClient.post<Object?>(
            'v1/listeners/me/voice-intro',
            data: formData,
          ),
          fromJson: ListenerVoiceIntroResponseModel.fromJson,
        ).run();
      } on MainAPIException catch (error) {
        return Left(error);
      } on Object catch (error, stackTrace) {
        return Left(mapUnknownErrorToException(error, stackTrace));
      }
    });
  }
}

Future<void> _addLocalFile(FormData formData, String field, String path) async {
  final normalized = RegistrationMediaStorage.normalizePath(path);
  final file = File(normalized);
  if (!await file.exists()) {
    throw MainAPIException(
      status: 'failed',
      type: 'validation',
      code: -2,
      message: '$field is missing on device. Please recapture and try again.',
    );
  }

  if (await file.length() == 0) {
    throw MainAPIException(
      status: 'failed',
      type: 'validation',
      code: -2,
      message: '$field is empty. Please recapture and try again.',
    );
  }

  formData.files.add(
    MapEntry(
      field,
      await MultipartFile.fromFile(normalized, filename: _basename(normalized)),
    ),
  );
}

String _basename(String path) {
  final normalized = path.replaceAll('\\', '/');
  final index = normalized.lastIndexOf('/');
  return index < 0 ? normalized : normalized.substring(index + 1);
}
