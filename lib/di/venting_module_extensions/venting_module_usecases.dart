import 'package:get_it/get_it.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/di/venting_module.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_change_password_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_check_email_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_delete_account_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_forgot_password_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_login_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_logout_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_me_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_refresh_token_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_register_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_social_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/catalog/catalog_boundaries_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/catalog/catalog_categories_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/catalog/catalog_languages_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/catalog/catalog_life_experiences_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_register_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_register_repository.dart';
import 'package:venting_mobile_app/domain/repository/app/auth_me_cache_repository.dart';
import 'package:venting_mobile_app/domain/repository/app/social_sign_in_repository.dart';
import 'package:venting_mobile_app/domain/usecase/auth_change_password_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_check_email_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_delete_account_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_forgot_password_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_login_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_logout_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_me_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_refresh_token_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_register_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_social_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/clear_auth_session_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_cached_auth_me_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_boundaries_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_categories_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_languages_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_life_experiences_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/listener_register_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/sign_in_with_apple_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/sign_in_with_google_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/ventor_register_usecase.dart';

/// Usecases mixin for VentingModule
/// Handles all usecase factory methods
mixin VentingModuleUsecases on VentingModule {
  AuthCheckEmailUsecase authCheckEmailUsecase(
    AuthCheckEmailRepository authCheckEmailRepository,
  ) => AuthCheckEmailUsecase(authCheckEmailRepository);

  AuthRegisterUsecase authRegisterUsecase(
    AuthRegisterRepository authRegisterRepository,
  ) => AuthRegisterUsecase(authRegisterRepository);

  AuthLoginUsecase authLoginUsecase(AuthLoginRepository authLoginRepository) =>
      AuthLoginUsecase(authLoginRepository);

  AuthForgotPasswordUsecase authForgotPasswordUsecase(
    AuthForgotPasswordRepository authForgotPasswordRepository,
  ) => AuthForgotPasswordUsecase(authForgotPasswordRepository);

  AuthRefreshTokenUsecase authRefreshTokenUsecase(
    AuthRefreshTokenRepository authRefreshTokenRepository,
    VentingPreferences ventingPreferences,
  ) => AuthRefreshTokenUsecase(authRefreshTokenRepository, ventingPreferences);

  AuthLogoutUsecase authLogoutUsecase(
    AuthLogoutRepository authLogoutRepository,
    VentingPreferences ventingPreferences,
  ) => AuthLogoutUsecase(authLogoutRepository, ventingPreferences);

  AuthDeleteAccountUsecase authDeleteAccountUsecase(
    AuthDeleteAccountRepository authDeleteAccountRepository,
    VentingPreferences ventingPreferences,
  ) =>
      AuthDeleteAccountUsecase(authDeleteAccountRepository, ventingPreferences);

  AuthChangePasswordUsecase authChangePasswordUsecase(
    AuthChangePasswordRepository authChangePasswordRepository,
    VentingPreferences ventingPreferences,
  ) => AuthChangePasswordUsecase(
    authChangePasswordRepository,
    ventingPreferences,
  );

  AuthMeUsecase authMeUsecase(
    AuthMeRepository authMeRepository,
    AuthMeCacheRepository authMeCacheRepository,
    VentingPreferences ventingPreferences,
  ) => AuthMeUsecase(
    authMeRepository,
    authMeCacheRepository,
    ventingPreferences,
  );

  GetCachedAuthMeUsecase getCachedAuthMeUsecase(
    AuthMeCacheRepository authMeCacheRepository,
  ) => GetCachedAuthMeUsecase(authMeCacheRepository);

  ClearAuthSessionUsecase clearAuthSessionUsecase(
    VentingPreferences ventingPreferences,
    AuthMeCacheRepository authMeCacheRepository,
  ) => ClearAuthSessionUsecase(ventingPreferences, authMeCacheRepository);

  AuthSocialUsecase authSocialUsecase(
    AuthSocialRepository authSocialRepository,
  ) => AuthSocialUsecase(authSocialRepository);

  SignInWithGoogleUsecase signInWithGoogleUsecase(
    SocialSignInRepository socialSignInRepository,
  ) => SignInWithGoogleUsecase(socialSignInRepository);

  SignInWithAppleUsecase signInWithAppleUsecase(
    SocialSignInRepository socialSignInRepository,
  ) => SignInWithAppleUsecase(socialSignInRepository);

  GetCatalogCategoriesUsecase getCatalogCategoriesUsecase(
    CatalogCategoriesRepository catalogCategoriesRepository,
  ) => GetCatalogCategoriesUsecase(catalogCategoriesRepository);

  GetCatalogLanguagesUsecase getCatalogLanguagesUsecase(
    CatalogLanguagesRepository catalogLanguagesRepository,
  ) => GetCatalogLanguagesUsecase(catalogLanguagesRepository);

  GetCatalogLifeExperiencesUsecase getCatalogLifeExperiencesUsecase(
    CatalogLifeExperiencesRepository catalogLifeExperiencesRepository,
  ) => GetCatalogLifeExperiencesUsecase(catalogLifeExperiencesRepository);

  GetCatalogBoundariesUsecase getCatalogBoundariesUsecase(
    CatalogBoundariesRepository catalogBoundariesRepository,
  ) => GetCatalogBoundariesUsecase(catalogBoundariesRepository);

  VentorRegisterUsecase ventorRegisterUsecase(
    VentorRegisterRepository ventorRegisterRepository,
    VentingPreferences ventingPreferences,
  ) => VentorRegisterUsecase(ventorRegisterRepository, ventingPreferences);

  ListenerRegisterUsecase listenerRegisterUsecase(
    ListenerRegisterRepository listenerRegisterRepository,
    VentingPreferences ventingPreferences,
  ) => ListenerRegisterUsecase(listenerRegisterRepository, ventingPreferences);

  /// Registers all usecase dependencies
  void registerUsecases(GetIt getIt, AppConfig appConfig) {
    getIt.registerFactory<AuthCheckEmailUsecase>(
      () => authCheckEmailUsecase(getIt<AuthCheckEmailRepository>()),
    );
    getIt.registerFactory<AuthRegisterUsecase>(
      () => authRegisterUsecase(getIt<AuthRegisterRepository>()),
    );
    getIt.registerFactory<AuthLoginUsecase>(
      () => authLoginUsecase(getIt<AuthLoginRepository>()),
    );
    getIt.registerFactory<AuthForgotPasswordUsecase>(
      () => authForgotPasswordUsecase(getIt<AuthForgotPasswordRepository>()),
    );
    getIt.registerFactory<AuthRefreshTokenUsecase>(
      () => authRefreshTokenUsecase(
        getIt<AuthRefreshTokenRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<AuthLogoutUsecase>(
      () => authLogoutUsecase(
        getIt<AuthLogoutRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<AuthDeleteAccountUsecase>(
      () => authDeleteAccountUsecase(
        getIt<AuthDeleteAccountRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<AuthChangePasswordUsecase>(
      () => authChangePasswordUsecase(
        getIt<AuthChangePasswordRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<AuthMeUsecase>(
      () => authMeUsecase(
        getIt<AuthMeRepository>(),
        getIt<AuthMeCacheRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<GetCachedAuthMeUsecase>(
      () => getCachedAuthMeUsecase(getIt<AuthMeCacheRepository>()),
    );
    getIt.registerFactory<ClearAuthSessionUsecase>(
      () => clearAuthSessionUsecase(
        getIt<VentingPreferences>(),
        getIt<AuthMeCacheRepository>(),
      ),
    );
    getIt.registerFactory<AuthSocialUsecase>(
      () => authSocialUsecase(getIt<AuthSocialRepository>()),
    );
    getIt.registerFactory<SignInWithGoogleUsecase>(
      () => signInWithGoogleUsecase(getIt<SocialSignInRepository>()),
    );
    getIt.registerFactory<SignInWithAppleUsecase>(
      () => signInWithAppleUsecase(getIt<SocialSignInRepository>()),
    );
    getIt.registerFactory<GetCatalogCategoriesUsecase>(
      () => getCatalogCategoriesUsecase(getIt<CatalogCategoriesRepository>()),
    );
    getIt.registerFactory<GetCatalogLanguagesUsecase>(
      () => getCatalogLanguagesUsecase(getIt<CatalogLanguagesRepository>()),
    );
    getIt.registerFactory<GetCatalogLifeExperiencesUsecase>(
      () => getCatalogLifeExperiencesUsecase(
        getIt<CatalogLifeExperiencesRepository>(),
      ),
    );
    getIt.registerFactory<GetCatalogBoundariesUsecase>(
      () => getCatalogBoundariesUsecase(getIt<CatalogBoundariesRepository>()),
    );
    getIt.registerFactory<VentorRegisterUsecase>(
      () => ventorRegisterUsecase(
        getIt<VentorRegisterRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<ListenerRegisterUsecase>(
      () => listenerRegisterUsecase(
        getIt<ListenerRegisterRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
  }
}
