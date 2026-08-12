import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of VentingMobLocalizations
/// returned by `VentingMobLocalizations.of(context)`.
///
/// Applications need to include `VentingMobLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: VentingMobLocalizations.localizationsDelegates,
///   supportedLocales: VentingMobLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the VentingMobLocalizations.supportedLocales
/// property.
abstract class VentingMobLocalizations {
  VentingMobLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static VentingMobLocalizations of(BuildContext context) {
    return Localizations.of<VentingMobLocalizations>(
      context,
      VentingMobLocalizations,
    )!;
  }

  static const LocalizationsDelegate<VentingMobLocalizations> delegate =
      _VentingMobLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @app_currency.
  ///
  /// In en, this message translates to:
  /// **'IQD'**
  String get app_currency;

  /// No description provided for @common_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get common_yes;

  /// No description provided for @common_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get common_submit;

  /// No description provided for @common_alert.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get common_alert;

  /// No description provided for @common_copied.
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get common_copied;

  /// No description provided for @common_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get common_skip;

  /// No description provided for @common_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_cancel;

  /// No description provided for @common_clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get common_clear;

  /// No description provided for @common_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get common_retry;

  /// No description provided for @common_ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get common_ok;

  /// No description provided for @common_okay.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get common_okay;

  /// No description provided for @common_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get common_next;

  /// No description provided for @common_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get common_back;

  /// No description provided for @common_pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get common_pay;

  /// No description provided for @common_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get common_confirm;

  /// No description provided for @common_done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get common_done;

  /// No description provided for @common_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get common_save;

  /// No description provided for @common_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get common_delete;

  /// No description provided for @common_maybe_later.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get common_maybe_later;

  /// No description provided for @common_noDataFound.
  ///
  /// In en, this message translates to:
  /// **'No data found'**
  String get common_noDataFound;

  /// No description provided for @common_generalErrorMsg.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get common_generalErrorMsg;

  /// No description provided for @common_connectionLost.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get common_connectionLost;

  /// No description provided for @common_connectionLostMessage.
  ///
  /// In en, this message translates to:
  /// **'Looks like you\'re offline. Please check your connection and try again.'**
  String get common_connectionLostMessage;

  /// No description provided for @common_rechargeRequired.
  ///
  /// In en, this message translates to:
  /// **'Recharge Required'**
  String get common_rechargeRequired;

  /// No description provided for @common_lowBalanceMessage.
  ///
  /// In en, this message translates to:
  /// **'You have Low Balance for this service, please recharge and try again'**
  String get common_lowBalanceMessage;

  /// No description provided for @splash_welcome_to.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get splash_welcome_to;

  /// No description provided for @splash_zain_iraq.
  ///
  /// In en, this message translates to:
  /// **'Zain Iraq'**
  String get splash_zain_iraq;

  /// No description provided for @auth_enter_mobile_number_getVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Get Verification Code'**
  String get auth_enter_mobile_number_getVerificationCode;

  /// No description provided for @auth_enter_mobile_number_phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get auth_enter_mobile_number_phoneNumber;

  /// No description provided for @auth_enter_mobile_number_mobileNumberLength.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number Length is less than expectations'**
  String get auth_enter_mobile_number_mobileNumberLength;

  /// No description provided for @auth_enter_mobile_number_mobileNumberNotUsed.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid Number'**
  String get auth_enter_mobile_number_mobileNumberNotUsed;

  /// No description provided for @auth_enter_mobile_number_mobileNumberNotZain.
  ///
  /// In en, this message translates to:
  /// **'Mobile number is not a Zain number'**
  String get auth_enter_mobile_number_mobileNumberNotZain;

  /// No description provided for @auth_enter_mobile_number_pleaseEnterYourZainPhoneNumberToContinue.
  ///
  /// In en, this message translates to:
  /// **'Enter your Zain number to continue'**
  String get auth_enter_mobile_number_pleaseEnterYourZainPhoneNumberToContinue;

  /// No description provided for @auth_enter_mobile_number_alreadyRegistered.
  ///
  /// In en, this message translates to:
  /// **'This phone number already has an account on the app'**
  String get auth_enter_mobile_number_alreadyRegistered;

  /// No description provided for @auth_enter_mobile_number_loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get auth_enter_mobile_number_loginButton;

  /// No description provided for @auth_enter_mobile_number_forgotPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get auth_enter_mobile_number_forgotPasswordButton;

  /// No description provided for @auth_enter_mobile_number_or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get auth_enter_mobile_number_or;

  /// No description provided for @auth_enter_mobile_number_simBlocked.
  ///
  /// In en, this message translates to:
  /// **'This service is not available for your line'**
  String get auth_enter_mobile_number_simBlocked;

  /// No description provided for @auth_enter_mobile_number_simBlockedIneligible.
  ///
  /// In en, this message translates to:
  /// **'The service will be available soon for your line'**
  String get auth_enter_mobile_number_simBlockedIneligible;

  /// No description provided for @auth_enter_mobile_number_simBlockedDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Your SIM is in a recycled, blocked, or barred state. Please call support for more information.'**
  String get auth_enter_mobile_number_simBlockedDisconnected;

  /// No description provided for @auth_enter_mobile_number_simBlockedActivate.
  ///
  /// In en, this message translates to:
  /// **'To activate, please make sure your SIM is inside your device and call using the button below.'**
  String get auth_enter_mobile_number_simBlockedActivate;

  /// No description provided for @auth_enter_mobile_number_simBlockedCritical.
  ///
  /// In en, this message translates to:
  /// **'Please visit a Zain service center to get a new SIM'**
  String get auth_enter_mobile_number_simBlockedCritical;

  /// No description provided for @auth_enter_mobile_number_mobileNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your mobile number'**
  String get auth_enter_mobile_number_mobileNumberRequired;

  /// No description provided for @auth_enter_mobile_number_enterPhoneNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get auth_enter_mobile_number_enterPhoneNumberHint;

  /// No description provided for @auth_enter_mobile_number_otpRequestFailureTitle.
  ///
  /// In en, this message translates to:
  /// **'OTP Error'**
  String get auth_enter_mobile_number_otpRequestFailureTitle;

  /// No description provided for @auth_enter_mobile_number_otpRequestFailureResend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get auth_enter_mobile_number_otpRequestFailureResend;

  /// No description provided for @auth_otp_authentication_enterOTP_lead.
  ///
  /// In en, this message translates to:
  /// **'A one time passcode has been sent to '**
  String get auth_otp_authentication_enterOTP_lead;

  /// No description provided for @auth_otp_authentication_enterOTP_tail.
  ///
  /// In en, this message translates to:
  /// **'. \nThe code will be valid for '**
  String get auth_otp_authentication_enterOTP_tail;

  /// No description provided for @auth_otp_authentication_enterOTP_validityDuration.
  ///
  /// In en, this message translates to:
  /// **'180 seconds'**
  String get auth_otp_authentication_enterOTP_validityDuration;

  /// No description provided for @auth_otp_authentication_enterOTP_tailSuffix.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get auth_otp_authentication_enterOTP_tailSuffix;

  /// No description provided for @auth_otp_authentication_didntReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get auth_otp_authentication_didntReceiveCode;

  /// No description provided for @auth_otp_authentication_resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get auth_otp_authentication_resendCode;

  /// No description provided for @auth_otp_authentication_resendCodeIn.
  ///
  /// In en, this message translates to:
  /// **'Resend code in'**
  String get auth_otp_authentication_resendCodeIn;

  /// No description provided for @auth_otp_authentication_triesLeft.
  ///
  /// In en, this message translates to:
  /// **'Attempts Remaining'**
  String get auth_otp_authentication_triesLeft;

  /// No description provided for @auth_otp_authentication_otpverificationtext.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get auth_otp_authentication_otpverificationtext;

  /// No description provided for @auth_otp_authentication_title.
  ///
  /// In en, this message translates to:
  /// **'OTP Authentication'**
  String get auth_otp_authentication_title;

  /// No description provided for @auth_otp_authentication_verifyWithOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify with One-Time Password'**
  String get auth_otp_authentication_verifyWithOtp;

  /// No description provided for @auth_otp_authentication_blockTitle.
  ///
  /// In en, this message translates to:
  /// **'You have exceeded the limit'**
  String get auth_otp_authentication_blockTitle;

  /// No description provided for @auth_otp_authentication_blockDescription.
  ///
  /// In en, this message translates to:
  /// **'For your security access is paused due to multiple incorrect attempts'**
  String get auth_otp_authentication_blockDescription;

  /// No description provided for @auth_otp_authentication_blockTimeRemaining.
  ///
  /// In en, this message translates to:
  /// **'Time Remaining'**
  String get auth_otp_authentication_blockTimeRemaining;

  /// No description provided for @auth_otp_authentication_blockTryAgainIn.
  ///
  /// In en, this message translates to:
  /// **'Please try again in {time}'**
  String auth_otp_authentication_blockTryAgainIn(String time);

  /// No description provided for @auth_biometric_activation_enableFaceId.
  ///
  /// In en, this message translates to:
  /// **'Enable Face ID'**
  String get auth_biometric_activation_enableFaceId;

  /// No description provided for @auth_biometric_activation_enableTouchId.
  ///
  /// In en, this message translates to:
  /// **'Enable Touch ID'**
  String get auth_biometric_activation_enableTouchId;

  /// No description provided for @auth_biometric_activation_enablePinCode.
  ///
  /// In en, this message translates to:
  /// **'Enable Pin Code'**
  String get auth_biometric_activation_enablePinCode;

  /// No description provided for @auth_biometric_activation_faceId_message.
  ///
  /// In en, this message translates to:
  /// **'Make logging in effortless with Face ID'**
  String get auth_biometric_activation_faceId_message;

  /// No description provided for @auth_biometric_activation_touchId_message.
  ///
  /// In en, this message translates to:
  /// **'Make logging in effortless with Touch ID'**
  String get auth_biometric_activation_touchId_message;

  /// No description provided for @auth_biometric_activation_pincode_message.
  ///
  /// In en, this message translates to:
  /// **'Make logging in effortless with Pin Code'**
  String get auth_biometric_activation_pincode_message;

  /// No description provided for @auth_biometric_activation_successRegistrationFaceId.
  ///
  /// In en, this message translates to:
  /// **'Face ID Enabled and PIN Created Successfully!'**
  String get auth_biometric_activation_successRegistrationFaceId;

  /// No description provided for @auth_biometric_activation_successRegistrationMessageFaceId.
  ///
  /// In en, this message translates to:
  /// **'You can now sign in instantly using Face ID.'**
  String get auth_biometric_activation_successRegistrationMessageFaceId;

  /// No description provided for @auth_biometric_activation_successRegistrationTocuhId.
  ///
  /// In en, this message translates to:
  /// **'Touch ID Enabled and PIN Created Successfully!'**
  String get auth_biometric_activation_successRegistrationTocuhId;

  /// No description provided for @auth_biometric_activation_successRegistrationMessageTocuhId.
  ///
  /// In en, this message translates to:
  /// **'You can now sign in instantly using Touch ID.'**
  String get auth_biometric_activation_successRegistrationMessageTocuhId;

  /// No description provided for @auth_biometric_activation_successRegistrationPinId.
  ///
  /// In en, this message translates to:
  /// **'PIN Created Successfully!'**
  String get auth_biometric_activation_successRegistrationPinId;

  /// No description provided for @auth_biometric_activation_successRegistrationMessagePinId.
  ///
  /// In en, this message translates to:
  /// **'You can now sign in instantly using Pin Code.'**
  String get auth_biometric_activation_successRegistrationMessagePinId;

  /// No description provided for @auth_biometric_activation_addLater.
  ///
  /// In en, this message translates to:
  /// **'Add Later'**
  String get auth_biometric_activation_addLater;

  /// No description provided for @auth_enable_quick_login_title.
  ///
  /// In en, this message translates to:
  /// **'You\'re one tap away 🔓'**
  String get auth_enable_quick_login_title;

  /// No description provided for @auth_enable_quick_login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable biometric login for instant, secure access — no typing needed.'**
  String get auth_enable_quick_login_subtitle;

  /// No description provided for @auth_enable_quick_login_proceed_biometric.
  ///
  /// In en, this message translates to:
  /// **'Enable biometric login'**
  String get auth_enable_quick_login_proceed_biometric;

  /// No description provided for @auth_set_password_title.
  ///
  /// In en, this message translates to:
  /// **'Set password'**
  String get auth_set_password_title;

  /// No description provided for @auth_set_password_description.
  ///
  /// In en, this message translates to:
  /// **'Set a secure password for your account.'**
  String get auth_set_password_description;

  /// No description provided for @auth_set_password_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get auth_set_password_continue;

  /// No description provided for @auth_set_password_must_contain.
  ///
  /// In en, this message translates to:
  /// **'Must contain at least;'**
  String get auth_set_password_must_contain;

  /// No description provided for @auth_setup_pin_code_setAppCode.
  ///
  /// In en, this message translates to:
  /// **'Set your app security code'**
  String get auth_setup_pin_code_setAppCode;

  /// No description provided for @auth_setup_pin_code_setAppCodeDesc.
  ///
  /// In en, this message translates to:
  /// **'For your security, please create a 6-digit app code to use when Face ID is unavailable.'**
  String get auth_setup_pin_code_setAppCodeDesc;

  /// No description provided for @auth_setup_pin_code_confirmAppCode.
  ///
  /// In en, this message translates to:
  /// **'Confirm your app code'**
  String get auth_setup_pin_code_confirmAppCode;

  /// No description provided for @auth_setup_pin_code_confirmAppCodeDesc.
  ///
  /// In en, this message translates to:
  /// **'For verification, please re-enter your 6-digit app code. This confirms your code for use when Face ID is unavailable'**
  String get auth_setup_pin_code_confirmAppCodeDesc;

  /// No description provided for @auth_setup_pin_code_createPinBtn.
  ///
  /// In en, this message translates to:
  /// **'Create  Pin'**
  String get auth_setup_pin_code_createPinBtn;

  /// No description provided for @auth_setup_pin_code_createCodeBtn.
  ///
  /// In en, this message translates to:
  /// **'Create code'**
  String get auth_setup_pin_code_createCodeBtn;

  /// No description provided for @auth_setup_pin_code_confirmPinErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'The codes do not match. Please try again'**
  String get auth_setup_pin_code_confirmPinErrorMessage;

  /// No description provided for @auth_setup_pin_code_continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get auth_setup_pin_code_continueButton;

  /// No description provided for @auth_captcha_title.
  ///
  /// In en, this message translates to:
  /// **'Verify you\'re human'**
  String get auth_captcha_title;

  /// No description provided for @auth_captcha_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the text shown below'**
  String get auth_captcha_subtitle;

  /// No description provided for @auth_captcha_inputLabel.
  ///
  /// In en, this message translates to:
  /// **'Characters'**
  String get auth_captcha_inputLabel;

  /// No description provided for @auth_captcha_inputHint.
  ///
  /// In en, this message translates to:
  /// **'Enter text here'**
  String get auth_captcha_inputHint;

  /// No description provided for @auth_captcha_refreshSemantics.
  ///
  /// In en, this message translates to:
  /// **'Show a new code'**
  String get auth_captcha_refreshSemantics;

  /// No description provided for @auth_captcha_error.
  ///
  /// In en, this message translates to:
  /// **'That doesn\'t match. Try again.'**
  String get auth_captcha_error;

  /// No description provided for @auth_captcha_success.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get auth_captcha_success;

  /// No description provided for @auth_captcha_verifyButton.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get auth_captcha_verifyButton;

  /// No description provided for @auth_enter_full_name_enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get auth_enter_full_name_enterYourName;

  /// No description provided for @auth_enter_full_name_fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'eg. John Doe'**
  String get auth_enter_full_name_fullNameHint;

  /// No description provided for @auth_returning_user_welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get auth_returning_user_welcomeBack;

  /// No description provided for @auth_returning_user_chooseLoginMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred login method'**
  String get auth_returning_user_chooseLoginMethod;

  /// No description provided for @auth_returning_user_mobileNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number:'**
  String get auth_returning_user_mobileNumberLabel;

  /// No description provided for @auth_returning_user_loginWithOTP.
  ///
  /// In en, this message translates to:
  /// **'Login with OTP'**
  String get auth_returning_user_loginWithOTP;

  /// No description provided for @auth_returning_user_switch_to_otp_title.
  ///
  /// In en, this message translates to:
  /// **'Switch to OTP Login'**
  String get auth_returning_user_switch_to_otp_title;

  /// No description provided for @auth_returning_user_switch_to_otp_message.
  ///
  /// In en, this message translates to:
  /// **'By continuing, your password will be removed. You will use OTP for future logins.'**
  String get auth_returning_user_switch_to_otp_message;

  /// No description provided for @auth_returning_user_loginWithPassword.
  ///
  /// In en, this message translates to:
  /// **'Login with Password'**
  String get auth_returning_user_loginWithPassword;

  /// No description provided for @auth_session_expired_title.
  ///
  /// In en, this message translates to:
  /// **'Session expired'**
  String get auth_session_expired_title;

  /// No description provided for @auth_session_expired_message.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please sign in again to continue using the app with {phoneNumber}.'**
  String auth_session_expired_message(String phoneNumber);

  /// No description provided for @auth_login_with_password_title.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get auth_login_with_password_title;

  /// No description provided for @auth_login_with_password_description.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password for'**
  String get auth_login_with_password_description;

  /// No description provided for @auth_returning_user_loginWithAnotherNumber.
  ///
  /// In en, this message translates to:
  /// **'Need to login with another number?'**
  String get auth_returning_user_loginWithAnotherNumber;

  /// No description provided for @auth_returning_user_loginWithAnotherAccount.
  ///
  /// In en, this message translates to:
  /// **'Login with a different account'**
  String get auth_returning_user_loginWithAnotherAccount;

  /// No description provided for @auth_returning_user_faceIDLogin.
  ///
  /// In en, this message translates to:
  /// **'Face ID Login'**
  String get auth_returning_user_faceIDLogin;

  /// No description provided for @auth_returning_user_touchIDLogin.
  ///
  /// In en, this message translates to:
  /// **'Touch ID Login'**
  String get auth_returning_user_touchIDLogin;

  /// No description provided for @auth_returning_user_orWord.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get auth_returning_user_orWord;

  /// No description provided for @auth_returning_user_confirm_logout_switch_title.
  ///
  /// In en, this message translates to:
  /// **'Logout to Switch'**
  String get auth_returning_user_confirm_logout_switch_title;

  /// No description provided for @auth_returning_user_confirm_logout_switch_description.
  ///
  /// In en, this message translates to:
  /// **'You\'ll be logged out from your current account before signing in with another.'**
  String get auth_returning_user_confirm_logout_switch_description;

  /// No description provided for @auth_returning_user_confirm_logout_switch_confirm_button_title.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get auth_returning_user_confirm_logout_switch_confirm_button_title;

  /// No description provided for @auth_returning_user_confirm_logout_switch_cancel_button_title.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get auth_returning_user_confirm_logout_switch_cancel_button_title;

  /// No description provided for @home_tab_home_tab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home_tab_home_tab;

  /// No description provided for @home_tab_welcoming_message_morning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get home_tab_welcoming_message_morning;

  /// No description provided for @home_tab_welcoming_message_afternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon'**
  String get home_tab_welcoming_message_afternoon;

  /// No description provided for @home_tab_welcoming_message_evening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get home_tab_welcoming_message_evening;

  /// No description provided for @home_tab_prepaid_validityTill.
  ///
  /// In en, this message translates to:
  /// **'Validity till'**
  String get home_tab_prepaid_validityTill;

  /// No description provided for @home_tab_prepaid_myresources.
  ///
  /// In en, this message translates to:
  /// **'My Resources'**
  String get home_tab_prepaid_myresources;

  /// No description provided for @home_tab_prepaid_gold.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get home_tab_prepaid_gold;

  /// No description provided for @home_tab_prepaid_mamnoon.
  ///
  /// In en, this message translates to:
  /// **'Mamnoon'**
  String get home_tab_prepaid_mamnoon;

  /// No description provided for @home_tab_postpaid_totalBill.
  ///
  /// In en, this message translates to:
  /// **'Total Bill'**
  String get home_tab_postpaid_totalBill;

  /// No description provided for @home_tab_postpaid_paybill.
  ///
  /// In en, this message translates to:
  /// **'Pay Bill'**
  String get home_tab_postpaid_paybill;

  /// No description provided for @home_tab_postpaid_unbilledAmount.
  ///
  /// In en, this message translates to:
  /// **'Unbilled Amount'**
  String get home_tab_postpaid_unbilledAmount;

  /// No description provided for @home_tab_postpaid_pastDue.
  ///
  /// In en, this message translates to:
  /// **'Past Due'**
  String get home_tab_postpaid_pastDue;

  /// No description provided for @home_tab_postpaid_advancePayment.
  ///
  /// In en, this message translates to:
  /// **'Advance Payment'**
  String get home_tab_postpaid_advancePayment;

  /// No description provided for @home_sim_restricted_banner_title.
  ///
  /// In en, this message translates to:
  /// **'Your SIM has a restriction'**
  String get home_sim_restricted_banner_title;

  /// No description provided for @home_sim_restricted_banner_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Please contact support for assistance.'**
  String get home_sim_restricted_banner_subtitle;

  /// No description provided for @sim_support_warn_recharge_title.
  ///
  /// In en, this message translates to:
  /// **'Recharge your line'**
  String get sim_support_warn_recharge_title;

  /// No description provided for @sim_support_warn_recharge_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your line needs a top-up. Recharge to restore full service and app features.'**
  String get sim_support_warn_recharge_subtitle;

  /// No description provided for @sim_support_dunning_title.
  ///
  /// In en, this message translates to:
  /// **'Payment or recharge needed'**
  String get sim_support_dunning_title;

  /// No description provided for @sim_support_dunning_subtitle.
  ///
  /// In en, this message translates to:
  /// **'There is an outstanding bill or balance issue. Pay or recharge to unlock all services.'**
  String get sim_support_dunning_subtitle;

  /// No description provided for @sim_support_postpaid_title.
  ///
  /// In en, this message translates to:
  /// **'Postpaid line restricted'**
  String get sim_support_postpaid_title;

  /// No description provided for @sim_support_postpaid_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your postpaid account needs attention. Contact customer support for help.'**
  String get sim_support_postpaid_subtitle;

  /// No description provided for @sim_support_prepaid_ineligible_title.
  ///
  /// In en, this message translates to:
  /// **'Service not available for this line'**
  String get sim_support_prepaid_ineligible_title;

  /// No description provided for @sim_support_prepaid_ineligible_subtitle.
  ///
  /// In en, this message translates to:
  /// **'This offer or service is not available on your prepaid line. Please contact support.'**
  String get sim_support_prepaid_ineligible_subtitle;

  /// No description provided for @sim_support_prepaid_line_issue_title.
  ///
  /// In en, this message translates to:
  /// **'Prepaid line issue'**
  String get sim_support_prepaid_line_issue_title;

  /// No description provided for @sim_support_prepaid_line_issue_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your prepaid line is suspended or blocked. Contact support to resolve it.'**
  String get sim_support_prepaid_line_issue_subtitle;

  /// No description provided for @sim_support_activate_title.
  ///
  /// In en, this message translates to:
  /// **'Activate your SIM'**
  String get sim_support_activate_title;

  /// No description provided for @sim_support_activate_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Insert your Zain SIM in this device, then dial *100# to activate.'**
  String get sim_support_activate_subtitle;

  /// No description provided for @auth_enter_mobile_number_dial_activate_sim.
  ///
  /// In en, this message translates to:
  /// **'Dial *100#'**
  String get auth_enter_mobile_number_dial_activate_sim;

  /// No description provided for @home_tab_loyalty_welcome_to_the_zain_loyalty_program.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Zain Loyalty Program'**
  String get home_tab_loyalty_welcome_to_the_zain_loyalty_program;

  /// No description provided for @loyalty_tutorial_discover_mamnoon.
  ///
  /// In en, this message translates to:
  /// **'Discover \"Mamnoon\" program !'**
  String get loyalty_tutorial_discover_mamnoon;

  /// No description provided for @loyalty_tutorial_watch_video_description.
  ///
  /// In en, this message translates to:
  /// **'Watch the video to learn how to earn points and redeem them for rewards and gifts'**
  String get loyalty_tutorial_watch_video_description;

  /// No description provided for @home_tab_loyalty_free_gift.
  ///
  /// In en, this message translates to:
  /// **'Scratch Card Reward'**
  String get home_tab_loyalty_free_gift;

  /// No description provided for @home_tab_loyalty_gift_text.
  ///
  /// In en, this message translates to:
  /// **'Scratch the card below to reveal your gift'**
  String get home_tab_loyalty_gift_text;

  /// No description provided for @home_tab_loyalty_congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations'**
  String get home_tab_loyalty_congratulations;

  /// No description provided for @home_tab_loyalty_already_clamed_git_title.
  ///
  /// In en, this message translates to:
  /// **'You have already got your daily gift'**
  String get home_tab_loyalty_already_clamed_git_title;

  /// No description provided for @home_tab_loyalty_already_clamed_git_desc.
  ///
  /// In en, this message translates to:
  /// **'You have already claimed your reward.. come back later as we gift every 24 hours!'**
  String get home_tab_loyalty_already_clamed_git_desc;

  /// No description provided for @home_tab_loyalty_you_got_100_mb_free.
  ///
  /// In en, this message translates to:
  /// **'You got 100MB Free!'**
  String get home_tab_loyalty_you_got_100_mb_free;

  /// No description provided for @home_tab_loyalty_next_gift_text.
  ///
  /// In en, this message translates to:
  /// **'Come back in 24 hours to claim your next free gift!'**
  String get home_tab_loyalty_next_gift_text;

  /// No description provided for @home_tab_loyalty_gift_disclaimer_text.
  ///
  /// In en, this message translates to:
  /// **'Use your finger to scratch the card completely.'**
  String get home_tab_loyalty_gift_disclaimer_text;

  /// No description provided for @loyalty_not_eligible_title.
  ///
  /// In en, this message translates to:
  /// **'Dear {name},'**
  String loyalty_not_eligible_title(String name);

  /// No description provided for @loyalty_not_eligible_subtitle.
  ///
  /// In en, this message translates to:
  /// **''**
  String get loyalty_not_eligible_subtitle;

  /// No description provided for @loyalty_not_eligible_body_blacklisted.
  ///
  /// In en, this message translates to:
  /// **'For more information please contact call center.'**
  String get loyalty_not_eligible_body_blacklisted;

  /// No description provided for @home_tab_recent_activities_recentactivities.
  ///
  /// In en, this message translates to:
  /// **'Recent Activities'**
  String get home_tab_recent_activities_recentactivities;

  /// No description provided for @home_tab_recent_activities_recentlyused.
  ///
  /// In en, this message translates to:
  /// **'Recently Used'**
  String get home_tab_recent_activities_recentlyused;

  /// No description provided for @home_tab_banner_view_details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get home_tab_banner_view_details;

  /// No description provided for @home_tab_games_zain_games.
  ///
  /// In en, this message translates to:
  /// **'Zain Games'**
  String get home_tab_games_zain_games;

  /// No description provided for @home_tab_games_games_title.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get home_tab_games_games_title;

  /// No description provided for @home_tab_games_play_and_win.
  ///
  /// In en, this message translates to:
  /// **'Play games everyday and win MBs'**
  String get home_tab_games_play_and_win;

  /// No description provided for @home_tab_new_releases.
  ///
  /// In en, this message translates to:
  /// **'New Releases'**
  String get home_tab_new_releases;

  /// No description provided for @home_tab_most_popular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular Bundles'**
  String get home_tab_most_popular;

  /// No description provided for @home_tab_view_details.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get home_tab_view_details;

  /// No description provided for @home_tab_feature_card_kafoo_line.
  ///
  /// In en, this message translates to:
  /// **'Kafoo Line'**
  String get home_tab_feature_card_kafoo_line;

  /// No description provided for @home_tab_feature_zain_fi_title.
  ///
  /// In en, this message translates to:
  /// **'Zain-Fi Devices'**
  String get home_tab_feature_zain_fi_title;

  /// No description provided for @home_tab_feature_zain_fi_description.
  ///
  /// In en, this message translates to:
  /// **'Stay connected and experience|lightning-fast speeds on the go|with Zain-Fi devices.'**
  String get home_tab_feature_zain_fi_description;

  /// No description provided for @home_tab_feature_esim_title.
  ///
  /// In en, this message translates to:
  /// **'eSIM'**
  String get home_tab_feature_esim_title;

  /// No description provided for @home_tab_feature_esim_description.
  ///
  /// In en, this message translates to:
  /// **'Switching to an eSIM is quick and easy, and it\'s eco-friendly.'**
  String get home_tab_feature_esim_description;

  /// No description provided for @home_tab_bundle_fastest_45g_internet.
  ///
  /// In en, this message translates to:
  /// **'Fastest 4.5G+ Internet'**
  String get home_tab_bundle_fastest_45g_internet;

  /// No description provided for @home_tab_bundle_high_speed_data.
  ///
  /// In en, this message translates to:
  /// **'High Speed Data'**
  String get home_tab_bundle_high_speed_data;

  /// No description provided for @home_tab_bundle_new_release_1.
  ///
  /// In en, this message translates to:
  /// **'Latest Data Bundle'**
  String get home_tab_bundle_new_release_1;

  /// No description provided for @home_tab_bundle_new_release_2.
  ///
  /// In en, this message translates to:
  /// **'Premium Internet Pack'**
  String get home_tab_bundle_new_release_2;

  /// No description provided for @home_tab_fill_name_welcome_to_zain.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Zain'**
  String get home_tab_fill_name_welcome_to_zain;

  /// No description provided for @home_tab_fill_name_what_should_we_call_you.
  ///
  /// In en, this message translates to:
  /// **'What should we call you?'**
  String get home_tab_fill_name_what_should_we_call_you;

  /// No description provided for @home_tab_fill_name_enter_your_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get home_tab_fill_name_enter_your_name;

  /// No description provided for @home_tab_fill_name_maybe_later.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get home_tab_fill_name_maybe_later;

  /// No description provided for @user_resources_kafoo_credit.
  ///
  /// In en, this message translates to:
  /// **'Kafoo Credit'**
  String get user_resources_kafoo_credit;

  /// No description provided for @user_resources_free_credit.
  ///
  /// In en, this message translates to:
  /// **'Free Credit'**
  String get user_resources_free_credit;

