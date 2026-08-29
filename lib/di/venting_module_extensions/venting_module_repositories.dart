import 'package:api_client/api_client.dart';
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
import 'package:venting_mobile_app/domain/repository/api/listener/listener_availability_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_dashboard_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_earnings_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_notification_preferences_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_notifications_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_payouts_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_privacy_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_profile_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_register_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_setup_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_training_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_notifications_repository.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_register_repository.dart';
import 'package:venting_mobile_app/domain/repository/app/auth_me_cache_repository.dart';
import 'package:venting_mobile_app/domain/repository/app/social_sign_in_repository.dart';

/// Repositories mixin for VentingModule
/// Handles all repository factory methods
mixin VentingModuleRepositories on VentingModule {
  AuthCheckEmailRepository authCheckEmailRepository(ApiClientBase apiClient) =>
      AuthCheckEmailRepository(apiClient);

  AuthRegisterRepository authRegisterRepository(ApiClientBase apiClient) =>
      AuthRegisterRepository(apiClient);

  AuthLoginRepository authLoginRepository(ApiClientBase apiClient) =>
      AuthLoginRepository(apiClient);

  AuthForgotPasswordRepository authForgotPasswordRepository(
    ApiClientBase apiClient,
  ) => AuthForgotPasswordRepository(apiClient);

  AuthRefreshTokenRepository authRefreshTokenRepository(
    ApiClientBase apiClient,
  ) => AuthRefreshTokenRepository(apiClient);

  AuthLogoutRepository authLogoutRepository(ApiClientBase apiClient) =>
      AuthLogoutRepository(apiClient);

  AuthDeleteAccountRepository authDeleteAccountRepository(
    ApiClientBase apiClient,
  ) => AuthDeleteAccountRepository(apiClient);

  AuthChangePasswordRepository authChangePasswordRepository(
    ApiClientBase apiClient,
  ) => AuthChangePasswordRepository(apiClient);

  AuthMeRepository authMeRepository(ApiClientBase apiClient) =>
      AuthMeRepository(apiClient);

  AuthSocialRepository authSocialRepository(ApiClientBase apiClient) =>
      AuthSocialRepository(apiClient);

  SocialSignInRepository socialSignInRepository(AppConfig appConfig) =>
      SocialSignInRepository(appConfig);

  AuthMeCacheRepository authMeCacheRepository(
    VentingPreferences ventingPreferences,
  ) => AuthMeCacheRepository(ventingPreferences);

  CatalogCategoriesRepository catalogCategoriesRepository(
    ApiClientBase apiClient,
  ) => CatalogCategoriesRepository(apiClient);

  CatalogLanguagesRepository catalogLanguagesRepository(
    ApiClientBase apiClient,
  ) => CatalogLanguagesRepository(apiClient);

  CatalogLifeExperiencesRepository catalogLifeExperiencesRepository(
    ApiClientBase apiClient,
  ) => CatalogLifeExperiencesRepository(apiClient);

  CatalogBoundariesRepository catalogBoundariesRepository(
    ApiClientBase apiClient,
  ) => CatalogBoundariesRepository(apiClient);

  ListenerAvailabilityRepository listenerAvailabilityRepository(
    ApiClientBase apiClient,
  ) => ListenerAvailabilityRepository(apiClient);

  ListenerDashboardRepository listenerDashboardRepository(
    ApiClientBase apiClient,
  ) => ListenerDashboardRepository(apiClient);

  ListenerEarningsRepository listenerEarningsRepository(
    ApiClientBase apiClient,
  ) => ListenerEarningsRepository(apiClient);

  ListenerPayoutsRepository listenerPayoutsRepository(
    ApiClientBase apiClient,
  ) => ListenerPayoutsRepository(apiClient);

  ListenerNotificationPreferencesRepository
  listenerNotificationPreferencesRepository(ApiClientBase apiClient) =>
      ListenerNotificationPreferencesRepository(apiClient);

  ListenerNotificationsRepository listenerNotificationsRepository(
    ApiClientBase apiClient,
  ) => ListenerNotificationsRepository(apiClient);

  ListenerPrivacyRepository listenerPrivacyRepository(
    ApiClientBase apiClient,
  ) => ListenerPrivacyRepository(apiClient);

  ListenerProfileRepository listenerProfileRepository(
    ApiClientBase apiClient,
  ) => ListenerProfileRepository(apiClient);

  ListenerRegisterRepository listenerRegisterRepository(
    ApiClientBase apiClient,
  ) => ListenerRegisterRepository(apiClient);

  ListenerSetupRepository listenerSetupRepository(ApiClientBase apiClient) =>
      ListenerSetupRepository(apiClient);

  ListenerTrainingRepository listenerTrainingRepository(
    ApiClientBase apiClient,
  ) => ListenerTrainingRepository(apiClient);

  VentorNotificationsRepository ventorNotificationsRepository(
    ApiClientBase apiClient,
  ) => VentorNotificationsRepository(apiClient);

  VentorRegisterRepository ventorRegisterRepository(ApiClientBase apiClient) =>
      VentorRegisterRepository(apiClient);

  /// Registers all repository dependencies
  void registerRepositories(GetIt getIt) {
    getIt.registerFactory<AuthCheckEmailRepository>(
      () => authCheckEmailRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<AuthRegisterRepository>(
      () => authRegisterRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<AuthLoginRepository>(
      () => authLoginRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<AuthForgotPasswordRepository>(
      () => authForgotPasswordRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<AuthRefreshTokenRepository>(
      () => authRefreshTokenRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<AuthLogoutRepository>(
      () => authLogoutRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<AuthDeleteAccountRepository>(
      () => authDeleteAccountRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<AuthChangePasswordRepository>(
      () => authChangePasswordRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<AuthMeRepository>(
      () => authMeRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<AuthSocialRepository>(
      () => authSocialRepository(getIt<ApiClientBase>()),
    );
    getIt.registerLazySingleton<SocialSignInRepository>(
      () => socialSignInRepository(getIt<AppConfig>()),
    );
    getIt.registerFactory<AuthMeCacheRepository>(
      () => authMeCacheRepository(getIt<VentingPreferences>()),
    );
    getIt.registerFactory<CatalogCategoriesRepository>(
      () => catalogCategoriesRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<CatalogLanguagesRepository>(
      () => catalogLanguagesRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<CatalogLifeExperiencesRepository>(
      () => catalogLifeExperiencesRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<CatalogBoundariesRepository>(
      () => catalogBoundariesRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<ListenerAvailabilityRepository>(
      () => listenerAvailabilityRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<ListenerDashboardRepository>(
      () => listenerDashboardRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<ListenerEarningsRepository>(
      () => listenerEarningsRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<ListenerPayoutsRepository>(
      () => listenerPayoutsRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<ListenerNotificationPreferencesRepository>(
      () => listenerNotificationPreferencesRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<ListenerNotificationsRepository>(
      () => listenerNotificationsRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<ListenerPrivacyRepository>(
      () => listenerPrivacyRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<ListenerProfileRepository>(
      () => listenerProfileRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<ListenerRegisterRepository>(
      () => listenerRegisterRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<ListenerSetupRepository>(
      () => listenerSetupRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<ListenerTrainingRepository>(
      () => listenerTrainingRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<VentorRegisterRepository>(
      () => ventorRegisterRepository(getIt<ApiClientBase>()),
    );
    getIt.registerFactory<VentorNotificationsRepository>(
      () => ventorNotificationsRepository(getIt<ApiClientBase>()),
    );
  }
}
