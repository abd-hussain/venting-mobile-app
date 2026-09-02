import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_find_listeners.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_find_listeners_repository.dart';

class GetVentorFindListenersUsecase {
  final VentorFindListenersRepository ventorFindListenersRepository;
  final VentingPreferences ventingPreferences;
  final AppConfig appConfig;

  const GetVentorFindListenersUsecase(
    this.ventorFindListenersRepository,
    this.ventingPreferences,
    this.appConfig,
  );

  TaskEither<Exception, VentorFindListenersPageData> call(
    VentorFindListenersQueryData query,
  ) {
    final accessToken = ventingPreferences
        .getValue(SavedConstants.accessToken, '')
        .trim();

    if (accessToken.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'auth',
          code: 401,
          message: 'Missing access token',
        ),
      );
    }

    final languages = query.languageIds.isEmpty
        ? null
        : query.languageIds.join(',');
    final genders = query.genders.isEmpty
        ? null
        : query.genders.map(ventorFindListenerGenderToApi).join(',');

    final isDefaultPrice =
        query.minPricePerMinute <= 0 && query.maxPricePerMinute >= 3;

    return ventorFindListenersRepository
        .searchListeners(
          q: query.query,
          topic: query.topicId,
          minPrice: isDefaultPrice ? null : query.minPricePerMinute,
          maxPrice: isDefaultPrice ? null : query.maxPricePerMinute,
          languages: languages,
          genders: genders,
          minRating: query.minRating,
          favorites: ventorFindFavoriteFilterToApi(query.favoriteFilter),
          page: query.page,
          pageSize: query.pageSize,
        )
        .map(
          (response) => ventorFindListenersPageFromApi(
            response.data,
            apiBaseUrl: appConfig.baseUrl,
          ),
        );
  }
}
