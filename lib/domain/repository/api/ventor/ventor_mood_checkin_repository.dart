import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_mood_checkin_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class VentorMoodCheckinRepository extends BaseRepository {
  const VentorMoodCheckinRepository(super.apiClient);

  TaskEither<Exception, VentorMoodCheckinResponseModel> submitCheckin({
    required String mood,
    String? note,
  }) {
    final trimmedMood = mood.trim();
    final trimmedNote = note?.trim();
    final body = <String, dynamic>{
      'mood': trimmedMood,
      if (trimmedNote != null && trimmedNote.isNotEmpty) 'note': trimmedNote,
    };

    return executeRequest(
      request: apiClient.post<Object?>(
        'v1/ventors/me/mood-checkins',
        data: body,
      ),
      fromJson: VentorMoodCheckinResponseModel.fromJson,
    );
  }
}
