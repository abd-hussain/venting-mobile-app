import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_home_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class VentorHomeRepository extends BaseRepository {
  const VentorHomeRepository(super.apiClient);

  TaskEither<Exception, VentorHomeResponseModel> getHome() => executeRequest(
    request: apiClient.get<Object?>('v1/ventors/me/home'),
    fromJson: VentorHomeResponseModel.fromJson,
  );
}
