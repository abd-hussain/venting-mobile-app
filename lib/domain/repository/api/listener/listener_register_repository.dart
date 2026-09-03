import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/domain/data/api/listener_register_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/listener_registration_progress_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_profile_patch.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_step_slug.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';
import 'package:venting_mobile_app/utils/registration_media_storage.dart';

/// Step-based listener registration (`#22a`–`#22j`).
class ListenerRegisterRepository extends BaseRepository {
  const ListenerRegisterRepository(super.apiClient);

  TaskEither<Exception, ListenerRegistrationProgressModel> getProgress() {
    return TaskEither(() async {
      try {
        final result = await apiClient
            .get<Object?>('v1/listeners/register/progress')
            .run();
        return result.fold(Left.new, (response) {
          final json = normalizeToJsonMap(response.data);
          if (json['status'] == 'failed') {
            return Left(MainAPIException.fromJson(json));
          }
          return Right(ListenerRegistrationProgressModel.fromJson(json));
        });
      } on Object catch (error, stackTrace) {
        return Left(mapUnknownErrorToException(error, stackTrace));
      }
    });
  }

  TaskEither<Exception, ListenerRegistrationProgressModel> saveProfileStep({
    required ListenerRegistrationStep1Data data,
  }) {
    return _saveMultipartStep(
      slug: ListenerRegistrationStepSlug.profile,
      buildFormData: (formData) async {
        await _addLocalFile(formData, 'avatar', data.profilePhotoPath);
        formData.fields
          ..add(MapEntry('full_name', data.fullName.trim()))
          ..add(MapEntry('phone', _formatPhoneE164(data)))
          ..add(MapEntry('phone_country', data.phoneCountryIso));
      },
    );
  }

  TaskEither<Exception, ListenerRegistrationProgressModel> saveIdentityStep({
    required ListenerRegistrationStep2Data data,
  }) {
    return _saveMultipartStep(
      slug: ListenerRegistrationStepSlug.identity,
      buildFormData: (formData) async {
        await _addLocalFile(formData, 'identity_document', data.idImagePath);
        await _addLocalFile(formData, 'selfie', data.selfieImagePath);
      },
    );
  }

  TaskEither<Exception, ListenerRegistrationProgressModel> saveAboutStep({
    required ListenerRegistrationStep3Data data,
  }) {
    return _saveJsonStep(
      slug: ListenerRegistrationStepSlug.about,
      body: {
        'date_of_birth': _formatDate(data.dateOfBirth),
        'country_iso': data.countryIso,
        'city': data.city.trim(),
        'language_ids': data.languageIds,
      },
    );
  }

  TaskEither<Exception, ListenerRegistrationProgressModel> saveExperiencesStep({
    required ListenerRegistrationStep4Data data,
  }) {
    return _saveJsonStep(
      slug: ListenerRegistrationStepSlug.experiences,
      body: experiencesUpdateBody(
        relationshipId: data.relationshipId,
        familyIds: data.familyIds.toSet(),
        experienceIds: data.experienceIds.toSet(),
        customExperiences: data.customExperiences,
      ),
    );
  }

  TaskEither<Exception, ListenerRegistrationProgressModel>
  saveComfortAreasStep({required ListenerRegistrationStep5Data data}) {
    return _saveJsonStep(
      slug: ListenerRegistrationStepSlug.comfortAreas,
      body: {
        'comfort_area_ids': data.comfortAreaIds,
        if (data.comfortAreaOtherText?.trim().isNotEmpty ?? false)
          'custom_comfort_area_text': data.comfortAreaOtherText!.trim(),
      },
    );
  }

  TaskEither<Exception, ListenerRegistrationProgressModel> saveBoundariesStep({
    required ListenerRegistrationStep6Data data,
  }) {
    return _saveJsonStep(
      slug: ListenerRegistrationStepSlug.boundaries,
      body: {
        'boundary_ids': data.boundaryIds,
        if (data.boundaryOtherText?.trim().isNotEmpty ?? false)
          'custom_boundary_text': data.boundaryOtherText!.trim(),
      },
    );
  }

