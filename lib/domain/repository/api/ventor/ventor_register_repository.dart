import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_profile_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

/// `#8 POST /v1/ventors/register`
class VentorRegisterRepository extends BaseRepository {
  const VentorRegisterRepository(super.apiClient);

  TaskEither<Exception, VentorProfileResponseModel> call({
    required String nickname,
    required String gender,
    required List<String> languageIds,
    required List<String> interestIds,
    String? otherInterestText,
    int? avatarPresetIndex,
    String? avatarFilePath,
    required bool notificationsEnabled,
    String? fcmToken,
  }) {
    final trimmedOther = otherInterestText?.trim();
    final hasOtherText = trimmedOther != null && trimmedOther.isNotEmpty;
    final trimmedToken = fcmToken?.trim();
    final hasToken = trimmedToken != null && trimmedToken.isNotEmpty;

    if (avatarFilePath != null && avatarFilePath.trim().isNotEmpty) {
      return TaskEither(() async {
        try {
          final formData = FormData();
          formData.fields
            ..add(MapEntry('nickname', nickname))
            ..add(MapEntry('gender', gender))
            ..add(
              MapEntry(
                'notifications_enabled',
                notificationsEnabled.toString(),
              ),
            );
          for (final id in languageIds) {
            formData.fields.add(MapEntry('language_ids', id));
          }
          for (final id in interestIds) {
            formData.fields.add(MapEntry('interest_ids', id));
          }
          if (hasOtherText) {
            formData.fields.add(MapEntry('other_interest_text', trimmedOther));
          }
          if (avatarPresetIndex != null) {
            formData.fields.add(
              MapEntry('avatar_preset_index', '$avatarPresetIndex'),
            );
          }
          if (hasToken) {
            formData.fields.add(MapEntry('fcm_token', trimmedToken));
          }
          final path = avatarFilePath.trim();
          formData.files.add(
            MapEntry(
              'avatar',
              await MultipartFile.fromFile(path, filename: _basename(path)),
            ),
          );

          return await executeRequest(
            request: apiClient.post<Object?>(
              'v1/ventors/register',
              data: formData,
            ),
            fromJson: VentorProfileResponseModel.fromJson,
          ).run();
        } on Object catch (error, stackTrace) {
          return Left(
            MainAPIException(
              status: 'failed',
              type: 'unknown',
              code: -1,
              message: error.toString(),
              stackTrace: stackTrace,
            ),
          );
        }
      });
    }

    return executeRequest(
      request: apiClient.post<Object?>(
        'v1/ventors/register',
        data: <String, Object?>{
          'nickname': nickname,
          'gender': gender,
          'language_ids': languageIds,
          'interest_ids': interestIds,
          'notifications_enabled': notificationsEnabled,
          if (hasOtherText) 'other_interest_text': trimmedOther,
          if (avatarPresetIndex != null)
            'avatar_preset_index': avatarPresetIndex,
          'fcm_token': hasToken ? trimmedToken : null,
        },
      ),
      fromJson: VentorProfileResponseModel.fromJson,
    );
  }

  static String _basename(String path) {
    final normalized = path.replaceAll('\\', '/');
    final index = normalized.lastIndexOf('/');
    return index < 0 ? normalized : normalized.substring(index + 1);
  }
}
