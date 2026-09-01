import 'package:venting_mobile_app/domain/data/api/auth_me_response_model.dart';
import 'package:venting_mobile_app/domain/repository/app/auth_me_cache_repository.dart';

class GetCachedAuthMeUsecase {
  final AuthMeCacheRepository authMeCacheRepository;

  const GetCachedAuthMeUsecase(this.authMeCacheRepository);

  AuthMeData? call() => authMeCacheRepository.read();
}