  /// No description provided for @user_resources_calls.
  ///
  /// In en, this message translates to:
  /// **'Calls'**
  String get user_resources_calls;

  /// No description provided for @user_resources_data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get user_resources_data;

  /// No description provided for @user_resources_sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get user_resources_sms;

  /// No description provided for @user_resources_roaming.
  ///
  /// In en, this message translates to:
  /// **'Roaming'**
  String get user_resources_roaming;

  /// No description provided for @user_resources_international.
  ///
  /// In en, this message translates to:
  /// **'International'**
  String get user_resources_international;

  /// No description provided for @user_resources_unit_min.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get user_resources_unit_min;

  /// No description provided for @user_resources_unit_sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get user_resources_unit_sms;

  /// No description provided for @user_resources_unlimited_internet.
  ///
  /// In en, this message translates to:
  /// **'∞ Unlimited Internet'**
  String get user_resources_unlimited_internet;

  /// No description provided for @user_resources_unit_gb_internet.
  ///
  /// In en, this message translates to:
  /// **'GB Internet'**
  String get user_resources_unit_gb_internet;

  /// No description provided for @user_resources_unit_mb_internet.
  ///
  /// In en, this message translates to:
  /// **'MB Internet'**
  String get user_resources_unit_mb_internet;

  /// No description provided for @user_resources_unit_gb.
  ///
  /// In en, this message translates to:
  /// **'GB'**
  String get user_resources_unit_gb;

  /// No description provided for @user_resources_unit_mb.
  ///
  /// In en, this message translates to:
  /// **'MB'**
  String get user_resources_unit_mb;

  /// No description provided for @user_resources_out_of.
  ///
  /// In en, this message translates to:
  /// **'out of'**
  String get user_resources_out_of;

  /// No description provided for @user_resources_days_remaining.
  ///
  /// In en, this message translates to:
  /// **'{days} Days Remaining'**
  String user_resources_days_remaining(int days);

  /// No description provided for @resource_details.
  ///
  /// In en, this message translates to:
  /// **'Resource Details'**
  String get resource_details;

  /// No description provided for @resource_details_empty_category.
  ///
  /// In en, this message translates to:
  /// **'You are not subscribed to any offer'**
  String get resource_details_empty_category;

  /// No description provided for @offers_tab_offers_tab.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers_tab_offers_tab;

  /// No description provided for @offers_tab_offer_internet.
  ///
  /// In en, this message translates to:
  /// **'Internet'**
  String get offers_tab_offer_internet;

  /// No description provided for @offers_tab_offer_sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get offers_tab_offer_sms;

  /// No description provided for @offers_tab_offer_minutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get offers_tab_offer_minutes;

  /// No description provided for @offers_tab_offer_free_credits.
  ///
  /// In en, this message translates to:
  /// **'Free Credits'**
  String get offers_tab_offer_free_credits;

  /// No description provided for @offers_tab_offer_free_socials.
  ///
  /// In en, this message translates to:
  /// **'Free Socials'**
  String get offers_tab_offer_free_socials;

  /// No description provided for @offers_tab_offer_details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get offers_tab_offer_details;

  /// No description provided for @offers_tab_offer_subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get offers_tab_offer_subscribe;

  /// No description provided for @offers_tab_offer_insufficient_error.
  ///
  /// In en, this message translates to:
  /// **'Insufficient balance. Recharge your account to subscribe to this offer.'**
  String get offers_tab_offer_insufficient_error;

  /// No description provided for @offers_tab_offer_call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get offers_tab_offer_call;

  /// No description provided for @offers_tab_offer_earn_mamnoon_points.
  ///
  /// In en, this message translates to:
  /// **'Mamnoon Points'**
  String get offers_tab_offer_earn_mamnoon_points;

  /// No description provided for @offers_tab_offer_bonus_credit.
  ///
  /// In en, this message translates to:
  /// **'Bonus Credit'**
  String get offers_tab_offer_bonus_credit;

  /// No description provided for @offers_tab_credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get offers_tab_credit;

  /// No description provided for @offers_tab_kaffoo_variant_standard.
  ///
  /// In en, this message translates to:
  /// **'Kafoo'**
  String get offers_tab_kaffoo_variant_standard;

  /// No description provided for @offers_tab_kaffoo_variant_two_plus_one.
  ///
  /// In en, this message translates to:
  /// **'Kafoo 2+1'**
  String get offers_tab_kaffoo_variant_two_plus_one;

  /// No description provided for @offers_tab_variant_bikaifi.
  ///
  /// In en, this message translates to:
  /// **'BIKAIFI'**
  String get offers_tab_variant_bikaifi;

  /// No description provided for @offers_tab_variant_super_card.
  ///
  /// In en, this message translates to:
  /// **'SUPER CARD'**
  String get offers_tab_variant_super_card;

  /// No description provided for @offers_tab_variant_unlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get offers_tab_variant_unlimited;

  /// No description provided for @offers_tab_variant_free_social.
  ///
  /// In en, this message translates to:
  /// **'Free Social'**
  String get offers_tab_variant_free_social;

  /// No description provided for @kaffoo_free_social_customise_title.
  ///
  /// In en, this message translates to:
  /// **'Customise your Apps'**
  String get kaffoo_free_social_customise_title;

  /// No description provided for @kaffoo_free_social_customise_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Replace any included app with another from the same category'**
  String get kaffoo_free_social_customise_subtitle;

  /// No description provided for @kaffoo_free_social_swap_confirm_title.
  ///
  /// In en, this message translates to:
  /// **'Swap. Personalize. Enjoy.'**
  String get kaffoo_free_social_swap_confirm_title;

  /// No description provided for @kaffoo_free_social_your_free_apps_title.
  ///
  /// In en, this message translates to:
  /// **'Your Free Apps'**
  String get kaffoo_free_social_your_free_apps_title;

  /// No description provided for @kaffoo_free_social_customise_button.
  ///
  /// In en, this message translates to:
  /// **'Customise'**
  String get kaffoo_free_social_customise_button;

  /// No description provided for @kaffoo_free_social_app_replacement_title.
  ///
  /// In en, this message translates to:
  /// **'App Replacement'**
  String get kaffoo_free_social_app_replacement_title;

  /// No description provided for @kaffoo_free_social_first_replacement_prefix.
  ///
  /// In en, this message translates to:
  /// **'1st Replacement is '**
  String get kaffoo_free_social_first_replacement_prefix;

  /// No description provided for @kaffoo_free_social_replacement_free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get kaffoo_free_social_replacement_free;

  /// No description provided for @kaffoo_free_social_replacements_per_cycle.
  ///
  /// In en, this message translates to:
  /// **'Up to {maxCount} replacements per cycle'**
  String kaffoo_free_social_replacements_per_cycle(int maxCount);

  /// No description provided for @kaffoo_free_social_replacement_changes_label.
  ///
  /// In en, this message translates to:
  /// **'Changes'**
  String get kaffoo_free_social_replacement_changes_label;

  /// No description provided for @kaffoo_free_social_replacement_no_changes.
  ///
  /// In en, this message translates to:
  /// **'No Changes'**
  String get kaffoo_free_social_replacement_no_changes;

  /// No description provided for @kaffoo_free_social_replacement_free_change.
  ///
  /// In en, this message translates to:
  /// **'Free Change'**
  String get kaffoo_free_social_replacement_free_change;

  /// No description provided for @kaffoo_free_social_replacement_pricing_note.
  ///
  /// In en, this message translates to:
  /// **'1 free, then {price} {currency} each'**
  String kaffoo_free_social_replacement_pricing_note(
    String price,
    String currency,
  );

  /// No description provided for @kaffoo_free_social_replacement_limit_reached.
  ///
  /// In en, this message translates to:
  /// **'All {maxCount} replacements have been used. You have reached the limit.'**
  String kaffoo_free_social_replacement_limit_reached(int maxCount);

  /// No description provided for @kaffoo_free_social_replacement_confirm_free_title.
  ///
  /// In en, this message translates to:
  /// **'Free App Change'**
  String get kaffoo_free_social_replacement_confirm_free_title;

  /// No description provided for @kaffoo_free_social_replacement_confirm_free_desc.
  ///
  /// In en, this message translates to:
  /// **'No FEE will be deducted from your balance if you continue.'**
  String get kaffoo_free_social_replacement_confirm_free_desc;

  /// No description provided for @kaffoo_free_social_replacement_confirm_paid_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm App Changes'**
  String get kaffoo_free_social_replacement_confirm_paid_title;

  /// No description provided for @kaffoo_free_social_replacement_confirm_paid_desc.
  ///
  /// In en, this message translates to:
  /// **'{price} {currency} will be deducted from your balance if you continue.'**
  String kaffoo_free_social_replacement_confirm_paid_desc(
    String price,
    String currency,
  );

  /// No description provided for @kaffoo_free_social_apps_new_tag.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get kaffoo_free_social_apps_new_tag;

  /// No description provided for @kaffoo_free_social_select_apps_title.
  ///
  /// In en, this message translates to:
  /// **'Select your Free Apps'**
  String get kaffoo_free_social_select_apps_title;

  /// No description provided for @kaffoo_free_social_select_apps_hint.
  ///
  /// In en, this message translates to:
  /// **'Choose 5 apps from the groups below'**
  String get kaffoo_free_social_select_apps_hint;

  /// No description provided for @kaffoo_free_social_light_apps_title.
  ///
  /// In en, this message translates to:
  /// **'Light Apps'**
  String get kaffoo_free_social_light_apps_title;

  /// No description provided for @kaffoo_free_social_heavy_apps_title.
  ///
  /// In en, this message translates to:
  /// **'Heavy Apps'**
  String get kaffoo_free_social_heavy_apps_title;

  /// No description provided for @kaffoo_free_social_choose_up_to.
  ///
  /// In en, this message translates to:
  /// **'(choose upto {count})'**
  String kaffoo_free_social_choose_up_to(int count);

  /// No description provided for @kaffoo_free_social_selected_label.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get kaffoo_free_social_selected_label;

  /// No description provided for @kaffoo_free_social_total_selected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get kaffoo_free_social_total_selected;

  /// No description provided for @kaffoo_free_social_reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get kaffoo_free_social_reset;

  /// No description provided for @kaffoo_free_social_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get kaffoo_free_social_continue;

  /// No description provided for @kaffoo_free_social_more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get kaffoo_free_social_more;

  /// No description provided for @kaffoo_free_social_max_selection_reached.
  ///
  /// In en, this message translates to:
  /// **'You can only select up to {count} apps from this group. Deselect one to choose another.'**
  String kaffoo_free_social_max_selection_reached(int count);

  /// No description provided for @kaffoo_free_social_review_selection_title.
  ///
  /// In en, this message translates to:
  /// **'Review Your Selection'**
  String get kaffoo_free_social_review_selection_title;

  /// No description provided for @kaffoo_free_social_review_selected_prefix.
  ///
  /// In en, this message translates to:
  /// **'You selected '**
  String get kaffoo_free_social_review_selected_prefix;

  /// No description provided for @kaffoo_free_social_review_selected_suffix.
  ///
  /// In en, this message translates to:
  /// **' free apps'**
  String get kaffoo_free_social_review_selected_suffix;

  /// No description provided for @kaffoo_free_social_good_choice.
  ///
  /// In en, this message translates to:
  /// **'Good Choice'**
  String get kaffoo_free_social_good_choice;

  /// No description provided for @kaffoo_free_social_bundle_price_note.
  ///
  /// In en, this message translates to:
  /// **'This won\'t affect the price of your bundle.'**
  String get kaffoo_free_social_bundle_price_note;

  /// No description provided for @offers_tab_variant_tiktok.
  ///
  /// In en, this message translates to:
  /// **'TIKTOK'**
  String get offers_tab_variant_tiktok;

  /// No description provided for @offers_tab_select_package.
  ///
  /// In en, this message translates to:
  /// **'Select Package'**
  String get offers_tab_select_package;

  /// No description provided for @offers_tab_already_subscribed_warning.
  ///
  /// In en, this message translates to:
  /// **'You\'re already subscribed to this offer'**
  String get offers_tab_already_subscribed_warning;

  /// No description provided for @offers_tab_offer_minutes_with_family.
  ///
  /// In en, this message translates to:
  /// **'Minutes with Family'**
  String get offers_tab_offer_minutes_with_family;

  /// No description provided for @offers_tab_offer_free_sms.
  ///
  /// In en, this message translates to:
  /// **'Free SMS'**
  String get offers_tab_offer_free_sms;

  /// No description provided for @offers_tab_kaffoo_offer_free_sms.
  ///
  /// In en, this message translates to:
  /// **'Free SMS'**
  String get offers_tab_kaffoo_offer_free_sms;

  /// No description provided for @offers_tab_offer_3rd_month_free.
  ///
  /// In en, this message translates to:
  /// **'3rd Month Free'**
  String get offers_tab_offer_3rd_month_free;

  /// No description provided for @offers_tab_appExclusiveBadge.
  ///
  /// In en, this message translates to:
  /// **'App Exclusive'**
  String get offers_tab_appExclusiveBadge;

  /// No description provided for @offers_tab_hotOfferBadge.
  ///
  /// In en, this message translates to:
  /// **'Hot Offer'**
  String get offers_tab_hotOfferBadge;

  /// No description provided for @offers_tab_hot.
  ///
  /// In en, this message translates to:
  /// **'Hot'**
  String get offers_tab_hot;

  /// No description provided for @offers_tab_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get offers_tab_search;

  /// No description provided for @account_tab_restricted.
  ///
  /// In en, this message translates to:
  /// **'Restricted'**
  String get account_tab_restricted;

  /// No description provided for @offers_tab_subscription_successful.
  ///
  /// In en, this message translates to:
  /// **'Subscription successful!'**
  String get offers_tab_subscription_successful;

  /// No description provided for @offers_tab_subscription_success_description.
  ///
  /// In en, this message translates to:
  /// **'Your selected bundle has been successfully activated. You can now enjoy your'**
  String get offers_tab_subscription_success_description;

  /// No description provided for @offers_tab_subscription_success_body.
  ///
  /// In en, this message translates to:
  /// **'Your selected bundle has been successfully activated.\nYou can now enjoy your benefits instantly'**
  String get offers_tab_subscription_success_body;

  /// No description provided for @offers_tab_subscription_activated_bundle.
  ///
  /// In en, this message translates to:
  /// **'Activated Bundle'**
  String get offers_tab_subscription_activated_bundle;

  /// No description provided for @offers_tab_subscription_balance_updated.
  ///
  /// In en, this message translates to:
  /// **'Thankyou ! your balance has been updated'**
  String get offers_tab_subscription_balance_updated;

  /// No description provided for @offers_tab_subscription_conflict_title.
  ///
  /// In en, this message translates to:
  /// **'Subscription Conflict Detected'**
  String get offers_tab_subscription_conflict_title;

  /// No description provided for @offers_tab_subscription_conflict_description.
  ///
  /// In en, this message translates to:
  /// **'You currently have an active subscription that conflicts with this offer. Only one bundle of this type can be active at a time.'**
  String get offers_tab_subscription_conflict_description;

  /// No description provided for @offers_tab_confirm_subscription.
  ///
  /// In en, this message translates to:
  /// **'Confirm Subscription'**
  String get offers_tab_confirm_subscription;

  /// No description provided for @offers_tab_confirm_subscription_details1.
  ///
  /// In en, this message translates to:
  /// **'You are about to subscribe to the selected bundle. Charges will apply as per your plan.'**
  String get offers_tab_confirm_subscription_details1;

  /// No description provided for @offers_tab_confirm_subscription_details2.
  ///
  /// In en, this message translates to:
  /// **'Would you like to continue?'**
  String get offers_tab_confirm_subscription_details2;

  /// No description provided for @offers_tab_confirm_subscription_yes_please.
  ///
  /// In en, this message translates to:
  /// **'yes, Please'**
  String get offers_tab_confirm_subscription_yes_please;

  /// No description provided for @offers_tab_confirm_subscription_no_cancel.
  ///
  /// In en, this message translates to:
  /// **'No Cancel'**
  String get offers_tab_confirm_subscription_no_cancel;

  /// No description provided for @offers_tab_confirm_subscription_button_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get offers_tab_confirm_subscription_button_confirm;

  /// No description provided for @offers_tab_confirm_subscription_maybe_later.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get offers_tab_confirm_subscription_maybe_later;

  /// No description provided for @offers_tab_restricted.
  ///
  /// In en, this message translates to:
  /// **'Restricted'**
  String get offers_tab_restricted;

  /// No description provided for @offers_tab_offer_subscribed_successfully.
  ///
  /// In en, this message translates to:
  /// **'Offer subscribed successfully'**
  String get offers_tab_offer_subscribed_successfully;

  /// No description provided for @offers_tab_error_subscribing_offer.
  ///
  /// In en, this message translates to:
  /// **'Error subscribing offer'**
  String get offers_tab_error_subscribing_offer;

  /// No description provided for @offers_tab_subscription_not_eligible_title.
  ///
  /// In en, this message translates to:
  /// **'Not Eligible'**
  String get offers_tab_subscription_not_eligible_title;

  /// No description provided for @offers_tab_subscription_not_eligible_description.
  ///
  /// In en, this message translates to:
  /// **'You are not eligible for this offer.'**
  String get offers_tab_subscription_not_eligible_description;

  /// No description provided for @offers_tab_subscription_unable_title.
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get offers_tab_subscription_unable_title;

  /// No description provided for @offers_tab_subscription_unable_description.
  ///
  /// In en, this message translates to:
  /// **'We were unable to process your subscription. Please try again later.'**
  String get offers_tab_subscription_unable_description;

  /// No description provided for @offers_tab_gift_sent_successfully.
  ///
  /// In en, this message translates to:
  /// **'Gift sent successfully'**
  String get offers_tab_gift_sent_successfully;

  /// No description provided for @offers_tab_error_sending_gift.
  ///
  /// In en, this message translates to:
  /// **'Error sending gift'**
  String get offers_tab_error_sending_gift;

  /// No description provided for @offers_tab_no_offers_found.
  ///
  /// In en, this message translates to:
  /// **'No offers found'**
  String get offers_tab_no_offers_found;

  /// No description provided for @offers_tab_confirm_gift.
  ///
  /// In en, this message translates to:
  /// **'Confirm Gift'**
  String get offers_tab_confirm_gift;

  /// No description provided for @offers_tab_you_are_about_to_gift.
  ///
  /// In en, this message translates to:
  /// **'You are about to gift'**
  String get offers_tab_you_are_about_to_gift;

  /// No description provided for @offers_tab_priced_at.
  ///
  /// In en, this message translates to:
  /// **'priced at'**
  String get offers_tab_priced_at;

  /// No description provided for @offers_tab_to_the_number.
  ///
  /// In en, this message translates to:
  /// **'to the number'**
  String get offers_tab_to_the_number;

  /// No description provided for @offers_tab_would_you_like_to_continue.
  ///
  /// In en, this message translates to:
  /// **'Would you like to continue ?'**
  String get offers_tab_would_you_like_to_continue;

  /// No description provided for @offers_tab_send_gift.
  ///
  /// In en, this message translates to:
  /// **'Send Gift'**
  String get offers_tab_send_gift;

  /// No description provided for @offers_tab_enter_gift_number_prompt.
  ///
  /// In en, this message translates to:
  /// **'Please enter the Zain number you want to send the gift to'**
  String get offers_tab_enter_gift_number_prompt;

  /// No description provided for @offers_tab_filter_offers.
  ///
  /// In en, this message translates to:
  /// **'Filter Offers'**
  String get offers_tab_filter_offers;

  /// No description provided for @offers_tab_offer_type.
  ///
  /// In en, this message translates to:
  /// **'Offer Type'**
  String get offers_tab_offer_type;

  /// No description provided for @offers_tab_offer_duration.
  ///
  /// In en, this message translates to:
  /// **'Offer Duration'**
  String get offers_tab_offer_duration;

  /// No description provided for @offers_tab_apply_filters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get offers_tab_apply_filters;

  /// No description provided for @offers_tab_clear_filters.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get offers_tab_clear_filters;

  /// No description provided for @offers_tab_sort_direction.
  ///
  /// In en, this message translates to:
  /// **'Sort Direction'**
  String get offers_tab_sort_direction;

  /// No description provided for @offers_tab_sort_by.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get offers_tab_sort_by;

  /// No description provided for @offers_tab_sort_ascending.
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get offers_tab_sort_ascending;

  /// No description provided for @offers_tab_sort_descending.
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get offers_tab_sort_descending;

  /// No description provided for @offers_tab_sort_by_price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get offers_tab_sort_by_price;

  /// No description provided for @offers_tab_sort_by_validity.
  ///
  /// In en, this message translates to:
  /// **'Validity'**
  String get offers_tab_sort_by_validity;

  /// No description provided for @offers_tab_sort_by_mbs.
  ///
  /// In en, this message translates to:
  /// **'MBs'**
  String get offers_tab_sort_by_mbs;

  /// No description provided for @offers_tab_sort_by_alphabetical.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical'**
  String get offers_tab_sort_by_alphabetical;

  /// No description provided for @offers_tab_offer_roaming.
  ///
  /// In en, this message translates to:
  /// **'Roaming'**
  String get offers_tab_offer_roaming;

  /// No description provided for @offers_tab_roaming_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search for country'**
  String get offers_tab_roaming_search_hint;

  /// No description provided for @offers_tab_offer_roam_internet.
  ///
  /// In en, this message translates to:
  /// **'Roam Internet'**
  String get offers_tab_offer_roam_internet;

  /// No description provided for @offers_tab_offer_roam_mins.
  ///
  /// In en, this message translates to:
  /// **'Roam Mins'**
  String get offers_tab_offer_roam_mins;

  /// No description provided for @offers_tab_offer_roam_sms.
  ///
  /// In en, this message translates to:
  /// **'Roam SMS'**
  String get offers_tab_offer_roam_sms;

  /// No description provided for @offers_tab_offer_int_internet.
  ///
  /// In en, this message translates to:
  /// **'Int Internet'**
  String get offers_tab_offer_int_internet;

  /// No description provided for @offers_tab_offer_int_mins.
  ///
  /// In en, this message translates to:
  /// **'Int Mins'**
  String get offers_tab_offer_int_mins;

  /// No description provided for @offers_tab_offer_int_sms.
  ///
  /// In en, this message translates to:
  /// **'Int SMS'**
  String get offers_tab_offer_int_sms;

  /// No description provided for @offers_tab_filter_type_bundle_to_gift.
  ///
  /// In en, this message translates to:
  /// **'Bundle to gift'**
  String get offers_tab_filter_type_bundle_to_gift;

  /// No description provided for @offers_tab_filter_type_hot_bundle.
  ///
  /// In en, this message translates to:
  /// **'Hot Bundle'**
  String get offers_tab_filter_type_hot_bundle;

  /// No description provided for @offers_tab_filter_duration_daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get offers_tab_filter_duration_daily;

  /// No description provided for @offers_tab_filter_duration_2_days.
  ///
  /// In en, this message translates to:
  /// **'2 Days'**
  String get offers_tab_filter_duration_2_days;

  /// No description provided for @offers_tab_filter_duration_3_days.
  ///
  /// In en, this message translates to:
  /// **'3 Days'**
  String get offers_tab_filter_duration_3_days;

  /// No description provided for @offers_tab_filter_duration_weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get offers_tab_filter_duration_weekly;

  /// No description provided for @offers_tab_filter_duration_10_days.
  ///
  /// In en, this message translates to:
  /// **'10 Days'**
  String get offers_tab_filter_duration_10_days;

  /// No description provided for @offers_tab_filter_duration_14_days.
  ///
  /// In en, this message translates to:
  /// **'14 Days'**
  String get offers_tab_filter_duration_14_days;

  /// No description provided for @offers_tab_filter_duration_20_days.
  ///
  /// In en, this message translates to:
  /// **'20 Days'**
  String get offers_tab_filter_duration_20_days;

  /// No description provided for @offers_tab_filter_duration_monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get offers_tab_filter_duration_monthly;

  /// No description provided for @offers_tab_filter_duration_yearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get offers_tab_filter_duration_yearly;

  /// No description provided for @offers_tab_validity_days_count.
  ///
  /// In en, this message translates to:
  /// **'{days} Days'**
  String offers_tab_validity_days_count(int days);

  /// No description provided for @offers_tab_validity_weeks_count.
  ///
  /// In en, this message translates to:
  /// **'{weeks} Week'**
  String offers_tab_validity_weeks_count(int weeks);

  /// No description provided for @offers_tab_gift_this_offer.
  ///
  /// In en, this message translates to:
  /// **'Gift this offer'**
  String get offers_tab_gift_this_offer;

  /// No description provided for @offers_tile_header_validity_prefix.
  ///
  /// In en, this message translates to:
  /// **'Validity: '**
  String get offers_tile_header_validity_prefix;

  /// No description provided for @offers_tab_offer_validity.
  ///
  /// In en, this message translates to:
  /// **'Validity: {days} Days'**
  String offers_tab_offer_validity(int days);

  /// No description provided for @offers_tab_view_details.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get offers_tab_view_details;

  /// No description provided for @offers_tab_offer_more_details.
  ///
  /// In en, this message translates to:
  /// **'More Details'**
  String get offers_tab_offer_more_details;

  /// No description provided for @account_tab_profile_tab.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account_tab_profile_tab;

  /// No description provided for @account_tab_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get account_tab_settings;

  /// No description provided for @account_tab_settings_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your account'**
  String get account_tab_settings_subtitle;

  /// No description provided for @account_tab_sim_status.
  ///
  /// In en, this message translates to:
  /// **'Sim Status'**
  String get account_tab_sim_status;

  /// No description provided for @account_tab_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get account_tab_active;

  /// No description provided for @account_tab_change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get account_tab_change_password;

  /// No description provided for @change_password_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get change_password_screen_title;

  /// No description provided for @forgot_password_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgot_password_screen_title;

  /// No description provided for @forgot_password_set_password.
  ///
  /// In en, this message translates to:
  /// **'SET PASSWORD'**
  String get forgot_password_set_password;

  /// No description provided for @change_password_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get change_password_password_hint;

  /// No description provided for @change_password_confirm_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get change_password_confirm_password_hint;

  /// No description provided for @change_password_rules_title.
  ///
  /// In en, this message translates to:
  /// **'Your password should contain:'**
  String get change_password_rules_title;

  /// No description provided for @change_password_rule_min_length.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get change_password_rule_min_length;

  /// No description provided for @change_password_rule_number.
  ///
  /// In en, this message translates to:
  /// **'At least 1 number'**
  String get change_password_rule_number;

  /// No description provided for @change_password_rule_upper_lower.
  ///
  /// In en, this message translates to:
  /// **'At least one upper-case & lower-case letter'**
  String get change_password_rule_upper_lower;

  /// No description provided for @change_password_rule_matched.
  ///
  /// In en, this message translates to:
  /// **'Passwords are matched'**
  String get change_password_rule_matched;

  /// No description provided for @change_password_validate_with_otp.
  ///
  /// In en, this message translates to:
  /// **'VALIDATE WITH OTP'**
  String get change_password_validate_with_otp;

  /// No description provided for @change_password_success_title.
  ///
  /// In en, this message translates to:
  /// **'Password Changed'**
  String get change_password_success_title;

  /// No description provided for @change_password_success_message.
  ///
  /// In en, this message translates to:
  /// **'You have successfully changed your password'**
  String get change_password_success_message;

  /// No description provided for @forgot_password_success_title.
  ///
  /// In en, this message translates to:
  /// **'Password reset'**
  String get forgot_password_success_title;

  /// No description provided for @forgot_password_success_message.
  ///
  /// In en, this message translates to:
  /// **'You have successfully reset your password. You can sign in with your new password.'**
  String get forgot_password_success_message;

  /// No description provided for @account_tab_manage_payment_card.
  ///
  /// In en, this message translates to:
  /// **'Manage Payment Card'**
  String get account_tab_manage_payment_card;

  /// No description provided for @account_tab_manage_subsecription.
  ///
  /// In en, this message translates to:
  /// **'Manage Subscriptions'**
  String get account_tab_manage_subsecription;

  /// No description provided for @manage_subscription_active_subscription.
  ///
  /// In en, this message translates to:
  /// **'Active Subscriptions'**
  String get manage_subscription_active_subscription;

  /// No description provided for @manage_subscription_browse_more_offers.
  ///
  /// In en, this message translates to:
  /// **'Browse More Offers'**
  String get manage_subscription_browse_more_offers;

  /// No description provided for @manage_subscription_no_subscriptions.
  ///
  /// In en, this message translates to:
  /// **'You are not subscribed to any offer'**
  String get manage_subscription_no_subscriptions;

  /// No description provided for @manage_subscription_expiring_in.
  ///
  /// In en, this message translates to:
  /// **'Expiring in'**
  String get manage_subscription_expiring_in;

  /// No description provided for @manage_subscription_day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get manage_subscription_day;

  /// No description provided for @manage_subscription_days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get manage_subscription_days;

  /// No description provided for @manage_subscription_unsubscribe.
  ///
  /// In en, this message translates to:
  /// **'Unsubscribe'**
  String get manage_subscription_unsubscribe;

  /// No description provided for @manage_subscription_recharge.
  ///
  /// In en, this message translates to:
  /// **'Recharge'**
  String get manage_subscription_recharge;

  /// No description provided for @manage_subscription_resubscribe.
  ///
  /// In en, this message translates to:
  /// **'Resubscribe'**
  String get manage_subscription_resubscribe;

  /// No description provided for @manage_subscription_pending_recharge.
  ///
  /// In en, this message translates to:
  /// **'Pending recharge'**
  String get manage_subscription_pending_recharge;

  /// No description provided for @manage_subscription_renew_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Renew Cancelled'**
  String get manage_subscription_renew_cancelled;

  /// No description provided for @manage_subscription_confirm_unsubscribe.
  ///
  /// In en, this message translates to:
  /// **'Confirm Unsubscription'**
  String get manage_subscription_confirm_unsubscribe;

  /// No description provided for @manage_subscription_confirm_unsubscribe_description.
  ///
  /// In en, this message translates to:
  /// **'Unsubscribing will stop this offer and all its benefits.'**
  String get manage_subscription_confirm_unsubscribe_description;

  /// No description provided for @manage_subscription_keep_offer.
  ///
  /// In en, this message translates to:
  /// **'Keep Offer'**
  String get manage_subscription_keep_offer;

  /// No description provided for @manage_subscription_unsubscribe_success.
  ///
  /// In en, this message translates to:
  /// **'You have successfully unsubscribed.'**
  String get manage_subscription_unsubscribe_success;

