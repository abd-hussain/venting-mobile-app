import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_boundary_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class CatalogBoundariesRepository extends BaseRepository {
  const CatalogBoundariesRepository(super.apiClient);

  /// `GET /v1/catalog/boundaries`
  TaskEither<Exception, CatalogBoundariesResponseModel> call() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/catalog/boundaries'),
        fromJson: CatalogBoundariesResponseModel.fromJson,
      );
}
