import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_language_model.dart';
import 'package:venting_mobile_app/domain/repository/api/catalog/catalog_languages_repository.dart';

class GetCatalogLanguagesUsecase {
  const GetCatalogLanguagesUsecase(this._catalogLanguagesRepository);

  final CatalogLanguagesRepository _catalogLanguagesRepository;

  TaskEither<Exception, CatalogLanguagesResponseModel> call() =>
      _catalogLanguagesRepository.call();
}