  /// No description provided for @manage_subscription_renews_on.
  ///
  /// In en, this message translates to:
  /// **'Renews on'**
  String get manage_subscription_renews_on;

  /// No description provided for @manage_subscription_expires_on.
  ///
  /// In en, this message translates to:
  /// **'Expires on'**
  String get manage_subscription_expires_on;

  /// No description provided for @manage_subscription_renew_with_balance.
  ///
  /// In en, this message translates to:
  /// **'Renew with balance'**
  String get manage_subscription_renew_with_balance;

  /// No description provided for @manage_subscription_renew_success.
  ///
  /// In en, this message translates to:
  /// **'Subscription renewed successfully.'**
  String get manage_subscription_renew_success;

  /// No description provided for @manage_subscription_confirm_renew_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm renewal'**
  String get manage_subscription_confirm_renew_title;

  /// No description provided for @manage_subscription_confirm_renew_body.
  ///
  /// In en, this message translates to:
  /// **'Resubscribing will renew this offer and restore its benefits.'**
  String get manage_subscription_confirm_renew_body;

  /// No description provided for @manage_subscription_status_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get manage_subscription_status_active;

  /// No description provided for @manage_subscription_view_details.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get manage_subscription_view_details;

  /// No description provided for @manage_subscription_cannot_unsubscribe.
  ///
  /// In en, this message translates to:
  /// **'This subscription cannot be unsubscribed.'**
  String get manage_subscription_cannot_unsubscribe;

  /// No description provided for @account_tab_biometric_login.
  ///
  /// In en, this message translates to:
  /// **'Biometric Login'**
  String get account_tab_biometric_login;

  /// No description provided for @account_tab_biometric_enable_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Enable Biometric Login'**
  String get account_tab_biometric_enable_dialog_title;

  /// No description provided for @account_tab_biometric_enable_dialog_description.
  ///
  /// In en, this message translates to:
  /// **'You will need to enter your password and complete biometric authentication to enable biometric login.'**
  String get account_tab_biometric_enable_dialog_description;

  /// No description provided for @account_tab_biometric_disable_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Disable Biometric Login'**
  String get account_tab_biometric_disable_dialog_title;

  /// No description provided for @account_tab_biometric_disable_dialog_description.
  ///
  /// In en, this message translates to:
  /// **'Biometric login will be turned off. You can enable it again anytime from Settings.'**
  String get account_tab_biometric_disable_dialog_description;

  /// No description provided for @account_tab_biometric_enable_button.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get account_tab_biometric_enable_button;

  /// No description provided for @account_tab_biometric_disable_button.
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get account_tab_biometric_disable_button;

  /// No description provided for @account_tab_biometric_confirm_password_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get account_tab_biometric_confirm_password_title;

  /// No description provided for @account_tab_biometric_confirm_password_description.
  ///
  /// In en, this message translates to:
  /// **'Enter your current password to enable biometric login.'**
  String get account_tab_biometric_confirm_password_description;

  /// No description provided for @account_tab_biometric_password_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password.'**
  String get account_tab_biometric_password_required;

  /// No description provided for @account_tab_biometric_wrong_password.
  ///
  /// In en, this message translates to:
  /// **'The password you entered is incorrect.'**
  String get account_tab_biometric_wrong_password;

  /// No description provided for @account_tab_change_language.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get account_tab_change_language;

  /// No description provided for @account_tab_select_language.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get account_tab_select_language;

  /// No description provided for @account_tab_select_language_subtitle.
  ///
  /// In en, this message translates to:
  /// **'choose your preferred language to continue'**
  String get account_tab_select_language_subtitle;

  /// No description provided for @account_tab_delete_my_account.
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get account_tab_delete_my_account;

  /// No description provided for @account_tab_delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get account_tab_delete_account;

  /// No description provided for @account_tab_delete_your_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Your Account'**
  String get account_tab_delete_your_account;

  /// No description provided for @account_tab_delete_account_description_paragraph1.
  ///
  /// In en, this message translates to:
  /// **'You are about to delete your account which will remove your data from the app and log you out. You will have to register again to access the app.'**
  String get account_tab_delete_account_description_paragraph1;

  /// No description provided for @account_tab_delete_account_description_paragraph2.
  ///
  /// In en, this message translates to:
  /// **'This does not affect your mobile line and benefits, so you will still have access to your subscriptions, allowances, and other Zain features.'**
  String get account_tab_delete_account_description_paragraph2;

  /// No description provided for @account_tab_confirm_delete_account_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete Account'**
  String get account_tab_confirm_delete_account_title;

  /// No description provided for @account_tab_confirm_delete_account_description.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get account_tab_confirm_delete_account_description;

  /// No description provided for @account_tab_delete_account_confirm_button_title.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get account_tab_delete_account_confirm_button_title;

  /// No description provided for @account_tab_delete_account_cancel_button_title.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get account_tab_delete_account_cancel_button_title;

  /// No description provided for @account_tab_confirm_logout_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm logout'**
  String get account_tab_confirm_logout_title;

  /// No description provided for @account_tab_confirm_logout_description.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get account_tab_confirm_logout_description;

  /// No description provided for @account_tab_confirm_logout_confirm_button_title.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get account_tab_confirm_logout_confirm_button_title;

  /// No description provided for @account_tab_confirm_logout_cancel_button_title.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get account_tab_confirm_logout_cancel_button_title;

  /// No description provided for @main_container_exit_app_title.
  ///
  /// In en, this message translates to:
  /// **'Exit app'**
  String get main_container_exit_app_title;

  /// No description provided for @main_container_exit_app_description.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit the app?'**
  String get main_container_exit_app_description;

  /// No description provided for @main_container_exit_app_confirm.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get main_container_exit_app_confirm;

  /// No description provided for @account_tab_support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get account_tab_support;

  /// No description provided for @account_tab_support_subtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'re here to help'**
  String get account_tab_support_subtitle;

  /// No description provided for @account_tab_whatsapp_care.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Zain Care'**
  String get account_tab_whatsapp_care;

  /// No description provided for @account_tab_help_and_support.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get account_tab_help_and_support;

  /// No description provided for @help_and_support_tutorials.
  ///
  /// In en, this message translates to:
  /// **'Tutorials'**
  String get help_and_support_tutorials;

  /// No description provided for @help_and_support_tutorial_registration.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get help_and_support_tutorial_registration;

  /// No description provided for @help_and_support_tutorial_forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get help_and_support_tutorial_forget_password;

  /// No description provided for @help_and_support_tutorial_recharge_by_voucher.
  ///
  /// In en, this message translates to:
  /// **'Recharge by voucher'**
  String get help_and_support_tutorial_recharge_by_voucher;

  /// No description provided for @help_and_support_tutorial_recharge_by_credit_card.
  ///
  /// In en, this message translates to:
  /// **'Recharge by credit card'**
  String get help_and_support_tutorial_recharge_by_credit_card;

  /// No description provided for @help_and_support_tutorial_offers_subscription.
  ///
  /// In en, this message translates to:
  /// **'Offers Subscription'**
  String get help_and_support_tutorial_offers_subscription;

  /// No description provided for @help_and_support_support_live_chat.
  ///
  /// In en, this message translates to:
  /// **'Live Chat'**
  String get help_and_support_support_live_chat;

  /// No description provided for @help_and_support_support_live_chat_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to launch Live Chat. Please try again.'**
  String get help_and_support_support_live_chat_failed;

  /// No description provided for @help_and_support_support_ticket_management.
  ///
  /// In en, this message translates to:
  /// **'Ticket Management'**
  String get help_and_support_support_ticket_management;

  /// No description provided for @help_and_support_ticket_select_complaint_type.
  ///
  /// In en, this message translates to:
  /// **'Select complaint type'**
  String get help_and_support_ticket_select_complaint_type;

  /// No description provided for @help_and_support_ticket_sort_by_date.
  ///
  /// In en, this message translates to:
  /// **'Sort by Date'**
  String get help_and_support_ticket_sort_by_date;

  /// No description provided for @help_and_support_ticket_sort_by_latest.
  ///
  /// In en, this message translates to:
  /// **'Sort by Latest'**
  String get help_and_support_ticket_sort_by_latest;

  /// No description provided for @help_and_support_ticket_sort_by_oldest.
  ///
  /// In en, this message translates to:
  /// **'Sort by Oldest'**
  String get help_and_support_ticket_sort_by_oldest;

  /// No description provided for @account_tab_find_zain_near_me.
  ///
  /// In en, this message translates to:
  /// **'Find Zain Near Me'**
  String get account_tab_find_zain_near_me;

  /// No description provided for @account_tab_edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get account_tab_edit_profile;

  /// No description provided for @account_tab_enter_full_name_fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get account_tab_enter_full_name_fullNameHint;

  /// No description provided for @account_tab_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get account_tab_logout;

  /// No description provided for @account_tab_could_not_launch_whatsapp.
  ///
  /// In en, this message translates to:
  /// **'Could not launch WhatsApp'**
  String get account_tab_could_not_launch_whatsapp;

  /// No description provided for @menu_tab_menu.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get menu_tab_menu;

  /// No description provided for @menu_tab_digital_services.
  ///
  /// In en, this message translates to:
  /// **'Digital Services'**
  String get menu_tab_digital_services;

  /// No description provided for @menu_tab_manage_data_usage.
  ///
  /// In en, this message translates to:
  /// **'Data Usage'**
  String get menu_tab_manage_data_usage;

  /// No description provided for @manage_data_usage_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Set your internet usage from KAFOO credit'**
  String get manage_data_usage_subtitle;

  /// No description provided for @manage_data_usage_limit_description.
  ///
  /// In en, this message translates to:
  /// **'Select your limit that can be spent on internet when you have enough credit from KAFOO bundle'**
  String get manage_data_usage_limit_description;

  /// No description provided for @manage_data_usage_header_assigned_credit.
  ///
  /// In en, this message translates to:
  /// **'You assigned {amount} {currency} from your credit for internet usage!'**
  String manage_data_usage_header_assigned_credit(
    String amount,
    String currency,
  );

  /// No description provided for @manage_data_usage_header_amount_reset.
  ///
  /// In en, this message translates to:
  /// **'This amount will reset with each successful bundle renewal'**
  String get manage_data_usage_header_amount_reset;

  /// No description provided for @manage_data_blocking_message.
  ///
  /// In en, this message translates to:
  /// **'You cannot perform the operation now, please try again after {date}'**
  String manage_data_blocking_message(String date);

  /// No description provided for @menu_tab_manage_subscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get menu_tab_manage_subscriptions;

  /// No description provided for @menu_tab_view_free_units.
  ///
  /// In en, this message translates to:
  /// **'View Free Units'**
  String get menu_tab_view_free_units;

  /// No description provided for @menu_tab_recharge.
  ///
  /// In en, this message translates to:
  /// **'Recharge'**
  String get menu_tab_recharge;

  /// No description provided for @menu_tab_give_feedback.
  ///
  /// In en, this message translates to:
  /// **'Give Feedback'**
  String get menu_tab_give_feedback;

  /// No description provided for @give_feedback_title.
  ///
  /// In en, this message translates to:
  /// **'We Value Your Feedback'**
  String get give_feedback_title;

  /// No description provided for @give_feedback_description.
  ///
  /// In en, this message translates to:
  /// **'Your comments help us enhance our services. Please rate your experience and share any issues or suggestions.'**
  String get give_feedback_description;

  /// No description provided for @give_feedback_hint.
  ///
  /// In en, this message translates to:
  /// **'Write your feedback here....'**
  String get give_feedback_hint;

  /// No description provided for @give_feedback_hint_negative.
  ///
  /// In en, this message translates to:
  /// **'Oh oh! Please help us to improve'**
  String get give_feedback_hint_negative;

  /// No description provided for @give_feedback_hint_positive.
  ///
  /// In en, this message translates to:
  /// **'So we are doing great?'**
  String get give_feedback_hint_positive;

  /// No description provided for @give_feedback_send_button.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get give_feedback_send_button;

  /// No description provided for @give_feedback_success_message.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your feedback!'**
  String get give_feedback_success_message;

  /// No description provided for @menu_tab_get_your_credit_info.
  ///
  /// In en, this message translates to:
  /// **'Credit Info'**
  String get menu_tab_get_your_credit_info;

  /// No description provided for @get_credit_info_no_activity_found.
  ///
  /// In en, this message translates to:
  /// **'No activity found'**
  String get get_credit_info_no_activity_found;

  /// No description provided for @get_credit_info_last_3_days.
  ///
  /// In en, this message translates to:
  /// **'(last 3 days)'**
  String get get_credit_info_last_3_days;

  /// No description provided for @get_credit_info_service_type.
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get get_credit_info_service_type;

  /// No description provided for @get_credit_info_time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get get_credit_info_time;

  /// No description provided for @get_credit_info_b_number.
  ///
  /// In en, this message translates to:
  /// **'B Number'**
  String get get_credit_info_b_number;

  /// No description provided for @get_credit_info_service_type_received_amount.
  ///
  /// In en, this message translates to:
  /// **'Received amount'**
  String get get_credit_info_service_type_received_amount;

  /// No description provided for @get_credit_info_service_type_transferred_amount.
  ///
  /// In en, this message translates to:
  /// **'Transferred amount'**
  String get get_credit_info_service_type_transferred_amount;

  /// No description provided for @get_credit_info_service_type_adjustment.
  ///
  /// In en, this message translates to:
  /// **'Adjustment'**
  String get get_credit_info_service_type_adjustment;

  /// No description provided for @get_credit_info_service_type_service_fee.
  ///
  /// In en, this message translates to:
  /// **'Service Fee'**
  String get get_credit_info_service_type_service_fee;

  /// No description provided for @get_credit_info_service_type_balance_recharge.
  ///
  /// In en, this message translates to:
  /// **'Balance Recharge'**
  String get get_credit_info_service_type_balance_recharge;

  /// No description provided for @get_credit_info_service_type_call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get get_credit_info_service_type_call;

  /// No description provided for @get_credit_info_service_type_video_call.
  ///
  /// In en, this message translates to:
  /// **'Video Call'**
  String get get_credit_info_service_type_video_call;

  /// No description provided for @get_credit_info_service_type_call_roaming.
  ///
  /// In en, this message translates to:
  /// **'Call Roaming'**
  String get get_credit_info_service_type_call_roaming;

  /// No description provided for @get_credit_info_service_type_sms_roaming.
  ///
  /// In en, this message translates to:
  /// **'SMS Roaming'**
  String get get_credit_info_service_type_sms_roaming;

  /// No description provided for @get_credit_info_service_type_sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get get_credit_info_service_type_sms;

  /// No description provided for @get_credit_info_service_type_mms.
  ///
  /// In en, this message translates to:
  /// **'MMS'**
  String get get_credit_info_service_type_mms;

  /// No description provided for @get_credit_info_service_type_data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get get_credit_info_service_type_data;

  /// No description provided for @get_credit_info_service_type_data_roaming.
  ///
  /// In en, this message translates to:
  /// **'Data Roaming'**
  String get get_credit_info_service_type_data_roaming;

  /// No description provided for @get_credit_info_service_type_bundle_fee.
  ///
  /// In en, this message translates to:
  /// **'Bundle Fee'**
  String get get_credit_info_service_type_bundle_fee;

  /// No description provided for @get_credit_info_service_type_installment.
  ///
  /// In en, this message translates to:
  /// **'Installment'**
  String get get_credit_info_service_type_installment;

  /// No description provided for @get_credit_info_service_type_unknown.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get get_credit_info_service_type_unknown;

  /// No description provided for @recharge_choose_recharge_method.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Recharge Method'**
  String get recharge_choose_recharge_method;

  /// No description provided for @recharge_recharge_method_voucher_pin.
  ///
  /// In en, this message translates to:
  /// **'Voucher PIN'**
  String get recharge_recharge_method_voucher_pin;

  /// No description provided for @recharge_recharge_method_credit_debit.
  ///
  /// In en, this message translates to:
  /// **'Credit/Debit Card'**
  String get recharge_recharge_method_credit_debit;

  /// No description provided for @recharge_recharge_method_zain_cash.
  ///
  /// In en, this message translates to:
  /// **'Zain Cash'**
  String get recharge_recharge_method_zain_cash;

  /// No description provided for @recharge_voucher_pin_enter_or_scan_voucher.
  ///
  /// In en, this message translates to:
  /// **'Enter or Scan Voucher'**
  String get recharge_voucher_pin_enter_or_scan_voucher;

  /// No description provided for @recharge_voucher_pin_enter_the_16_digit_voucher_pin.
  ///
  /// In en, this message translates to:
  /// **'Enter the 16-digit voucher PIN'**
  String get recharge_voucher_pin_enter_the_16_digit_voucher_pin;

  /// No description provided for @recharge_voucher_pin_recharge.
  ///
  /// In en, this message translates to:
  /// **'Recharge'**
  String get recharge_voucher_pin_recharge;

  /// No description provided for @recharge_voucher_pin_please_enter_zain_number_you_want_to_recharge.
  ///
  /// In en, this message translates to:
  /// **'Please enter Zain number you want to recharge'**
  String get recharge_voucher_pin_please_enter_zain_number_you_want_to_recharge;

  /// No description provided for @recharge_voucher_pin_recharge_to_others.
  ///
  /// In en, this message translates to:
  /// **'Another Number'**
  String get recharge_voucher_pin_recharge_to_others;

  /// No description provided for @recharge_voucher_pin_recharge_failed.
  ///
  /// In en, this message translates to:
  /// **'Voucher Recharge Failed'**
  String get recharge_voucher_pin_recharge_failed;

  /// No description provided for @recharge_voucher_pin_recharge_failed_message.
  ///
  /// In en, this message translates to:
  /// **'Invalid code entered, please check and re-enter 16-digit voucher code'**
  String get recharge_voucher_pin_recharge_failed_message;

  /// No description provided for @recharge_voucher_pin_voucher_already_used_message.
  ///
  /// In en, this message translates to:
  /// **'This voucher has already been used.'**
  String get recharge_voucher_pin_voucher_already_used_message;

  /// No description provided for @recharge_voucher_pin_success_message.
  ///
  /// In en, this message translates to:
  /// **'You Have successfully recharge'**
  String get recharge_voucher_pin_success_message;

  /// No description provided for @recharge_success_via.
  ///
  /// In en, this message translates to:
  /// **'Via'**
  String get recharge_success_via;

  /// No description provided for @recharge_success_method_voucher.
  ///
  /// In en, this message translates to:
  /// **'Voucher'**
  String get recharge_success_method_voucher;

  /// No description provided for @recharge_success_via_credit_card_to.
  ///
  /// In en, this message translates to:
  /// **'Via Credit Card to'**
  String get recharge_success_via_credit_card_to;

  /// No description provided for @recharge_success_recharge_another_number.
  ///
  /// In en, this message translates to:
  /// **'Recharge another number'**
  String get recharge_success_recharge_another_number;

  /// No description provided for @common_back_to_home.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get common_back_to_home;

  /// No description provided for @recharge_credit_debit_card_credit_debit_card.
  ///
  /// In en, this message translates to:
  /// **'Credit/Debit Card'**
  String get recharge_credit_debit_card_credit_debit_card;

  /// No description provided for @recharge_credit_debit_card_enter_the_amount_you_want_to_recharge.
  ///
  /// In en, this message translates to:
  /// **'Enter the amount you want to recharge'**
  String get recharge_credit_debit_card_enter_the_amount_you_want_to_recharge;

  /// No description provided for @recharge_credit_debit_card_enter_the_amount_you_want_to_pay.
  ///
  /// In en, this message translates to:
  /// **'Enter the amount you want to pay your bill with'**
  String get recharge_credit_debit_card_enter_the_amount_you_want_to_pay;

  /// No description provided for @recharge_credit_debit_card_select_amount.
  ///
  /// In en, this message translates to:
  /// **'Select Amount'**
  String get recharge_credit_debit_card_select_amount;

  /// No description provided for @recharge_credit_debit_card_select_amount_you_want_to_recharge.
  ///
  /// In en, this message translates to:
  /// **'Select the amount you want to recharge'**
  String get recharge_credit_debit_card_select_amount_you_want_to_recharge;

  /// No description provided for @recharge_credit_debit_card_payment_unsuccessful.
  ///
  /// In en, this message translates to:
  /// **'Payment Unsuccessful'**
  String get recharge_credit_debit_card_payment_unsuccessful;

  /// No description provided for @recharge_credit_debit_card_payment_unsuccessful_message.
  ///
  /// In en, this message translates to:
  /// **'Your credit card payment was not successful. Please ensure your card details are correct and try again.'**
  String get recharge_credit_debit_card_payment_unsuccessful_message;

  /// No description provided for @recharge_credit_debit_card_3ds_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Payment authentication was cancelled.'**
  String get recharge_credit_debit_card_3ds_cancelled;

  /// No description provided for @recharge_credit_debit_card_3ds_webview_title.
  ///
  /// In en, this message translates to:
  /// **'Secure verification'**
  String get recharge_credit_debit_card_3ds_webview_title;

  /// No description provided for @recharge_credit_debit_card_payment_successful.
  ///
  /// In en, this message translates to:
  /// **'Payment successful'**
  String get recharge_credit_debit_card_payment_successful;

  /// No description provided for @recharge_credit_debit_card_payment_successful_message.
  ///
  /// In en, this message translates to:
  /// **'Your payment has been successfully processed'**
  String get recharge_credit_debit_card_payment_successful_message;

  /// No description provided for @recharge_credit_debit_card_additional_fees.
  ///
  /// In en, this message translates to:
  /// **'Additional fees might be applied by the bank or the credit card issuer'**
  String get recharge_credit_debit_card_additional_fees;

  /// No description provided for @recharge_credit_debit_card_your_card_number.
  ///
  /// In en, this message translates to:
  /// **'Your card number'**
  String get recharge_credit_debit_card_your_card_number;

  /// No description provided for @recharge_credit_debit_card_your_name_on_card.
  ///
  /// In en, this message translates to:
  /// **'Your name on the card'**
  String get recharge_credit_debit_card_your_name_on_card;

  /// No description provided for @recharge_credit_debit_card_powered_by.
  ///
  /// In en, this message translates to:
  /// **'Powered by'**
  String get recharge_credit_debit_card_powered_by;

  /// No description provided for @recharge_credit_debit_card_recharge_with_zain_cash.
  ///
  /// In en, this message translates to:
  /// **'Recharge with Zain Cash'**
  String get recharge_credit_debit_card_recharge_with_zain_cash;

  /// No description provided for @recharge_credit_debit_card_totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get recharge_credit_debit_card_totalAmount;

  /// No description provided for @recharge_credit_debit_card_current_balance.
  ///
  /// In en, this message translates to:
  /// **'Current Balance'**
  String get recharge_credit_debit_card_current_balance;

  /// No description provided for @recharge_credit_debit_card_expiry_hint.
  ///
  /// In en, this message translates to:
  /// **'MM/YY'**
  String get recharge_credit_debit_card_expiry_hint;

  /// No description provided for @recharge_credit_debit_card_cvv_hint.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get recharge_credit_debit_card_cvv_hint;

  /// No description provided for @recharge_credit_debit_card_expiry_error_month.
  ///
  /// In en, this message translates to:
  /// **'Month must be between 01 and 12'**
  String get recharge_credit_debit_card_expiry_error_month;

  /// No description provided for @recharge_credit_debit_card_expiry_error_past.
  ///
  /// In en, this message translates to:
  /// **'Expiry date cannot be in the past'**
  String get recharge_credit_debit_card_expiry_error_past;

  /// No description provided for @recharge_credit_debit_card_expiry_error_future.
  ///
  /// In en, this message translates to:
  /// **'Expiry date cannot be more than {maxYears} years in the future'**
  String recharge_credit_debit_card_expiry_error_future(int maxYears);

  /// No description provided for @recharge_zain_cash_pay_bill_with_zain_cash.
  ///
  /// In en, this message translates to:
  /// **'Pay Bill with Zain Cash'**
  String get recharge_zain_cash_pay_bill_with_zain_cash;

  /// No description provided for @recharge_zain_cash_webview_pay_with_zain_cash.
  ///
  /// In en, this message translates to:
  /// **'Pay with Zain Cash'**
  String get recharge_zain_cash_webview_pay_with_zain_cash;

  /// No description provided for @recharge_zain_cash_webview_error_loading.
  ///
  /// In en, this message translates to:
  /// **'Error loading Zain Cash'**
  String get recharge_zain_cash_webview_error_loading;

  /// No description provided for @recharge_zain_cash_enter_recharge_amount.
  ///
  /// In en, this message translates to:
  /// **'Please enter the recharge amount'**
  String get recharge_zain_cash_enter_recharge_amount;

  /// No description provided for @recharge_zain_cash_confirm_amount_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm amount'**
  String get recharge_zain_cash_confirm_amount_title;

  /// No description provided for @recharge_zain_cash_confirm_amount_message.
  ///
  /// In en, this message translates to:
  /// **'You are about to pay {amount}. Do you want to continue?'**
  String recharge_zain_cash_confirm_amount_message(String amount);

  /// No description provided for @recharge_transfer_credit_transferCredit.
  ///
  /// In en, this message translates to:
  /// **'Transfer Credit'**
  String get recharge_transfer_credit_transferCredit;

  /// No description provided for @recharge_transfer_credit_please_enter_zain_number_you_want_to_send_credit_to.
  ///
  /// In en, this message translates to:
  /// **'Please enter Zain number you want to transfer credit'**
  String
  get recharge_transfer_credit_please_enter_zain_number_you_want_to_send_credit_to;

  /// No description provided for @recharge_transfer_credit_please_enter_amount_of_money.
  ///
  /// In en, this message translates to:
  /// **'Please enter the amount of money you would like to send'**
  String get recharge_transfer_credit_please_enter_amount_of_money;

  /// No description provided for @recharge_transfer_credit_noContactsPermissionButton.
  ///
  /// In en, this message translates to:
  /// **'Activate from settings'**
  String get recharge_transfer_credit_noContactsPermissionButton;

  /// No description provided for @recharge_transfer_credit_no_permission_for_contact.
  ///
  /// In en, this message translates to:
  /// **'no permission to read your contacts list'**
  String get recharge_transfer_credit_no_permission_for_contact;

  /// No description provided for @recharge_transfer_credit_no_contacts_to_show.
  ///
  /// In en, this message translates to:
  /// **'no contacts to show'**
  String get recharge_transfer_credit_no_contacts_to_show;

  /// No description provided for @recharge_transfer_credit_select_contact.
  ///
  /// In en, this message translates to:
  /// **'Select Contact'**
  String get recharge_transfer_credit_select_contact;

  /// No description provided for @recharge_transfer_credit_transferAmount.
  ///
  /// In en, this message translates to:
  /// **'Transfer Amount'**
  String get recharge_transfer_credit_transferAmount;

  /// No description provided for @recharge_transfer_credit_confirmTransfer.
  ///
  /// In en, this message translates to:
  /// **'Confirm Transfer'**
  String get recharge_transfer_credit_confirmTransfer;

  /// No description provided for @recharge_transfer_credit_confirmTransferMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to transfer to {phoneNumber} a credit of {amount}'**
  String recharge_transfer_credit_confirmTransferMessage(
    String phoneNumber,
    String amount,
  );

  /// No description provided for @recharge_transfer_credit_transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get recharge_transfer_credit_transfer;

  /// No description provided for @contact_list_no_contacts_to_show.
  ///
  /// In en, this message translates to:
  /// **'no contacts to show'**
  String get contact_list_no_contacts_to_show;

  /// No description provided for @contact_list_no_permission_for_contact.
  ///
  /// In en, this message translates to:
  /// **'no permission to read your contacts list'**
  String get contact_list_no_permission_for_contact;

  /// No description provided for @contact_list_no_permission_button.
  ///
  /// In en, this message translates to:
  /// **'Activate from settings'**
  String get contact_list_no_permission_button;

  /// No description provided for @recharge_transfer_credit_search.
  ///
  /// In en, this message translates to:
  /// **'Who are you looking for?'**
  String get recharge_transfer_credit_search;

  /// No description provided for @contact_list_select_contact.
  ///
  /// In en, this message translates to:
  /// **'Select Contact'**
  String get contact_list_select_contact;

  /// No description provided for @loyalty_dashboard_how_to_earn_points.
  ///
  /// In en, this message translates to:
  /// **'How to Earn Points'**
  String get loyalty_dashboard_how_to_earn_points;

  /// No description provided for @loyalty_dashboard_redeem_points.
  ///
  /// In en, this message translates to:
  /// **'Redeem Points'**
  String get loyalty_dashboard_redeem_points;

  /// No description provided for @loyalty_dashboard_hot_bundles.
  ///
  /// In en, this message translates to:
  /// **'Hot Bundles'**
  String get loyalty_dashboard_hot_bundles;

  /// No description provided for @loyalty_dashboard_points_history.
  ///
  /// In en, this message translates to:
  /// **'Point History'**
  String get loyalty_dashboard_points_history;

  /// No description provided for @loyalty_dashboard_help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get loyalty_dashboard_help;

  /// No description provided for @loyalty_dashboard_platinum.
  ///
  /// In en, this message translates to:
  /// **'Platinum'**
  String get loyalty_dashboard_platinum;

  /// No description provided for @loyalty_dashboard_silver.
  ///
  /// In en, this message translates to:
  /// **'Silver'**
  String get loyalty_dashboard_silver;

  /// No description provided for @loyalty_redeem_points_bundles.
  ///
  /// In en, this message translates to:
  /// **'Bundles'**
  String get loyalty_redeem_points_bundles;

  /// No description provided for @loyalty_redeem_points_credits.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get loyalty_redeem_points_credits;

  /// No description provided for @loyalty_redeem_points_stores.
  ///
  /// In en, this message translates to:
  /// **'Stores'**
  String get loyalty_redeem_points_stores;

  /// No description provided for @loyalty_redeem_points_stores_location_services_disabled_message.
  ///
  /// In en, this message translates to:
  /// **'Please enable location services to find nearby stores.'**
  String get loyalty_redeem_points_stores_location_services_disabled_message;

  /// No description provided for @loyalty_redeem_points_stores_permission_denied_message.
  ///
  /// In en, this message translates to:
  /// **'Please enable location permission to find nearby stores.'**
  String get loyalty_redeem_points_stores_permission_denied_message;

  /// No description provided for @loyalty_redeem_points_stores_permission_denied_forever_message.
  ///
  /// In en, this message translates to:
  /// **'Location permission is permanently denied. Please open app settings to enable it.'**
  String get loyalty_redeem_points_stores_permission_denied_forever_message;

