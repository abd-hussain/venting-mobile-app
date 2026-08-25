import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/repository/app/auth_me_cache_repository.dart';

class ClearAuthSessionUsecase {
  final VentingPreferences ventingPreferences;
  final AuthMeCacheRepository authMeCacheRepository;

  const ClearAuthSessionUsecase(
    this.ventingPreferences,
    this.authMeCacheRepository,
  );

  Future<void> call() async {
    await ventingPreferences.remove(SavedConstants.accessToken);
    await ventingPreferences.remove(SavedConstants.refreshToken);
    await authMeCacheRepository.clear();
  }
}
