import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_life_experience_model.dart';
import 'package:venting_mobile_app/domain/repository/api/catalog/catalog_life_experiences_repository.dart';

class GetCatalogLifeExperiencesUsecase {
  const GetCatalogLifeExperiencesUsecase(
    this._catalogLifeExperiencesRepository,
  );

  final CatalogLifeExperiencesRepository _catalogLifeExperiencesRepository;

  TaskEither<Exception, CatalogLifeExperiencesResponseModel> call() =>
      _catalogLifeExperiencesRepository.call();
}