  TaskEither<Exception, ListenerRegistrationProgressModel> saveVoiceIntroStep({
    required ListenerRegistrationStep7Data data,
  }) {
    return _saveMultipartStep(
      slug: ListenerRegistrationStepSlug.voiceIntro,
      buildFormData: (formData) async {
        await _addLocalFile(formData, 'voice_intro', data.voiceIntroPath);
        formData.fields.add(
          MapEntry('voice_intro_seconds', '${data.voiceIntroSeconds}'),
        );
      },
    );
  }

  TaskEither<Exception, ListenerRegistrationProgressModel>
  saveAvailabilityStep({required ListenerRegistrationStep8Data data}) {
    return _saveJsonStep(
      slug: ListenerRegistrationStepSlug.availability,
      body: {
        'session_minutes': _resolveSessionMinutes(data.sessionMinutes),
        'availability': _availabilityPayload(data),
      },
    );
  }

  TaskEither<Exception, ListenerRegisterResponseModel> completeRegistration({
    String? fcmToken,
  }) {
    final trimmed = fcmToken?.trim();
    return executeRequest(
      request: apiClient.post<Object?>(
        'v1/listeners/register/complete',
        data: trimmed != null && trimmed.isNotEmpty
            ? {'fcm_token': trimmed}
            : const <String, dynamic>{},
      ),
      fromJson: ListenerRegisterResponseModel.fromJson,
    );
  }

  TaskEither<Exception, ListenerRegistrationProgressModel> _saveJsonStep({
    required ListenerRegistrationStepSlug slug,
    required Map<String, Object?> body,
  }) {
    return executeRequest(
      request: apiClient.patch<Object?>(
        'v1/listeners/register/steps/${slug.pathSegment}',
        data: body,
      ),
      fromJson: ListenerRegistrationProgressModel.fromJson,
    );
  }

  TaskEither<Exception, ListenerRegistrationProgressModel> _saveMultipartStep({
    required ListenerRegistrationStepSlug slug,
    required Future<void> Function(FormData formData) buildFormData,
  }) {
    return TaskEither(() async {
      try {
        final formData = FormData();
        await buildFormData(formData);
        return await executeRequest(
          request: apiClient.patch<Object?>(
            'v1/listeners/register/steps/${slug.pathSegment}',
            data: formData,
          ),
          fromJson: ListenerRegistrationProgressModel.fromJson,
        ).run();
      } on MainAPIException catch (error) {
        return Left(error);
      } on Object catch (error, stackTrace) {
        return Left(mapUnknownErrorToException(error, stackTrace));
      }
    });
  }

  int _resolveSessionMinutes(List<int> values) {
    if (values.isEmpty) return 30;
    return values.reduce((a, b) => a < b ? a : b);
  }

  Map<String, Object?> _availabilityPayload(
    ListenerRegistrationStep8Data data,
  ) {
    final from = listenerRegistrationTimeTo24Hour(data.availabilityFrom);
    final to = listenerRegistrationTimeTo24Hour(data.availabilityTo);

    return {
      'time_zone_id': data.timeZoneId,
      'days': data.availabilityDays
          .map(
            (day) => {
              'day': day,
              'slots': [
                {'start': from, 'end': to},
              ],
            },
          )
          .toList(growable: false),
    };
  }

  String _formatDate(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  String _formatPhoneE164(ListenerRegistrationStep1Data data) {
    final iso = IsoCode.values.byName(data.phoneCountryIso);
    final national = data.phoneNational.replaceAll(RegExp(r'\D'), '');
    try {
      final phone = PhoneNumber.parse(
        national,
        callerCountry: iso,
        destinationCountry: iso,
      );
      return phone.international.replaceAll(' ', '');
    } catch (_) {
      final dial = PhoneNumber(isoCode: iso, nsn: national).countryCode;
      return '$dial$national';
    }
  }

  Future<void> _addLocalFile(
    FormData formData,
    String field,
    String path,
  ) async {
    if (_isRemoteUrl(path)) return;

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
        await MultipartFile.fromFile(
          normalized,
          filename: _basename(normalized),
        ),
      ),
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