  /// No description provided for @loyalty_redeem_points_stores_enable_location_services.
  ///
  /// In en, this message translates to:
  /// **'Enable Location Services'**
  String get loyalty_redeem_points_stores_enable_location_services;

  /// No description provided for @loyalty_redeem_points_stores_request_permission_again.
  ///
  /// In en, this message translates to:
  /// **'Request Permission Again'**
  String get loyalty_redeem_points_stores_request_permission_again;

  /// No description provided for @loyalty_redeem_points_stores_open_app_settings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get loyalty_redeem_points_stores_open_app_settings;

  /// No description provided for @loyalty_redeem_points_points.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get loyalty_redeem_points_points;

  /// No description provided for @loyalty_hot_bundles_loyalty_points_label.
  ///
  /// In en, this message translates to:
  /// **'Loyalty Points'**
  String get loyalty_hot_bundles_loyalty_points_label;

  /// No description provided for @loyalty_redeem_points_no_bundles_available.
  ///
  /// In en, this message translates to:
  /// **'No bundles available'**
  String get loyalty_redeem_points_no_bundles_available;

  /// No description provided for @loyalty_bundles_redeem_success_message.
  ///
  /// In en, this message translates to:
  /// **'Your bundle has been activated successfully.'**
  String get loyalty_bundles_redeem_success_message;

  /// No description provided for @loyalty_redeem_points_please_enter_amount_of_points_you_want_to_redeem_to_credit.
  ///
  /// In en, this message translates to:
  /// **'Please enter the amount of points you want to redeem to credit'**
  String
  get loyalty_redeem_points_please_enter_amount_of_points_you_want_to_redeem_to_credit;

  /// No description provided for @loyalty_redeem_points_redeem_mamnoon_points_to_credit_to_be_used_for_all_networks.
  ///
  /// In en, this message translates to:
  /// **'Redeem Mamnoon points to credit to be used for all networks'**
  String
  get loyalty_redeem_points_redeem_mamnoon_points_to_credit_to_be_used_for_all_networks;

  /// No description provided for @loyalty_extend_validity_select_length_of_extension.
  ///
  /// In en, this message translates to:
  /// **'Select extension period'**
  String get loyalty_extend_validity_select_length_of_extension;

  /// No description provided for @loyalty_extend_validity_select_extension_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose how long you want to extend your line validity'**
  String get loyalty_extend_validity_select_extension_subtitle;

  /// No description provided for @loyalty_extend_validity_option_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Extend validity for {duration}'**
  String loyalty_extend_validity_option_subtitle(String duration);

  /// No description provided for @loyalty_extend_validity_service_active_info.
  ///
  /// In en, this message translates to:
  /// **'Service will be active for selected period'**
  String get loyalty_extend_validity_service_active_info;

  /// No description provided for @loyalty_extend_validity_extension_label.
  ///
  /// In en, this message translates to:
  /// **'Extension'**
  String get loyalty_extend_validity_extension_label;

  /// No description provided for @loyalty_extend_validity_total_price_label.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get loyalty_extend_validity_total_price_label;

  /// No description provided for @loyalty_extend_validity_day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get loyalty_extend_validity_day;

  /// No description provided for @loyalty_extend_validity_days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get loyalty_extend_validity_days;

  /// No description provided for @loyalty_extend_validity_week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get loyalty_extend_validity_week;

  /// No description provided for @loyalty_extend_validity_weeks.
  ///
  /// In en, this message translates to:
  /// **'Weeks'**
  String get loyalty_extend_validity_weeks;

  /// No description provided for @loyalty_extend_validity_month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get loyalty_extend_validity_month;

  /// No description provided for @loyalty_extend_validity_months.
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get loyalty_extend_validity_months;

  /// No description provided for @loyalty_extend_validity_year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get loyalty_extend_validity_year;

  /// No description provided for @loyalty_extend_validity_extendValidity.
  ///
  /// In en, this message translates to:
  /// **'Extend Validity'**
  String get loyalty_extend_validity_extendValidity;

  /// No description provided for @loyalty_extend_validity_extendValidityAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Extension'**
  String get loyalty_extend_validity_extendValidityAlertTitle;

  /// No description provided for @loyalty_extend_validity_extendValidityAlertBody1.
  ///
  /// In en, this message translates to:
  /// **'Your credit validity will be extended for'**
  String get loyalty_extend_validity_extendValidityAlertBody1;

  /// No description provided for @loyalty_extend_validity_extendValidityAlertBody2.
  ///
  /// In en, this message translates to:
  /// **'with a fee of'**
  String get loyalty_extend_validity_extendValidityAlertBody2;

  /// No description provided for @loyalty_extend_validity_extension_successful.
  ///
  /// In en, this message translates to:
  /// **'Extension Successful'**
  String get loyalty_extend_validity_extension_successful;

  /// No description provided for @loyalty_extend_validity_success_message.
  ///
  /// In en, this message translates to:
  /// **'The validity has been successfully extended.'**
  String get loyalty_extend_validity_success_message;

  /// No description provided for @loyalty_extend_validity_noThanks.
  ///
  /// In en, this message translates to:
  /// **'No, Thanks'**
  String get loyalty_extend_validity_noThanks;

  /// No description provided for @digital_services_explore.
  ///
  /// In en, this message translates to:
  /// **'EXPLORE'**
  String get digital_services_explore;

  /// No description provided for @digital_services_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get digital_services_all;

  /// No description provided for @digital_services_games.
  ///
  /// In en, this message translates to:
  /// **'GAMES'**
  String get digital_services_games;

  /// No description provided for @digital_services_ehealth_insurance.
  ///
  /// In en, this message translates to:
  /// **'E-HEALTH & INSURANCE'**
  String get digital_services_ehealth_insurance;

  /// No description provided for @digital_services_elearning.
  ///
  /// In en, this message translates to:
  /// **'E-LEARNING'**
  String get digital_services_elearning;

  /// No description provided for @digital_services_entertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get digital_services_entertainment;

  /// No description provided for @digital_services_zain_world_kids.
  ///
  /// In en, this message translates to:
  /// **'ZAIN WORLD KIDS'**
  String get digital_services_zain_world_kids;

  /// No description provided for @digital_services_esports_service.
  ///
  /// In en, this message translates to:
  /// **'ESPORTS SERVICE'**
  String get digital_services_esports_service;

  /// No description provided for @digital_services_appstore.
  ///
  /// In en, this message translates to:
  /// **'APP STORE'**
  String get digital_services_appstore;

  /// No description provided for @digital_services_voucher_and_estores.
  ///
  /// In en, this message translates to:
  /// **'VOUCHER & E-STORES'**
  String get digital_services_voucher_and_estores;

  /// No description provided for @digital_services_no_services_available.
  ///
  /// In en, this message translates to:
  /// **'No service available'**
  String get digital_services_no_services_available;

  /// No description provided for @digital_services_details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get digital_services_details;

  /// No description provided for @update_version_update_version_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get update_version_update_version_cancel;

  /// No description provided for @update_version_update_required_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get update_version_update_required_skip;

  /// No description provided for @update_version_update_version_update_badge.
  ///
  /// In en, this message translates to:
  /// **'NEW UPDATE'**
  String get update_version_update_version_update_badge;

  /// No description provided for @update_version_update_version_update_now.
  ///
  /// In en, this message translates to:
  /// **'Update the app now!'**
  String get update_version_update_version_update_now;

  /// No description provided for @update_version_update_required_now.
  ///
  /// In en, this message translates to:
  /// **'Update the app now!'**
  String get update_version_update_required_now;

  /// No description provided for @update_version_update_version_update_title.
  ///
  /// In en, this message translates to:
  /// **'Update Required'**
  String get update_version_update_version_update_title;

  /// No description provided for @update_version_update_required_title.
  ///
  /// In en, this message translates to:
  /// **'Update Required'**
  String get update_version_update_required_title;

  /// No description provided for @update_version_update_version_update_desc.
  ///
  /// In en, this message translates to:
  /// **'A new version of the app is available.\nGet the latest version to enjoy our newest services,\nenhanced features, and the best possible experience.'**
  String get update_version_update_version_update_desc;

  /// No description provided for @update_version_update_required_desc.
  ///
  /// In en, this message translates to:
  /// **'A new version of the app is available.\nGet the latest version to enjoy our newest services,\nenhanced features, and the best possible experience.'**
  String get update_version_update_required_desc;

  /// No description provided for @update_version_update_highlight_better_performance_title.
  ///
  /// In en, this message translates to:
  /// **'Better Performance'**
  String get update_version_update_highlight_better_performance_title;

  /// No description provided for @update_version_update_highlight_bug_fixes_title.
  ///
  /// In en, this message translates to:
  /// **'Bug Fixes'**
  String get update_version_update_highlight_bug_fixes_title;

  /// No description provided for @update_version_update_highlight_security_improvements_title.
  ///
  /// In en, this message translates to:
  /// **'Security Improvements'**
  String get update_version_update_highlight_security_improvements_title;

  /// No description provided for @edit_profile_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile_screen_title;

  /// No description provided for @edit_profile_photo_sheet_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile Photo'**
  String get edit_profile_photo_sheet_title;

  /// No description provided for @edit_profile_remove_current_photo.
  ///
  /// In en, this message translates to:
  /// **'Remove Current Photo'**
  String get edit_profile_remove_current_photo;

  /// No description provided for @edit_profile_select_new_photo.
  ///
  /// In en, this message translates to:
  /// **'Select New Photo'**
  String get edit_profile_select_new_photo;

  /// No description provided for @edit_profile_capture_new_photo.
  ///
  /// In en, this message translates to:
  /// **'Capture New Photo'**
  String get edit_profile_capture_new_photo;

  /// No description provided for @edit_profile_full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get edit_profile_full_name;

  /// No description provided for @edit_profile_save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get edit_profile_save_changes;

  /// No description provided for @edit_profile_confirm_changes_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm Changes'**
  String get edit_profile_confirm_changes_title;

  /// No description provided for @edit_profile_confirm_changes_message.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to save these changes?'**
  String get edit_profile_confirm_changes_message;

  /// No description provided for @edit_profile_yes_please.
  ///
  /// In en, this message translates to:
  /// **'Yes, Please'**
  String get edit_profile_yes_please;

  /// No description provided for @edit_profile_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get edit_profile_back;

  /// No description provided for @edit_profile_remove_photo_title.
  ///
  /// In en, this message translates to:
  /// **'Remove Photo'**
  String get edit_profile_remove_photo_title;

  /// No description provided for @edit_profile_remove_photo_message.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove Current Photo?'**
  String get edit_profile_remove_photo_message;

  /// No description provided for @common_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get common_something_went_wrong;

  /// No description provided for @common_something_went_wrong_message.
  ///
  /// In en, this message translates to:
  /// **'We didn\'t see that coming. Please try again in a moment.'**
  String get common_something_went_wrong_message;

  /// No description provided for @common_contact_support.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get common_contact_support;

  /// No description provided for @zain_near_me_list_of_stores.
  ///
  /// In en, this message translates to:
  /// **'List of Store'**
  String get zain_near_me_list_of_stores;

  /// No description provided for @zain_near_me_map_view.
  ///
  /// In en, this message translates to:
  /// **'Map View'**
  String get zain_near_me_map_view;

  /// No description provided for @zain_near_me_no_stores_found.
  ///
  /// In en, this message translates to:
  /// **'No stores found'**
  String get zain_near_me_no_stores_found;

  /// No description provided for @zain_near_me_enable_location_message.
  ///
  /// In en, this message translates to:
  /// **'Please Enable Location Permission to use this feature'**
  String get zain_near_me_enable_location_message;

  /// No description provided for @zain_near_me_enable_location_button.
  ///
  /// In en, this message translates to:
  /// **'Enable Location Permission'**
  String get zain_near_me_enable_location_button;

  /// No description provided for @zain_near_me_request_permission_again.
  ///
  /// In en, this message translates to:
  /// **'Request Permission Again'**
  String get zain_near_me_request_permission_again;

  /// No description provided for @zain_near_me_open_settings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get zain_near_me_open_settings;

  /// No description provided for @zain_near_me_map_view_coming_soon.
  ///
  /// In en, this message translates to:
  /// **'Map view coming soon'**
  String get zain_near_me_map_view_coming_soon;

  /// No description provided for @zain_near_me_permission_permanently_denied.
  ///
  /// In en, this message translates to:
  /// **'Location permission is permanently denied. Please open app settings to enable it.'**
  String get zain_near_me_permission_permanently_denied;

  /// No description provided for @zain_near_me_get_directions.
  ///
  /// In en, this message translates to:
  /// **'Get Directions'**
  String get zain_near_me_get_directions;

  /// No description provided for @zain_near_me_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get zain_near_me_close;

  /// No description provided for @zain_near_me_store_location_not_available.
  ///
  /// In en, this message translates to:
  /// **'Store location not available'**
  String get zain_near_me_store_location_not_available;

  /// No description provided for @zain_near_me_distance_km_away.
  ///
  /// In en, this message translates to:
  /// **'{distance} km away'**
  String zain_near_me_distance_km_away(String distance);

  /// No description provided for @zain_near_me_opening_hours_day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get zain_near_me_opening_hours_day;

  /// No description provided for @zain_near_me_opening_hours_work_hours.
  ///
  /// In en, this message translates to:
  /// **'Work hours'**
  String get zain_near_me_opening_hours_work_hours;

  /// No description provided for @zain_near_me_opening_hours_rest_hours.
  ///
  /// In en, this message translates to:
  /// **'Rest hours'**
  String get zain_near_me_opening_hours_rest_hours;

  /// No description provided for @zain_near_me_opening_hours_closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get zain_near_me_opening_hours_closed;

  /// No description provided for @zain_near_me_store_status_opens_closes.
  ///
  /// In en, this message translates to:
  /// **'Opens {startTime} • Closes {endTime}'**
  String zain_near_me_store_status_opens_closes(
    String startTime,
    String endTime,
  );

  /// No description provided for @zain_near_me_store_status_closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get zain_near_me_store_status_closed;

  /// No description provided for @zain_near_me_day_sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get zain_near_me_day_sunday;

  /// No description provided for @zain_near_me_day_monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get zain_near_me_day_monday;

  /// No description provided for @zain_near_me_day_tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get zain_near_me_day_tuesday;

  /// No description provided for @zain_near_me_day_wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get zain_near_me_day_wednesday;

  /// No description provided for @zain_near_me_day_thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get zain_near_me_day_thursday;

  /// No description provided for @zain_near_me_day_friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get zain_near_me_day_friday;

  /// No description provided for @zain_near_me_day_saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get zain_near_me_day_saturday;

  /// No description provided for @zain_near_me_time_am.
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get zain_near_me_time_am;

  /// No description provided for @zain_near_me_time_pm.
  ///
  /// In en, this message translates to:
  /// **'PM'**
  String get zain_near_me_time_pm;

  /// No description provided for @kafoo_intro_slide1_title.
  ///
  /// In en, this message translates to:
  /// **'What\'s KAFOO?'**
  String get kafoo_intro_slide1_title;

  /// No description provided for @kafoo_intro_slide1_description.
  ///
  /// In en, this message translates to:
  /// **'Kafoo bundles portfolio gives you multiplied credit and unlimited flexibility to make calls and SMS across all local networks and use 4.5G+ Internet.'**
  String get kafoo_intro_slide1_description;

  /// No description provided for @kafoo_intro_slide2_title.
  ///
  /// In en, this message translates to:
  /// **'What\'s KAFOO Family?'**
  String get kafoo_intro_slide2_title;

  /// No description provided for @kafoo_intro_slide2_description.
  ///
  /// In en, this message translates to:
  /// **'With the all-new KAFOO Family Bundles, you can enjoy all the benefits of KAFOO and also share them with your family and friends.'**
  String get kafoo_intro_slide2_description;

  /// No description provided for @kafoo_intro_slide3_title.
  ///
  /// In en, this message translates to:
  /// **'Free Social Media with KAFOO!'**
  String get kafoo_intro_slide3_title;

  /// No description provided for @kafoo_intro_slide3_description.
  ///
  /// In en, this message translates to:
  /// **'Enjoy unlimited free social media with all your favorite apps. Avail 20% bonus credit when subscribing through the app on KAFOO 20, 25, and 30.'**
  String get kafoo_intro_slide3_description;

  /// No description provided for @kafoo_intro_explore_bundles.
  ///
  /// In en, this message translates to:
  /// **'Explore KAFOO Bundles!'**
  String get kafoo_intro_explore_bundles;

  /// No description provided for @notifications_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notifications_screen_title;

  /// No description provided for @notifications_mark_all_as_read.
  ///
  /// In en, this message translates to:
  /// **'Mark All as Read'**
  String get notifications_mark_all_as_read;

  /// No description provided for @notifications_show_unread_only.
  ///
  /// In en, this message translates to:
  /// **'Show Unread Only'**
  String get notifications_show_unread_only;

  /// No description provided for @notifications_error_fetching.
  ///
  /// In en, this message translates to:
  /// **'Error fetching notifications'**
  String get notifications_error_fetching;

  /// No description provided for @auth_native_biometric_title.
  ///
  /// In en, this message translates to:
  /// **'Enable Biometric Login'**
  String get auth_native_biometric_title;

  /// No description provided for @auth_native_biometric_subtitle.
  ///
  /// In en, this message translates to:
  /// **'You will be able to login more quickly'**
  String get auth_native_biometric_subtitle;

  /// No description provided for @auth_native_biometric_enable_button.
  ///
  /// In en, this message translates to:
  /// **'Enable Biometric'**
  String get auth_native_biometric_enable_button;

  /// No description provided for @auth_native_biometric_skip_button.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get auth_native_biometric_skip_button;

  /// No description provided for @loyalty_dashboard_mamnoon_rewards.
  ///
  /// In en, this message translates to:
  /// **'Mamnoon Rewards'**
  String get loyalty_dashboard_mamnoon_rewards;

  /// No description provided for @loyalty_dashboard_mamnoon_gifts_discounts.
  ///
  /// In en, this message translates to:
  /// **'Gifts and Discounts'**
  String get loyalty_dashboard_mamnoon_gifts_discounts;

  /// No description provided for @loyalty_dashboard_mamnoon_redeem.
  ///
  /// In en, this message translates to:
  /// **'Redeem'**
  String get loyalty_dashboard_mamnoon_redeem;

  /// No description provided for @loyalty_dashboard_mamnoon_enter_points.
  ///
  /// In en, this message translates to:
  /// **'Enter Points'**
  String get loyalty_dashboard_mamnoon_enter_points;

  /// No description provided for @loyalty_dashboard_mamnoon_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get loyalty_dashboard_mamnoon_cancel;

  /// No description provided for @loyalty_dashboard_mamnoon_please_confirm.
  ///
  /// In en, this message translates to:
  /// **'Please Confirm'**
  String get loyalty_dashboard_mamnoon_please_confirm;

  /// No description provided for @loyalty_dashboard_mamnoon_points_redeem_for_gifts.
  ///
  /// In en, this message translates to:
  /// **'{points} points will be Redeemed for this gift.'**
  String loyalty_dashboard_mamnoon_points_redeem_for_gifts(int points);

  /// No description provided for @loyalty_dashboard_points_range_error.
  ///
  /// In en, this message translates to:
  /// **'Points should be between {minPoints} and {maxPoints}.'**
  String loyalty_dashboard_points_range_error(int minPoints, int maxPoints);

  /// No description provided for @loyalty_dashboard_redemption_history.
  ///
  /// In en, this message translates to:
  /// **'Rewards history'**
  String get loyalty_dashboard_redemption_history;

  /// No description provided for @loyalty_dashboard_no_redemption_history.
  ///
  /// In en, this message translates to:
  /// **'There is no redemption history'**
  String get loyalty_dashboard_no_redemption_history;

  /// No description provided for @loyalty_dashboard_you_currently_have.
  ///
  /// In en, this message translates to:
  /// **'You currently have:'**
  String get loyalty_dashboard_you_currently_have;

  /// No description provided for @loyalty_dashboard_total_spendable_points.
  ///
  /// In en, this message translates to:
  /// **'{totalSpendablePoints} Points'**
  String loyalty_dashboard_total_spendable_points(int totalSpendablePoints);

  /// No description provided for @loyalty_dashboard_congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get loyalty_dashboard_congratulations;

  /// No description provided for @loyalty_dashboard_points_redeemed_successfully.
  ///
  /// In en, this message translates to:
  /// **'Your points are successfully redeemed!'**
  String get loyalty_dashboard_points_redeemed_successfully;

  /// No description provided for @loyalty_dashboard_redemption_failed.
  ///
  /// In en, this message translates to:
  /// **'Redemption failed'**
  String get loyalty_dashboard_redemption_failed;

  /// No description provided for @loyalty_dashboard_see_details.
  ///
  /// In en, this message translates to:
  /// **'SEE DETAILS'**
  String get loyalty_dashboard_see_details;

  /// No description provided for @loyalty_statement_points_earned.
  ///
  /// In en, this message translates to:
  /// **'Points earned'**
  String get loyalty_statement_points_earned;

  /// No description provided for @loyalty_statement_points_redeemed.
  ///
  /// In en, this message translates to:
  /// **'Points redeemed'**
  String get loyalty_statement_points_redeemed;

  /// No description provided for @loyalty_statement_your_point_history.
  ///
  /// In en, this message translates to:
  /// **'Points history'**
  String get loyalty_statement_your_point_history;

  /// No description provided for @loyalty_statement_no_history_available.
  ///
  /// In en, this message translates to:
  /// **'No history available'**
  String get loyalty_statement_no_history_available;

  /// No description provided for @loyalty_statement_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get loyalty_statement_type;

  /// No description provided for @loyalty_statement_partner.
  ///
  /// In en, this message translates to:
  /// **'Partner'**
  String get loyalty_statement_partner;

  /// No description provided for @loyalty_statement_mamnoon_points.
  ///
  /// In en, this message translates to:
  /// **'Mamnoon Points'**
  String get loyalty_statement_mamnoon_points;

  /// No description provided for @loyalty_statement_points_redemption.
  ///
  /// In en, this message translates to:
  /// **'Points Redemption'**
  String get loyalty_statement_points_redemption;

  /// No description provided for @loyalty_statement_close.
  ///
  /// In en, this message translates to:
  /// **'CLOSE'**
  String get loyalty_statement_close;

  /// No description provided for @loyalty_statement_redeem_again.
  ///
  /// In en, this message translates to:
  /// **'REDEEM AGAIN'**
  String get loyalty_statement_redeem_again;

  /// No description provided for @loyalty_dashboard_valid_until.
  ///
  /// In en, this message translates to:
  /// **'Valid until {validUntil}'**
  String loyalty_dashboard_valid_until(String validUntil);

  /// No description provided for @loyalty_dashboard_faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get loyalty_dashboard_faq;

  /// No description provided for @loyalty_help_no_faq_items_available.
  ///
  /// In en, this message translates to:
  /// **'No FAQ items available'**
  String get loyalty_help_no_faq_items_available;

  /// No description provided for @loyalty_help_and_faq.
  ///
  /// In en, this message translates to:
  /// **'Help & FAQ'**
  String get loyalty_help_and_faq;

  /// No description provided for @loyalty_help_contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get loyalty_help_contact_us;

  /// No description provided for @loyalty_dashboard_zain_network.
  ///
  /// In en, this message translates to:
  /// **'Zain Network: {zainNetworkNumber}'**
  String loyalty_dashboard_zain_network(String zainNetworkNumber);

  /// No description provided for @loyalty_dashboard_other_networks.
  ///
  /// In en, this message translates to:
  /// **'Other Networks: {otherNetworksNumber}'**
  String loyalty_dashboard_other_networks(String otherNetworksNumber);

  /// No description provided for @loyalty_help_whatsapp_zain_care.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Zain Care'**
  String get loyalty_help_whatsapp_zain_care;

  /// No description provided for @loyalty_help_could_not_open_email_client.
  ///
  /// In en, this message translates to:
  /// **'Could not open email client'**
  String get loyalty_help_could_not_open_email_client;

  /// No description provided for @loyalty_dashboard_gifts_and_discounts.
  ///
  /// In en, this message translates to:
  /// **'Gifts and Discounts'**
  String get loyalty_dashboard_gifts_and_discounts;

  /// No description provided for @loyalty_store_details.
  ///
  /// In en, this message translates to:
  /// **'Store Details'**
  String get loyalty_store_details;

  /// No description provided for @loyalty_store_promo_code_copied.
  ///
  /// In en, this message translates to:
  /// **'Promo code copied!'**
  String get loyalty_store_promo_code_copied;

  /// No description provided for @loyalty_store_could_not_open_google_maps.
  ///
  /// In en, this message translates to:
  /// **'Could not open Google Maps'**
  String get loyalty_store_could_not_open_google_maps;

  /// No description provided for @loyalty_store_view_on_map.
  ///
  /// In en, this message translates to:
  /// **'VIEW ON MAP'**
  String get loyalty_store_view_on_map;

  /// No description provided for @loyalty_store_redeem_offer.
  ///
  /// In en, this message translates to:
  /// **'REDEEM'**
  String get loyalty_store_redeem_offer;

  /// No description provided for @loyalty_store_normal_redemption_visit_message.
  ///
  /// In en, this message translates to:
  /// **'To get this offer please visit {storeName}'**
  String loyalty_store_normal_redemption_visit_message(String storeName);

  /// No description provided for @loyalty_store_report_merchant.
  ///
  /// In en, this message translates to:
  /// **'REPORT MERCHANT'**
  String get loyalty_store_report_merchant;

  /// No description provided for @loyalty_store_report_merchant_confirm.
  ///
  /// In en, this message translates to:
  /// **'Report merchant?'**
  String get loyalty_store_report_merchant_confirm;

  /// No description provided for @loyalty_store_report_merchant_guideline.
  ///
  /// In en, this message translates to:
  /// **'Please only report merchants who do not fulfill the offers listed on our app'**
  String get loyalty_store_report_merchant_guideline;

  /// No description provided for @loyalty_store_got_it.
  ///
  /// In en, this message translates to:
  /// **'GOT IT'**
  String get loyalty_store_got_it;

  /// No description provided for @loyalty_store_enter_valid_points.
  ///
  /// In en, this message translates to:
  /// **'Enter valid points'**
  String get loyalty_store_enter_valid_points;

  /// No description provided for @loyalty_store_minimum_points_required.
  ///
  /// In en, this message translates to:
  /// **'Minimum {minPoints} points required'**
  String loyalty_store_minimum_points_required(String minPoints);

  /// No description provided for @loyalty_store_not_enough_points.
  ///
  /// In en, this message translates to:
  /// **'You don’t have enough points'**
  String get loyalty_store_not_enough_points;

  /// No description provided for @loyalty_store_maximum_allowed_points.
  ///
  /// In en, this message translates to:
  /// **'Maximum allowed is {maxPoints} points'**
  String loyalty_store_maximum_allowed_points(String maxPoints);

  /// No description provided for @loyalty_store_earn_more_points_to_upgrade.
  ///
  /// In en, this message translates to:
  /// **'Earn more {points} points to upgrade to {nextTier}'**
  String loyalty_store_earn_more_points_to_upgrade(
    String points,
    String nextTier,
  );

  /// No description provided for @loyalty_dashboard_mamnoon_earn_points_to_redeem.
  ///
  /// In en, this message translates to:
  /// **'Earn {missing_points} extra points to redeem this offer'**
  String loyalty_dashboard_mamnoon_earn_points_to_redeem(int missing_points);

  /// No description provided for @start_date_end_date.
  ///
  /// In en, this message translates to:
  /// **'Start date - End date'**
  String get start_date_end_date;

  /// No description provided for @select_date.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get select_date;

  /// No description provided for @clear_filter.
  ///
  /// In en, this message translates to:
  /// **'Clear Filter'**
  String get clear_filter;

  /// No description provided for @end_date.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get end_date;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// No description provided for @loyalty_info_details_title.
  ///
  /// In en, this message translates to:
  /// **'Mamnoon Rewards Points'**
  String get loyalty_info_details_title;

  /// No description provided for @loyalty_how_to_earn_points.
  ///
  /// In en, this message translates to:
  /// **'How to Earn Points'**
  String get loyalty_how_to_earn_points;

  /// No description provided for @loyalty_expiring_on.
  ///
  /// In en, this message translates to:
  /// **'Expiring on'**
  String get loyalty_expiring_on;

  /// No description provided for @onboarding_welcome_to_zain.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Zain'**
  String get onboarding_welcome_to_zain;

  /// No description provided for @onboarding_experience_best_services.
  ///
  /// In en, this message translates to:
  /// **'Fast, stable, and reliable coverage built for everyday communication, streaming, gaming, and work.'**
  String get onboarding_experience_best_services;

  /// No description provided for @onboarding_manage_your_account.
  ///
  /// In en, this message translates to:
  /// **'Manage Your Account'**
  String get onboarding_manage_your_account;

  /// No description provided for @onboarding_account_description.
  ///
  /// In en, this message translates to:
  /// **'Check your balance, recharge, and manage subscriptions easily'**
  String get onboarding_account_description;

  /// No description provided for @onboarding_explore_offers.
  ///
  /// In en, this message translates to:
  /// **'Explore Offers'**
  String get onboarding_explore_offers;

  /// No description provided for @onboarding_offers_description.
  ///
  /// In en, this message translates to:
  /// **'Discover amazing offers and bundles tailored for you'**
  String get onboarding_offers_description;

  /// No description provided for @onboarding_get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboarding_get_started;

  /// No description provided for @error_could_not_open_link.
  ///
  /// In en, this message translates to:
  /// **'Could not open link'**
  String get error_could_not_open_link;

  /// No description provided for @digital_services_more_details.
  ///
  /// In en, this message translates to:
  /// **'More Details'**
  String get digital_services_more_details;

  /// No description provided for @common_see_more.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get common_see_more;

  /// No description provided for @common_show_qr_code.
  ///
  /// In en, this message translates to:
  /// **'SHOW QR CODE'**
  String get common_show_qr_code;

  /// No description provided for @common_show_barcode.
  ///
  /// In en, this message translates to:
  /// **'SHOW BARCODE'**
  String get common_show_barcode;

  /// No description provided for @common_promo_code.
  ///
  /// In en, this message translates to:
  /// **'Promo Code'**
  String get common_promo_code;

  /// No description provided for @common_promo_code_copied.
  ///
  /// In en, this message translates to:
  /// **'Promo code copied!'**
  String get common_promo_code_copied;

