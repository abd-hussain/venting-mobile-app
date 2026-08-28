import 'package:get_it/get_it.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/di/venting_module.dart';
import 'package:venting_mobile_app/domain/usecase/auth_change_password_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_check_email_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_delete_account_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_forgot_password_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_login_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_logout_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_me_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_register_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_social_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/clear_auth_session_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_cached_auth_me_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_notification_preferences_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_privacy_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_profile_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_reviews_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/sign_in_with_apple_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/sign_in_with_google_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_about_me_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_avatar_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_notification_preferences_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_phone_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_privacy_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_profile_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_voice_intro_usecase.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';
import 'package:venting_mobile_app/presentation/auth/bloc/auth_bloc.dart';
import 'package:venting_mobile_app/presentation/auth/bloc/email_registration_bloc.dart';
import 'package:venting_mobile_app/presentation/auth/bloc/forgot_password_bloc.dart';
import 'package:venting_mobile_app/presentation/auth/forgot_password_screen.dart';
import 'package:venting_mobile_app/presentation/change_password/bloc/change_password_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/bloc/edit_phone/edit_phone_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/bloc/listener_profile/listener_profile_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/bloc/notification_preferences/listener_notification_preferences_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/bloc/privacy_visibility/listener_privacy_visibility_bloc.dart';
import 'package:venting_mobile_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:venting_mobile_app/shared_widgets/bottom_sheets/logout_delete_account_confirm/bloc/logout_delete_account_confirm_bloc.dart';

/// Blocs mixin for VentingModule
/// Handles all bloc factory methods
mixin VentingModuleBlocs on VentingModule {
  /// Registers all bloc dependencies
  void registerBlocs(GetIt getIt) {
    getIt.registerFactory<SplashBloc>(
      () => SplashBloc(
        getIt<VentingPreferences>(),
        getIt<AuthMeUsecase>(),
        getIt<GetCachedAuthMeUsecase>(),
        getIt<ClearAuthSessionUsecase>(),
      ),
    );
    getIt.registerFactoryParam<EmailRegistrationBloc, AuthUserType, void>(
      (userType, _) => EmailRegistrationBloc(
        getIt<AuthCheckEmailUsecase>(),
        getIt<AuthRegisterUsecase>(),
        getIt<AuthLoginUsecase>(),
        getIt<AuthMeUsecase>(),
        getIt<VentingPreferences>(),
        userType: userType,
      ),
    );
    getIt.registerFactoryParam<AuthBloc, AuthUserType, void>(
      (userType, _) => AuthBloc(
        getIt<SignInWithGoogleUsecase>(),
        getIt<SignInWithAppleUsecase>(),
        getIt<AuthCheckEmailUsecase>(),
        getIt<AuthSocialUsecase>(),
        getIt<AuthMeUsecase>(),
        getIt<VentingPreferences>(),
        userType: userType,
      ),
    );
    getIt.registerFactoryParam<
      ForgotPasswordBloc,
      ForgotPasswordRouteArgs,
      void
    >(
      (args, _) => ForgotPasswordBloc(
        getIt<AuthForgotPasswordUsecase>(),
        email: args.email,
        userType: args.userType,
      ),
    );
    getIt.registerFactory<ChangePasswordBloc>(
      () => ChangePasswordBloc(getIt<AuthChangePasswordUsecase>()),
    );
    getIt.registerFactory<EditPhoneBloc>(
      () => EditPhoneBloc(getIt<UpdateListenerPhoneUsecase>()),
    );
    getIt.registerFactory<ListenerProfileBloc>(
      () => ListenerProfileBloc(
        getIt<GetListenerProfileUsecase>(),
        getIt<GetListenerReviewsUsecase>(),
        getIt<UpdateListenerAvatarUsecase>(),
        getIt<UpdateListenerAboutMeUsecase>(),
        getIt<UpdateListenerVoiceIntroUsecase>(),
        getIt<UpdateListenerProfileUsecase>(),
      ),
    );
    getIt.registerFactory<ListenerNotificationPreferencesBloc>(
      () => ListenerNotificationPreferencesBloc(
        getIt<GetListenerNotificationPreferencesUsecase>(),
        getIt<UpdateListenerNotificationPreferencesUsecase>(),
      ),
    );
    getIt.registerFactory<ListenerPrivacyVisibilityBloc>(
      () => ListenerPrivacyVisibilityBloc(
        getIt<GetListenerPrivacyUsecase>(),
        getIt<UpdateListenerPrivacyUsecase>(),
      ),
    );
    getIt.registerFactory<LogoutDeleteAccountConfirmBloc>(
      () => LogoutDeleteAccountConfirmBloc(
        getIt<AuthLogoutUsecase>(),
        getIt<AuthDeleteAccountUsecase>(),
        getIt<ClearAuthSessionUsecase>(),
      ),
    );
  }
}
