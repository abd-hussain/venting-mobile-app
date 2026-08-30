import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_boundary_model.dart';
import 'package:venting_mobile_app/domain/repository/api/catalog/catalog_boundaries_repository.dart';

class GetCatalogBoundariesUsecase {
  const GetCatalogBoundariesUsecase(this._catalogBoundariesRepository);

  final CatalogBoundariesRepository _catalogBoundariesRepository;

  TaskEither<Exception, CatalogBoundariesResponseModel> call() =>
      _catalogBoundariesRepository.call();
}