  /// No description provided for @common_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get common_all;

  /// No description provided for @service_data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get service_data;

  /// No description provided for @service_minutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get service_minutes;

  /// No description provided for @service_sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get service_sms;

  /// No description provided for @common_redeem_offer.
  ///
  /// In en, this message translates to:
  /// **'Redeem Offer'**
  String get common_redeem_offer;

  /// No description provided for @redeem_offer_confirmation_message.
  ///
  /// In en, this message translates to:
  /// **'points will be Redeemed for this gift'**
  String get redeem_offer_confirmation_message;

  /// No description provided for @redeem_offer_button.
  ///
  /// In en, this message translates to:
  /// **'REDEEM OFFER'**
  String get redeem_offer_button;

  /// No description provided for @common_congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get common_congratulations;

  /// No description provided for @redeem_barcode_success_message.
  ///
  /// In en, this message translates to:
  /// **'Your barcode has been redeemed successfully'**
  String get redeem_barcode_success_message;

  /// No description provided for @common_close.
  ///
  /// In en, this message translates to:
  /// **'CLOSE'**
  String get common_close;

  /// No description provided for @barcode_error_unable_to_generate.
  ///
  /// In en, this message translates to:
  /// **'Unable to generate barcode'**
  String get barcode_error_unable_to_generate;

  /// No description provided for @redeem_offer_success_discount_received.
  ///
  /// In en, this message translates to:
  /// **'You have got the discount'**
  String get redeem_offer_success_discount_received;

  /// No description provided for @redeem_offer_show_to_merchant.
  ///
  /// In en, this message translates to:
  /// **'Show the dialog to the merchant {merchantName} to get:'**
  String redeem_offer_show_to_merchant(String merchantName);

  /// No description provided for @qr_scan_get_discount.
  ///
  /// In en, this message translates to:
  /// **'Scan the QR code to get the discount'**
  String get qr_scan_get_discount;

  /// No description provided for @redeem_offer_copy_code.
  ///
  /// In en, this message translates to:
  /// **'Copy Code'**
  String get redeem_offer_copy_code;

  /// No description provided for @report_merchant_success_title.
  ///
  /// In en, this message translates to:
  /// **'Merchant reported'**
  String get report_merchant_success_title;

  /// No description provided for @report_merchant_success_message.
  ///
  /// In en, this message translates to:
  /// **'We will look into this and make sure it does not happen again'**
  String get report_merchant_success_message;

  /// No description provided for @redeem_offer_success_discount_text_1.
  ///
  /// In en, this message translates to:
  /// **'You\'ve got the discount. Show the counter to the merchant'**
  String get redeem_offer_success_discount_text_1;

  /// No description provided for @common_unable_to_generate_barcode.
  ///
  /// In en, this message translates to:
  /// **'Unable to generate barcode'**
  String get common_unable_to_generate_barcode;

  /// No description provided for @redeem_offer_success_to_get.
  ///
  /// In en, this message translates to:
  /// **'to get:'**
  String get redeem_offer_success_to_get;

  /// No description provided for @common_code.
  ///
  /// In en, this message translates to:
  /// **'code:'**
  String get common_code;

  /// No description provided for @common_details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get common_details;

  /// No description provided for @common_redeem_on.
  ///
  /// In en, this message translates to:
  /// **'Redeem on'**
  String get common_redeem_on;

  /// No description provided for @common_choose_governorate.
  ///
  /// In en, this message translates to:
  /// **'Choose Governorate'**
  String get common_choose_governorate;

  /// No description provided for @common_select.
  ///
  /// In en, this message translates to:
  /// **'SELECT'**
  String get common_select;

  /// No description provided for @common_clear_filter.
  ///
  /// In en, this message translates to:
  /// **'CLEAR FILTER'**
  String get common_clear_filter;

  /// No description provided for @common_selected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get common_selected;

  /// No description provided for @scan_card.
  ///
  /// In en, this message translates to:
  /// **'Scan Card'**
  String get scan_card;

  /// No description provided for @initializing_camera.
  ///
  /// In en, this message translates to:
  /// **'Initializing camera...'**
  String get initializing_camera;

  /// No description provided for @camera_no_available.
  ///
  /// In en, this message translates to:
  /// **'No cameras available'**
  String get camera_no_available;

  /// No description provided for @camera_permission_required.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required'**
  String get camera_permission_required;

  /// No description provided for @camera_permission_settings.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required. Please enable it in Settings.'**
  String get camera_permission_settings;

  /// No description provided for @camera_init_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize camera'**
  String get camera_init_failed;

  /// No description provided for @camera_init_failed_generic.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize camera'**
  String get camera_init_failed_generic;

  /// No description provided for @position_card.
  ///
  /// In en, this message translates to:
  /// **'Position card within the frame'**
  String get position_card;

  /// No description provided for @card_not_detected.
  ///
  /// In en, this message translates to:
  /// **'Card Not Detected'**
  String get card_not_detected;

  /// No description provided for @card_not_detected_desc.
  ///
  /// In en, this message translates to:
  /// **'Could not detect a card number. Please try again.'**
  String get card_not_detected_desc;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get try_again;

  /// No description provided for @error_processing_image.
  ///
  /// In en, this message translates to:
  /// **'Error processing image'**
  String get error_processing_image;

  /// No description provided for @open_settings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get open_settings;

  /// No description provided for @use_scanned_code.
  ///
  /// In en, this message translates to:
  /// **'Use scanned code'**
  String get use_scanned_code;

  /// No description provided for @enter_manually.
  ///
  /// In en, this message translates to:
  /// **'Enter manually'**
  String get enter_manually;

  /// No description provided for @instruction_digits.
  ///
  /// In en, this message translates to:
  /// **'To start scanning, place the sixteen-digit number inside the yellow box.'**
  String get instruction_digits;

  /// No description provided for @instruction_qr.
  ///
  /// In en, this message translates to:
  /// **'To start scanning, place the QR code inside the yellow box.'**
  String get instruction_qr;

  /// No description provided for @scanner_mode_digits.
  ///
  /// In en, this message translates to:
  /// **'DIGITS'**
  String get scanner_mode_digits;

  /// No description provided for @scanner_mode_qr.
  ///
  /// In en, this message translates to:
  /// **'QR CODE'**
  String get scanner_mode_qr;

  /// No description provided for @voucher_pin_scanner.
  ///
  /// In en, this message translates to:
  /// **'Voucher Pin Scanner'**
  String get voucher_pin_scanner;

  /// No description provided for @zain_cash_recharge_failed.
  ///
  /// In en, this message translates to:
  /// **'Zain Cash Recharge Failed'**
  String get zain_cash_recharge_failed;

  /// No description provided for @transaction_failed.
  ///
  /// In en, this message translates to:
  /// **'Transaction failed'**
  String get transaction_failed;

  /// No description provided for @submit_new_ticket.
  ///
  /// In en, this message translates to:
  /// **'Submit New Ticket'**
  String get submit_new_ticket;

  /// No description provided for @submit_ticket_attachments.
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get submit_ticket_attachments;

  /// No description provided for @submit_ticket_upload_attachment.
  ///
  /// In en, this message translates to:
  /// **'Upload Attachment'**
  String get submit_ticket_upload_attachment;

  /// No description provided for @submit_ticket_upload_files_hint.
  ///
  /// In en, this message translates to:
  /// **'Upload up to {maxFiles} files (PDF, JPG, JPEG, PNG)'**
  String submit_ticket_upload_files_hint(Object maxFiles);

  /// No description provided for @submit_ticket_attachment_invalid_file_type.
  ///
  /// In en, this message translates to:
  /// **'File type not supported. Please upload PDF, JPG, JPEG, or PNG.'**
  String get submit_ticket_attachment_invalid_file_type;

  /// No description provided for @submit_ticket_attachment_duplicate_file.
  ///
  /// In en, this message translates to:
  /// **'This file has already been uploaded.'**
  String get submit_ticket_attachment_duplicate_file;

  /// No description provided for @submit_ticket_attachment_unreadable_file.
  ///
  /// In en, this message translates to:
  /// **'Unable to read file.'**
  String get submit_ticket_attachment_unreadable_file;

  /// No description provided for @submit_ticket_attachment_size_limit_exceeded.
  ///
  /// In en, this message translates to:
  /// **'Total attachment size must be less than {maxSizeMb} MB.'**
  String submit_ticket_attachment_size_limit_exceeded(Object maxSizeMb);

  /// No description provided for @submit_ticket_hint_upload_images.
  ///
  /// In en, this message translates to:
  /// **'Upload up to 3 images (optional)'**
  String get submit_ticket_hint_upload_images;

  /// No description provided for @submit_ticket_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get submit_ticket_description;

  /// No description provided for @submit_ticket_describe_your_issue.
  ///
  /// In en, this message translates to:
  /// **'Describe your issue…'**
  String get submit_ticket_describe_your_issue;

  /// No description provided for @submit_ticket_complaint_type.
  ///
  /// In en, this message translates to:
  /// **'Complaint Type'**
  String get submit_ticket_complaint_type;

  /// No description provided for @submit_ticket_location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get submit_ticket_location;

  /// No description provided for @submit_ticket_governorate.
  ///
  /// In en, this message translates to:
  /// **'Governorate'**
  String get submit_ticket_governorate;

  /// No description provided for @submit_ticket_city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get submit_ticket_city;

  /// No description provided for @submit_ticket_enter_your_answer.
  ///
  /// In en, this message translates to:
  /// **'Enter your answer'**
  String get submit_ticket_enter_your_answer;

  /// No description provided for @submit_ticket_date_future_error.
  ///
  /// In en, this message translates to:
  /// **'Date cannot be in the future'**
  String get submit_ticket_date_future_error;

  /// No description provided for @submit_ticket_time_future_error.
  ///
  /// In en, this message translates to:
  /// **'Invalid time'**
  String get submit_ticket_time_future_error;

  /// No description provided for @submit_ticket_additional_questions.
  ///
  /// In en, this message translates to:
  /// **'Additional Questions'**
  String get submit_ticket_additional_questions;

  /// No description provided for @submit_ticket_success_message.
  ///
  /// In en, this message translates to:
  /// **'Your ticket has been submitted successfully. We will get back to you soon.'**
  String get submit_ticket_success_message;

  /// No description provided for @submit_ticket_select_summary.
  ///
  /// In en, this message translates to:
  /// **'Select summary'**
  String get submit_ticket_select_summary;

  /// No description provided for @submit_ticket_select_option.
  ///
  /// In en, this message translates to:
  /// **'Select an option'**
  String get submit_ticket_select_option;

  /// No description provided for @submit_ticket_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get submit_ticket_summary;

  /// Ticket id with file count
  ///
  /// In en, this message translates to:
  /// **'Ticket #{ticketId} • {count, plural, one{# file} other{# files}}'**
  String submit_ticket_ticket_files_count(Object ticketId, int count);

