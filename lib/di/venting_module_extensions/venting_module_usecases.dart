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
import 'package:venting_mobile_app/domain/repository/api/listener/listener_notification_preferences_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_privacy_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_profile_repository.dart';
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
import 'package:venting_mobile_app/domain/usecase/complete_listener_registration_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/complete_ventor_registration_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_cached_auth_me_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_boundaries_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_categories_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_languages_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_catalog_life_experiences_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_notification_preferences_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_privacy_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_registration_progress_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_registration_progress_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/save_listener_registration_step_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/save_ventor_registration_step_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/sign_in_with_apple_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/sign_in_with_google_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_notification_preferences_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_phone_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_privacy_usecase.dart';

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

  GetListenerNotificationPreferencesUsecase
  getListenerNotificationPreferencesUsecase(
    ListenerNotificationPreferencesRepository
    listenerNotificationPreferencesRepository,
    VentingPreferences ventingPreferences,
  ) => GetListenerNotificationPreferencesUsecase(
    listenerNotificationPreferencesRepository,
    ventingPreferences,
  );

  UpdateListenerNotificationPreferencesUsecase
  updateListenerNotificationPreferencesUsecase(
    ListenerNotificationPreferencesRepository
    listenerNotificationPreferencesRepository,
    VentingPreferences ventingPreferences,
  ) => UpdateListenerNotificationPreferencesUsecase(
    listenerNotificationPreferencesRepository,
    ventingPreferences,
  );

  GetListenerPrivacyUsecase getListenerPrivacyUsecase(
    ListenerPrivacyRepository listenerPrivacyRepository,
    VentingPreferences ventingPreferences,
  ) => GetListenerPrivacyUsecase(listenerPrivacyRepository, ventingPreferences);

  UpdateListenerPrivacyUsecase updateListenerPrivacyUsecase(
    ListenerPrivacyRepository listenerPrivacyRepository,
    VentingPreferences ventingPreferences,
  ) => UpdateListenerPrivacyUsecase(
    listenerPrivacyRepository,
    ventingPreferences,
  );

  UpdateListenerPhoneUsecase updateListenerPhoneUsecase(
    ListenerProfileRepository listenerProfileRepository,
    VentingPreferences ventingPreferences,
  ) =>
      UpdateListenerPhoneUsecase(listenerProfileRepository, ventingPreferences);

  GetListenerRegistrationProgressUsecase getListenerRegistrationProgressUsecase(
    ListenerRegisterRepository listenerRegisterRepository,
  ) => GetListenerRegistrationProgressUsecase(listenerRegisterRepository);

  SaveListenerRegistrationStepUsecase saveListenerRegistrationStepUsecase(
    ListenerRegisterRepository listenerRegisterRepository,
  ) => SaveListenerRegistrationStepUsecase(listenerRegisterRepository);

  CompleteListenerRegistrationUsecase completeListenerRegistrationUsecase(
    ListenerRegisterRepository listenerRegisterRepository,
    VentingPreferences ventingPreferences,
  ) => CompleteListenerRegistrationUsecase(
    listenerRegisterRepository,
    ventingPreferences,
  );

  GetVentorRegistrationProgressUsecase getVentorRegistrationProgressUsecase(
    VentorRegisterRepository ventorRegisterRepository,
  ) => GetVentorRegistrationProgressUsecase(ventorRegisterRepository);

  SaveVentorRegistrationStepUsecase saveVentorRegistrationStepUsecase(
    VentorRegisterRepository ventorRegisterRepository,
  ) => SaveVentorRegistrationStepUsecase(ventorRegisterRepository);

  CompleteVentorRegistrationUsecase completeVentorRegistrationUsecase(
    VentorRegisterRepository ventorRegisterRepository,
    VentingPreferences ventingPreferences,
  ) => CompleteVentorRegistrationUsecase(
    ventorRegisterRepository,
    ventingPreferences,
  );

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
    getIt.registerFactory<GetListenerNotificationPreferencesUsecase>(
      () => getListenerNotificationPreferencesUsecase(
        getIt<ListenerNotificationPreferencesRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<UpdateListenerNotificationPreferencesUsecase>(
      () => updateListenerNotificationPreferencesUsecase(
        getIt<ListenerNotificationPreferencesRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<GetListenerPrivacyUsecase>(
      () => getListenerPrivacyUsecase(
        getIt<ListenerPrivacyRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<UpdateListenerPrivacyUsecase>(
      () => updateListenerPrivacyUsecase(
        getIt<ListenerPrivacyRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<UpdateListenerPhoneUsecase>(
      () => updateListenerPhoneUsecase(
        getIt<ListenerProfileRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<GetListenerRegistrationProgressUsecase>(
      () => getListenerRegistrationProgressUsecase(
        getIt<ListenerRegisterRepository>(),
      ),
    );
    getIt.registerFactory<SaveListenerRegistrationStepUsecase>(
      () => saveListenerRegistrationStepUsecase(
        getIt<ListenerRegisterRepository>(),
      ),
    );
    getIt.registerFactory<CompleteListenerRegistrationUsecase>(
      () => completeListenerRegistrationUsecase(
        getIt<ListenerRegisterRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
    getIt.registerFactory<GetVentorRegistrationProgressUsecase>(
      () => getVentorRegistrationProgressUsecase(
        getIt<VentorRegisterRepository>(),
      ),
    );
    getIt.registerFactory<SaveVentorRegistrationStepUsecase>(
      () =>
          saveVentorRegistrationStepUsecase(getIt<VentorRegisterRepository>()),
    );
    getIt.registerFactory<CompleteVentorRegistrationUsecase>(
      () => completeVentorRegistrationUsecase(
        getIt<VentorRegisterRepository>(),
        getIt<VentingPreferences>(),
      ),
    );
  }
}
