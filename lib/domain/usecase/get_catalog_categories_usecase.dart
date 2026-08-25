import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/catalog_category_model.dart';
import 'package:venting_mobile_app/domain/repository/api/catalog/catalog_categories_repository.dart';

class GetCatalogCategoriesUsecase {
  const GetCatalogCategoriesUsecase(this._catalogCategoriesRepository);

  final CatalogCategoriesRepository _catalogCategoriesRepository;

  TaskEither<Exception, CatalogCategoriesResponseModel> call() =>
      _catalogCategoriesRepository.call();
}
