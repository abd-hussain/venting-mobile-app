import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/domain/data/api/listener_register_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';
import 'package:venting_mobile_app/utils/registration_media_storage.dart';

/// `#22 POST /v1/listeners/register`
class ListenerRegisterRepository extends BaseRepository {
  const ListenerRegisterRepository(super.apiClient);

  TaskEither<Exception, ListenerRegisterResponseModel> call({
    required ListenerRegistrationDraft draft,
  }) {
    return TaskEither(() async {
      try {
        final formData = await _buildFormData(draft);
        return await executeRequest(
          request: apiClient.post<Object?>(
            'v1/listeners/register',
            data: formData,
          ),
          fromJson: ListenerRegisterResponseModel.fromJson,
        ).run();
      } on MainAPIException catch (error) {
        return Left(error);
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

  Future<FormData> _buildFormData(ListenerRegistrationDraft draft) async {
    final formData = FormData();

    // Attach files first — temp camera paths may be purged before submit.
    await _addFile(formData, 'avatar', draft.profilePhotoPath!);
    await _addFile(formData, 'document_front', draft.idImagePath!);
    await _addFile(formData, 'selfie', draft.selfieImagePath!);
    await _addFile(formData, 'voice_intro', draft.voiceIntroPath!);

    formData.fields
      ..add(MapEntry('full_name', draft.fullName.trim()))
      ..add(MapEntry('phone', _formatPhoneE164(draft)))
      ..add(MapEntry('phone_country', draft.phoneCountryIso))
      ..add(MapEntry('agreed_to_terms', draft.agreedToTerms.toString()))
      ..add(MapEntry('date_of_birth', _formatDate(draft.dateOfBirth!)))
      ..add(MapEntry('country_iso', draft.countryIso!))
      ..add(MapEntry('city', draft.city.trim()))
      ..add(
        MapEntry('accept_instant_calls', draft.acceptInstantCalls.toString()),
      )
      ..add(
        MapEntry(
          'notifications_enabled',
          draft.notificationsEnabled.toString(),
        ),
      )
      ..add(MapEntry('voice_intro_seconds', '${draft.voiceIntroSeconds}'));

    final fcmToken = draft.fcmToken?.trim();
    if (fcmToken != null && fcmToken.isNotEmpty) {
      formData.fields.add(MapEntry('fcm_token', fcmToken));
    }

    final comfortOther = draft.comfortAreaOtherText?.trim();
    if (comfortOther != null && comfortOther.isNotEmpty) {
      formData.fields.add(MapEntry('custom_comfort_area_text', comfortOther));
    }

    final boundaryOther = draft.boundaryOtherText?.trim();
    if (boundaryOther != null && boundaryOther.isNotEmpty) {
      formData.fields.add(MapEntry('custom_boundary_text', boundaryOther));
    }

    _addJsonArrayField(formData, 'language_ids', draft.languageIds);
    _addJsonArrayField(
      formData,
      'life_experience_ids',
      draft.lifeExperienceIds,
    );
    if (draft.customExperiences.isNotEmpty) {
      _addJsonArrayField(
        formData,
        'custom_experiences',
        draft.customExperiences,
      );
    }
    _addJsonArrayField(formData, 'comfort_area_ids', draft.comfortAreaIds);
    if (draft.boundaryIds.isNotEmpty) {
      _addJsonArrayField(formData, 'boundary_ids', draft.boundaryIds);
    }
    formData.fields.add(
      MapEntry(
        'session_minutes',
        '${_resolveSessionMinutes(draft.sessionMinutes)}',
      ),
    );

    formData.fields.add(
      MapEntry('availability', jsonEncode(_availabilityPayload(draft))),
    );

    return formData;
  }

  void _addJsonArrayField(
    FormData formData,
    String field,
    List<String> values,
  ) {
    formData.fields.add(MapEntry(field, jsonEncode(values)));
  }

  /// Backend `#22` accepts one integer (`session_length_minutes` semantics).
  /// When the UI has both 30 and 60 selected, send the shortest option.
  int _resolveSessionMinutes(List<int> values) {
    if (values.isEmpty) return 30;
    return values.reduce((a, b) => a < b ? a : b);
  }

  Map<String, Object?> _availabilityPayload(ListenerRegistrationDraft draft) {
    final from = listenerRegistrationTimeTo24Hour(draft.availabilityFrom);
    final to = listenerRegistrationTimeTo24Hour(draft.availabilityTo);

    return {
      'time_zone_id': draft.timeZoneId,
      'days': draft.availabilityDays
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

  String _formatPhoneE164(ListenerRegistrationDraft draft) {
    final iso = IsoCode.values.byName(draft.phoneCountryIso);
    final national = draft.phoneNational.replaceAll(RegExp(r'\D'), '');
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

  Future<void> _addFile(FormData formData, String field, String path) async {
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

    final bytes = await file.readAsBytes();
    if (bytes.isEmpty) {
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
        MultipartFile.fromBytes(
          bytes,
          filename: _uploadFilename(field, normalized),
          contentType: _contentTypeFor(field, normalized),
        ),
      ),
    );
  }

  static String _uploadFilename(String field, String path) {
    final ext = _extension(path);
    return '$field$ext';
  }

  static String _extension(String path) {
    final dot = path.lastIndexOf('.');
    if (dot <= 0 || dot == path.length - 1) {
      return '.jpg';
    }
    return path.substring(dot).toLowerCase();
  }

  static MediaType _contentTypeFor(String field, String path) {
    if (field == 'voice_intro') {
      return switch (_extension(path)) {
        '.wav' => MediaType('audio', 'wav'),
        '.ogg' => MediaType('audio', 'ogg'),
        '.amr' => MediaType('audio', 'amr'),
        _ => MediaType('audio', 'mp4'),
      };
    }

    return switch (_extension(path)) {
      '.png' => MediaType('image', 'png'),
      '.webp' => MediaType('image', 'webp'),
      '.heic' || '.heif' => MediaType('image', 'heic'),
      _ => MediaType('image', 'jpeg'),
    };
  }
}
