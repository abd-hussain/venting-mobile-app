import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_favorites_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_mood_journey_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_profile_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';
import 'package:venting_mobile_app/utils/registration_media_storage.dart';

class VentorProfileRepository extends BaseRepository {
  const VentorProfileRepository(super.apiClient);

  TaskEither<Exception, VentorProfileResponseModel> getProfile() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/ventors/me'),
        fromJson: VentorProfileResponseModel.fromJson,
      );

  TaskEither<Exception, VentorMoodJourneyResponseModel> getMoodJourney({
    int days = 7,
  }) => executeRequest(
    request: apiClient.get<Object?>(
      'v1/ventors/me/mood-journey',
      queryParams: <String, Object?>{'days': days},
    ),
    fromJson: VentorMoodJourneyResponseModel.fromJson,
  );

  TaskEither<Exception, VentorFavoritesResponseModel> getFavorites() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/ventors/me/favorites'),
        fromJson: VentorFavoritesResponseModel.fromJson,
      );

  TaskEither<Exception, void> addFavorite({required String listenerId}) =>
      executeVoidRequest(
        request: apiClient.post<Object?>(
          'v1/ventors/me/favorites/$listenerId',
          data: const <String, dynamic>{},
        ),
      );

  TaskEither<Exception, void> removeFavorite({required String listenerId}) =>
      executeVoidRequest(
        request: apiClient.delete<Object?>(
          'v1/ventors/me/favorites/$listenerId',
        ),
      );

  TaskEither<Exception, VentorProfileResponseModel> updateProfile({
    String? nickname,
    String? avatarFilePath,
  }) {
    final trimmedNickname = nickname?.trim();
    final trimmedAvatarPath = avatarFilePath?.trim();
    final hasNickname = trimmedNickname != null && trimmedNickname.isNotEmpty;
    final hasAvatar =
        trimmedAvatarPath != null &&
        trimmedAvatarPath.isNotEmpty &&
        !_isRemoteUrl(trimmedAvatarPath);

    if (!hasNickname && !hasAvatar) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'No profile fields to update',
        ),
      );
    }

    if (hasAvatar) {
      return TaskEither(() async {
        try {
          final formData = FormData();
          if (hasNickname) {
            formData.fields.add(MapEntry('nickname', trimmedNickname));
          }

          final path = RegistrationMediaStorage.normalizePath(
            trimmedAvatarPath,
          );
          formData.files.add(
            MapEntry(
              'avatar',
              await MultipartFile.fromFile(path, filename: _basename(path)),
            ),
          );

          return await executeRequest(
            request: apiClient.patch<Object?>('v1/ventors/me', data: formData),
            fromJson: VentorProfileResponseModel.fromJson,
          ).run();
        } on MainAPIException catch (error) {
          return Left(error);
        } on Object catch (error, stackTrace) {
          return Left(mapUnknownErrorToException(error, stackTrace));
        }
      });
    }

    return executeRequest(
      request: apiClient.patch<Object?>(
        'v1/ventors/me',
        data: <String, dynamic>{'nickname': trimmedNickname},
      ),
      fromJson: VentorProfileResponseModel.fromJson,
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
