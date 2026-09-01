import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_life_experience_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class CatalogLifeExperiencesRepository extends BaseRepository {
  const CatalogLifeExperiencesRepository(super.apiClient);

  /// `GET /v1/catalog/life-experiences`
  TaskEither<Exception, CatalogLifeExperiencesResponseModel> call() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/catalog/life-experiences'),
        fromJson: CatalogLifeExperiencesResponseModel.fromJson,
      );
}
