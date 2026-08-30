import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_profile_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_registration_progress_model.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_registration_step_slug.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';
import 'package:venting_mobile_app/utils/registration_media_storage.dart';

/// Step-based ventor registration (`#8a`–`#8e`).
class VentorRegisterRepository extends BaseRepository {
  const VentorRegisterRepository(super.apiClient);

  TaskEither<Exception, VentorRegistrationProgressModel> getProgress() {
    return TaskEither(() async {
      try {
        final result = await apiClient
            .get<Object?>('v1/ventors/register/progress')
            .run();
        return result.fold(Left.new, (response) {
          final json = normalizeToJsonMap(response.data);
          if (json['status'] == 'failed') {
            return Left(MainAPIException.fromJson(json));
          }
          return Right(VentorRegistrationProgressModel.fromJson(json));
        });
      } on Object catch (error, stackTrace) {
        return Left(mapUnknownErrorToException(error, stackTrace));
      }
    });
  }

  TaskEither<Exception, VentorRegistrationProgressModel> saveProfileStep({
    required String nickname,
    required String gender,
    int? avatarPresetIndex,
    String? avatarFilePath,
  }) {
    final trimmedPath = avatarFilePath?.trim();
    final hasGalleryAvatar =
        trimmedPath != null &&
        trimmedPath.isNotEmpty &&
        !_isRemoteUrl(trimmedPath);

    if (hasGalleryAvatar) {
      return TaskEither(() async {
        try {
          final formData = FormData();
          formData.fields
            ..add(MapEntry('nickname', nickname))
            ..add(MapEntry('gender', gender));

          final path = RegistrationMediaStorage.normalizePath(trimmedPath);
          formData.files.add(
            MapEntry(
              'avatar',
              await MultipartFile.fromFile(path, filename: _basename(path)),
            ),
          );

          return await _saveMultipartStep(
            slug: VentorRegistrationStepSlug.profile,
            formData: formData,
          ).run();
        } on Object catch (error, stackTrace) {
          return Left(mapUnknownErrorToException(error, stackTrace));
        }
      });
    }

    return _saveJsonStep(
      slug: VentorRegistrationStepSlug.profile,
      body: {
        'nickname': nickname,
        'gender': gender,
        if (avatarPresetIndex != null) 'avatar_preset_index': avatarPresetIndex,
      },
    );
  }

  TaskEither<Exception, VentorRegistrationProgressModel> saveLanguagesStep({
    required List<String> languageIds,
  }) {
    return _saveJsonStep(
      slug: VentorRegistrationStepSlug.languages,
      body: {'language_ids': languageIds},
    );
  }

  TaskEither<Exception, VentorRegistrationProgressModel> saveInterestsStep({
    required List<String> interestIds,
    String? otherInterestText,
  }) {
    final trimmedOther = otherInterestText?.trim();
    return _saveJsonStep(
      slug: VentorRegistrationStepSlug.interests,
      body: {
        'interest_ids': interestIds,
        if (trimmedOther != null && trimmedOther.isNotEmpty)
          'other_interest_text': trimmedOther,
      },
    );
  }

  TaskEither<Exception, VentorProfileResponseModel> completeRegistration({
    required bool notificationsEnabled,
    String? fcmToken,
  }) {
    final trimmedToken = fcmToken?.trim();
    final hasToken = trimmedToken != null && trimmedToken.isNotEmpty;

    return executeRequest(
      request: apiClient.post<Object?>(
        'v1/ventors/register/complete',
        data: {
          'notifications_enabled': notificationsEnabled,
          if (hasToken) 'fcm_token': trimmedToken,
        },
      ),
      fromJson: VentorProfileResponseModel.fromJson,
    );
  }

  TaskEither<Exception, VentorRegistrationProgressModel> _saveJsonStep({
    required VentorRegistrationStepSlug slug,
    required Map<String, Object?> body,
  }) {
    return executeRequest(
      request: apiClient.patch<Object?>(
        'v1/ventors/register/steps/${slug.pathSegment}',
        data: body,
      ),
      fromJson: VentorRegistrationProgressModel.fromJson,
    );
  }

  TaskEither<Exception, VentorRegistrationProgressModel> _saveMultipartStep({
    required VentorRegistrationStepSlug slug,
    required FormData formData,
  }) {
    return executeRequest(
      request: apiClient.patch<Object?>(
        'v1/ventors/register/steps/${slug.pathSegment}',
        data: formData,
      ),
      fromJson: VentorRegistrationProgressModel.fromJson,
    );
  }

  static bool _isRemoteUrl(String path) {
    final trimmed = path.trim().toLowerCase();
    return trimmed.startsWith('http://') || trimmed.startsWith('https://');
  }

  static String _basename(String path) {
    final normalized = path.replaceAll('\\', '/');
    final index = normalized.lastIndexOf('/');
    return index < 0 ? normalized : normalized.substring(index + 1);
  }
}
