import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_find_listeners_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class VentorFindListenersRepository extends BaseRepository {
  const VentorFindListenersRepository(super.apiClient);

  TaskEither<Exception, VentorFindListenersResponseModel> searchListeners({
    String? q,
    String? topic,
    double? minPrice,
    double? maxPrice,
    String? languages,
    String? genders,
    double? minRating,
    String? favorites,
    bool? onlineOnly,
    int page = 1,
    int pageSize = 20,
  }) {
    final queryParams = <String, Object?>{
      'page': page,
      'page_size': pageSize,
      if (q != null && q.trim().isNotEmpty) 'q': q.trim(),
      if (topic != null && topic.trim().isNotEmpty && topic != 'all')
        'topic': topic.trim(),
      if (minPrice != null) 'min_price': minPrice,
      if (maxPrice != null) 'max_price': maxPrice,
      if (languages != null && languages.trim().isNotEmpty)
        'languages': languages.trim(),
      if (genders != null && genders.trim().isNotEmpty)
        'genders': genders.trim(),
      if (minRating != null && minRating > 0) 'min_rating': minRating,
      if (favorites != null &&
          favorites.trim().isNotEmpty &&
          favorites.trim() != 'any')
        'favorites': favorites.trim(),
      if (onlineOnly != null) 'online_only': onlineOnly,
    };

    return executeRequest(
      request: apiClient.get<Object?>('v1/listeners', queryParams: queryParams),
      fromJson: VentorFindListenersResponseModel.fromJson,
    );
  }

  TaskEither<Exception, VentorFindListenerResponseModel> getListener({
    required String listenerId,
  }) => executeRequest(
    request: apiClient.get<Object?>('v1/listeners/$listenerId'),
    fromJson: VentorFindListenerResponseModel.fromJson,
  );
}