  /// Shows number of tickets
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{# Ticket} other{# Tickets}}'**
  String ticket_count_label(int count);

  /// Attachment count label
  ///
  /// In en, this message translates to:
  /// **'{count} Attachment(s)'**
  String submit_ticket_attachment_count(Object count);

  /// No description provided for @submit_ticket_no_attachments.
  ///
  /// In en, this message translates to:
  /// **'No attachments'**
  String get submit_ticket_no_attachments;

  /// No description provided for @submit_ticket_answers.
  ///
  /// In en, this message translates to:
  /// **'Answers'**
  String get submit_ticket_answers;

  /// No description provided for @submit_ticket_details.
  ///
  /// In en, this message translates to:
  /// **'Ticket Details'**
  String get submit_ticket_details;

  /// No description provided for @submit_ticket_no_tickets.
  ///
  /// In en, this message translates to:
  /// **'No tickets yet'**
  String get submit_ticket_no_tickets;

  /// No description provided for @submit_ticket_create_hint.
  ///
  /// In en, this message translates to:
  /// **'Submit a new ticket using the button below.'**
  String get submit_ticket_create_hint;

  /// No description provided for @submit_ticket_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get submit_ticket_retry;

  /// No description provided for @submit_ticket_submit_ticket.
  ///
  /// In en, this message translates to:
  /// **'Submit Ticket'**
  String get submit_ticket_submit_ticket;

  /// No description provided for @submit_ticket_my_tickets.
  ///
  /// In en, this message translates to:
  /// **'My Tickets'**
  String get submit_ticket_my_tickets;

  /// No description provided for @submit_ticket_search.
  ///
  /// In en, this message translates to:
  /// **'Search tickets…'**
  String get submit_ticket_search;

  /// No description provided for @submit_ticket_summary_label.
  ///
  /// In en, this message translates to:
  /// **'Summary:'**
  String get submit_ticket_summary_label;

  /// No description provided for @submit_ticket_created.
  ///
  /// In en, this message translates to:
  /// **'Created:'**
  String get submit_ticket_created;

  /// No description provided for @submit_ticket_view_details.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get submit_ticket_view_details;

  /// No description provided for @submit_ticket_reopen.
  ///
  /// In en, this message translates to:
  /// **'Re-open Ticket'**
  String get submit_ticket_reopen;

  /// No description provided for @submit_ticket_reopen_instruction.
  ///
  /// In en, this message translates to:
  /// **'Select a reason and provide additional details.'**
  String get submit_ticket_reopen_instruction;

  /// No description provided for @submit_ticket_reopen_success.
  ///
  /// In en, this message translates to:
  /// **'Success opening ticket'**
  String get submit_ticket_reopen_success;

  /// No description provided for @submit_ticket_additional_details.
  ///
  /// In en, this message translates to:
  /// **'Additional details (optional)'**
  String get submit_ticket_additional_details;

  /// No description provided for @submit_ticket_no_matches.
  ///
  /// In en, this message translates to:
  /// **'No matches found'**
  String get submit_ticket_no_matches;

  /// No description provided for @submit_ticket_no_results_hint.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find any tickets matching your search.'**
  String get submit_ticket_no_results_hint;

  /// No description provided for @submit_ticket_description_hint.
  ///
  /// In en, this message translates to:
  /// **'Describe your issue…'**
  String get submit_ticket_description_hint;

  /// No description provided for @submit_ticket_scan_card.
  ///
  /// In en, this message translates to:
  /// **'Scan Card'**
  String get submit_ticket_scan_card;

  /// No description provided for @submit_ticket_initializing_camera.
  ///
  /// In en, this message translates to:
  /// **'Initializing camera...'**
  String get submit_ticket_initializing_camera;

  /// No description provided for @submit_ticket_camera_no_available.
  ///
  /// In en, this message translates to:
  /// **'No cameras available'**
  String get submit_ticket_camera_no_available;

  /// No description provided for @submit_ticket_camera_permission_required.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required'**
  String get submit_ticket_camera_permission_required;

  /// No description provided for @submit_ticket_camera_permission_settings.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required. Please enable it in Settings.'**
  String get submit_ticket_camera_permission_settings;

  /// No description provided for @submit_ticket_camera_init_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize camera'**
  String get submit_ticket_camera_init_failed;

  /// No description provided for @submit_ticket_camera_init_failed_generic.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize camera'**
  String get submit_ticket_camera_init_failed_generic;

  /// No description provided for @submit_ticket_position_card.
  ///
  /// In en, this message translates to:
  /// **'Position card within the frame'**
  String get submit_ticket_position_card;

  /// No description provided for @submit_ticket_card_not_detected.
  ///
  /// In en, this message translates to:
  /// **'Card Not Detected'**
  String get submit_ticket_card_not_detected;

  /// No description provided for @submit_ticket_card_not_detected_desc.
  ///
  /// In en, this message translates to:
  /// **'Could not detect a card number. Please try again.'**
  String get submit_ticket_card_not_detected_desc;

  /// No description provided for @submit_ticket_try_again.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get submit_ticket_try_again;

  /// No description provided for @submit_ticket_error_processing_image.
  ///
  /// In en, this message translates to:
  /// **'Error processing image'**
  String get submit_ticket_error_processing_image;

  /// No description provided for @submit_ticket_open_settings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get submit_ticket_open_settings;

  /// No description provided for @submit_ticket_use_scanned_code.
  ///
  /// In en, this message translates to:
  /// **'Use scanned code'**
  String get submit_ticket_use_scanned_code;

  /// No description provided for @submit_ticket_enter_manually.
  ///
  /// In en, this message translates to:
  /// **'Enter Manually'**
  String get submit_ticket_enter_manually;

  /// No description provided for @submit_ticket_voucher_pin_scanner.
  ///
  /// In en, this message translates to:
  /// **'Voucher Pin Scanner'**
  String get submit_ticket_voucher_pin_scanner;

  /// No description provided for @submit_ticket_submit_new_ticket.
  ///
  /// In en, this message translates to:
  /// **'Submit New Ticket'**
  String get submit_ticket_submit_new_ticket;

  /// No description provided for @submit_ticket_ticket_submitted.
  ///
  /// In en, this message translates to:
  /// **'Ticket Submitted!'**
  String get submit_ticket_ticket_submitted;

  /// No description provided for @submit_ticket_ticket_number.
  ///
  /// In en, this message translates to:
  /// **'Ticket #{ticketNumber}'**
  String submit_ticket_ticket_number(Object ticketNumber);

  /// No description provided for @submit_ticket_usim_required.
  ///
  /// In en, this message translates to:
  /// **'USIM Required'**
  String get submit_ticket_usim_required;

  /// No description provided for @submit_ticket_usim_required_desc.
  ///
  /// In en, this message translates to:
  /// **'You need USIM to create ticket in \"{summary}\".'**
  String submit_ticket_usim_required_desc(Object summary);

  /// No description provided for @common_item.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get common_item;

  /// No description provided for @enter_card_number.
  ///
  /// In en, this message translates to:
  /// **'Enter card number'**
  String get enter_card_number;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get week;

  /// No description provided for @older.
  ///
  /// In en, this message translates to:
  /// **'Older'**
  String get older;

  /// No description provided for @confirm_delete_title.
  ///
  /// In en, this message translates to:
  /// **'Delete notification?'**
  String get confirm_delete_title;

  /// No description provided for @confirm_delete_description.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. The notification will be permanently removed.'**
  String get confirm_delete_description;

  /// No description provided for @time_just_now.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get time_just_now;

  /// No description provided for @time_minutes_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} minute(s) ago'**
  String time_minutes_ago(int count);

  /// No description provided for @time_hours_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} hour(s) ago'**
  String time_hours_ago(int count);

  /// No description provided for @time_days_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} day(s) ago'**
  String time_days_ago(int count);

  /// No description provided for @time_weeks_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} week(s) ago'**
  String time_weeks_ago(int count);

  /// No description provided for @time_months_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} month(s) ago'**
  String time_months_ago(int count);

  /// No description provided for @time_years_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} year(s) ago'**
  String time_years_ago(int count);

  /// No description provided for @notifications_no_unread.
  ///
  /// In en, this message translates to:
  /// **'No unread notifications'**
  String get notifications_no_unread;

  /// No description provided for @notifications_show_all.
  ///
  /// In en, this message translates to:
  /// **'Show all'**
  String get notifications_show_all;

  /// No description provided for @general_error.
  ///
  /// In en, this message translates to:
  /// **'General error'**
  String get general_error;

  /// No description provided for @common_error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get common_error;

  /// No description provided for @authentication_failed.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed. Please try again.'**
  String get authentication_failed;

  /// No description provided for @failed_to_check_authentication_status.
  ///
  /// In en, this message translates to:
  /// **'Failed to check authentication status'**
  String get failed_to_check_authentication_status;

  /// No description provided for @common_page_not_found_title.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get common_page_not_found_title;

  /// No description provided for @common_page_not_found_description.
  ///
  /// In en, this message translates to:
  /// **'The page you are looking for does not exist.'**
  String get common_page_not_found_description;

  /// No description provided for @common_go_home.
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get common_go_home;

  /// No description provided for @loyalty_statement_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get loyalty_statement_date;

  /// No description provided for @common_not_applicable.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get common_not_applicable;

  /// No description provided for @offers_tab_service_types_joiner.
  ///
  /// In en, this message translates to:
  /// **', and '**
  String get offers_tab_service_types_joiner;

  /// No description provided for @common_no_internet_connection_short.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get common_no_internet_connection_short;

  /// No description provided for @recharge_hyper_pay_no_bridge_response.
  ///
  /// In en, this message translates to:
  /// **'No response from payment service'**
  String get recharge_hyper_pay_no_bridge_response;

  /// No description provided for @recharge_hyper_pay_payment_failed.
  ///
  /// In en, this message translates to:
  /// **'Payment failed'**
  String get recharge_hyper_pay_payment_failed;

  /// No description provided for @recharge_hyper_pay_unknown_response_type.
  ///
  /// In en, this message translates to:
  /// **'Unknown payment response: {responseType}'**
  String recharge_hyper_pay_unknown_response_type(String responseType);

  /// No description provided for @recharge_hyper_pay_platform_error.
  ///
  /// In en, this message translates to:
  /// **'Platform error'**
  String get recharge_hyper_pay_platform_error;

  /// No description provided for @common_unknown_error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get common_unknown_error;

  /// No description provided for @onboarding_stay_connected_across_iraq.
  ///
  /// In en, this message translates to:
  /// **'Stay Connected Across Iraq'**
  String get onboarding_stay_connected_across_iraq;

  /// No description provided for @onboarding_connectivity.
  ///
  /// In en, this message translates to:
  /// **'Connectivity'**
  String get onboarding_connectivity;

  /// No description provided for @onboarding_account_dashboard.
  ///
  /// In en, this message translates to:
  /// **'Account Dashboard'**
  String get onboarding_account_dashboard;

  /// No description provided for @onboarding_everything_in_one_place.
  ///
  /// In en, this message translates to:
  /// **'Everything in One Place'**
  String get onboarding_everything_in_one_place;

  /// No description provided for @onboarding_manage_services_description.
  ///
  /// In en, this message translates to:
  /// **'Manage balance, recharge, subscriptions, internet packages, and usage instantly.'**
  String get onboarding_manage_services_description;

  /// No description provided for @onboarding_loyalty_program.
  ///
  /// In en, this message translates to:
  /// **'Loyalty Program'**
  String get onboarding_loyalty_program;

  /// No description provided for @onboarding_rewards_more.
  ///
  /// In en, this message translates to:
  /// **'Rewards & More'**
  String get onboarding_rewards_more;

  /// No description provided for @onboarding_loyalty_description.
  ///
  /// In en, this message translates to:
  /// **'Unlock exclusive offers, collect rewards, discover entertainment, and enjoy personalized deals.'**
  String get onboarding_loyalty_description;

  /// No description provided for @onboarding_join_zain.
  ///
  /// In en, this message translates to:
  /// **'Join Zain'**
  String get onboarding_join_zain;

  /// No description provided for @onboarding_join_customers.
  ///
  /// In en, this message translates to:
  /// **'Join 20M+ Satisfied Customers'**
  String get onboarding_join_customers;

  /// No description provided for @onboarding_create_account_description.
  ///
  /// In en, this message translates to:
  /// **'Create your account in seconds and start managing your services instantly.'**
  String get onboarding_create_account_description;

  /// No description provided for @imtiyaz_merchant_details_confirm_redeption_popup_title.
  ///
  /// In en, this message translates to:
  /// **'Please Confirm'**
  String get imtiyaz_merchant_details_confirm_redeption_popup_title;

  /// No description provided for @zain_loyalty_promo_codes_redemption_popup_title.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get zain_loyalty_promo_codes_redemption_popup_title;

  /// No description provided for @redeem_offer_confirmation_no_points_message.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reveal the offer for {merchantName}?'**
  String redeem_offer_confirmation_no_points_message(String merchantName);

  /// No description provided for @common_success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get common_success;

  /// No description provided for @ticket_location_picker_selectLocation.
  ///
  /// In en, this message translates to:
  /// **'Select location'**
  String get ticket_location_picker_selectLocation;

  /// No description provided for @ticket_location_picker_readingAddress.
  ///
  /// In en, this message translates to:
  /// **'Reading address…'**
  String get ticket_location_picker_readingAddress;

  /// No description provided for @ticket_location_picker_addressUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Address unavailable for this point'**
  String get ticket_location_picker_addressUnavailable;

  /// No description provided for @submit_ticket_location_pick_prompt.
  ///
  /// In en, this message translates to:
  /// **'We need you to pick the issue location on the map.'**
  String get submit_ticket_location_pick_prompt;

  /// No description provided for @submit_ticket_tap_to_pick_on_map.
  ///
  /// In en, this message translates to:
  /// **'Tap to pick on map'**
  String get submit_ticket_tap_to_pick_on_map;

  /// No description provided for @bundle_sharing_view_users.
  ///
  /// In en, this message translates to:
  /// **'Manage lines'**
  String get bundle_sharing_view_users;

  /// No description provided for @bundle_sharing_offer_management.
  ///
  /// In en, this message translates to:
  /// **'Offer Management'**
  String get bundle_sharing_offer_management;

  /// No description provided for @bundle_sharing_add_user.
  ///
  /// In en, this message translates to:
  /// **'Add Member'**
  String get bundle_sharing_add_user;

  /// No description provided for @bundle_sharing_remaining_out_of_iqd.
  ///
  /// In en, this message translates to:
  /// **'Remaining out of {amount} IQD'**
  String bundle_sharing_remaining_out_of_iqd(String amount);

  /// No description provided for @bundle_sharing_remaining_users.
  ///
  /// In en, this message translates to:
  /// **'You can add a total of {count} members'**
  String bundle_sharing_remaining_users(int count);

  /// No description provided for @bundle_sharing_member_label.
  ///
  /// In en, this message translates to:
  /// **'Member {index}'**
  String bundle_sharing_member_label(int index);

  /// No description provided for @bundle_sharing_valid_till.
  ///
  /// In en, this message translates to:
  /// **'Valid until {date}'**
  String bundle_sharing_valid_till(String date);

  /// No description provided for @bundle_sharing_enter_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Zain number'**
  String get bundle_sharing_enter_number;

  /// No description provided for @bundle_sharing_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get bundle_sharing_confirm;

  /// No description provided for @bundle_sharing_confirm_add_and_assign.
  ///
  /// In en, this message translates to:
  /// **'Add {number} and assign them {amount}?'**
  String bundle_sharing_confirm_add_and_assign(String number, String amount);

  /// No description provided for @bundle_sharing_parent_member.
  ///
  /// In en, this message translates to:
  /// **'You can\'t add your own number'**
  String get bundle_sharing_parent_member;

  /// No description provided for @bundle_sharing_already_member.
  ///
  /// In en, this message translates to:
  /// **'This number is already a member'**
  String get bundle_sharing_already_member;

  /// No description provided for @bundle_sharing_user_not_on_kafoo.
  ///
  /// In en, this message translates to:
  /// **'User not on Kafoo'**
  String get bundle_sharing_user_not_on_kafoo;

  /// No description provided for @bundle_sharing_user_not_on_kafoo_message.
  ///
  /// In en, this message translates to:
  /// **'{number} is not a Kafoo member yet. Invite them to migrate.'**
  String bundle_sharing_user_not_on_kafoo_message(String number);

  /// No description provided for @bundle_sharing_invite_to_kafoo.
  ///
  /// In en, this message translates to:
  /// **'Invite to Kafoo'**
  String get bundle_sharing_invite_to_kafoo;

  /// No description provided for @bundle_sharing_invite_success.
  ///
  /// In en, this message translates to:
  /// **'Invitation sent'**
  String get bundle_sharing_invite_success;

  /// No description provided for @bundle_sharing_invite_success_message.
  ///
  /// In en, this message translates to:
  /// **'We\'ve invited {number}. You can add them once they migrate to Kafoo.'**
  String bundle_sharing_invite_success_message(String number);

  /// No description provided for @bundle_sharing_ineligible_number_title.
  ///
  /// In en, this message translates to:
  /// **'Ineligible number'**
  String get bundle_sharing_ineligible_number_title;

  /// No description provided for @bundle_sharing_ineligible_number_message.
  ///
  /// In en, this message translates to:
  /// **'This number can\'t be added to your family bundle.'**
  String get bundle_sharing_ineligible_number_message;

  /// No description provided for @bundle_sharing_add_success.
  ///
  /// In en, this message translates to:
  /// **'{amount} shared with the member'**
  String bundle_sharing_add_success(String amount);

  /// No description provided for @bundle_sharing_quota.
  ///
  /// In en, this message translates to:
  /// **'Sharing Credit'**
  String get bundle_sharing_quota;

  /// No description provided for @bundle_sharing_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get bundle_sharing_back;

  /// No description provided for @bundle_sharing_confirm_remove_member.
  ///
  /// In en, this message translates to:
  /// **'Remove {number} from your family bundle?'**
  String bundle_sharing_confirm_remove_member(String number);

  /// No description provided for @bundle_sharing_remove_success.
  ///
  /// In en, this message translates to:
  /// **'Member removed'**
  String get bundle_sharing_remove_success;

  /// No description provided for @bundle_sharing_change_quota.
  ///
  /// In en, this message translates to:
  /// **'Manage Sharing Quota'**
  String get bundle_sharing_change_quota;

  /// No description provided for @bundle_sharing_save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get bundle_sharing_save_changes;

  /// No description provided for @bundle_sharing_confirm_quota_changes_message.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to add additional shared credit with {number} for {amount}?'**
  String bundle_sharing_confirm_quota_changes_message(
    String number,
    String amount,
  );

  /// No description provided for @send_a_gift.
  ///
  /// In en, this message translates to:
  /// **'Send a Gift'**
  String get send_a_gift;

  /// No description provided for @choose_preferred_language.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language to continue'**
  String get choose_preferred_language;

  /// No description provided for @language_save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get language_save_changes;

  /// No description provided for @bundle_validity_days.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =0 {0 Days} =1 {1 Day} other {{days} Days}}'**
  String bundle_validity_days(int days);

  /// No description provided for @welcome_tagline.
  ///
  /// In en, this message translates to:
  /// **'A safe space to be lighter'**
  String get welcome_tagline;

  /// No description provided for @welcome_need_someone_to_talk_to.
  ///
  /// In en, this message translates to:
  /// **'I need someone to talk to'**
  String get welcome_need_someone_to_talk_to;

  /// No description provided for @welcome_want_to_be_listener.
  ///
  /// In en, this message translates to:
  /// **'I want to be a listener'**
  String get welcome_want_to_be_listener;

  /// No description provided for @welcome_already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get welcome_already_have_account;

  /// No description provided for @welcome_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get welcome_sign_in;

  /// No description provided for @onboarding_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboarding_skip;

  /// No description provided for @onboarding_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboarding_next;

  /// No description provided for @onboarding_page1_title.
  ///
  /// In en, this message translates to:
  /// **'venting'**
  String get onboarding_page1_title;

  /// No description provided for @onboarding_page1_tagline.
  ///
  /// In en, this message translates to:
  /// **'BE HEARD. FEEL BETTER.'**
  String get onboarding_page1_tagline;

  /// No description provided for @onboarding_page1_description.
  ///
  /// In en, this message translates to:
  /// **'A safe place to share your thoughts and feel understood.'**
  String get onboarding_page1_description;

  /// No description provided for @onboarding_page2_title.
  ///
  /// In en, this message translates to:
  /// **'Talk Freely. We\'re Here to Listen.'**
  String get onboarding_page2_title;

  /// No description provided for @onboarding_page2_description.
  ///
  /// In en, this message translates to:
  /// **'Connect with compassionate listeners who truly care.'**
  String get onboarding_page2_description;

  /// No description provided for @onboarding_page3_title.
  ///
  /// In en, this message translates to:
  /// **'Your Privacy Comes First'**
  String get onboarding_page3_title;

  /// No description provided for @onboarding_page3_description.
  ///
  /// In en, this message translates to:
  /// **'Your conversations are private and secure. You stay in control.'**
  String get onboarding_page3_description;

  /// No description provided for @onboarding_page4_title.
  ///
  /// In en, this message translates to:
  /// **'Invite Friends. Earn Rewards.'**
  String get onboarding_page4_title;

  /// No description provided for @onboarding_page4_description.
  ///
  /// In en, this message translates to:
  /// **'Invite your friends and earn points, discounts, and exclusive perks.'**
  String get onboarding_page4_description;

  /// No description provided for @onboarding_page5_title.
  ///
  /// In en, this message translates to:
  /// **'A Community That Cares'**
  String get onboarding_page5_title;

  /// No description provided for @onboarding_page5_description.
  ///
  /// In en, this message translates to:
  /// **'You\'re not alone. Join a community that listens and supports.'**
  String get onboarding_page5_description;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get change_language;

  /// No description provided for @ventor_onboarding_page1_title.
  ///
  /// In en, this message translates to:
  /// **'A Safe Place to Be Heard'**
  String get ventor_onboarding_page1_title;

  /// No description provided for @ventor_onboarding_page1_description.
  ///
  /// In en, this message translates to:
  /// **'Sometimes all you need is someone who listens.'**
  String get ventor_onboarding_page1_description;

  /// No description provided for @ventor_onboarding_page2_title.
  ///
  /// In en, this message translates to:
  /// **'Express Yourself'**
  String get ventor_onboarding_page2_title;

  /// No description provided for @ventor_onboarding_page2_description.
  ///
  /// In en, this message translates to:
  /// **'Talk freely with verified listeners in a private and judgment-free environment.'**
  String get ventor_onboarding_page2_description;

  /// No description provided for @ventor_onboarding_page3_title.
  ///
  /// In en, this message translates to:
  /// **'Find the Right Listener'**
  String get ventor_onboarding_page3_title;

  /// No description provided for @ventor_onboarding_page3_description.
  ///
  /// In en, this message translates to:
  /// **'Choose a listener based on language, expertise, personality, reviews, and voice introduction.'**
  String get ventor_onboarding_page3_description;

  /// No description provided for @ventor_onboarding_page4_title.
  ///
  /// In en, this message translates to:
  /// **'Your Privacy Comes First'**
  String get ventor_onboarding_page4_title;

  /// No description provided for @ventor_onboarding_page4_description.
  ///
  /// In en, this message translates to:
  /// **'Stay anonymous. You decide what to share. Every conversation is private.'**
  String get ventor_onboarding_page4_description;

  /// No description provided for @listener_onboarding_page1_title.
  ///
  /// In en, this message translates to:
  /// **'Be the Listener Someone Needs'**
  String get listener_onboarding_page1_title;

  /// No description provided for @listener_onboarding_page1_description.
  ///
  /// In en, this message translates to:
  /// **'Your empathy can help someone feel lighter, heard, and less alone.'**
  String get listener_onboarding_page1_description;

  /// No description provided for @listener_onboarding_page2_title.
  ///
  /// In en, this message translates to:
  /// **'Listen with Compassion'**
  String get listener_onboarding_page2_title;

  /// No description provided for @listener_onboarding_page2_description.
  ///
  /// In en, this message translates to:
  /// **'Support people through tough moments in a private, judgment-free space.'**
  String get listener_onboarding_page2_description;

  /// No description provided for @listener_onboarding_page3_title.
  ///
  /// In en, this message translates to:
  /// **'Build Your Listener Profile'**
  String get listener_onboarding_page3_title;

  /// No description provided for @listener_onboarding_page3_description.
  ///
  /// In en, this message translates to:
  /// **'Share your languages, expertise, personality, and a voice introduction.'**
  String get listener_onboarding_page3_description;

  /// No description provided for @listener_onboarding_page4_title.
  ///
  /// In en, this message translates to:
  /// **'Support on Your Schedule'**
  String get listener_onboarding_page4_title;

  /// No description provided for @listener_onboarding_page4_description.
  ///
  /// In en, this message translates to:
  /// **'Choose when you\'re available and make a difference whenever it works for you.'**
  String get listener_onboarding_page4_description;

  /// No description provided for @sign_up_lets_get_started.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get Started'**
  String get sign_up_lets_get_started;

  /// No description provided for @sign_up_create_account_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account to begin your journey.'**
  String get sign_up_create_account_subtitle;

  /// No description provided for @auth_register_ventor_title.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get Started'**
  String get auth_register_ventor_title;

  /// No description provided for @auth_register_ventor_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account to start talking and feel heard.'**
  String get auth_register_ventor_subtitle;

  /// No description provided for @auth_register_listener_title.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get Started'**
  String get auth_register_listener_title;

  /// No description provided for @auth_register_listener_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account to start listening and supporting others.'**
  String get auth_register_listener_subtitle;

  /// No description provided for @sign_in_welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get sign_in_welcome_back;

  /// No description provided for @sign_in_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue your journey.'**
  String get sign_in_subtitle;

  /// No description provided for @sign_in_dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get sign_in_dont_have_account;

  /// No description provided for @sign_in_sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_in_sign_up;

  /// No description provided for @sign_up_continue_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get sign_up_continue_with_apple;

  /// No description provided for @sign_up_continue_with_google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get sign_up_continue_with_google;

  /// No description provided for @sign_up_continue_with_email.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get sign_up_continue_with_email;

  /// No description provided for @sign_in_continue_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get sign_in_continue_with_apple;

  /// No description provided for @sign_in_continue_with_google.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get sign_in_continue_with_google;

  /// No description provided for @sign_in_continue_with_email.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Email'**
  String get sign_in_continue_with_email;

  /// No description provided for @sign_up_or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get sign_up_or;

  /// No description provided for @email_registration_title.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get email_registration_title;

  /// No description provided for @email_registration_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter your details to create your account.'**
  String get email_registration_subtitle;

  /// No description provided for @email_registration_ventor_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your details to create your ventor account.'**
  String get email_registration_ventor_subtitle;

  /// No description provided for @email_registration_listener_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your details to create your listener account.'**
  String get email_registration_listener_subtitle;

  /// No description provided for @email_sign_in_title.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Email'**
  String get email_sign_in_title;

  /// No description provided for @email_sign_in_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and password to continue.'**
  String get email_sign_in_subtitle;

  /// No description provided for @email_registration_email_label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email_registration_email_label;

  /// No description provided for @email_registration_email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get email_registration_email_hint;

  /// No description provided for @email_registration_password_label.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get email_registration_password_label;

  /// No description provided for @email_registration_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Create a password'**
  String get email_registration_password_hint;

  /// No description provided for @email_sign_in_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get email_sign_in_password_hint;

  /// No description provided for @email_registration_password_must_contain.
  ///
  /// In en, this message translates to:
  /// **'Password must contain:'**
  String get email_registration_password_must_contain;

  /// No description provided for @email_registration_rule_min_length.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get email_registration_rule_min_length;

  /// No description provided for @email_registration_rule_uppercase.
  ///
  /// In en, this message translates to:
  /// **'One uppercase letter'**
  String get email_registration_rule_uppercase;

  /// No description provided for @email_registration_rule_number.
  ///
  /// In en, this message translates to:
  /// **'One number'**
  String get email_registration_rule_number;

  /// No description provided for @email_registration_create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get email_registration_create_account;

  /// No description provided for @email_sign_in_button.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get email_sign_in_button;

  /// No description provided for @email_registration_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get email_registration_invalid_email;

  /// No description provided for @account_created_title.
  ///
  /// In en, this message translates to:
  /// **'Account Created!'**
  String get account_created_title;

  /// No description provided for @account_created_subtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a verification link to your email address.'**
  String get account_created_subtitle;

  /// No description provided for @account_created_check_email.
  ///
  /// In en, this message translates to:
  /// **'Check Your Email'**
  String get account_created_check_email;

  /// No description provided for @account_created_resend_email.
  ///
  /// In en, this message translates to:
  /// **'Resend Email'**
  String get account_created_resend_email;

  /// No description provided for @account_created_resend_email_countdown.
  ///
  /// In en, this message translates to:
  /// **'Resend Email ({time})'**
  String account_created_resend_email_countdown(String time);

  /// No description provided for @listener_reg_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get listener_reg_continue;

  /// No description provided for @listener_reg_skip_for_now.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get listener_reg_skip_for_now;

  /// No description provided for @listener_reg_step_of.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String listener_reg_step_of(int current, int total);

  /// No description provided for @listener_reg_steps_remaining.
  ///
  /// In en, this message translates to:
  /// **'{count} steps remaining'**
  String listener_reg_steps_remaining(int count);

  /// No description provided for @listener_reg_last_step.
  ///
  /// In en, this message translates to:
  /// **'Last step'**
  String get listener_reg_last_step;

  /// No description provided for @listener_reg_step1_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome! Let\'s get you started'**
  String get listener_reg_step1_title;

  /// No description provided for @listener_reg_step1_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account to begin your journey as a listener.'**
  String get listener_reg_step1_subtitle;

  /// No description provided for @listener_reg_add_profile_photo.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get listener_reg_add_profile_photo;

  /// No description provided for @listener_reg_change_profile_photo.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get listener_reg_change_profile_photo;

  /// No description provided for @listener_reg_profile_photo_required.
  ///
  /// In en, this message translates to:
  /// **'Please add a profile photo'**
  String get listener_reg_profile_photo_required;

  /// No description provided for @listener_reg_full_name.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get listener_reg_full_name;

  /// No description provided for @listener_reg_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get listener_reg_email;

  /// No description provided for @listener_reg_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get listener_reg_phone;

  /// No description provided for @listener_reg_invalid_phone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number for the selected country'**
  String get listener_reg_invalid_phone;

  /// No description provided for @listener_reg_select_country.
  ///
  /// In en, this message translates to:
  /// **'Select country'**
  String get listener_reg_select_country;

  /// No description provided for @listener_reg_search_country.
  ///
  /// In en, this message translates to:
  /// **'Search by country or code'**
  String get listener_reg_search_country;

  /// No description provided for @listener_reg_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get listener_reg_password;

  /// No description provided for @listener_reg_agree_prefix.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get listener_reg_agree_prefix;

  /// No description provided for @listener_reg_terms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get listener_reg_terms;

  /// No description provided for @listener_reg_agree_and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get listener_reg_agree_and;

  /// No description provided for @listener_reg_privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get listener_reg_privacy;

  /// No description provided for @listener_reg_already_have.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get listener_reg_already_have;

  /// No description provided for @listener_reg_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get listener_reg_sign_in;

  /// No description provided for @listener_reg_step_coming_soon.
  ///
  /// In en, this message translates to:
  /// **'This step is coming next. Continue to preview the flow.'**
  String get listener_reg_step_coming_soon;

  /// No description provided for @listener_reg_step_create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get listener_reg_step_create_account;

  /// No description provided for @listener_reg_step_verify_email.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get listener_reg_step_verify_email;

  /// No description provided for @listener_reg_step_profile_photo.
  ///
  /// In en, this message translates to:
  /// **'Profile Photo'**
  String get listener_reg_step_profile_photo;

  /// No description provided for @listener_reg_step_boundaries.
  ///
  /// In en, this message translates to:
  /// **'Things You Don\'t Want'**
  String get listener_reg_step_boundaries;

  /// No description provided for @listener_reg_boundaries_title.
  ///
  /// In en, this message translates to:
  /// **'Set your boundaries'**
  String get listener_reg_boundaries_title;

  /// No description provided for @listener_reg_boundaries_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Topics you don\'t want to discuss. We will respect your choice.'**
  String get listener_reg_boundaries_subtitle;

  /// No description provided for @listener_reg_boundary_suicide.
  ///
  /// In en, this message translates to:
  /// **'Suicide or self-harm'**
  String get listener_reg_boundary_suicide;

  /// No description provided for @listener_reg_boundary_domestic_violence.
  ///
  /// In en, this message translates to:
  /// **'Domestic violence'**
  String get listener_reg_boundary_domestic_violence;

  /// No description provided for @listener_reg_boundary_sexual.
  ///
  /// In en, this message translates to:
  /// **'Sexual topics'**
  String get listener_reg_boundary_sexual;

  /// No description provided for @listener_reg_boundary_addiction.
  ///
  /// In en, this message translates to:
  /// **'Addiction'**
  String get listener_reg_boundary_addiction;

  /// No description provided for @listener_reg_boundary_politics.
  ///
  /// In en, this message translates to:
  /// **'Politics'**
  String get listener_reg_boundary_politics;

  /// No description provided for @listener_reg_boundary_religion.
  ///
  /// In en, this message translates to:
  /// **'Religion'**
  String get listener_reg_boundary_religion;

  /// No description provided for @listener_reg_boundary_illegal.
  ///
  /// In en, this message translates to:
  /// **'Illegal activities'**
  String get listener_reg_boundary_illegal;

  /// No description provided for @listener_reg_boundary_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get listener_reg_boundary_other;

  /// No description provided for @listener_reg_step_about_you.
  ///
  /// In en, this message translates to:
  /// **'About You'**
  String get listener_reg_step_about_you;

  /// No description provided for @listener_reg_about_title.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself'**
  String get listener_reg_about_title;

  /// No description provided for @listener_reg_about_subtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps us match you with the right conversations.'**
  String get listener_reg_about_subtitle;

  /// No description provided for @listener_reg_date_of_birth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get listener_reg_date_of_birth;

  /// No description provided for @listener_reg_select_date.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get listener_reg_select_date;

  /// No description provided for @listener_reg_country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get listener_reg_country;

  /// No description provided for @listener_reg_city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get listener_reg_city;

  /// No description provided for @listener_reg_enter_city.
  ///
  /// In en, this message translates to:
  /// **'Enter your city'**
  String get listener_reg_enter_city;

  /// No description provided for @listener_reg_select_city.
  ///
  /// In en, this message translates to:
  /// **'Select city'**
  String get listener_reg_select_city;

  /// No description provided for @listener_reg_search_city.
  ///
  /// In en, this message translates to:
  /// **'Search or type a city'**
  String get listener_reg_search_city;

  /// No description provided for @listener_reg_type_city.
  ///
  /// In en, this message translates to:
  /// **'Type your city name above to continue.'**
  String get listener_reg_type_city;

  /// No description provided for @listener_reg_use_city.
  ///
  /// In en, this message translates to:
  /// **'Use \"{city}\"'**
  String listener_reg_use_city(String city);

  /// No description provided for @listener_reg_languages_you_speak.
  ///
  /// In en, this message translates to:
  /// **'Languages you speak'**
  String get listener_reg_languages_you_speak;

  /// No description provided for @listener_reg_select_languages.
  ///
  /// In en, this message translates to:
  /// **'Select languages'**
  String get listener_reg_select_languages;

  /// No description provided for @listener_reg_search_language.
  ///
  /// In en, this message translates to:
  /// **'Search languages'**
  String get listener_reg_search_language;

  /// No description provided for @listener_reg_done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get listener_reg_done;

  /// No description provided for @listener_reg_step_languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get listener_reg_step_languages;

  /// No description provided for @listener_reg_step_expertise.
  ///
  /// In en, this message translates to:
  /// **'Areas You\'re Comfortable With'**
  String get listener_reg_step_expertise;

  /// No description provided for @listener_reg_areas_title.
  ///
  /// In en, this message translates to:
  /// **'What would you like to listen to?'**
  String get listener_reg_areas_title;

  /// No description provided for @listener_reg_areas_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the topics you feel comfortable supporting others with.'**
  String get listener_reg_areas_subtitle;

  /// No description provided for @listener_reg_area_relationships.
  ///
  /// In en, this message translates to:
  /// **'Relationships'**
  String get listener_reg_area_relationships;

  /// No description provided for @listener_reg_area_marriage.
  ///
  /// In en, this message translates to:
  /// **'Marriage'**
  String get listener_reg_area_marriage;

  /// No description provided for @listener_reg_area_parenting.
  ///
  /// In en, this message translates to:
  /// **'Parenting'**
  String get listener_reg_area_parenting;

  /// No description provided for @listener_reg_area_career_work.
  ///
  /// In en, this message translates to:
  /// **'Career & Work'**
  String get listener_reg_area_career_work;

  /// No description provided for @listener_reg_area_stress_anxiety.
  ///
  /// In en, this message translates to:
  /// **'Stress & Anxiety'**
  String get listener_reg_area_stress_anxiety;

  /// No description provided for @listener_reg_area_loneliness.
  ///
  /// In en, this message translates to:
  /// **'Loneliness'**
  String get listener_reg_area_loneliness;

  /// No description provided for @listener_reg_area_student_life.
  ///
  /// In en, this message translates to:
  /// **'Student Life'**
  String get listener_reg_area_student_life;

  /// No description provided for @listener_reg_area_financial_stress.
  ///
  /// In en, this message translates to:
  /// **'Financial Stress'**
  String get listener_reg_area_financial_stress;

  /// No description provided for @listener_reg_area_health_wellness.
  ///
  /// In en, this message translates to:
  /// **'Health & Wellness'**
  String get listener_reg_area_health_wellness;

  /// No description provided for @listener_reg_area_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get listener_reg_area_other;

  /// No description provided for @listener_reg_step_voice_intro.
  ///
  /// In en, this message translates to:
  /// **'Voice Introduction'**
  String get listener_reg_step_voice_intro;

  /// No description provided for @listener_reg_voice_title.
  ///
  /// In en, this message translates to:
  /// **'Record a short introduction'**
  String get listener_reg_voice_title;

  /// No description provided for @listener_reg_voice_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Introduce yourself so users can get to know you.'**
  String get listener_reg_voice_subtitle;

  /// No description provided for @listener_reg_voice_speak_hint.
  ///
  /// In en, this message translates to:
  /// **'Speak for about 60 seconds'**
  String get listener_reg_voice_speak_hint;

  /// No description provided for @listener_reg_voice_record.
  ///
  /// In en, this message translates to:
  /// **'Record'**
  String get listener_reg_voice_record;

  /// No description provided for @listener_reg_voice_stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get listener_reg_voice_stop;

  /// No description provided for @listener_reg_voice_play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get listener_reg_voice_play;

  /// No description provided for @listener_reg_voice_tip.
  ///
  /// In en, this message translates to:
  /// **'Tip: Be natural, kind, and authentic.'**
  String get listener_reg_voice_tip;

  /// No description provided for @listener_reg_voice_tips_title.
  ///
  /// In en, this message translates to:
  /// **'Recording Tips'**
  String get listener_reg_voice_tips_title;

  /// No description provided for @listener_reg_voice_tip_1.
  ///
  /// In en, this message translates to:
  /// **'Speak naturally.'**
  String get listener_reg_voice_tip_1;

  /// No description provided for @listener_reg_voice_tip_2.
  ///
  /// In en, this message translates to:
  /// **'Smile while speaking—it changes your tone.'**
  String get listener_reg_voice_tip_2;

  /// No description provided for @listener_reg_voice_tip_3.
  ///
  /// In en, this message translates to:
  /// **'Don\'t rush.'**
  String get listener_reg_voice_tip_3;

  /// No description provided for @listener_reg_voice_tip_4.
  ///
  /// In en, this message translates to:
  /// **'Avoid reading like a robot.'**
  String get listener_reg_voice_tip_4;

  /// No description provided for @listener_reg_voice_tip_5.
  ///
  /// In en, this message translates to:
  /// **'Keep it between 45 and 60 seconds.'**
  String get listener_reg_voice_tip_5;

  /// No description provided for @listener_reg_voice_tip_6.
  ///
  /// In en, this message translates to:
  /// **'Record in a quiet place.'**
  String get listener_reg_voice_tip_6;

  /// No description provided for @listener_reg_voice_example_title.
  ///
  /// In en, this message translates to:
  /// **'You may use the following structure:'**
  String get listener_reg_voice_example_title;

  /// No description provided for @listener_reg_voice_example_body.
  ///
  /// In en, this message translates to:
  /// **'Hello! My name is [Display Name].\n\nThank you for taking a moment to listen to my introduction.\n\nI\'m here because I genuinely enjoy listening to people and creating a safe, judgment-free space where you can express yourself openly.\n\nWhether you\'re feeling stressed, overwhelmed, lonely, or simply need someone to talk to, I\'m here to listen with empathy and respect.\n\nYou don\'t need to prepare anything before our conversation. Just come as you are, and we\'ll take it one step at a time.\n\nIf you think we\'d be a good match, I\'d be happy to talk with you.\n\nI look forward to meeting you, and I hope you have a wonderful day.'**
  String get listener_reg_voice_example_body;

  /// No description provided for @listener_reg_voice_mic_permission.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is required to record your introduction.'**
  String get listener_reg_voice_mic_permission;

  /// No description provided for @listener_reg_voice_mic_permission_settings.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is required. Please enable it in Settings.'**
  String get listener_reg_voice_mic_permission_settings;

  /// No description provided for @listener_reg_voice_record_failed.
  ///
  /// In en, this message translates to:
  /// **'Could not start recording. Please try again.'**
  String get listener_reg_voice_record_failed;

  /// No description provided for @listener_reg_voice_plugin_restart.
  ///
  /// In en, this message translates to:
  /// **'Recording plugin is not ready. Fully stop the app and run it again (hot restart is not enough).'**
  String get listener_reg_voice_plugin_restart;

  /// No description provided for @listener_reg_step_availability.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get listener_reg_step_availability;

  /// No description provided for @listener_reg_avail_title.
  ///
  /// In en, this message translates to:
  /// **'Set your availability'**
  String get listener_reg_avail_title;

  /// No description provided for @listener_reg_avail_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose when you are usually available to talk.'**
  String get listener_reg_avail_subtitle;

  /// No description provided for @listener_reg_avail_timezone.
  ///
  /// In en, this message translates to:
  /// **'Time zone'**
  String get listener_reg_avail_timezone;

  /// No description provided for @listener_reg_avail_search_timezone.
  ///
  /// In en, this message translates to:
  /// **'Search time zones'**
  String get listener_reg_avail_search_timezone;

  /// No description provided for @listener_reg_avail_weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly availability'**
  String get listener_reg_avail_weekly;

  /// No description provided for @listener_reg_avail_hours.
  ///
  /// In en, this message translates to:
  /// **'Available hours'**
  String get listener_reg_avail_hours;

  /// No description provided for @listener_reg_avail_from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get listener_reg_avail_from;

  /// No description provided for @listener_reg_avail_to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get listener_reg_avail_to;

  /// No description provided for @listener_reg_avail_instant_call.
  ///
  /// In en, this message translates to:
  /// **'Accept instant call'**
  String get listener_reg_avail_instant_call;

  /// No description provided for @listener_reg_avail_instant_call_hint.
  ///
  /// In en, this message translates to:
  /// **'Instant calls can help you earn more income.'**
  String get listener_reg_avail_instant_call_hint;

  /// No description provided for @listener_reg_avail_session_length.
  ///
  /// In en, this message translates to:
  /// **'Session length'**
  String get listener_reg_avail_session_length;

  /// No description provided for @listener_reg_avail_session_min.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String listener_reg_avail_session_min(int minutes);

  /// No description provided for @listener_reg_avail_day_mon.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get listener_reg_avail_day_mon;

  /// No description provided for @listener_reg_avail_day_tue.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get listener_reg_avail_day_tue;

  /// No description provided for @listener_reg_avail_day_wed.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get listener_reg_avail_day_wed;

  /// No description provided for @listener_reg_avail_day_thu.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get listener_reg_avail_day_thu;

  /// No description provided for @listener_reg_avail_day_fri.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get listener_reg_avail_day_fri;

  /// No description provided for @listener_reg_avail_day_sat.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get listener_reg_avail_day_sat;

  /// No description provided for @listener_reg_avail_day_sun.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get listener_reg_avail_day_sun;

  /// No description provided for @listener_reg_step_experience.
  ///
  /// In en, this message translates to:
  /// **'Life Experience'**
  String get listener_reg_step_experience;

  /// No description provided for @listener_reg_experience_title.
  ///
  /// In en, this message translates to:
  /// **'Share your life experiences'**
  String get listener_reg_experience_title;

  /// No description provided for @listener_reg_experience_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Select what applies to you. This helps people find someone who understands.'**
  String get listener_reg_experience_subtitle;

  /// No description provided for @listener_reg_exp_section_relationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get listener_reg_exp_section_relationship;

  /// No description provided for @listener_reg_exp_section_family.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get listener_reg_exp_section_family;

  /// No description provided for @listener_reg_exp_section_experiences.
  ///
  /// In en, this message translates to:
  /// **'Experiences (select all that apply)'**
  String get listener_reg_exp_section_experiences;

  /// No description provided for @listener_reg_exp_single.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get listener_reg_exp_single;

  /// No description provided for @listener_reg_exp_in_relationship.
  ///
  /// In en, this message translates to:
  /// **'In a relationship'**
  String get listener_reg_exp_in_relationship;

  /// No description provided for @listener_reg_exp_married.
  ///
  /// In en, this message translates to:
  /// **'Married'**
  String get listener_reg_exp_married;

  /// No description provided for @listener_reg_exp_divorced.
  ///
  /// In en, this message translates to:
  /// **'Divorced'**
  String get listener_reg_exp_divorced;

  /// No description provided for @listener_reg_exp_widowed.
  ///
  /// In en, this message translates to:
  /// **'Widowed'**
  String get listener_reg_exp_widowed;

  /// No description provided for @listener_reg_exp_parent.
  ///
  /// In en, this message translates to:
  /// **'Parent'**
  String get listener_reg_exp_parent;

  /// No description provided for @listener_reg_exp_single_parent.
  ///
  /// In en, this message translates to:
  /// **'Single parent'**
  String get listener_reg_exp_single_parent;

  /// No description provided for @listener_reg_exp_caregiver.
  ///
  /// In en, this message translates to:
  /// **'Caregiver'**
  String get listener_reg_exp_caregiver;

  /// No description provided for @listener_reg_exp_career_change.
  ///
  /// In en, this message translates to:
  /// **'Career change'**
  String get listener_reg_exp_career_change;

  /// No description provided for @listener_reg_exp_job_loss.
  ///
  /// In en, this message translates to:
  /// **'Job loss'**
  String get listener_reg_exp_job_loss;

  /// No description provided for @listener_reg_exp_startup_founder.
  ///
  /// In en, this message translates to:
  /// **'Startup founder'**
  String get listener_reg_exp_startup_founder;

  /// No description provided for @listener_reg_exp_financial_struggle.
  ///
  /// In en, this message translates to:
  /// **'Financial struggle'**
  String get listener_reg_exp_financial_struggle;

  /// No description provided for @listener_reg_exp_life_stages.
  ///
  /// In en, this message translates to:
  /// **'Life stages'**
  String get listener_reg_exp_life_stages;

  /// No description provided for @listener_reg_exp_grief_loss.
  ///
  /// In en, this message translates to:
  /// **'Grief / Loss'**
  String get listener_reg_exp_grief_loss;

  /// No description provided for @listener_reg_exp_anxiety_stress.
  ///
  /// In en, this message translates to:
  /// **'Anxiety / Stress'**
  String get listener_reg_exp_anxiety_stress;

  /// No description provided for @listener_reg_exp_health_challenge.
  ///
  /// In en, this message translates to:
  /// **'Health challenge'**
  String get listener_reg_exp_health_challenge;

  /// No description provided for @listener_reg_exp_addiction_recovery.
  ///
  /// In en, this message translates to:
  /// **'Addiction recovery'**
  String get listener_reg_exp_addiction_recovery;

  /// No description provided for @listener_reg_exp_add_more.
  ///
  /// In en, this message translates to:
  /// **'Add more'**
  String get listener_reg_exp_add_more;

  /// No description provided for @listener_reg_add_experience_title.
  ///
  /// In en, this message translates to:
  /// **'Add experience'**
  String get listener_reg_add_experience_title;

  /// No description provided for @listener_reg_add_experience_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter an experience'**
  String get listener_reg_add_experience_hint;

  /// No description provided for @listener_reg_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get listener_reg_add;

  /// No description provided for @listener_reg_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get listener_reg_cancel;

  /// No description provided for @listener_reg_step_guidelines.
  ///
  /// In en, this message translates to:
  /// **'Community Guidelines'**
  String get listener_reg_step_guidelines;

  /// No description provided for @listener_reg_step_identity.
  ///
  /// In en, this message translates to:
  /// **'Identity Verification'**
  String get listener_reg_step_identity;

  /// No description provided for @listener_reg_identity_title.
  ///
  /// In en, this message translates to:
  /// **'Verify your identity'**
  String get listener_reg_identity_title;

  /// No description provided for @listener_reg_identity_subtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps us keep our community safe and trusted.'**
  String get listener_reg_identity_subtitle;

  /// No description provided for @listener_reg_identity_upload_id_title.
  ///
  /// In en, this message translates to:
  /// **'Upload Government ID'**
  String get listener_reg_identity_upload_id_title;

  /// No description provided for @listener_reg_identity_upload_id_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Passport, Driver\'s License or National ID.'**
  String get listener_reg_identity_upload_id_subtitle;

  /// No description provided for @listener_reg_identity_selfie_title.
  ///
  /// In en, this message translates to:
  /// **'Take a selfie'**
  String get listener_reg_identity_selfie_title;

  /// No description provided for @listener_reg_identity_selfie_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Make sure your face is clearly visible'**
  String get listener_reg_identity_selfie_subtitle;

  /// No description provided for @listener_reg_identity_liveness_title.
  ///
  /// In en, this message translates to:
  /// **'Liveness check'**
  String get listener_reg_identity_liveness_title;

  /// No description provided for @listener_reg_identity_liveness_subtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ll ask you to move your head slightly'**
  String get listener_reg_identity_liveness_subtitle;

  /// No description provided for @listener_reg_identity_start.
  ///
  /// In en, this message translates to:
  /// **'Start Verification'**
  String get listener_reg_identity_start;

  /// No description provided for @listener_reg_identity_secure_note.
  ///
  /// In en, this message translates to:
  /// **'Your data is encrypted and secure'**
  String get listener_reg_identity_secure_note;

  /// No description provided for @listener_reg_step_review_submit.
  ///
  /// In en, this message translates to:
  /// **'Review & Submit'**
  String get listener_reg_step_review_submit;

  /// No description provided for @listener_profile_under_review_title.
  ///
  /// In en, this message translates to:
  /// **'Your profile is under review'**
  String get listener_profile_under_review_title;

  /// No description provided for @listener_profile_under_review_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Our team is reviewing your information to ensure a safe and trusted community.'**
  String get listener_profile_under_review_subtitle;

  /// No description provided for @listener_profile_review_time_title.
  ///
  /// In en, this message translates to:
  /// **'Review time'**
  String get listener_profile_review_time_title;

  /// No description provided for @listener_profile_review_time_body.
  ///
  /// In en, this message translates to:
  /// **'It usually takes 2–3 working days. We\'ll notify you as soon as there\'s an update.'**
  String get listener_profile_review_time_body;

  /// No description provided for @listener_profile_got_it.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get listener_profile_got_it;

  /// No description provided for @listener_profile_go_to_dashboard.
  ///
  /// In en, this message translates to:
  /// **'Go to Dashboard'**
  String get listener_profile_go_to_dashboard;

  /// No description provided for @listener_profile_approved_title.
  ///
  /// In en, this message translates to:
  /// **'Your profile has been approved!'**
  String get listener_profile_approved_title;

  /// No description provided for @listener_profile_approved_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You are now part of the Venting listener community.'**
  String get listener_profile_approved_subtitle;

  /// No description provided for @listener_profile_approved_badge.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get listener_profile_approved_badge;

  /// No description provided for @listener_profile_rejected_title.
  ///
  /// In en, this message translates to:
  /// **'Your profile was not approved'**
  String get listener_profile_rejected_title;

  /// No description provided for @listener_profile_rejected_subtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'re unable to approve your profile at this time for the following reason(s).'**
  String get listener_profile_rejected_subtitle;

  /// No description provided for @listener_profile_reasons_title.
  ///
  /// In en, this message translates to:
  /// **'Reason(s)'**
  String get listener_profile_reasons_title;

  /// No description provided for @listener_profile_reject_reason_voice.
  ///
  /// In en, this message translates to:
  /// **'The voice introduction is too short.'**
  String get listener_profile_reject_reason_voice;

  /// No description provided for @listener_profile_reject_reason_experience.
  ///
  /// In en, this message translates to:
  /// **'Please provide more details about your experience.'**
  String get listener_profile_reject_reason_experience;

  /// No description provided for @listener_profile_reject_reason_id.
  ///
  /// In en, this message translates to:
  /// **'The uploaded ID is not clear.'**
  String get listener_profile_reject_reason_id;

  /// No description provided for @listener_profile_what_you_can_do.
  ///
  /// In en, this message translates to:
  /// **'What can you do?'**
  String get listener_profile_what_you_can_do;

  /// No description provided for @listener_profile_what_you_can_do_body.
  ///
  /// In en, this message translates to:
  /// **'You can go back and update the information that needs attention.'**
  String get listener_profile_what_you_can_do_body;

  /// No description provided for @listener_profile_review_edit.
  ///
  /// In en, this message translates to:
  /// **'Review & Edit'**
  String get listener_profile_review_edit;

  /// No description provided for @listener_profile_edit_step_hint.
  ///
  /// In en, this message translates to:
  /// **'You can edit the {step} step.'**
  String listener_profile_edit_step_hint(String step);

  /// No description provided for @listener_reg_step_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get listener_reg_step_notifications;

  /// No description provided for @listener_reg_notif_title.
  ///
  /// In en, this message translates to:
  /// **'Stay Updated'**
  String get listener_reg_notif_title;

  /// No description provided for @listener_reg_notif_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Get notified when your profile review is complete, and about sessions, rewards, and important updates.'**
  String get listener_reg_notif_subtitle;

  /// No description provided for @listener_reg_notif_enable.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get listener_reg_notif_enable;

  /// No description provided for @listener_reg_notif_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get listener_reg_notif_skip;

  /// No description provided for @ventor_reg_title.
  ///
  /// In en, this message translates to:
  /// **'Choose a nickname'**
  String get ventor_reg_title;

  /// No description provided for @ventor_reg_subtitle.
  ///
  /// In en, this message translates to:
  /// **'This is how listeners will see you.'**
  String get ventor_reg_subtitle;

  /// No description provided for @ventor_reg_nickname_hint.
  ///
  /// In en, this message translates to:
  /// **'e.g. QuietSoul'**
  String get ventor_reg_nickname_hint;

  /// No description provided for @ventor_reg_nickname_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter a nickname'**
  String get ventor_reg_nickname_required;

  /// No description provided for @ventor_reg_avatar_label.
  ///
  /// In en, this message translates to:
  /// **'Add a profile avatar (optional)'**
  String get ventor_reg_avatar_label;

  /// No description provided for @ventor_reg_change_anytime.
  ///
  /// In en, this message translates to:
  /// **'You can change it anytime from your profile settings'**
  String get ventor_reg_change_anytime;

  /// No description provided for @home_tab_dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get home_tab_dashboard;

  /// No description provided for @home_tab_sessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get home_tab_sessions;

  /// No description provided for @home_tab_availability.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get home_tab_availability;

  /// No description provided for @home_tab_earnings.
  ///
  /// In en, this message translates to:
  /// **'Earnings'**
  String get home_tab_earnings;

  /// No description provided for @home_tab_rewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get home_tab_rewards;

  /// No description provided for @home_tab_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get home_tab_profile;

  /// No description provided for @listener_home_dashboard_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Your listener overview will appear here.'**
  String get listener_home_dashboard_placeholder;

  /// No description provided for @listener_home_sessions_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Upcoming and past listening sessions will appear here.'**
  String get listener_home_sessions_placeholder;

  /// No description provided for @listener_home_availability_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Manage when you are available to take calls.'**
  String get listener_home_availability_placeholder;

  /// No description provided for @listener_home_earnings_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Track your listener earnings and payouts here.'**
  String get listener_home_earnings_placeholder;

  /// No description provided for @listener_earnings_total.
  ///
  /// In en, this message translates to:
  /// **'Total Earnings'**
  String get listener_earnings_total;

  /// No description provided for @listener_earnings_trend_up.
  ///
  /// In en, this message translates to:
  /// **'+{percent}% from last month'**
  String listener_earnings_trend_up(int percent);

  /// No description provided for @listener_earnings_sessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get listener_earnings_sessions;

  /// No description provided for @listener_earnings_hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get listener_earnings_hours;

  /// No description provided for @listener_earnings_hours_value.
  ///
  /// In en, this message translates to:
  /// **'{hours}h'**
  String listener_earnings_hours_value(String hours);

  /// No description provided for @listener_earnings_rate.
  ///
  /// In en, this message translates to:
  /// **'Rate / 30 min'**
  String get listener_earnings_rate;

  /// No description provided for @listener_earnings_overview.
  ///
  /// In en, this message translates to:
  /// **'Earnings Overview'**
  String get listener_earnings_overview;

  /// No description provided for @listener_earnings_recent_payout.
  ///
  /// In en, this message translates to:
  /// **'Recent Payout'**
  String get listener_earnings_recent_payout;

  /// No description provided for @listener_earnings_status_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get listener_earnings_status_paid;

  /// No description provided for @listener_earnings_payout_methods.
  ///
  /// In en, this message translates to:
  /// **'Payout Methods'**
  String get listener_earnings_payout_methods;

  /// No description provided for @listener_earnings_default.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get listener_earnings_default;

  /// No description provided for @listener_home_profile_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Your listener profile and settings will appear here.'**
  String get listener_home_profile_placeholder;

  /// No description provided for @listener_profile_title.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get listener_profile_title;

  /// No description provided for @listener_profile_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get listener_profile_email;

  /// No description provided for @listener_profile_date_of_birth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get listener_profile_date_of_birth;

  /// No description provided for @listener_profile_view_profile.
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get listener_profile_view_profile;

  /// No description provided for @listener_profile_active_now.
  ///
  /// In en, this message translates to:
  /// **'Active now'**
  String get listener_profile_active_now;

  /// No description provided for @listener_profile_reviews_count.
  ///
  /// In en, this message translates to:
  /// **'{count} reviews'**
  String listener_profile_reviews_count(int count);

  /// No description provided for @listener_profile_voice_introduction.
  ///
  /// In en, this message translates to:
  /// **'Voice Introduction'**
  String get listener_profile_voice_introduction;

  /// No description provided for @listener_profile_edit_voice_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Voice Introduction'**
  String get listener_profile_edit_voice_title;

  /// No description provided for @listener_profile_edit_voice_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Re-record a short introduction so ventors can get to know you.'**
  String get listener_profile_edit_voice_subtitle;

  /// No description provided for @listener_profile_edit_voice_re_record.
  ///
  /// In en, this message translates to:
  /// **'Re-record'**
  String get listener_profile_edit_voice_re_record;

  /// No description provided for @listener_profile_about_me.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get listener_profile_about_me;

  /// No description provided for @listener_profile_edit_about_me_title.
  ///
  /// In en, this message translates to:
  /// **'Edit About Me'**
  String get listener_profile_edit_about_me_title;

  /// No description provided for @listener_profile_edit_about_me_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Share a short introduction so ventors know what to expect from you.'**
  String get listener_profile_edit_about_me_subtitle;

  /// No description provided for @listener_profile_edit_about_me_hint.
  ///
  /// In en, this message translates to:
  /// **'Write something about yourself...'**
  String get listener_profile_edit_about_me_hint;

  /// No description provided for @listener_profile_edit_about_me_counter.
  ///
  /// In en, this message translates to:
  /// **'{current}/{max}'**
  String listener_profile_edit_about_me_counter(int current, int max);

  /// No description provided for @listener_profile_see_more.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get listener_profile_see_more;

  /// No description provided for @listener_profile_see_less.
  ///
  /// In en, this message translates to:
  /// **'See less'**
  String get listener_profile_see_less;

  /// No description provided for @listener_profile_good_at.
  ///
  /// In en, this message translates to:
  /// **'What I\'m Good At'**
  String get listener_profile_good_at;

  /// No description provided for @listener_profile_experiences.
  ///
  /// In en, this message translates to:
  /// **'Experiences'**
  String get listener_profile_experiences;

  /// No description provided for @listener_profile_edit_experiences_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Experiences'**
  String get listener_profile_edit_experiences_title;

  /// No description provided for @listener_profile_edit_experiences_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Update the life experiences that shape how you listen and support others.'**
  String get listener_profile_edit_experiences_subtitle;

  /// No description provided for @listener_profile_experiences_empty.
  ///
  /// In en, this message translates to:
  /// **'No experiences added yet. Tap Edit to add some.'**
  String get listener_profile_experiences_empty;

  /// No description provided for @listener_profile_comfort_areas.
  ///
  /// In en, this message translates to:
  /// **'What I\'m Good At'**
  String get listener_profile_comfort_areas;

  /// No description provided for @listener_profile_edit_comfort_areas_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Comfort Areas'**
  String get listener_profile_edit_comfort_areas_title;

  /// No description provided for @listener_profile_edit_comfort_areas_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose topics you\'re comfortable listening to and supporting.'**
  String get listener_profile_edit_comfort_areas_subtitle;

  /// No description provided for @listener_profile_comfort_areas_empty.
  ///
  /// In en, this message translates to:
  /// **'No comfort areas selected yet. Tap Edit to choose topics.'**
  String get listener_profile_comfort_areas_empty;

  /// No description provided for @listener_profile_boundaries.
  ///
  /// In en, this message translates to:
  /// **'Boundaries'**
  String get listener_profile_boundaries;

  /// No description provided for @listener_profile_edit_boundaries_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Boundaries'**
  String get listener_profile_edit_boundaries_title;

  /// No description provided for @listener_profile_edit_boundaries_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Topics you don\'t want to discuss. We will respect your choice.'**
  String get listener_profile_edit_boundaries_subtitle;

  /// No description provided for @listener_profile_boundaries_empty.
  ///
  /// In en, this message translates to:
  /// **'No boundaries set yet. Tap Edit to choose topics you prefer to avoid.'**
  String get listener_profile_boundaries_empty;

  /// No description provided for @listener_profile_add_more.
  ///
  /// In en, this message translates to:
  /// **'+ Add more'**
  String get listener_profile_add_more;

  /// No description provided for @listener_profile_languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get listener_profile_languages;

  /// No description provided for @listener_profile_country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get listener_profile_country;

  /// No description provided for @listener_profile_city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get listener_profile_city;

  /// No description provided for @listener_profile_edit_city_title.
  ///
  /// In en, this message translates to:
  /// **'Edit City'**
  String get listener_profile_edit_city_title;

  /// No description provided for @listener_profile_edit_city_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Update the city shown on your listener profile.'**
  String get listener_profile_edit_city_subtitle;

  /// No description provided for @listener_profile_experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get listener_profile_experience;

  /// No description provided for @listener_profile_availability_label.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get listener_profile_availability_label;

  /// No description provided for @listener_profile_response_time.
  ///
  /// In en, this message translates to:
  /// **'Response Time'**
  String get listener_profile_response_time;

  /// No description provided for @listener_profile_reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get listener_profile_reviews;

  /// No description provided for @listener_profile_view_all_reviews.
  ///
  /// In en, this message translates to:
  /// **'View all ({count})'**
  String listener_profile_view_all_reviews(int count);

  /// No description provided for @listener_profile_all_reviews_title.
  ///
  /// In en, this message translates to:
  /// **'All Reviews'**
  String get listener_profile_all_reviews_title;

  /// No description provided for @listener_profile_all_reviews_subtitle.
  ///
  /// In en, this message translates to:
  /// **'{rating} · {count} reviews'**
  String listener_profile_all_reviews_subtitle(String rating, int count);

  /// No description provided for @listener_profile_all_reviews_empty.
  ///
  /// In en, this message translates to:
  /// **'No reviews yet. Reviews from ventors will appear here.'**
  String get listener_profile_all_reviews_empty;

  /// No description provided for @listener_profile_review_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get listener_profile_review_today;

  /// No description provided for @listener_profile_review_yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get listener_profile_review_yesterday;

  /// No description provided for @listener_profile_review_days_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String listener_profile_review_days_ago(int count);

  /// No description provided for @listener_profile_review_weeks_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} weeks ago'**
  String listener_profile_review_weeks_ago(int count);

  /// No description provided for @listener_profile_review_months_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} months ago'**
  String listener_profile_review_months_ago(int count);

  /// No description provided for @listener_profile_review_years_ago.
  ///
  /// In en, this message translates to:
  /// **'{count} years ago'**
  String listener_profile_review_years_ago(int count);

  /// No description provided for @listener_profile_next_availability.
  ///
  /// In en, this message translates to:
  /// **'Next Availability'**
  String get listener_profile_next_availability;

  /// No description provided for @listener_profile_available_now.
  ///
  /// In en, this message translates to:
  /// **'Available Now'**
  String get listener_profile_available_now;

  /// No description provided for @listener_profile_until_time.
  ///
  /// In en, this message translates to:
  /// **'Until {time}'**
  String listener_profile_until_time(String time);

  /// No description provided for @listener_profile_tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get listener_profile_tomorrow;

  /// No description provided for @listener_profile_account_settings.
  ///
  /// In en, this message translates to:
  /// **'Account & Settings'**
  String get listener_profile_account_settings;

  /// No description provided for @listener_profile_notification_preferences.
  ///
  /// In en, this message translates to:
  /// **'Notification Preferences'**
  String get listener_profile_notification_preferences;

  /// No description provided for @listener_profile_privacy_visibility.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Visibility'**
  String get listener_profile_privacy_visibility;

  /// No description provided for @listener_profile_payment_payouts.
  ///
  /// In en, this message translates to:
  /// **'Payment & Payouts'**
  String get listener_profile_payment_payouts;

  /// No description provided for @listener_profile_help_support.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get listener_profile_help_support;

  /// No description provided for @listener_help_topics.
  ///
  /// In en, this message translates to:
  /// **'Help Topics'**
  String get listener_help_topics;

  /// No description provided for @listener_help_getting_started.
  ///
  /// In en, this message translates to:
  /// **'Getting Started'**
  String get listener_help_getting_started;

  /// No description provided for @listener_help_managing_sessions.
  ///
  /// In en, this message translates to:
  /// **'Managing Sessions'**
  String get listener_help_managing_sessions;

  /// No description provided for @listener_help_earnings_payouts.
  ///
  /// In en, this message translates to:
  /// **'Earnings & Payouts'**
  String get listener_help_earnings_payouts;

  /// No description provided for @listener_help_account_profile.
  ///
  /// In en, this message translates to:
  /// **'Account & Profile'**
  String get listener_help_account_profile;

  /// No description provided for @listener_help_safety_boundaries.
  ///
  /// In en, this message translates to:
  /// **'Safety & Boundaries'**
  String get listener_help_safety_boundaries;

  /// No description provided for @listener_help_community_guidelines.
  ///
  /// In en, this message translates to:
  /// **'Community Guidelines'**
  String get listener_help_community_guidelines;

  /// No description provided for @listener_help_faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get listener_help_faqs;

  /// No description provided for @listener_help_app_technical.
  ///
  /// In en, this message translates to:
  /// **'App & Technical'**
  String get listener_help_app_technical;

  /// No description provided for @listener_help_contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get listener_help_contact_us;

  /// No description provided for @listener_help_whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get listener_help_whatsapp;

  /// No description provided for @listener_help_whatsapp_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Chat with our support team'**
  String get listener_help_whatsapp_subtitle;

  /// No description provided for @listener_help_whatsapp_failed.
  ///
  /// In en, this message translates to:
  /// **'Could not open WhatsApp. Please try again.'**
  String get listener_help_whatsapp_failed;

  /// No description provided for @listener_help_email_support.
  ///
  /// In en, this message translates to:
  /// **'Email Support'**
  String get listener_help_email_support;

  /// No description provided for @listener_help_email_failed.
  ///
  /// In en, this message translates to:
  /// **'Could not open email. Please try again.'**
  String get listener_help_email_failed;

  /// No description provided for @listener_profile_settings_section_account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get listener_profile_settings_section_account;

  /// No description provided for @listener_profile_settings_section_preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get listener_profile_settings_section_preferences;

  /// No description provided for @listener_profile_settings_section_earnings.
  ///
  /// In en, this message translates to:
  /// **'Earnings & Payouts'**
  String get listener_profile_settings_section_earnings;

  /// No description provided for @listener_profile_settings_section_support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get listener_profile_settings_section_support;

  /// No description provided for @listener_profile_settings_email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get listener_profile_settings_email;

  /// No description provided for @listener_profile_settings_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get listener_profile_settings_phone;

  /// No description provided for @listener_profile_settings_two_factor.
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication'**
  String get listener_profile_settings_two_factor;

  /// No description provided for @listener_profile_settings_payout_methods.
  ///
  /// In en, this message translates to:
  /// **'Payout Methods'**
  String get listener_profile_settings_payout_methods;

  /// No description provided for @listener_profile_settings_feedback.
  ///
  /// In en, this message translates to:
  /// **'Give Us Feedback'**
  String get listener_profile_settings_feedback;

  /// No description provided for @listener_profile_settings_about.
  ///
  /// In en, this message translates to:
  /// **'About Venting'**
  String get listener_profile_settings_about;

  /// No description provided for @listener_confirm_logout_title.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get listener_confirm_logout_title;

  /// No description provided for @listener_confirm_logout_heading.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get listener_confirm_logout_heading;

  /// No description provided for @listener_confirm_logout_subtitle.
  ///
  /// In en, this message translates to:
  /// **'You will need to sign in again to access your account.'**
  String get listener_confirm_logout_subtitle;

  /// No description provided for @listener_confirm_logout_confirm.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get listener_confirm_logout_confirm;

  /// No description provided for @listener_confirm_delete_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get listener_confirm_delete_title;

  /// No description provided for @listener_confirm_delete_heading.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get listener_confirm_delete_heading;

  /// No description provided for @listener_confirm_delete_subtitle.
  ///
  /// In en, this message translates to:
  /// **'This permanently removes your listener profile and data. You will need to register again.'**
  String get listener_confirm_delete_subtitle;

  /// No description provided for @listener_confirm_delete_confirm.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get listener_confirm_delete_confirm;

  /// No description provided for @listener_confirm_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get listener_confirm_cancel;

  /// No description provided for @listener_about_tagline.
  ///
  /// In en, this message translates to:
  /// **'The safe place to be heard and make a real impact.'**
  String get listener_about_tagline;

  /// No description provided for @listener_about_version.
  ///
  /// In en, this message translates to:
  /// **'Version {version} ({build})'**
  String listener_about_version(String version, String build);

  /// No description provided for @listener_about_whats_new.
  ///
  /// In en, this message translates to:
  /// **'What\'s New'**
  String get listener_about_whats_new;

  /// No description provided for @listener_about_terms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get listener_about_terms;

  /// No description provided for @listener_about_privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get listener_about_privacy;

  /// No description provided for @listener_about_community_guidelines.
  ///
  /// In en, this message translates to:
  /// **'Community Guidelines'**
  String get listener_about_community_guidelines;

  /// No description provided for @listener_about_licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get listener_about_licenses;

  /// No description provided for @listener_whats_new_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Highlights from the latest Venting updates.'**
  String get listener_whats_new_subtitle;

  /// No description provided for @listener_whats_new_date_aug_2026.
  ///
  /// In en, this message translates to:
  /// **'August 2026'**
  String get listener_whats_new_date_aug_2026;

  /// No description provided for @listener_whats_new_date_jul_2026.
  ///
  /// In en, this message translates to:
  /// **'July 2026'**
  String get listener_whats_new_date_jul_2026;

  /// No description provided for @listener_whats_new_1_2_0_item_1.
  ///
  /// In en, this message translates to:
  /// **'New listener Account & Settings experience.'**
  String get listener_whats_new_1_2_0_item_1;

  /// No description provided for @listener_whats_new_1_2_0_item_2.
  ///
  /// In en, this message translates to:
  /// **'Payment & Payouts with bank details and history.'**
  String get listener_whats_new_1_2_0_item_2;

  /// No description provided for @listener_whats_new_1_2_0_item_3.
  ///
  /// In en, this message translates to:
  /// **'Privacy controls for countries and profile visibility.'**
  String get listener_whats_new_1_2_0_item_3;

  /// No description provided for @listener_whats_new_1_2_0_item_4.
  ///
  /// In en, this message translates to:
  /// **'Help & Support with WhatsApp and help topics.'**
  String get listener_whats_new_1_2_0_item_4;

  /// No description provided for @listener_whats_new_1_1_0_item_1.
  ///
  /// In en, this message translates to:
  /// **'Improved session reminders and notification preferences.'**
  String get listener_whats_new_1_1_0_item_1;

  /// No description provided for @listener_whats_new_1_1_0_item_2.
  ///
  /// In en, this message translates to:
  /// **'Faster profile editing for languages, city, and bio.'**
  String get listener_whats_new_1_1_0_item_2;

  /// No description provided for @listener_whats_new_1_1_0_item_3.
  ///
  /// In en, this message translates to:
  /// **'Stability and performance improvements.'**
  String get listener_whats_new_1_1_0_item_3;

  /// No description provided for @listener_profile_settings_on.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get listener_profile_settings_on;

  /// No description provided for @listener_profile_settings_off.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get listener_profile_settings_off;

  /// No description provided for @listener_profile_settings_version.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String listener_profile_settings_version(String version);

  /// No description provided for @listener_change_password_current_label.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get listener_change_password_current_label;

  /// No description provided for @listener_change_password_current_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter current password'**
  String get listener_change_password_current_hint;

  /// No description provided for @listener_change_password_new_label.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get listener_change_password_new_label;

  /// No description provided for @listener_change_password_new_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get listener_change_password_new_hint;

  /// No description provided for @listener_change_password_confirm_label.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get listener_change_password_confirm_label;

  /// No description provided for @listener_change_password_confirm_hint.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get listener_change_password_confirm_hint;

  /// No description provided for @listener_change_password_rule_hint.
  ///
  /// In en, this message translates to:
  /// **'Min. 8 characters with a number and symbol'**
  String get listener_change_password_rule_hint;

  /// No description provided for @listener_change_password_update.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get listener_change_password_update;

  /// No description provided for @listener_change_password_current_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter your current password'**
  String get listener_change_password_current_required;

  /// No description provided for @listener_change_password_mismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get listener_change_password_mismatch;

  /// No description provided for @listener_change_password_same_as_current.
  ///
  /// In en, this message translates to:
  /// **'New password must be different from your current password'**
  String get listener_change_password_same_as_current;

  /// No description provided for @listener_edit_phone_title.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get listener_edit_phone_title;

  /// No description provided for @listener_edit_phone_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Update the phone number linked to your listener account.'**
  String get listener_edit_phone_subtitle;

  /// No description provided for @listener_notif_section_push.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get listener_notif_section_push;

  /// No description provided for @listener_notif_receive_push.
  ///
  /// In en, this message translates to:
  /// **'Receive push notifications'**
  String get listener_notif_receive_push;

  /// No description provided for @listener_notif_section_notify_about.
  ///
  /// In en, this message translates to:
  /// **'Notify me about'**
  String get listener_notif_section_notify_about;

  /// No description provided for @listener_notif_new_session_requests.
  ///
  /// In en, this message translates to:
  /// **'New session requests'**
  String get listener_notif_new_session_requests;

  /// No description provided for @listener_notif_section_session_reminders.
  ///
  /// In en, this message translates to:
  /// **'Session reminders'**
  String get listener_notif_section_session_reminders;

  /// No description provided for @listener_notif_session_reminder_15.
  ///
  /// In en, this message translates to:
  /// **'Session reminder before 15 min'**
  String get listener_notif_session_reminder_15;

  /// No description provided for @listener_notif_session_reminder_10.
  ///
  /// In en, this message translates to:
  /// **'Session reminder before 10 min'**
  String get listener_notif_session_reminder_10;

  /// No description provided for @listener_notif_session_reminder_5.
  ///
  /// In en, this message translates to:
  /// **'Session reminder before 5 min'**
  String get listener_notif_session_reminder_5;

  /// No description provided for @listener_notif_messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get listener_notif_messages;

  /// No description provided for @listener_notif_reviews_feedback.
  ///
  /// In en, this message translates to:
  /// **'Reviews & feedback'**
  String get listener_notif_reviews_feedback;

  /// No description provided for @listener_notif_tips_earnings.
  ///
  /// In en, this message translates to:
  /// **'Tips & earnings'**
  String get listener_notif_tips_earnings;

  /// No description provided for @listener_notif_promotions_updates.
  ///
  /// In en, this message translates to:
  /// **'Promotions & updates'**
  String get listener_notif_promotions_updates;

  /// No description provided for @listener_notif_section_email.
  ///
  /// In en, this message translates to:
  /// **'Email Notifications'**
  String get listener_notif_section_email;

  /// No description provided for @listener_notif_receive_email.
  ///
  /// In en, this message translates to:
  /// **'Receive email notifications'**
  String get listener_notif_receive_email;

  /// No description provided for @listener_notif_save.
  ///
  /// In en, this message translates to:
  /// **'Save Preferences'**
  String get listener_notif_save;

  /// No description provided for @listener_privacy_section_visibility.
  ///
  /// In en, this message translates to:
  /// **'Profile Visibility'**
  String get listener_privacy_section_visibility;

  /// No description provided for @listener_privacy_online_status.
  ///
  /// In en, this message translates to:
  /// **'Online status'**
  String get listener_privacy_online_status;

  /// No description provided for @listener_privacy_show_when_online.
  ///
  /// In en, this message translates to:
  /// **'Show when I\'m online'**
  String get listener_privacy_show_when_online;

  /// No description provided for @listener_privacy_show_profile_in.
  ///
  /// In en, this message translates to:
  /// **'Show my profile in'**
  String get listener_privacy_show_profile_in;

  /// No description provided for @listener_privacy_all_countries.
  ///
  /// In en, this message translates to:
  /// **'All countries'**
  String get listener_privacy_all_countries;

  /// No description provided for @listener_privacy_specific_countries.
  ///
  /// In en, this message translates to:
  /// **'Specific countries'**
  String get listener_privacy_specific_countries;

  /// No description provided for @listener_privacy_select_countries.
  ///
  /// In en, this message translates to:
  /// **'Select countries'**
  String get listener_privacy_select_countries;

  /// No description provided for @listener_privacy_countries_count.
  ///
  /// In en, this message translates to:
  /// **'{count} countries'**
  String listener_privacy_countries_count(int count);

  /// No description provided for @listener_privacy_countries_required.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one country'**
  String get listener_privacy_countries_required;

  /// No description provided for @listener_privacy_visible_countries_title.
  ///
  /// In en, this message translates to:
  /// **'Profile visibility by country'**
  String get listener_privacy_visible_countries_title;

  /// No description provided for @listener_privacy_section_information.
  ///
  /// In en, this message translates to:
  /// **'Profile Information'**
  String get listener_privacy_section_information;

  /// No description provided for @listener_privacy_show_languages.
  ///
  /// In en, this message translates to:
  /// **'Show languages I speak'**
  String get listener_privacy_show_languages;

  /// No description provided for @listener_privacy_show_comfort_areas.
  ///
  /// In en, this message translates to:
  /// **'Show topics I\'m good at'**
  String get listener_privacy_show_comfort_areas;

  /// No description provided for @listener_privacy_show_experience_ratings.
  ///
  /// In en, this message translates to:
  /// **'Show experience & ratings'**
  String get listener_privacy_show_experience_ratings;

  /// No description provided for @listener_privacy_show_boundaries.
  ///
  /// In en, this message translates to:
  /// **'Show my boundaries'**
  String get listener_privacy_show_boundaries;

  /// No description provided for @listener_privacy_section_activity.
  ///
  /// In en, this message translates to:
  /// **'Activity & Data'**
  String get listener_privacy_section_activity;

  /// No description provided for @listener_privacy_allow_search_indexing.
  ///
  /// In en, this message translates to:
  /// **'Allow search engine indexing'**
  String get listener_privacy_allow_search_indexing;

  /// No description provided for @listener_privacy_search_indexing_hint.
  ///
  /// In en, this message translates to:
  /// **'Turn off to keep your profile out of search engines.'**
  String get listener_privacy_search_indexing_hint;

  /// No description provided for @listener_privacy_save.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get listener_privacy_save;

  /// No description provided for @listener_payout_your_balance.
  ///
  /// In en, this message translates to:
  /// **'Your Balance'**
  String get listener_payout_your_balance;

  /// No description provided for @listener_payout_available.
  ///
  /// In en, this message translates to:
  /// **'Available for payout'**
  String get listener_payout_available;

  /// No description provided for @listener_payout_total_earnings.
  ///
  /// In en, this message translates to:
  /// **'Total Earnings'**
  String get listener_payout_total_earnings;

  /// No description provided for @listener_payout_this_month.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get listener_payout_this_month;

  /// No description provided for @listener_payout_add_method.
  ///
  /// In en, this message translates to:
  /// **'Add method'**
  String get listener_payout_add_method;

  /// No description provided for @listener_payout_history.
  ///
  /// In en, this message translates to:
  /// **'Payout History'**
  String get listener_payout_history;

  /// No description provided for @listener_payout_history_empty.
  ///
  /// In en, this message translates to:
  /// **'No payout history yet.'**
  String get listener_payout_history_empty;

  /// No description provided for @listener_payout_detail_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get listener_payout_detail_date;

  /// No description provided for @listener_payout_detail_method.
  ///
  /// In en, this message translates to:
  /// **'Method'**
  String get listener_payout_detail_method;

  /// No description provided for @listener_payout_detail_reference.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get listener_payout_detail_reference;

  /// No description provided for @listener_payout_status_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get listener_payout_status_completed;

  /// No description provided for @listener_payout_status_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get listener_payout_status_pending;

  /// No description provided for @listener_payout_status_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get listener_payout_status_failed;

  /// No description provided for @listener_payout_min_hint.
  ///
  /// In en, this message translates to:
  /// **'You can request a payout when your available balance reaches at least \$100.'**
  String get listener_payout_min_hint;

  /// No description provided for @listener_payout_need_method.
  ///
  /// In en, this message translates to:
  /// **'Please add a bank account before requesting a payout.'**
  String get listener_payout_need_method;

  /// No description provided for @listener_payout_request_submitted.
  ///
  /// In en, this message translates to:
  /// **'Payout request submitted.'**
  String get listener_payout_request_submitted;

  /// No description provided for @listener_payout_bank_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your bank account details to receive payouts.'**
  String get listener_payout_bank_subtitle;

  /// No description provided for @listener_payout_bank_holder.
  ///
  /// In en, this message translates to:
  /// **'Account holder name'**
  String get listener_payout_bank_holder;

  /// No description provided for @listener_payout_bank_holder_hint.
  ///
  /// In en, this message translates to:
  /// **'Full name on the account'**
  String get listener_payout_bank_holder_hint;

  /// No description provided for @listener_payout_bank_name.
  ///
  /// In en, this message translates to:
  /// **'Bank name'**
  String get listener_payout_bank_name;

  /// No description provided for @listener_payout_bank_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter bank name'**
  String get listener_payout_bank_name_hint;

  /// No description provided for @listener_payout_bank_iban.
  ///
  /// In en, this message translates to:
  /// **'IBAN / Account number'**
  String get listener_payout_bank_iban;

  /// No description provided for @listener_payout_bank_iban_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter IBAN or account number'**
  String get listener_payout_bank_iban_hint;

  /// No description provided for @listener_payout_bank_swift.
  ///
  /// In en, this message translates to:
  /// **'SWIFT / BIC'**
  String get listener_payout_bank_swift;

  /// No description provided for @listener_payout_bank_swift_hint.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get listener_payout_bank_swift_hint;

  /// No description provided for @listener_payout_bank_optional.
  ///
  /// In en, this message translates to:
  /// **'(optional)'**
  String get listener_payout_bank_optional;

  /// No description provided for @listener_payout_bank_required.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get listener_payout_bank_required;

  /// No description provided for @listener_payout_bank_iban_invalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid IBAN or account number'**
  String get listener_payout_bank_iban_invalid;

  /// No description provided for @listener_payout_request.
  ///
  /// In en, this message translates to:
  /// **'Request Payout'**
  String get listener_payout_request;

  /// No description provided for @listener_profile_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get listener_profile_edit;

  /// No description provided for @listener_profile_about_me_body.
  ///
  /// In en, this message translates to:
  /// **'I\'m here to listen and support you in a safe, judgment-free space. I truly believe that sometimes all we need is someone who listens with an open heart.'**
  String get listener_profile_about_me_body;

  /// No description provided for @listener_profile_experience_value.
  ///
  /// In en, this message translates to:
  /// **'{years}+ years'**
  String listener_profile_experience_value(int years);

  /// No description provided for @listener_profile_usually_available.
  ///
  /// In en, this message translates to:
  /// **'Usually available'**
  String get listener_profile_usually_available;

  /// No description provided for @listener_profile_response_within.
  ///
  /// In en, this message translates to:
  /// **'Usually within {minutes} min'**
  String listener_profile_response_within(int minutes);

  /// No description provided for @listener_profile_tag_stress_anxiety.
  ///
  /// In en, this message translates to:
  /// **'Stress & Anxiety'**
  String get listener_profile_tag_stress_anxiety;

  /// No description provided for @listener_profile_tag_relationships.
  ///
  /// In en, this message translates to:
  /// **'Relationships'**
  String get listener_profile_tag_relationships;

  /// No description provided for @listener_profile_tag_overthinking.
  ///
  /// In en, this message translates to:
  /// **'Overthinking'**
  String get listener_profile_tag_overthinking;

  /// No description provided for @listener_profile_tag_life_transitions.
  ///
  /// In en, this message translates to:
  /// **'Life Transitions'**
  String get listener_profile_tag_life_transitions;

  /// No description provided for @listener_profile_tag_parenting.
  ///
  /// In en, this message translates to:
  /// **'Parenting'**
  String get listener_profile_tag_parenting;

  /// No description provided for @ventor_home_dashboard_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Find listeners and start a conversation from here.'**
  String get ventor_home_dashboard_placeholder;

  /// No description provided for @ventor_home_sessions_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Your venting sessions and history will appear here.'**
  String get ventor_home_sessions_placeholder;

  /// No description provided for @ventor_home_rewards_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Rewards and achievements for ventors will appear here.'**
  String get ventor_home_rewards_placeholder;

  /// No description provided for @ventor_home_profile_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Your ventor profile and settings will appear here.'**
  String get ventor_home_profile_placeholder;

  /// No description provided for @ventor_profile_anonymous.
  ///
  /// In en, this message translates to:
  /// **'Anonymous'**
  String get ventor_profile_anonymous;

  /// No description provided for @ventor_profile_sessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get ventor_profile_sessions;

  /// No description provided for @ventor_profile_avg_rating.
  ///
  /// In en, this message translates to:
  /// **'Avg. Rating'**
  String get ventor_profile_avg_rating;

  /// No description provided for @ventor_profile_day_streak.
  ///
  /// In en, this message translates to:
  /// **'Day Streak'**
  String get ventor_profile_day_streak;

  /// No description provided for @ventor_profile_mood_journey.
  ///
  /// In en, this message translates to:
  /// **'Mood Journey'**
  String get ventor_profile_mood_journey;

  /// No description provided for @ventor_profile_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get ventor_profile_today;

  /// No description provided for @ventor_profile_day_mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get ventor_profile_day_mon;

  /// No description provided for @ventor_profile_day_tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get ventor_profile_day_tue;

  /// No description provided for @ventor_profile_day_wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get ventor_profile_day_wed;

  /// No description provided for @ventor_profile_day_thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get ventor_profile_day_thu;

  /// No description provided for @ventor_profile_day_fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get ventor_profile_day_fri;

  /// No description provided for @ventor_profile_day_sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get ventor_profile_day_sat;

  /// No description provided for @ventor_profile_day_sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get ventor_profile_day_sun;

  /// No description provided for @ventor_profile_achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get ventor_profile_achievements;

  /// No description provided for @ventor_profile_see_all.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get ventor_profile_see_all;

  /// No description provided for @ventor_profile_achievement_first_step.
  ///
  /// In en, this message translates to:
  /// **'First Step'**
  String get ventor_profile_achievement_first_step;

  /// No description provided for @ventor_profile_achievement_first_step_desc.
  ///
  /// In en, this message translates to:
  /// **'1 Session'**
  String get ventor_profile_achievement_first_step_desc;

  /// No description provided for @ventor_profile_achievement_be_heard.
  ///
  /// In en, this message translates to:
  /// **'Be Heard'**
  String get ventor_profile_achievement_be_heard;

  /// No description provided for @ventor_profile_achievement_be_heard_desc.
  ///
  /// In en, this message translates to:
  /// **'5 Sessions'**
  String get ventor_profile_achievement_be_heard_desc;

  /// No description provided for @ventor_profile_achievement_week_warrior.
  ///
  /// In en, this message translates to:
  /// **'Week Warrior'**
  String get ventor_profile_achievement_week_warrior;

  /// No description provided for @ventor_profile_achievement_week_warrior_desc.
  ///
  /// In en, this message translates to:
  /// **'7 Day Streak'**
  String get ventor_profile_achievement_week_warrior_desc;

  /// No description provided for @ventor_profile_achievement_active_mind.
  ///
  /// In en, this message translates to:
  /// **'Active Mind'**
  String get ventor_profile_achievement_active_mind;

  /// No description provided for @ventor_profile_achievement_active_mind_desc.
  ///
  /// In en, this message translates to:
  /// **'20 Sessions'**
  String get ventor_profile_achievement_active_mind_desc;

  /// No description provided for @ventor_profile_achievement_first_step_detail.
  ///
  /// In en, this message translates to:
  /// **'Complete your first venting session. Taking that first step shows courage — and it unlocks your journey on Venting.'**
  String get ventor_profile_achievement_first_step_detail;

  /// No description provided for @ventor_profile_achievement_be_heard_detail.
  ///
  /// In en, this message translates to:
  /// **'Finish 5 sessions where you shared how you feel. Being heard consistently helps build trust and emotional clarity.'**
  String get ventor_profile_achievement_be_heard_detail;

  /// No description provided for @ventor_profile_achievement_week_warrior_detail.
  ///
  /// In en, this message translates to:
  /// **'Keep a 7-day streak by checking in or completing sessions. Small daily habits can make a big difference.'**
  String get ventor_profile_achievement_week_warrior_detail;

  /// No description provided for @ventor_profile_achievement_active_mind_detail.
  ///
  /// In en, this message translates to:
  /// **'Reach 20 total sessions. This badge celebrates showing up for yourself again and again.'**
  String get ventor_profile_achievement_active_mind_detail;

  /// No description provided for @ventor_profile_achievements_subtitle.
  ///
  /// In en, this message translates to:
  /// **'{unlocked} of {total} unlocked'**
  String ventor_profile_achievements_subtitle(int unlocked, int total);

  /// No description provided for @ventor_profile_achievement_unlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get ventor_profile_achievement_unlocked;

  /// No description provided for @ventor_profile_achievement_locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get ventor_profile_achievement_locked;

  /// No description provided for @ventor_profile_total_points.
  ///
  /// In en, this message translates to:
  /// **'{points} Total Points'**
  String ventor_profile_total_points(String points);

  /// No description provided for @ventor_profile_view_rewards.
  ///
  /// In en, this message translates to:
  /// **'View Rewards'**
  String get ventor_profile_view_rewards;

  /// No description provided for @ventor_profile_my_listeners.
  ///
  /// In en, this message translates to:
  /// **'My Listeners'**
  String get ventor_profile_my_listeners;

  /// No description provided for @ventor_profile_add_favorite.
  ///
  /// In en, this message translates to:
  /// **'Add Favorite'**
  String get ventor_profile_add_favorite;

  /// No description provided for @ventor_profile_quote.
  ///
  /// In en, this message translates to:
  /// **'It\'s okay to not be okay. You don\'t have to go through it alone.'**
  String get ventor_profile_quote;

  /// No description provided for @ventor_profile_edit_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get ventor_profile_edit_title;

  /// No description provided for @ventor_profile_edit_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Update your display name and profile photo.'**
  String get ventor_profile_edit_subtitle;

  /// No description provided for @ventor_profile_edit_name_label.
  ///
  /// In en, this message translates to:
  /// **'Display name'**
  String get ventor_profile_edit_name_label;

  /// No description provided for @ventor_profile_edit_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get ventor_profile_edit_name_hint;

  /// No description provided for @ventor_profile_edit_change_photo.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get ventor_profile_edit_change_photo;

  /// No description provided for @ventor_profile_edit_photo_gallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get ventor_profile_edit_photo_gallery;

  /// No description provided for @ventor_profile_edit_photo_camera.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get ventor_profile_edit_photo_camera;

  /// No description provided for @ventor_profile_settings_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get ventor_profile_settings_title;

  /// No description provided for @ventor_profile_settings_privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get ventor_profile_settings_privacy;

  /// No description provided for @ventor_profile_settings_privacy_sub.
  ///
  /// In en, this message translates to:
  /// **'Control your privacy'**
  String get ventor_profile_settings_privacy_sub;

  /// No description provided for @ventor_profile_settings_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get ventor_profile_settings_notifications;

  /// No description provided for @ventor_profile_settings_notifications_sub.
  ///
  /// In en, this message translates to:
  /// **'Manage what you get'**
  String get ventor_profile_settings_notifications_sub;

  /// No description provided for @ventor_profile_settings_help_sub.
  ///
  /// In en, this message translates to:
  /// **'We\'re here for you'**
  String get ventor_profile_settings_help_sub;

  /// No description provided for @ventor_notif_section_push.
  ///
  /// In en, this message translates to:
  /// **'Push notifications'**
  String get ventor_notif_section_push;

  /// No description provided for @ventor_notif_receive_push.
  ///
  /// In en, this message translates to:
  /// **'Receive push notifications'**
  String get ventor_notif_receive_push;

  /// No description provided for @ventor_notif_section_session_reminders.
  ///
  /// In en, this message translates to:
  /// **'Session reminders'**
  String get ventor_notif_section_session_reminders;

  /// No description provided for @ventor_notif_session_reminder_30.
  ///
  /// In en, this message translates to:
  /// **'30 minutes before'**
  String get ventor_notif_session_reminder_30;

  /// No description provided for @ventor_notif_session_reminder_15.
  ///
  /// In en, this message translates to:
  /// **'15 minutes before'**
  String get ventor_notif_session_reminder_15;

  /// No description provided for @ventor_notif_session_reminder_10.
  ///
  /// In en, this message translates to:
  /// **'10 minutes before'**
  String get ventor_notif_session_reminder_10;

  /// No description provided for @ventor_notif_session_reminder_5.
  ///
  /// In en, this message translates to:
  /// **'5 minutes before'**
  String get ventor_notif_session_reminder_5;

  /// No description provided for @ventor_notif_section_activity.
  ///
  /// In en, this message translates to:
  /// **'Notify me about'**
  String get ventor_notif_section_activity;

  /// No description provided for @ventor_notif_rewards_updates.
  ///
  /// In en, this message translates to:
  /// **'Rewards & points'**
  String get ventor_notif_rewards_updates;

  /// No description provided for @ventor_notif_promotions.
  ///
  /// In en, this message translates to:
  /// **'Promotions & tips'**
  String get ventor_notif_promotions;

  /// No description provided for @ventor_notif_section_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get ventor_notif_section_email;

  /// No description provided for @ventor_notif_receive_email.
  ///
  /// In en, this message translates to:
  /// **'Receive email updates'**
  String get ventor_notif_receive_email;

  /// No description provided for @ventor_notif_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get ventor_notif_save;

  /// No description provided for @ventor_privacy_section_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile visibility'**
  String get ventor_privacy_section_profile;

  /// No description provided for @ventor_privacy_show_mood_journey.
  ///
  /// In en, this message translates to:
  /// **'Show Mood Journey'**
  String get ventor_privacy_show_mood_journey;

  /// No description provided for @ventor_privacy_show_achievements.
  ///
  /// In en, this message translates to:
  /// **'Show Achievements'**
  String get ventor_privacy_show_achievements;

  /// No description provided for @ventor_privacy_show_stats.
  ///
  /// In en, this message translates to:
  /// **'Show Sessions & Streak'**
  String get ventor_privacy_show_stats;

  /// No description provided for @ventor_privacy_show_favorite_listeners.
  ///
  /// In en, this message translates to:
  /// **'Show My Listeners'**
  String get ventor_privacy_show_favorite_listeners;

  /// No description provided for @ventor_privacy_section_discovery.
  ///
  /// In en, this message translates to:
  /// **'Discovery'**
  String get ventor_privacy_section_discovery;

  /// No description provided for @ventor_privacy_allow_discovery.
  ///
  /// In en, this message translates to:
  /// **'Allow listeners to find me'**
  String get ventor_privacy_allow_discovery;

  /// No description provided for @ventor_privacy_allow_discovery_sub.
  ///
  /// In en, this message translates to:
  /// **'Let matching listeners discover your profile when looking for someone to talk to.'**
  String get ventor_privacy_allow_discovery_sub;

  /// No description provided for @ventor_privacy_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get ventor_privacy_save;

  /// No description provided for @listener_avail_title.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get listener_avail_title;

  /// No description provided for @listener_avail_weekly_schedule.
  ///
  /// In en, this message translates to:
  /// **'Set Weekly Schedule'**
  String get listener_avail_weekly_schedule;

  /// No description provided for @listener_avail_weekly_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose when you\'re available to help.'**
  String get listener_avail_weekly_subtitle;

  /// No description provided for @listener_avail_day_off.
  ///
  /// In en, this message translates to:
  /// **'Day off'**
  String get listener_avail_day_off;

  /// No description provided for @listener_avail_session_settings.
  ///
  /// In en, this message translates to:
  /// **'Session Settings'**
  String get listener_avail_session_settings;

  /// No description provided for @listener_avail_session_length.
  ///
  /// In en, this message translates to:
  /// **'Preferred Session Length'**
  String get listener_avail_session_length;

  /// No description provided for @listener_avail_break_between.
  ///
  /// In en, this message translates to:
  /// **'Break Between Sessions'**
  String get listener_avail_break_between;

  /// No description provided for @listener_avail_languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get listener_avail_languages;

  /// No description provided for @listener_avail_min_value.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String listener_avail_min_value(int minutes);

  /// No description provided for @listener_avail_instant_calls.
  ///
  /// In en, this message translates to:
  /// **'Accept Instant Calls'**
  String get listener_avail_instant_calls;

  /// No description provided for @listener_avail_instant_calls_hint.
  ///
  /// In en, this message translates to:
  /// **'Allow ventors to reach you for immediate sessions without scheduling.'**
  String get listener_avail_instant_calls_hint;

  /// No description provided for @listener_avail_day_available.
  ///
  /// In en, this message translates to:
  /// **'Available on this day'**
  String get listener_avail_day_available;

  /// No description provided for @listener_avail_add_slot.
  ///
  /// In en, this message translates to:
  /// **'Add time slot'**
  String get listener_avail_add_slot;

  /// No description provided for @listener_avail_remove_slot.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get listener_avail_remove_slot;

  /// No description provided for @listener_sessions_filter_upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming ({count})'**
  String listener_sessions_filter_upcoming(int count);

  /// No description provided for @listener_sessions_filter_missed.
  ///
  /// In en, this message translates to:
  /// **'Missed ({count})'**
  String listener_sessions_filter_missed(int count);

  /// No description provided for @listener_sessions_filter_history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get listener_sessions_filter_history;

  /// No description provided for @listener_sessions_upcoming_title.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Sessions'**
  String get listener_sessions_upcoming_title;

  /// No description provided for @listener_sessions_active_title.
  ///
  /// In en, this message translates to:
  /// **'Active Sessions'**
  String get listener_sessions_active_title;

  /// No description provided for @listener_sessions_history_title.
  ///
  /// In en, this message translates to:
  /// **'Past Sessions'**
  String get listener_sessions_history_title;

  /// No description provided for @listener_sessions_requests_title.
  ///
  /// In en, this message translates to:
  /// **'Session Requests'**
  String get listener_sessions_requests_title;

  /// No description provided for @listener_sessions_new_request.
  ///
  /// In en, this message translates to:
  /// **'New request'**
  String get listener_sessions_new_request;

  /// No description provided for @listener_sessions_decline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get listener_sessions_decline;

  /// No description provided for @listener_sessions_accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get listener_sessions_accept;

  /// No description provided for @listener_sessions_waiting.
  ///
  /// In en, this message translates to:
  /// **'They\'re waiting for you'**
  String get listener_sessions_waiting;

  /// No description provided for @listener_sessions_join_now.
  ///
  /// In en, this message translates to:
  /// **'Join call now'**
  String get listener_sessions_join_now;

  /// No description provided for @listener_sessions_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get listener_sessions_today;

  /// No description provided for @listener_sessions_tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get listener_sessions_tomorrow;

  /// No description provided for @listener_sessions_minutes_ago.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m ago'**
  String listener_sessions_minutes_ago(int minutes);

  /// No description provided for @listener_sessions_hours_ago.
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String listener_sessions_hours_ago(int hours);

  /// No description provided for @listener_sessions_days_ago.
  ///
  /// In en, this message translates to:
  /// **'{days}d ago'**
  String listener_sessions_days_ago(int days);

  /// No description provided for @listener_sessions_stats_title.
  ///
  /// In en, this message translates to:
  /// **'Request outcomes'**
  String get listener_sessions_stats_title;

  /// No description provided for @listener_sessions_accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get listener_sessions_accepted;

  /// No description provided for @listener_sessions_declined.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get listener_sessions_declined;

  /// No description provided for @listener_sessions_stats_missed.
  ///
  /// In en, this message translates to:
  /// **'Missed to enter'**
  String get listener_sessions_stats_missed;

  /// No description provided for @listener_sessions_status_accepted.
  ///
  /// In en, this message translates to:
  /// **'Session accepted'**
  String get listener_sessions_status_accepted;

  /// No description provided for @listener_sessions_status_declined.
  ///
  /// In en, this message translates to:
  /// **'Request declined'**
  String get listener_sessions_status_declined;

  /// No description provided for @listener_sessions_status_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get listener_sessions_status_completed;

  /// No description provided for @listener_sessions_no_missed.
  ///
  /// In en, this message translates to:
  /// **'No missed sessions.'**
  String get listener_sessions_no_missed;

  /// No description provided for @listener_sessions_no_history.
  ///
  /// In en, this message translates to:
  /// **'No past sessions yet.'**
  String get listener_sessions_no_history;

  /// No description provided for @listener_sessions_chosen_you.
  ///
  /// In en, this message translates to:
  /// **'Why they chose you'**
  String get listener_sessions_chosen_you;

  /// No description provided for @listener_sessions_penalty_note.
  ///
  /// In en, this message translates to:
  /// **'For each session you miss without entering, 20% of the session cost will be deducted from your balance.'**
  String get listener_sessions_penalty_note;

  /// No description provided for @listener_sessions_missed_title.
  ///
  /// In en, this message translates to:
  /// **'Missed sessions'**
  String get listener_sessions_missed_title;

  /// No description provided for @listener_sessions_status_missed.
  ///
  /// In en, this message translates to:
  /// **'Missed — not entered'**
  String get listener_sessions_status_missed;

  /// No description provided for @listener_sessions_penalty_deducted.
  ///
  /// In en, this message translates to:
  /// **'{amount} deducted (20%)'**
  String listener_sessions_penalty_deducted(String amount);

  /// No description provided for @listener_call_instructions_title.
  ///
  /// In en, this message translates to:
  /// **'Before you join'**
  String get listener_call_instructions_title;

  /// No description provided for @listener_call_mode_video.
  ///
  /// In en, this message translates to:
  /// **'This is a video call — the ventor chose camera on.'**
  String get listener_call_mode_video;

  /// No description provided for @listener_call_mode_audio.
  ///
  /// In en, this message translates to:
  /// **'This is a voice-only call — the ventor chose audio.'**
  String get listener_call_mode_audio;

  /// No description provided for @listener_call_instructions_heading.
  ///
  /// In en, this message translates to:
  /// **'Guidelines for this session'**
  String get listener_call_instructions_heading;

  /// No description provided for @listener_call_instruction_respect.
  ///
  /// In en, this message translates to:
  /// **'Treat the ventor with respect and kindness. This is a safe space for them to share.'**
  String get listener_call_instruction_respect;

  /// No description provided for @listener_call_instruction_listen.
  ///
  /// In en, this message translates to:
  /// **'Listen actively without interrupting. Let them lead the conversation.'**
  String get listener_call_instruction_listen;

  /// No description provided for @listener_call_instruction_safe.
  ///
  /// In en, this message translates to:
  /// **'Keep the conversation supportive. Do not give medical or legal advice.'**
  String get listener_call_instruction_safe;

  /// No description provided for @listener_call_instruction_time.
  ///
  /// In en, this message translates to:
  /// **'Stay for the full {minutes}-minute session unless they end early.'**
  String listener_call_instruction_time(int minutes);

  /// No description provided for @listener_call_instruction_boundaries.
  ///
  /// In en, this message translates to:
  /// **'Respect boundaries. If a topic feels outside your comfort zone, guide them gently.'**
  String get listener_call_instruction_boundaries;

  /// No description provided for @listener_call_permissions_heading.
  ///
  /// In en, this message translates to:
  /// **'Allow camera & microphone'**
  String get listener_call_permissions_heading;

  /// No description provided for @listener_call_permissions_subtitle.
  ///
  /// In en, this message translates to:
  /// **'The ventor decides whether the call is audio or video. Please allow both so you are ready either way.'**
  String get listener_call_permissions_subtitle;

  /// No description provided for @listener_call_permission_mic.
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get listener_call_permission_mic;

  /// No description provided for @listener_call_permission_camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get listener_call_permission_camera;

  /// No description provided for @listener_call_permission_allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get listener_call_permission_allow;

  /// No description provided for @listener_call_permission_granted.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get listener_call_permission_granted;

  /// No description provided for @listener_call_permission_settings.
  ///
  /// In en, this message translates to:
  /// **'Permission denied. Enable it in Settings to join the call.'**
  String get listener_call_permission_settings;

  /// No description provided for @listener_call_join_now.
  ///
  /// In en, this message translates to:
  /// **'Join call'**
  String get listener_call_join_now;

  /// No description provided for @listener_call_end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get listener_call_end;

  /// No description provided for @listener_call_mute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get listener_call_mute;

  /// No description provided for @listener_call_speaker.
  ///
  /// In en, this message translates to:
  /// **'Speaker'**
  String get listener_call_speaker;

  /// No description provided for @listener_call_flip.
  ///
  /// In en, this message translates to:
  /// **'Flip'**
  String get listener_call_flip;

  /// No description provided for @listener_call_chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get listener_call_chat;

  /// No description provided for @listener_call_rating_title.
  ///
  /// In en, this message translates to:
  /// **'How was your conversation?'**
  String get listener_call_rating_title;

  /// No description provided for @listener_call_rating_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your feedback helps us improve'**
  String get listener_call_rating_subtitle;

  /// No description provided for @listener_call_rating_felt_heard.
  ///
  /// In en, this message translates to:
  /// **'Did they feel heard?'**
  String get listener_call_rating_felt_heard;

  /// No description provided for @listener_call_rating_talk_again.
  ///
  /// In en, this message translates to:
  /// **'Would you take another session with them?'**
  String get listener_call_rating_talk_again;

  /// No description provided for @listener_call_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get listener_call_yes;

  /// No description provided for @listener_call_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get listener_call_no;

  /// No description provided for @listener_call_rating_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get listener_call_rating_submit;

  /// No description provided for @listener_call_report_session.
  ///
  /// In en, this message translates to:
  /// **'Report session'**
  String get listener_call_report_session;

  /// No description provided for @listener_call_report_title.
  ///
  /// In en, this message translates to:
  /// **'Report session'**
  String get listener_call_report_title;

  /// No description provided for @listener_call_report_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us what happened. Our team will review your report.'**
  String get listener_call_report_subtitle;

  /// No description provided for @listener_call_report_reason_inappropriate.
  ///
  /// In en, this message translates to:
  /// **'Inappropriate behavior'**
  String get listener_call_report_reason_inappropriate;

  /// No description provided for @listener_call_report_reason_harassment.
  ///
  /// In en, this message translates to:
  /// **'Harassment or abuse'**
  String get listener_call_report_reason_harassment;

  /// No description provided for @listener_call_report_reason_hate_speech.
  ///
  /// In en, this message translates to:
  /// **'Hate speech or discrimination'**
  String get listener_call_report_reason_hate_speech;

  /// No description provided for @listener_call_report_reason_safety.
  ///
  /// In en, this message translates to:
  /// **'Safety concern'**
  String get listener_call_report_reason_safety;

  /// No description provided for @listener_call_report_reason_technical.
  ///
  /// In en, this message translates to:
  /// **'Technical issue'**
  String get listener_call_report_reason_technical;

  /// No description provided for @listener_call_report_reason_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get listener_call_report_reason_other;

  /// No description provided for @listener_call_report_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit report'**
  String get listener_call_report_submit;

  /// No description provided for @listener_call_report_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get listener_call_report_cancel;

  /// No description provided for @listener_call_report_success.
  ///
  /// In en, this message translates to:
  /// **'Report submitted. Our team will review it shortly.'**
  String get listener_call_report_success;
}

class _VentingMobLocalizationsDelegate
    extends LocalizationsDelegate<VentingMobLocalizations> {
  const _VentingMobLocalizationsDelegate();

  @override
  Future<VentingMobLocalizations> load(Locale locale) {
    return SynchronousFuture<VentingMobLocalizations>(
      lookupVentingMobLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_VentingMobLocalizationsDelegate old) => false;
}

VentingMobLocalizations lookupVentingMobLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return VentingMobLocalizationsAr();
    case 'en':
      return VentingMobLocalizationsEn();
  }

  throw FlutterError(
    'VentingMobLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
