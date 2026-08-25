import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_category_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class CatalogCategoriesRepository extends BaseRepository {
  const CatalogCategoriesRepository(super.apiClient);

  /// `GET /v1/catalog/categories`
  TaskEither<Exception, CatalogCategoriesResponseModel> call() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/catalog/categories'),
        fromJson: CatalogCategoriesResponseModel.fromJson,
      );
}
