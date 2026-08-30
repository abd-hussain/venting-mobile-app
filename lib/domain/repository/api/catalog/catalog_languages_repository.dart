import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_language_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class CatalogLanguagesRepository extends BaseRepository {
  const CatalogLanguagesRepository(super.apiClient);

  /// `GET /v1/catalog/languages`
  TaskEither<Exception, CatalogLanguagesResponseModel> call() => executeRequest(
    request: apiClient.get<Object?>('v1/catalog/languages'),
    fromJson: CatalogLanguagesResponseModel.fromJson,
  );
}
