import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/refresh_token_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class AuthRefreshTokenRepository extends BaseRepository {
  const AuthRefreshTokenRepository(super.apiClient);

  TaskEither<Exception, RefreshTokenResponseModel> call({
    required String refreshToken,
  }) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/auth/refresh',
      data: {'refresh_token': refreshToken},
    ),
    fromJson: RefreshTokenResponseModel.fromJson,
  );
}
