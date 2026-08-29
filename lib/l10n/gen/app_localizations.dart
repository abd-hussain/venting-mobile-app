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

  /// No description provided for @common_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_cancel;

  /// No description provided for @common_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get common_save;

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

  /// No description provided for @account_tab_change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get account_tab_change_password;

  /// No description provided for @change_password_success_message.
  ///
  /// In en, this message translates to:
  /// **'You have successfully changed your password'**
  String get change_password_success_message;

  /// No description provided for @account_tab_change_language.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get account_tab_change_language;

  /// No description provided for @account_tab_delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get account_tab_delete_account;

  /// No description provided for @account_tab_logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get account_tab_logout;

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

  /// No description provided for @onboarding_get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboarding_get_started;

  /// No description provided for @camera_init_failed_generic.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize camera'**
  String get camera_init_failed_generic;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get try_again;

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

  /// No description provided for @common_no_internet_connection_short.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get common_no_internet_connection_short;

  /// No description provided for @common_unknown_error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get common_unknown_error;

  /// No description provided for @common_retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get common_retry;

  /// No description provided for @choose_preferred_language.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language to continue'**
  String get choose_preferred_language;

  /// No description provided for @welcome_tagline.
  ///
  /// In en, this message translates to:
  /// **'A safe place to be heard'**
  String get welcome_tagline;

  /// No description provided for @welcome_i_am_ventor.
  ///
  /// In en, this message translates to:
  /// **'I want to Vent'**
  String get welcome_i_am_ventor;

  /// No description provided for @welcome_vent_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Find someone who listens'**
  String get welcome_vent_subtitle;

  /// No description provided for @welcome_i_am_listener.
  ///
  /// In en, this message translates to:
  /// **'I want to Listen'**
  String get welcome_i_am_listener;

  /// No description provided for @welcome_listen_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Earn by lending an ear'**
  String get welcome_listen_subtitle;

  /// No description provided for @welcome_anonymous_footer.
  ///
  /// In en, this message translates to:
  /// **'Speak freely. Stay private.'**
  String get welcome_anonymous_footer;

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

  /// No description provided for @auth_ventor_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome, Ventor'**
  String get auth_ventor_title;

  /// No description provided for @auth_ventor_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue venting'**
  String get auth_ventor_subtitle;

  /// No description provided for @auth_listener_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome, Listener'**
  String get auth_listener_title;

  /// No description provided for @auth_listener_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue listening'**
  String get auth_listener_subtitle;

  /// No description provided for @auth_continue_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get auth_continue_with_apple;

  /// No description provided for @auth_continue_with_google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get auth_continue_with_google;

  /// No description provided for @auth_continue_with_email.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get auth_continue_with_email;

  /// No description provided for @auth_or_divider.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get auth_or_divider;

  /// No description provided for @email_registration_title.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get email_registration_title;

  /// No description provided for @email_registration_ventor_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in or create your Ventor account with email.'**
  String get email_registration_ventor_subtitle;

  /// No description provided for @email_registration_listener_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in or create your Listener account with email.'**
  String get email_registration_listener_subtitle;

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
  /// **'Enter your password'**
  String get email_registration_password_hint;

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
  /// **'Continue'**
  String get email_registration_create_account;

  /// No description provided for @email_registration_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get email_registration_sign_in;

  /// No description provided for @email_registration_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get email_registration_forgot_password;

  /// No description provided for @forgot_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgot_password_title;

  /// No description provided for @forgot_password_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm your email and we’ll send a secure link to reset your password.'**
  String get forgot_password_subtitle;

  /// No description provided for @forgot_password_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get forgot_password_continue;

  /// No description provided for @forgot_password_sent_title.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get forgot_password_sent_title;

  /// No description provided for @forgot_password_sent_body.
  ///
  /// In en, this message translates to:
  /// **'If an account exists for {email}, you’ll receive a reset link shortly. Open it to choose a new password.'**
  String forgot_password_sent_body(String email);

  /// No description provided for @forgot_password_back_to_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Back to Sign in'**
  String get forgot_password_back_to_sign_in;

  /// No description provided for @email_registration_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get email_registration_invalid_email;

  /// No description provided for @email_registration_role_mismatch.
  ///
  /// In en, this message translates to:
  /// **'This email belongs to a {role} account. Go back and choose the matching role, or use a different email.'**
  String email_registration_role_mismatch(String role);

  /// No description provided for @email_registration_checking_email.
  ///
  /// In en, this message translates to:
  /// **'Checking email…'**
  String get email_registration_checking_email;

  /// No description provided for @listener_reg_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get listener_reg_continue;

  /// No description provided for @listener_reg_skip_for_now.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
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
  /// **'Let\'s set up your account'**
  String get listener_reg_step1_title;

  /// No description provided for @listener_reg_step1_subtitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re joining as a listener'**
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
  /// **'Full Name'**
  String get listener_reg_full_name;

  /// No description provided for @listener_reg_full_name_hint.
  ///
  /// In en, this message translates to:
  /// **'e.g. John Doe'**
  String get listener_reg_full_name_hint;

  /// No description provided for @listener_reg_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get listener_reg_email;

  /// No description provided for @listener_reg_email_hint.
  ///
  /// In en, this message translates to:
  /// **'e.g. johndoe@gmail.com'**
  String get listener_reg_email_hint;

  /// No description provided for @listener_reg_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get listener_reg_phone;

  /// No description provided for @listener_reg_phone_hint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 345566789'**
  String get listener_reg_phone_hint;

  /// No description provided for @listener_reg_invalid_phone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number for the selected country'**
  String get listener_reg_invalid_phone;

  /// No description provided for @listener_reg_select_country.
  ///
  /// In en, this message translates to:
  /// **'Select Country'**
  String get listener_reg_select_country;

  /// No description provided for @listener_reg_search_country.
  ///
  /// In en, this message translates to:
  /// **'Search by country or code'**
  String get listener_reg_search_country;

  /// No description provided for @listener_reg_agree_prefix.
  ///
  /// In en, this message translates to:
  /// **'I agree to '**
  String get listener_reg_agree_prefix;

  /// No description provided for @listener_reg_terms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get listener_reg_terms;

  /// No description provided for @listener_reg_terms_link.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get listener_reg_terms_link;

  /// No description provided for @listener_reg_agree_and.
  ///
  /// In en, this message translates to:
  /// **' & '**
  String get listener_reg_agree_and;

  /// No description provided for @listener_reg_privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get listener_reg_privacy;

  /// No description provided for @listener_reg_privacy_link.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get listener_reg_privacy_link;

  /// No description provided for @listener_reg_step1_footer.
  ///
  /// In en, this message translates to:
  /// **'Your data is encrypted · Never shared with third parties.\nYou control what\'s visible on your profile.'**
  String get listener_reg_step1_footer;

  /// No description provided for @listener_reg_boundaries_title.
  ///
  /// In en, this message translates to:
  /// **'Select your Boundaries'**
  String get listener_reg_boundaries_title;

  /// No description provided for @listener_reg_boundaries_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Topics you prefer not to discuss. We respect your choice.'**
  String get listener_reg_boundaries_subtitle;

  /// No description provided for @catalog_boundaries_load_error.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load boundaries.'**
  String get catalog_boundaries_load_error;

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

  /// No description provided for @listener_reg_boundary_other_hint.
  ///
  /// In en, this message translates to:
  /// **'Please specify'**
  String get listener_reg_boundary_other_hint;

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
  /// **'Date of Birth'**
  String get listener_reg_date_of_birth;

  /// No description provided for @listener_reg_select_date.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
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
  /// **'Enter your City'**
  String get listener_reg_enter_city;

  /// No description provided for @listener_reg_languages_you_speak.
  ///
  /// In en, this message translates to:
  /// **'Languages you speak'**
  String get listener_reg_languages_you_speak;

  /// No description provided for @listener_reg_select_languages.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get listener_reg_select_languages;

  /// No description provided for @listener_reg_search_language.
  ///
  /// In en, this message translates to:
  /// **'Search languages'**
  String get listener_reg_search_language;

  /// No description provided for @listener_reg_must_be_18.
  ///
  /// In en, this message translates to:
  /// **'You must be at least 18 years old'**
  String get listener_reg_must_be_18;

  /// No description provided for @listener_reg_done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get listener_reg_done;

  /// No description provided for @listener_reg_areas_title.
  ///
  /// In en, this message translates to:
  /// **'What would you like to listen to?'**
  String get listener_reg_areas_title;

  /// No description provided for @listener_reg_areas_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Topics you\'re comfortable supporting others with.'**
  String get listener_reg_areas_subtitle;

  /// No description provided for @listener_reg_areas_topics_selected.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 topic selected} =1{1 topic selected} other{{count} topics selected}}'**
  String listener_reg_areas_topics_selected(int count);

  /// No description provided for @catalog_categories_load_error.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load topics.'**
  String get catalog_categories_load_error;

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

  /// No description provided for @listener_reg_area_other_hint.
  ///
  /// In en, this message translates to:
  /// **'Please specify'**
  String get listener_reg_area_other_hint;

  /// No description provided for @listener_reg_voice_title.
  ///
  /// In en, this message translates to:
  /// **'Record your Introduction'**
  String get listener_reg_voice_title;

  /// No description provided for @listener_reg_voice_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Venters hear this before booking. Make it warm.'**
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

  /// No description provided for @listener_reg_avail_manage_later_note.
  ///
  /// In en, this message translates to:
  /// **'You can manage your availability in more detail from inside the app after you finish registration.'**
  String get listener_reg_avail_manage_later_note;

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
  /// **'Helps people find someone who truly understands.'**
  String get listener_reg_experience_subtitle;

  /// No description provided for @listener_reg_exp_section_relationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship Status'**
  String get listener_reg_exp_section_relationship;

  /// No description provided for @listener_reg_exp_section_family.
  ///
  /// In en, this message translates to:
  /// **'Family Role'**
  String get listener_reg_exp_section_family;

  /// No description provided for @listener_reg_exp_section_experiences.
  ///
  /// In en, this message translates to:
  /// **'Life Experiences'**
  String get listener_reg_exp_section_experiences;

  /// No description provided for @listener_reg_exp_single.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get listener_reg_exp_single;

  /// No description provided for @listener_reg_exp_in_relationship.
  ///
  /// In en, this message translates to:
  /// **'In relationship'**
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
  /// **'Single Parent'**
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

  /// No description provided for @listener_reg_exp_load_error.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load life experiences.'**
  String get listener_reg_exp_load_error;

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

  /// No description provided for @listener_reg_identity_title.
  ///
  /// In en, this message translates to:
  /// **'Verify your identity'**
  String get listener_reg_identity_title;

  /// No description provided for @listener_reg_identity_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Keeps our community safe & trusted'**
  String get listener_reg_identity_subtitle;

  /// No description provided for @listener_reg_identity_upload_id_title.
  ///
  /// In en, this message translates to:
  /// **'Upload Govt. ID'**
  String get listener_reg_identity_upload_id_title;

  /// No description provided for @listener_reg_identity_upload_id_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Passport. Driver license'**
  String get listener_reg_identity_upload_id_subtitle;

  /// No description provided for @listener_reg_identity_selfie_title.
  ///
  /// In en, this message translates to:
  /// **'Take a Selfie'**
  String get listener_reg_identity_selfie_title;

  /// No description provided for @listener_reg_identity_selfie_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Face clearly Visible'**
  String get listener_reg_identity_selfie_subtitle;

  /// No description provided for @listener_reg_identity_how_title.
  ///
  /// In en, this message translates to:
  /// **'HOW VERIFICATION WORKS'**
  String get listener_reg_identity_how_title;

  /// No description provided for @listener_reg_identity_how_step1.
  ///
  /// In en, this message translates to:
  /// **'Upload your ID document'**
  String get listener_reg_identity_how_step1;

  /// No description provided for @listener_reg_identity_how_step2.
  ///
  /// In en, this message translates to:
  /// **'Take a matching selfie'**
  String get listener_reg_identity_how_step2;

  /// No description provided for @listener_reg_identity_how_step3.
  ///
  /// In en, this message translates to:
  /// **'We verify within 24 hours'**
  String get listener_reg_identity_how_step3;

  /// No description provided for @listener_reg_identity_secure_note.
  ///
  /// In en, this message translates to:
  /// **'Upload both to Continue'**
  String get listener_reg_identity_secure_note;

  /// No description provided for @listener_profile_under_review_title.
  ///
  /// In en, this message translates to:
  /// **'Your profile is under review'**
  String get listener_profile_under_review_title;

  /// No description provided for @listener_profile_under_review_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Our team is reviewing your info to ensure a safe and trusted community.'**
  String get listener_profile_under_review_subtitle;

  /// No description provided for @listener_profile_review_time_title.
  ///
  /// In en, this message translates to:
  /// **'Review time'**
  String get listener_profile_review_time_title;

  /// No description provided for @listener_profile_review_time_body.
  ///
  /// In en, this message translates to:
  /// **'Usually takes 24–48 hours. We\'ll notify you right away.'**
  String get listener_profile_review_time_body;

  /// No description provided for @listener_profile_what_happens_next_title.
  ///
  /// In en, this message translates to:
  /// **'What happens Next'**
  String get listener_profile_what_happens_next_title;

  /// No description provided for @listener_profile_what_happens_next_1.
  ///
  /// In en, this message translates to:
  /// **'Team reviews your submission'**
  String get listener_profile_what_happens_next_1;

  /// No description provided for @listener_profile_what_happens_next_2.
  ///
  /// In en, this message translates to:
  /// **'You get a notification on approval'**
  String get listener_profile_what_happens_next_2;

  /// No description provided for @listener_profile_what_happens_next_3.
  ///
  /// In en, this message translates to:
  /// **'Your profile goes live for Venters'**
  String get listener_profile_what_happens_next_3;

  /// No description provided for @listener_profile_what_happens_next_4.
  ///
  /// In en, this message translates to:
  /// **'First session requests arrive'**
  String get listener_profile_what_happens_next_4;

  /// No description provided for @listener_profile_got_it.
  ///
  /// In en, this message translates to:
  /// **'Got it!'**
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
  /// **'Stay in the loop'**
  String get listener_reg_notif_title;

  /// No description provided for @listener_reg_notif_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Get notified when your profile is approved, sessions are booked, and rewards are ready.'**
  String get listener_reg_notif_subtitle;

  /// No description provided for @listener_reg_notif_about_title.
  ///
  /// In en, this message translates to:
  /// **'You will be notified about'**
  String get listener_reg_notif_about_title;

  /// No description provided for @listener_reg_notif_about_1.
  ///
  /// In en, this message translates to:
  /// **'Profile approval status'**
  String get listener_reg_notif_about_1;

  /// No description provided for @listener_reg_notif_about_2.
  ///
  /// In en, this message translates to:
  /// **'Incoming session requests'**
  String get listener_reg_notif_about_2;

  /// No description provided for @listener_reg_notif_about_3.
  ///
  /// In en, this message translates to:
  /// **'Earnings & payout updates'**
  String get listener_reg_notif_about_3;

  /// No description provided for @listener_reg_notif_about_4.
  ///
  /// In en, this message translates to:
  /// **'Reward milestones'**
  String get listener_reg_notif_about_4;

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

  /// No description provided for @listener_reg_submit_title.
  ///
  /// In en, this message translates to:
  /// **'Submitting your profile'**
  String get listener_reg_submit_title;

  /// No description provided for @listener_reg_submit_subtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'re securely uploading your details. This may take a moment — please keep the app open.'**
  String get listener_reg_submit_subtitle;

  /// No description provided for @listener_reg_submit_progress_title.
  ///
  /// In en, this message translates to:
  /// **'What we\'re sending'**
  String get listener_reg_submit_progress_title;

  /// No description provided for @listener_reg_submit_progress_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile photo, contact info, and about you'**
  String get listener_reg_submit_progress_profile;

  /// No description provided for @listener_reg_submit_progress_identity.
  ///
  /// In en, this message translates to:
  /// **'Identity verification documents'**
  String get listener_reg_submit_progress_identity;

  /// No description provided for @listener_reg_submit_progress_voice.
  ///
  /// In en, this message translates to:
  /// **'Voice introduction and experiences'**
  String get listener_reg_submit_progress_voice;

  /// No description provided for @listener_reg_submit_progress_preferences.
  ///
  /// In en, this message translates to:
  /// **'Availability and notification preferences'**
  String get listener_reg_submit_progress_preferences;

  /// No description provided for @listener_reg_submit_error_title.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t submit your profile'**
  String get listener_reg_submit_error_title;

  /// No description provided for @listener_reg_submit_error_generic.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while submitting your profile. Please try again.'**
  String get listener_reg_submit_error_generic;

  /// No description provided for @listener_reg_submit_error_hint.
  ///
  /// In en, this message translates to:
  /// **'Check your connection and try again. Your answers are saved — you won\'t need to re-enter them.'**
  String get listener_reg_submit_error_hint;

  /// No description provided for @listener_reg_submit_back_to_notifications.
  ///
  /// In en, this message translates to:
  /// **'Back to notifications'**
  String get listener_reg_submit_back_to_notifications;

  /// No description provided for @listener_reg_submit_retrying.
  ///
  /// In en, this message translates to:
  /// **'Retry attempt {attempt}'**
  String listener_reg_submit_retrying(int attempt);

  /// No description provided for @ventor_reg_title.
  ///
  /// In en, this message translates to:
  /// **'What should we Call you?'**
  String get ventor_reg_title;

  /// No description provided for @ventor_reg_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Listeners will see this. Stay anonymous — your real name is never required.'**
  String get ventor_reg_subtitle;

  /// No description provided for @ventor_reg_nickname_label.
  ///
  /// In en, this message translates to:
  /// **'Your Nick Name'**
  String get ventor_reg_nickname_label;

  /// No description provided for @ventor_reg_nickname_hint.
  ///
  /// In en, this message translates to:
  /// **'e.g. johndoe'**
  String get ventor_reg_nickname_hint;

  /// No description provided for @ventor_reg_nickname_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter a nickname'**
  String get ventor_reg_nickname_required;

  /// No description provided for @ventor_reg_suggestions_label.
  ///
  /// In en, this message translates to:
  /// **'Try one of these'**
  String get ventor_reg_suggestions_label;

  /// No description provided for @ventor_reg_suggestion_1.
  ///
  /// In en, this message translates to:
  /// **'QuietSoul'**
  String get ventor_reg_suggestion_1;

  /// No description provided for @ventor_reg_suggestion_2.
  ///
  /// In en, this message translates to:
  /// **'SoftRain'**
  String get ventor_reg_suggestion_2;

  /// No description provided for @ventor_reg_suggestion_3.
  ///
  /// In en, this message translates to:
  /// **'NightOwl'**
  String get ventor_reg_suggestion_3;

  /// No description provided for @ventor_reg_suggestion_4.
  ///
  /// In en, this message translates to:
  /// **'CalmWave'**
  String get ventor_reg_suggestion_4;

  /// No description provided for @ventor_reg_suggestion_5.
  ///
  /// In en, this message translates to:
  /// **'GentleSky'**
  String get ventor_reg_suggestion_5;

  /// No description provided for @ventor_reg_gender_label.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get ventor_reg_gender_label;

  /// No description provided for @ventor_reg_gender_male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get ventor_reg_gender_male;

  /// No description provided for @ventor_reg_gender_female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get ventor_reg_gender_female;

  /// No description provided for @ventor_reg_gender_prefer_not.
  ///
  /// In en, this message translates to:
  /// **'Not prefer'**
  String get ventor_reg_gender_prefer_not;

  /// No description provided for @ventor_reg_gender_required.
  ///
  /// In en, this message translates to:
  /// **'Please select a gender option'**
  String get ventor_reg_gender_required;

  /// No description provided for @ventor_reg_avatar_label.
  ///
  /// In en, this message translates to:
  /// **'Pick an Avatar'**
  String get ventor_reg_avatar_label;

  /// No description provided for @ventor_reg_avatar_gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get ventor_reg_avatar_gallery;

  /// No description provided for @ventor_reg_change_anytime.
  ///
  /// In en, this message translates to:
  /// **'You can change this anytime in settings'**
  String get ventor_reg_change_anytime;

  /// No description provided for @ventor_reg_interests_title.
  ///
  /// In en, this message translates to:
  /// **'What\'s on your mind?'**
  String get ventor_reg_interests_title;

  /// No description provided for @ventor_reg_interests_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick topics. We\'ll match you with the right listeners instantly.'**
  String get ventor_reg_interests_subtitle;

  /// No description provided for @ventor_reg_interest_relationships.
  ///
  /// In en, this message translates to:
  /// **'Relationships'**
  String get ventor_reg_interest_relationships;

  /// No description provided for @ventor_reg_interest_marriage.
  ///
  /// In en, this message translates to:
  /// **'Marriage'**
  String get ventor_reg_interest_marriage;

  /// No description provided for @ventor_reg_interest_parenting.
  ///
  /// In en, this message translates to:
  /// **'Parenting'**
  String get ventor_reg_interest_parenting;

  /// No description provided for @ventor_reg_interest_career_work.
  ///
  /// In en, this message translates to:
  /// **'Career & Work'**
  String get ventor_reg_interest_career_work;

  /// No description provided for @ventor_reg_interest_stress_anxiety.
  ///
  /// In en, this message translates to:
  /// **'Stress & Anxiety'**
  String get ventor_reg_interest_stress_anxiety;

  /// No description provided for @ventor_reg_interest_loneliness.
  ///
  /// In en, this message translates to:
  /// **'Loneliness'**
  String get ventor_reg_interest_loneliness;

  /// No description provided for @ventor_reg_interest_student_life.
  ///
  /// In en, this message translates to:
  /// **'Student Life'**
  String get ventor_reg_interest_student_life;

  /// No description provided for @ventor_reg_interest_financial_stress.
  ///
  /// In en, this message translates to:
  /// **'Financial Stress'**
  String get ventor_reg_interest_financial_stress;

  /// No description provided for @ventor_reg_interest_health_wellness.
  ///
  /// In en, this message translates to:
  /// **'Health & Wellness'**
  String get ventor_reg_interest_health_wellness;

  /// No description provided for @ventor_reg_interest_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get ventor_reg_interest_other;

  /// No description provided for @ventor_reg_interest_other_hint.
  ///
  /// In en, this message translates to:
  /// **'Please specify'**
  String get ventor_reg_interest_other_hint;

  /// No description provided for @ventor_reg_finish.
  ///
  /// In en, this message translates to:
  /// **'Find my listeners'**
  String get ventor_reg_finish;

  /// No description provided for @ventor_reg_notif_title.
  ///
  /// In en, this message translates to:
  /// **'Stay in the loop'**
  String get ventor_reg_notif_title;

  /// No description provided for @ventor_reg_notif_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Get notified when listeners accept your session, reminders are due, and rewards are ready.'**
  String get ventor_reg_notif_subtitle;

  /// No description provided for @ventor_reg_notif_about_title.
  ///
  /// In en, this message translates to:
  /// **'You will be notified about'**
  String get ventor_reg_notif_about_title;

  /// No description provided for @ventor_reg_notif_about_1.
  ///
  /// In en, this message translates to:
  /// **'Session acceptances and reminders'**
  String get ventor_reg_notif_about_1;

  /// No description provided for @ventor_reg_notif_about_2.
  ///
  /// In en, this message translates to:
  /// **'Upcoming booked sessions'**
  String get ventor_reg_notif_about_2;

  /// No description provided for @ventor_reg_notif_about_3.
  ///
  /// In en, this message translates to:
  /// **'Rewards and promo updates'**
  String get ventor_reg_notif_about_3;

  /// No description provided for @ventor_reg_notif_about_4.
  ///
  /// In en, this message translates to:
  /// **'Important account updates'**
  String get ventor_reg_notif_about_4;

  /// No description provided for @ventor_reg_notif_enable.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get ventor_reg_notif_enable;

  /// No description provided for @ventor_reg_interests_selected_footer.
  ///
  /// In en, this message translates to:
  /// **'{count} selected, you can change this later'**
  String ventor_reg_interests_selected_footer(int count);

  /// No description provided for @ventor_reg_language_title.
  ///
  /// In en, this message translates to:
  /// **'Choose your Language'**
  String get ventor_reg_language_title;

  /// No description provided for @ventor_reg_language_subtitle.
  ///
  /// In en, this message translates to:
  /// **'You can change the app language at any time from settings.'**
  String get ventor_reg_language_subtitle;

  /// No description provided for @ventor_reg_language_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search language'**
  String get ventor_reg_language_search_hint;

  /// No description provided for @ventor_reg_language_continue.
  ///
  /// In en, this message translates to:
  /// **'Save & Continue'**
  String get ventor_reg_language_continue;

  /// No description provided for @ventor_reg_language_empty.
  ///
  /// In en, this message translates to:
  /// **'No languages found'**
  String get ventor_reg_language_empty;

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
  /// **'Hourly rate'**
  String get listener_earnings_rate;

  /// No description provided for @listener_earnings_overview.
  ///
  /// In en, this message translates to:
  /// **'Earnings Overview'**
  String get listener_earnings_overview;

  /// No description provided for @listener_earnings_payout_methods.
  ///
  /// In en, this message translates to:
  /// **'Payout Methods'**
  String get listener_earnings_payout_methods;

  /// No description provided for @listener_earnings_payout_empty_title.
  ///
  /// In en, this message translates to:
  /// **'Add a payout method'**
  String get listener_earnings_payout_empty_title;

  /// No description provided for @listener_earnings_payout_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Link your bank or PayPal account so you\'re ready to cash out your earnings.'**
  String get listener_earnings_payout_empty_subtitle;

  /// No description provided for @listener_earnings_payout_empty_action.
  ///
  /// In en, this message translates to:
  /// **'Set up'**
  String get listener_earnings_payout_empty_action;

  /// No description provided for @listener_earnings_default.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get listener_earnings_default;

  /// No description provided for @listener_earnings_tiers_title.
  ///
  /// In en, this message translates to:
  /// **'Hourly rate tiers'**
  String get listener_earnings_tiers_title;

  /// No description provided for @listener_earnings_tiers_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your hourly rate is based on completed sessions and your average rating. Meet both requirements to unlock a tier.'**
  String get listener_earnings_tiers_subtitle;

  /// No description provided for @listener_earnings_tiers_stats.
  ///
  /// In en, this message translates to:
  /// **'Your stats: {sessions} sessions · {rating} rating'**
  String listener_earnings_tiers_stats(int sessions, String rating);

  /// No description provided for @listener_earnings_your_tier.
  ///
  /// In en, this message translates to:
  /// **'Your current tier'**
  String get listener_earnings_your_tier;

  /// No description provided for @listener_earnings_tier_requirement.
  ///
  /// In en, this message translates to:
  /// **'{sessions}+ sessions · {rating}+ rating'**
  String listener_earnings_tier_requirement(int sessions, String rating);

  /// No description provided for @listener_earnings_tier_requirement_starter.
  ///
  /// In en, this message translates to:
  /// **'Open to all listeners'**
  String get listener_earnings_tier_requirement_starter;

  /// No description provided for @listener_earnings_hourly_value.
  ///
  /// In en, this message translates to:
  /// **'{amount}/hr'**
  String listener_earnings_hourly_value(String amount);

  /// No description provided for @listener_earnings_tier_starter.
  ///
  /// In en, this message translates to:
  /// **'Starter'**
  String get listener_earnings_tier_starter;

  /// No description provided for @listener_earnings_tier_rising.
  ///
  /// In en, this message translates to:
  /// **'Rising'**
  String get listener_earnings_tier_rising;

  /// No description provided for @listener_earnings_tier_trusted.
  ///
  /// In en, this message translates to:
  /// **'Trusted'**
  String get listener_earnings_tier_trusted;

  /// No description provided for @listener_earnings_tier_expert.
  ///
  /// In en, this message translates to:
  /// **'Expert'**
  String get listener_earnings_tier_expert;

  /// No description provided for @listener_earnings_tier_elite.
  ///
  /// In en, this message translates to:
  /// **'Elite'**
  String get listener_earnings_tier_elite;

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

  /// No description provided for @listener_profile_about_me_empty.
  ///
  /// In en, this message translates to:
  /// **'Add your about me. Tap Edit to write a short introduction.'**
  String get listener_profile_about_me_empty;

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

  /// No description provided for @listener_profile_settings_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get listener_profile_settings_phone;

  /// No description provided for @listener_profile_settings_payout_methods.
  ///
  /// In en, this message translates to:
  /// **'Payout Methods'**
  String get listener_profile_settings_payout_methods;

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

  /// No description provided for @listener_privacy_profile_visible.
  ///
  /// In en, this message translates to:
  /// **'Show my profile in the app'**
  String get listener_privacy_profile_visible;

  /// No description provided for @listener_privacy_profile_visible_sub.
  ///
  /// In en, this message translates to:
  /// **'Turn off to hide your profile from ventors'**
  String get listener_privacy_profile_visible_sub;

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

  /// No description provided for @listener_payout_pending_balance.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get listener_payout_pending_balance;

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

  /// No description provided for @listener_payout_method_saved.
  ///
  /// In en, this message translates to:
  /// **'Payout method saved.'**
  String get listener_payout_method_saved;

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

  /// No description provided for @ventor_rewards_title.
  ///
  /// In en, this message translates to:
  /// **'Rewards & Discounts'**
  String get ventor_rewards_title;

  /// No description provided for @ventor_rewards_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Use your points to get amazing benefits.'**
  String get ventor_rewards_subtitle;

  /// No description provided for @ventor_rewards_pts.
  ///
  /// In en, this message translates to:
  /// **'{points} pts'**
  String ventor_rewards_pts(String points);

  /// No description provided for @ventor_rewards_active_saving.
  ///
  /// In en, this message translates to:
  /// **'You’re saving {percent}% on your next session.'**
  String ventor_rewards_active_saving(int percent);

  /// No description provided for @ventor_rewards_active_saving_tier.
  ///
  /// In en, this message translates to:
  /// **'You’re saving {percent}% with {audience} on your next session.'**
  String ventor_rewards_active_saving_tier(int percent, String audience);

  /// No description provided for @ventor_rewards_active_free_session.
  ///
  /// In en, this message translates to:
  /// **'Your next {minutes}-min session is free.'**
  String ventor_rewards_active_free_session(int minutes);

  /// No description provided for @ventor_rewards_active_priority.
  ///
  /// In en, this message translates to:
  /// **'Priority match is on for your next session.'**
  String get ventor_rewards_active_priority;

  /// No description provided for @ventor_rewards_available.
  ///
  /// In en, this message translates to:
  /// **'Available Rewards'**
  String get ventor_rewards_available;

  /// No description provided for @ventor_rewards_tab_available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get ventor_rewards_tab_available;

  /// No description provided for @ventor_rewards_tab_history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get ventor_rewards_tab_history;

  /// No description provided for @ventor_rewards_earn_more.
  ///
  /// In en, this message translates to:
  /// **'How to earn more points'**
  String get ventor_rewards_earn_more;

  /// No description provided for @ventor_rewards_trade_history.
  ///
  /// In en, this message translates to:
  /// **'Trade history'**
  String get ventor_rewards_trade_history;

  /// No description provided for @ventor_rewards_trade_empty.
  ///
  /// In en, this message translates to:
  /// **'No trades yet. Redeem an offer to see it here.'**
  String get ventor_rewards_trade_empty;

  /// No description provided for @ventor_rewards_trade_unknown.
  ///
  /// In en, this message translates to:
  /// **'Session discount'**
  String get ventor_rewards_trade_unknown;

  /// No description provided for @ventor_rewards_not_enough.
  ///
  /// In en, this message translates to:
  /// **'You need more points for this offer.'**
  String get ventor_rewards_not_enough;

  /// No description provided for @ventor_rewards_redeemed.
  ///
  /// In en, this message translates to:
  /// **'Reward applied to your next session.'**
  String get ventor_rewards_redeemed;

  /// No description provided for @ventor_rewards_already_active.
  ///
  /// In en, this message translates to:
  /// **'This reward is already active.'**
  String get ventor_rewards_already_active;

  /// No description provided for @ventor_rewards_welcome_used.
  ///
  /// In en, this message translates to:
  /// **'Your first-call 50% gift has already been used.'**
  String get ventor_rewards_welcome_used;

  /// No description provided for @ventor_rewards_first_call_gift.
  ///
  /// In en, this message translates to:
  /// **'After your first call you unlocked 50% off your next session.'**
  String get ventor_rewards_first_call_gift;

  /// No description provided for @ventor_rewards_welcome_title.
  ///
  /// In en, this message translates to:
  /// **'50% off your next session'**
  String get ventor_rewards_welcome_title;

  /// No description provided for @ventor_rewards_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get ventor_rewards_active;

  /// No description provided for @ventor_rewards_used.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get ventor_rewards_used;

  /// No description provided for @ventor_rewards_unlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get ventor_rewards_unlocked;

  /// No description provided for @ventor_rewards_offer_percent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Off'**
  String ventor_rewards_offer_percent(int percent);

  /// No description provided for @ventor_rewards_offer_free_minutes.
  ///
  /// In en, this message translates to:
  /// **'Free {minutes}-min Session'**
  String ventor_rewards_offer_free_minutes(int minutes);

  /// No description provided for @ventor_rewards_offer_priority.
  ///
  /// In en, this message translates to:
  /// **'Priority Match'**
  String get ventor_rewards_offer_priority;

  /// No description provided for @ventor_rewards_offer_welcome_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Gift after your first call'**
  String get ventor_rewards_offer_welcome_subtitle;

  /// No description provided for @ventor_rewards_audience_any.
  ///
  /// In en, this message translates to:
  /// **'Any session'**
  String get ventor_rewards_audience_any;

  /// No description provided for @ventor_rewards_audience_elite.
  ///
  /// In en, this message translates to:
  /// **'Elite listeners'**
  String get ventor_rewards_audience_elite;

  /// No description provided for @ventor_rewards_audience_trusted_up.
  ///
  /// In en, this message translates to:
  /// **'Trusted listeners & up'**
  String get ventor_rewards_audience_trusted_up;

  /// No description provided for @ventor_rewards_audience_starter_rising.
  ///
  /// In en, this message translates to:
  /// **'Starter & Rising listeners'**
  String get ventor_rewards_audience_starter_rising;

  /// No description provided for @ventor_rewards_audience_min_tier.
  ///
  /// In en, this message translates to:
  /// **'{tier} listeners & up'**
  String ventor_rewards_audience_min_tier(String tier);

  /// No description provided for @ventor_rewards_earn_title.
  ///
  /// In en, this message translates to:
  /// **'How to earn points'**
  String get ventor_rewards_earn_title;

  /// No description provided for @ventor_rewards_earn_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Four ways to grow your balance and unlock session discounts.'**
  String get ventor_rewards_earn_subtitle;

  /// No description provided for @ventor_rewards_earn_sessions_title.
  ///
  /// In en, this message translates to:
  /// **'Have more sessions'**
  String get ventor_rewards_earn_sessions_title;

  /// No description provided for @ventor_rewards_earn_sessions_body.
  ///
  /// In en, this message translates to:
  /// **'Earn {points} points every time you complete a session.'**
  String ventor_rewards_earn_sessions_body(int points);

  /// No description provided for @ventor_rewards_earn_invite_title.
  ///
  /// In en, this message translates to:
  /// **'Invite friends'**
  String get ventor_rewards_earn_invite_title;

  /// No description provided for @ventor_rewards_earn_invite_body.
  ///
  /// In en, this message translates to:
  /// **'Share your code. You get {registerPoints} points when they register, and you both get {firstCallPoints} points after their first call.'**
  String ventor_rewards_earn_invite_body(
    int registerPoints,
    int firstCallPoints,
  );

  /// No description provided for @ventor_rewards_earn_booking_title.
  ///
  /// In en, this message translates to:
  /// **'Your friend books a call'**
  String get ventor_rewards_earn_booking_title;

  /// No description provided for @ventor_rewards_earn_booking_body.
  ///
  /// In en, this message translates to:
  /// **'Get {points} extra points when a friend you invited books a session.'**
  String ventor_rewards_earn_booking_body(int points);

  /// No description provided for @ventor_rewards_earn_buy_title.
  ///
  /// In en, this message translates to:
  /// **'Buy points'**
  String get ventor_rewards_earn_buy_title;

  /// No description provided for @ventor_rewards_earn_buy_body.
  ///
  /// In en, this message translates to:
  /// **'Purchase point packs anytime and redeem them in Rewards for free sessions or discounts.'**
  String get ventor_rewards_earn_buy_body;

  /// No description provided for @ventor_rewards_earn_invite_cta.
  ///
  /// In en, this message translates to:
  /// **'Invite friends'**
  String get ventor_rewards_earn_invite_cta;

  /// No description provided for @ventor_points_buy_title.
  ///
  /// In en, this message translates to:
  /// **'Buy points'**
  String get ventor_points_buy_title;

  /// No description provided for @ventor_points_buy_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Top up your balance and redeem points in Rewards for free minutes or session discounts.'**
  String get ventor_points_buy_subtitle;

  /// No description provided for @ventor_points_buy_cta.
  ///
  /// In en, this message translates to:
  /// **'Buy points'**
  String get ventor_points_buy_cta;

  /// No description provided for @ventor_points_buy_example.
  ///
  /// In en, this message translates to:
  /// **'Redeem points in Rewards for free sessions (30, 45, or 60 min) or percentage discounts — costs depend on the offer.'**
  String get ventor_points_buy_example;

  /// No description provided for @ventor_points_package_price.
  ///
  /// In en, this message translates to:
  /// **'\${price}'**
  String ventor_points_package_price(String price);

  /// No description provided for @ventor_points_package_bonus.
  ///
  /// In en, this message translates to:
  /// **'+{percent}% bonus'**
  String ventor_points_package_bonus(int percent);

  /// No description provided for @ventor_points_purchase_success.
  ///
  /// In en, this message translates to:
  /// **'{points} points added to your balance.'**
  String ventor_points_purchase_success(String points);

  /// No description provided for @ventor_points_purchase_redeem_cta.
  ///
  /// In en, this message translates to:
  /// **'Redeem'**
  String get ventor_points_purchase_redeem_cta;

  /// No description provided for @ventor_points_home_title.
  ///
  /// In en, this message translates to:
  /// **'Points & rewards'**
  String get ventor_points_home_title;

  /// No description provided for @ventor_points_home_body.
  ///
  /// In en, this message translates to:
  /// **'Buy points and redeem them in Rewards for free sessions (30, 45, or 60 min) or session discounts.'**
  String get ventor_points_home_body;

  /// No description provided for @ventor_points_home_buy_cta.
  ///
  /// In en, this message translates to:
  /// **'Buy points'**
  String get ventor_points_home_buy_cta;

  /// No description provided for @ventor_points_home_redeem_cta.
  ///
  /// In en, this message translates to:
  /// **'Redeem'**
  String get ventor_points_home_redeem_cta;

  /// No description provided for @ventor_invite_title.
  ///
  /// In en, this message translates to:
  /// **'Invite Friends. Earn More.'**
  String get ventor_invite_title;

  /// No description provided for @ventor_invite_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Help others find support and get rewarded.'**
  String get ventor_invite_subtitle;

  /// No description provided for @ventor_invite_promo.
  ///
  /// In en, this message translates to:
  /// **'Give support. Get rewarded. Invite a friend — you get {registerPoints} points when they register, and you both get {firstCallPoints} points after their first call.'**
  String ventor_invite_promo(int registerPoints, int firstCallPoints);

  /// No description provided for @ventor_invite_your_code.
  ///
  /// In en, this message translates to:
  /// **'YOUR CODE'**
  String get ventor_invite_your_code;

  /// No description provided for @ventor_invite_copied.
  ///
  /// In en, this message translates to:
  /// **'Invite code copied'**
  String get ventor_invite_copied;

  /// No description provided for @ventor_invite_link_copied.
  ///
  /// In en, this message translates to:
  /// **'Invite link copied'**
  String get ventor_invite_link_copied;

  /// No description provided for @ventor_invite_share_title.
  ///
  /// In en, this message translates to:
  /// **'Share your invite link'**
  String get ventor_invite_share_title;

  /// No description provided for @ventor_invite_share_failed.
  ///
  /// In en, this message translates to:
  /// **'Could not open the share app.'**
  String get ventor_invite_share_failed;

  /// No description provided for @ventor_invite_instagram_hint.
  ///
  /// In en, this message translates to:
  /// **'Link copied — paste it in Instagram.'**
  String get ventor_invite_instagram_hint;

  /// No description provided for @ventor_invite_history_cta.
  ///
  /// In en, this message translates to:
  /// **'See Invite History'**
  String get ventor_invite_history_cta;

  /// No description provided for @ventor_invite_how_title.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get ventor_invite_how_title;

  /// No description provided for @ventor_invite_how_1.
  ///
  /// In en, this message translates to:
  /// **'Share your unique code or link.'**
  String get ventor_invite_how_1;

  /// No description provided for @ventor_invite_how_2.
  ///
  /// In en, this message translates to:
  /// **'Your friend registers in the app — you get {points} points.'**
  String ventor_invite_how_2(int points);

  /// No description provided for @ventor_invite_how_3.
  ///
  /// In en, this message translates to:
  /// **'When your friend has their first call, you both get {points} points.'**
  String ventor_invite_how_3(int points);

  /// No description provided for @ventor_invite_summary_title.
  ///
  /// In en, this message translates to:
  /// **'Your Invites'**
  String get ventor_invite_summary_title;

  /// No description provided for @ventor_invite_total.
  ///
  /// In en, this message translates to:
  /// **'Total invited: {count} friends'**
  String ventor_invite_total(int count);

  /// No description provided for @ventor_invite_points_earned.
  ///
  /// In en, this message translates to:
  /// **'Points earned: {points} pts'**
  String ventor_invite_points_earned(String points);

  /// No description provided for @ventor_invite_share_message.
  ///
  /// In en, this message translates to:
  /// **'Join me on Venting. Use my code {code} to get started: {link}'**
  String ventor_invite_share_message(String code, String link);

  /// No description provided for @ventor_invite_history_title.
  ///
  /// In en, this message translates to:
  /// **'Invite History'**
  String get ventor_invite_history_title;

  /// No description provided for @ventor_invite_history_empty.
  ///
  /// In en, this message translates to:
  /// **'No invites yet. Share your code to get started.'**
  String get ventor_invite_history_empty;

  /// No description provided for @ventor_invite_status_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get ventor_invite_status_pending;

  /// No description provided for @ventor_invite_status_joined.
  ///
  /// In en, this message translates to:
  /// **'Registered'**
  String get ventor_invite_status_joined;

  /// No description provided for @ventor_invite_status_first_session.
  ///
  /// In en, this message translates to:
  /// **'First call done'**
  String get ventor_invite_status_first_session;

  /// No description provided for @ventor_invite_status_booked.
  ///
  /// In en, this message translates to:
  /// **'Booked a call'**
  String get ventor_invite_status_booked;

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

  /// No description provided for @ventor_profile_day_streak.
  ///
  /// In en, this message translates to:
  /// **'Days Streak'**
  String get ventor_profile_day_streak;

  /// No description provided for @ventor_profile_progress_summary.
  ///
  /// In en, this message translates to:
  /// **'Progress Summary'**
  String get ventor_profile_progress_summary;

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

  /// No description provided for @ventor_profile_see_all.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get ventor_profile_see_all;

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

  /// No description provided for @ventor_profile_add_favorite_total.
  ///
  /// In en, this message translates to:
  /// **'Total ({count})'**
  String ventor_profile_add_favorite_total(int count);

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

  /// No description provided for @ventor_profile_settings_section_preferences.
  ///
  /// In en, this message translates to:
  /// **'PREFERENCES'**
  String get ventor_profile_settings_section_preferences;

  /// No description provided for @ventor_profile_settings_section_security.
  ///
  /// In en, this message translates to:
  /// **'SECURITY & ACCOUNT'**
  String get ventor_profile_settings_section_security;

  /// No description provided for @ventor_profile_settings_section_support.
  ///
  /// In en, this message translates to:
  /// **'SUPPORT & ABOUT'**
  String get ventor_profile_settings_section_support;

  /// No description provided for @ventor_profile_settings_privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Controls'**
  String get ventor_profile_settings_privacy;

  /// No description provided for @ventor_profile_settings_privacy_sub.
  ///
  /// In en, this message translates to:
  /// **'Managed'**
  String get ventor_profile_settings_privacy_sub;

  /// No description provided for @ventor_profile_settings_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get ventor_profile_settings_notifications;

  /// No description provided for @ventor_profile_settings_notifications_sub.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get ventor_profile_settings_notifications_sub;

  /// No description provided for @ventor_profile_settings_help_sub.
  ///
  /// In en, this message translates to:
  /// **'FAQ & Chat'**
  String get ventor_profile_settings_help_sub;

  /// No description provided for @ventor_profile_settings_version.
  ///
  /// In en, this message translates to:
  /// **'v{version}'**
  String ventor_profile_settings_version(String version);

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

  /// No description provided for @listener_avail_session_length_any.
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get listener_avail_session_length_any;

  /// No description provided for @listener_avail_session_length_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose Any or up to two session lengths.'**
  String get listener_avail_session_length_subtitle;

  /// No description provided for @listener_avail_break_between.
  ///
  /// In en, this message translates to:
  /// **'Break Between Sessions'**
  String get listener_avail_break_between;

  /// No description provided for @listener_avail_break_none.
  ///
  /// In en, this message translates to:
  /// **'No Break'**
  String get listener_avail_break_none;

  /// No description provided for @listener_avail_break_minutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} Min'**
  String listener_avail_break_minutes(int minutes);

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

  /// No description provided for @listener_avail_instant_calls_earnings_highlight.
  ///
  /// In en, this message translates to:
  /// **'Instant calls can help you earn extra income.'**
  String get listener_avail_instant_calls_earnings_highlight;

  /// No description provided for @listener_avail_online_status.
  ///
  /// In en, this message translates to:
  /// **'Appear Online'**
  String get listener_avail_online_status;

  /// No description provided for @listener_avail_online_status_hint.
  ///
  /// In en, this message translates to:
  /// **'When online, ventors can see you\'re available for sessions.'**
  String get listener_avail_online_status_hint;

  /// No description provided for @listener_avail_online_status_offline_hint.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline. Turn this on when you\'re ready to accept sessions.'**
  String get listener_avail_online_status_offline_hint;

  /// No description provided for @listener_avail_status_online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get listener_avail_status_online;

  /// No description provided for @listener_avail_status_offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get listener_avail_status_offline;

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

  /// No description provided for @listener_avail_slot_overlap_error.
  ///
  /// In en, this message translates to:
  /// **'Time slots cannot overlap. Each new slot must start when the previous one ends.'**
  String get listener_avail_slot_overlap_error;

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

  /// No description provided for @listener_sessions_history_title.
  ///
  /// In en, this message translates to:
  /// **'Past Sessions'**
  String get listener_sessions_history_title;

  /// No description provided for @listener_sessions_instant_section_title.
  ///
  /// In en, this message translates to:
  /// **'Instant Calls'**
  String get listener_sessions_instant_section_title;

  /// No description provided for @listener_sessions_scheduled_section_title.
  ///
  /// In en, this message translates to:
  /// **'Scheduled Sessions'**
  String get listener_sessions_scheduled_section_title;

  /// No description provided for @listener_sessions_instant_note.
  ///
  /// In en, this message translates to:
  /// **'Instant calls notify available listeners at the same time. The first listener who accepts is assigned the call — others lose the request.'**
  String get listener_sessions_instant_note;

  /// No description provided for @listener_sessions_no_instant.
  ///
  /// In en, this message translates to:
  /// **'No instant calls right now.'**
  String get listener_sessions_no_instant;

  /// No description provided for @listener_sessions_no_scheduled.
  ///
  /// In en, this message translates to:
  /// **'No scheduled sessions yet.'**
  String get listener_sessions_no_scheduled;

  /// No description provided for @listener_sessions_instant_incoming.
  ///
  /// In en, this message translates to:
  /// **'Incoming instant call'**
  String get listener_sessions_instant_incoming;

  /// No description provided for @listener_sessions_voice_call.
  ///
  /// In en, this message translates to:
  /// **'Voice call'**
  String get listener_sessions_voice_call;

  /// No description provided for @listener_sessions_video_call.
  ///
  /// In en, this message translates to:
  /// **'Video call'**
  String get listener_sessions_video_call;

  /// No description provided for @listener_sessions_scheduled_request.
  ///
  /// In en, this message translates to:
  /// **'New scheduled request'**
  String get listener_sessions_scheduled_request;

  /// No description provided for @listener_sessions_assigned_voice.
  ///
  /// In en, this message translates to:
  /// **'Assigned — voice call'**
  String get listener_sessions_assigned_voice;

  /// No description provided for @listener_sessions_assigned_video.
  ///
  /// In en, this message translates to:
  /// **'Assigned — video call'**
  String get listener_sessions_assigned_video;

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

  /// No description provided for @listener_sessions_accept_instant.
  ///
  /// In en, this message translates to:
  /// **'Accept call'**
  String get listener_sessions_accept_instant;

  /// No description provided for @listener_sessions_assigned_snackbar.
  ///
  /// In en, this message translates to:
  /// **'Call assigned to you — join when ready.'**
  String get listener_sessions_assigned_snackbar;

  /// No description provided for @listener_sessions_already_taken.
  ///
  /// In en, this message translates to:
  /// **'Another listener accepted this call first.'**
  String get listener_sessions_already_taken;

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

  /// No description provided for @listener_sessions_now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get listener_sessions_now;

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

  /// No description provided for @listener_sessions_speech_language.
  ///
  /// In en, this message translates to:
  /// **'Session language'**
  String get listener_sessions_speech_language;

  /// No description provided for @listener_sessions_penalty_note.
  ///
  /// In en, this message translates to:
  /// **'For each session you miss without entering, 20% of the session cost will be deducted from your balance.'**
  String get listener_sessions_penalty_note;

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

  /// No description provided for @listener_dashboard_greeting_morning.
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name} 👋'**
  String listener_dashboard_greeting_morning(String name);

  /// No description provided for @listener_dashboard_greeting_afternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon, {name} 👋'**
  String listener_dashboard_greeting_afternoon(String name);

  /// No description provided for @listener_dashboard_greeting_evening.
  ///
  /// In en, this message translates to:
  /// **'Good evening, {name} 👋'**
  String listener_dashboard_greeting_evening(String name);

  /// No description provided for @listener_dashboard_subtitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re making a real difference.'**
  String get listener_dashboard_subtitle;

  /// No description provided for @listener_dashboard_impact_title.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Impact'**
  String get listener_dashboard_impact_title;

  /// No description provided for @listener_dashboard_period_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get listener_dashboard_period_today;

  /// No description provided for @listener_dashboard_period_week.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get listener_dashboard_period_week;

  /// No description provided for @listener_dashboard_period_month.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get listener_dashboard_period_month;

  /// No description provided for @listener_dashboard_sessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get listener_dashboard_sessions;

  /// No description provided for @listener_dashboard_hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get listener_dashboard_hours;

  /// No description provided for @listener_dashboard_people_helped.
  ///
  /// In en, this message translates to:
  /// **'People helped'**
  String get listener_dashboard_people_helped;

  /// No description provided for @listener_dashboard_currently.
  ///
  /// In en, this message translates to:
  /// **'You\'re Currently'**
  String get listener_dashboard_currently;

  /// No description provided for @listener_dashboard_available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get listener_dashboard_available;

  /// No description provided for @listener_dashboard_offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get listener_dashboard_offline;

  /// No description provided for @listener_dashboard_accepting.
  ///
  /// In en, this message translates to:
  /// **'Accepting new sessions'**
  String get listener_dashboard_accepting;

  /// No description provided for @listener_dashboard_paused.
  ///
  /// In en, this message translates to:
  /// **'Not accepting new sessions'**
  String get listener_dashboard_paused;

  /// No description provided for @listener_dashboard_go_offline.
  ///
  /// In en, this message translates to:
  /// **'Go Offline'**
  String get listener_dashboard_go_offline;

  /// No description provided for @listener_dashboard_go_online.
  ///
  /// In en, this message translates to:
  /// **'Go Online'**
  String get listener_dashboard_go_online;

  /// No description provided for @listener_dashboard_upcoming_title.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Session'**
  String get listener_dashboard_upcoming_title;

  /// No description provided for @listener_dashboard_at_time.
  ///
  /// In en, this message translates to:
  /// **'At {time}'**
  String listener_dashboard_at_time(String time);

  /// No description provided for @listener_dashboard_session_minutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min session'**
  String listener_dashboard_session_minutes(int minutes);

  /// No description provided for @listener_dashboard_waiting.
  ///
  /// In en, this message translates to:
  /// **'They\'re waiting for you.'**
  String get listener_dashboard_waiting;

  /// No description provided for @listener_dashboard_view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get listener_dashboard_view;

  /// No description provided for @listener_dashboard_reminder_title.
  ///
  /// In en, this message translates to:
  /// **'Daily Reminder'**
  String get listener_dashboard_reminder_title;

  /// No description provided for @listener_dashboard_reminder_message.
  ///
  /// In en, this message translates to:
  /// **'Your presence can be the reason someone feels better today.'**
  String get listener_dashboard_reminder_message;

  /// No description provided for @listener_dashboard_setup_title.
  ///
  /// In en, this message translates to:
  /// **'Complete your setup'**
  String get listener_dashboard_setup_title;

  /// No description provided for @listener_dashboard_setup_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Finish the remaining steps before going live.'**
  String get listener_dashboard_setup_subtitle;

  /// No description provided for @listener_dashboard_setup_identity.
  ///
  /// In en, this message translates to:
  /// **'Identity Verification'**
  String get listener_dashboard_setup_identity;

  /// No description provided for @listener_dashboard_setup_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile Info'**
  String get listener_dashboard_setup_profile;

  /// No description provided for @listener_dashboard_setup_account.
  ///
  /// In en, this message translates to:
  /// **'Account Setup'**
  String get listener_dashboard_setup_account;

  /// No description provided for @listener_dashboard_setup_about.
  ///
  /// In en, this message translates to:
  /// **'About You'**
  String get listener_dashboard_setup_about;

  /// No description provided for @listener_dashboard_setup_experience.
  ///
  /// In en, this message translates to:
  /// **'Life Experience'**
  String get listener_dashboard_setup_experience;

  /// No description provided for @listener_dashboard_setup_comfort_areas.
  ///
  /// In en, this message translates to:
  /// **'Comfort Areas'**
  String get listener_dashboard_setup_comfort_areas;

  /// No description provided for @listener_dashboard_setup_boundaries.
  ///
  /// In en, this message translates to:
  /// **'Boundaries'**
  String get listener_dashboard_setup_boundaries;

  /// No description provided for @listener_dashboard_setup_voice_intro.
  ///
  /// In en, this message translates to:
  /// **'Voice Introduction'**
  String get listener_dashboard_setup_voice_intro;

  /// No description provided for @listener_dashboard_setup_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get listener_dashboard_setup_notifications;

  /// No description provided for @listener_dashboard_setup_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get listener_dashboard_setup_pending;

  /// No description provided for @listener_dashboard_setup_availability.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get listener_dashboard_setup_availability;

  /// No description provided for @listener_dashboard_setup_training.
  ///
  /// In en, this message translates to:
  /// **'Training'**
  String get listener_dashboard_setup_training;

  /// No description provided for @listener_dashboard_setup_tutorial.
  ///
  /// In en, this message translates to:
  /// **'First Session Tutorial'**
  String get listener_dashboard_setup_tutorial;

  /// No description provided for @listener_dashboard_setup_book_first_session.
  ///
  /// In en, this message translates to:
  /// **'First session with us'**
  String get listener_dashboard_setup_book_first_session;

  /// No description provided for @listener_dashboard_setup_book_first_session_cta.
  ///
  /// In en, this message translates to:
  /// **'Got it — I\'m ready'**
  String get listener_dashboard_setup_book_first_session_cta;

  /// No description provided for @listener_dashboard_setup_book_first_session_availability.
  ///
  /// In en, this message translates to:
  /// **'Update my availability'**
  String get listener_dashboard_setup_book_first_session_availability;

  /// No description provided for @listener_dashboard_setup_done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get listener_dashboard_setup_done;

  /// No description provided for @listener_dashboard_setup_in_progress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get listener_dashboard_setup_in_progress;

  /// No description provided for @listener_dashboard_setup_under_review.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get listener_dashboard_setup_under_review;

  /// No description provided for @listener_dashboard_setup_locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get listener_dashboard_setup_locked;

  /// No description provided for @listener_dashboard_setup_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue Setup'**
  String get listener_dashboard_setup_continue;

  /// No description provided for @listener_training_title.
  ///
  /// In en, this message translates to:
  /// **'Active Listening Training'**
  String get listener_training_title;

  /// No description provided for @listener_training_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Open each module’s tutorial video or link to complete it. Finish all modules to pass training.'**
  String get listener_training_subtitle;

  /// No description provided for @listener_training_continue_learning.
  ///
  /// In en, this message translates to:
  /// **'Continue Learning'**
  String get listener_training_continue_learning;

  /// No description provided for @listener_training_finish.
  ///
  /// In en, this message translates to:
  /// **'Finish Training'**
  String get listener_training_finish;

  /// No description provided for @listener_training_finish_locked.
  ///
  /// In en, this message translates to:
  /// **'Complete all modules to finish'**
  String get listener_training_finish_locked;

  /// No description provided for @listener_training_status_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get listener_training_status_completed;

  /// No description provided for @listener_training_status_tap_to_open.
  ///
  /// In en, this message translates to:
  /// **'Tap to open tutorial'**
  String get listener_training_status_tap_to_open;

  /// No description provided for @listener_training_status_locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get listener_training_status_locked;

  /// No description provided for @listener_training_locked_hint.
  ///
  /// In en, this message translates to:
  /// **'Complete the previous module first.'**
  String get listener_training_locked_hint;

  /// No description provided for @listener_training_open_failed.
  ///
  /// In en, this message translates to:
  /// **'Could not open the training link.'**
  String get listener_training_open_failed;

  /// No description provided for @listener_training_module_art_of_listening.
  ///
  /// In en, this message translates to:
  /// **'The Art of Listening'**
  String get listener_training_module_art_of_listening;

  /// No description provided for @listener_training_module_empathy.
  ///
  /// In en, this message translates to:
  /// **'Empathy & Understanding'**
  String get listener_training_module_empathy;

  /// No description provided for @listener_training_module_boundaries.
  ///
  /// In en, this message translates to:
  /// **'Boundaries & Ethics'**
  String get listener_training_module_boundaries;

  /// No description provided for @listener_training_module_difficult_situations.
  ///
  /// In en, this message translates to:
  /// **'Handling Difficult Situations'**
  String get listener_training_module_difficult_situations;

  /// No description provided for @listener_training_module_crisis_awareness.
  ///
  /// In en, this message translates to:
  /// **'Crisis Awareness'**
  String get listener_training_module_crisis_awareness;

  /// No description provided for @listener_dashboard_profile_approved_title.
  ///
  /// In en, this message translates to:
  /// **'Profile approved'**
  String get listener_dashboard_profile_approved_title;

  /// No description provided for @listener_dashboard_profile_approved_message.
  ///
  /// In en, this message translates to:
  /// **'Before taking sessions, complete the onboarding journey and tutorials.'**
  String get listener_dashboard_profile_approved_message;

  /// No description provided for @listener_dashboard_profile_under_review_title.
  ///
  /// In en, this message translates to:
  /// **'Profile under review'**
  String get listener_dashboard_profile_under_review_title;

  /// No description provided for @listener_dashboard_profile_under_review_message.
  ///
  /// In en, this message translates to:
  /// **'Finish training and book your first session while we review your profile. You won\'t appear online to ventors until approved.'**
  String get listener_dashboard_profile_under_review_message;

  /// No description provided for @listener_dashboard_profile_rejected_title.
  ///
  /// In en, this message translates to:
  /// **'Profile needs updates'**
  String get listener_dashboard_profile_rejected_title;

  /// No description provided for @listener_dashboard_profile_rejected_message.
  ///
  /// In en, this message translates to:
  /// **'An admin flagged one or more steps below. Update them and we\'ll review your profile again.'**
  String get listener_dashboard_profile_rejected_message;

  /// No description provided for @listener_dashboard_setup_needs_refill.
  ///
  /// In en, this message translates to:
  /// **'Needs update'**
  String get listener_dashboard_setup_needs_refill;

  /// No description provided for @listener_dashboard_go_online_requires_approval.
  ///
  /// In en, this message translates to:
  /// **'Your profile must be approved before you can go online.'**
  String get listener_dashboard_go_online_requires_approval;

  /// No description provided for @listener_dashboard_availability_hidden_until_approved.
  ///
  /// In en, this message translates to:
  /// **'Hidden from ventors until your profile is approved'**
  String get listener_dashboard_availability_hidden_until_approved;

  /// No description provided for @listener_dashboard_locked_accept_title.
  ///
  /// In en, this message translates to:
  /// **'Accept Sessions'**
  String get listener_dashboard_locked_accept_title;

  /// No description provided for @listener_dashboard_locked_accept_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock after completing required steps.'**
  String get listener_dashboard_locked_accept_subtitle;

  /// No description provided for @listener_dashboard_locked_earnings_title.
  ///
  /// In en, this message translates to:
  /// **'Earnings (This Month)'**
  String get listener_dashboard_locked_earnings_title;

  /// No description provided for @listener_dashboard_locked_earnings_footnote.
  ///
  /// In en, this message translates to:
  /// **'Complete tutorials to see your earnings.'**
  String get listener_dashboard_locked_earnings_footnote;

  /// No description provided for @listener_dashboard_no_requests.
  ///
  /// In en, this message translates to:
  /// **'No upcoming requests yet. Requests will appear here once you go live.'**
  String get listener_dashboard_no_requests;

  /// No description provided for @listener_dashboard_helpful_tip_title.
  ///
  /// In en, this message translates to:
  /// **'Helpful Tip'**
  String get listener_dashboard_helpful_tip_title;

  /// No description provided for @listener_dashboard_helpful_tip_message.
  ///
  /// In en, this message translates to:
  /// **'Complete your tutorials to build trust and get more session requests.'**
  String get listener_dashboard_helpful_tip_message;

  /// No description provided for @listener_dashboard_notifications_empty.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up. New notifications will appear here.'**
  String get listener_dashboard_notifications_empty;

  /// No description provided for @listener_dashboard_notifications_just_now.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get listener_dashboard_notifications_just_now;

  /// No description provided for @listener_dashboard_notifications_minutes_ago.
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String listener_dashboard_notifications_minutes_ago(int count);

  /// No description provided for @listener_dashboard_notifications_hours_ago.
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String listener_dashboard_notifications_hours_ago(int count);

  /// No description provided for @listener_dashboard_notifications_days_ago.
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String listener_dashboard_notifications_days_ago(int count);

  /// No description provided for @listener_dashboard_notifications_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get listener_dashboard_notifications_delete;

  /// No description provided for @listener_first_session_continue.
  ///
  /// In en, this message translates to:
  /// **'Open first session info'**
  String get listener_first_session_continue;

  /// No description provided for @listener_first_session_title.
  ///
  /// In en, this message translates to:
  /// **'First session with us'**
  String get listener_first_session_title;

  /// No description provided for @listener_first_session_body.
  ///
  /// In en, this message translates to:
  /// **'You\'re almost there. Based on the availability you set, our team will call you for a short live session before we approve your profile.'**
  String get listener_first_session_body;

  /// No description provided for @listener_first_session_bullet_call.
  ///
  /// In en, this message translates to:
  /// **'We\'ll reach out during the time slots you shared — keep your phone nearby and notifications on.'**
  String get listener_first_session_bullet_call;

  /// No description provided for @listener_first_session_bullet_guidelines.
  ///
  /// In en, this message translates to:
  /// **'On the call we\'ll walk through real scenarios and test your listening skills.'**
  String get listener_first_session_bullet_guidelines;

  /// No description provided for @listener_first_session_bullet_available.
  ///
  /// In en, this message translates to:
  /// **'If you pass, we\'ll approve your profile and you can start accepting sessions.'**
  String get listener_first_session_bullet_available;

  /// No description provided for @listener_first_session_cta.
  ///
  /// In en, this message translates to:
  /// **'Got it — I\'m ready'**
  String get listener_first_session_cta;

  /// No description provided for @ventor_sessions_title.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get ventor_sessions_title;

  /// No description provided for @ventor_sessions_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Find someone who gets you.'**
  String get ventor_sessions_subtitle;

  /// No description provided for @ventor_sessions_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search topics, listeners...'**
  String get ventor_sessions_search_hint;

  /// No description provided for @ventor_sessions_topic_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get ventor_sessions_topic_all;

  /// No description provided for @ventor_sessions_topic_anxiety.
  ///
  /// In en, this message translates to:
  /// **'Anxiety'**
  String get ventor_sessions_topic_anxiety;

  /// No description provided for @ventor_sessions_topic_sadness.
  ///
  /// In en, this message translates to:
  /// **'Sadness'**
  String get ventor_sessions_topic_sadness;

  /// No description provided for @ventor_sessions_topic_relationships.
  ///
  /// In en, this message translates to:
  /// **'Relationships'**
  String get ventor_sessions_topic_relationships;

  /// No description provided for @ventor_sessions_topic_stress.
  ///
  /// In en, this message translates to:
  /// **'Stress'**
  String get ventor_sessions_topic_stress;

  /// No description provided for @ventor_sessions_top_listeners.
  ///
  /// In en, this message translates to:
  /// **'Top listeners for you'**
  String get ventor_sessions_top_listeners;

  /// No description provided for @ventor_sessions_empty.
  ///
  /// In en, this message translates to:
  /// **'No listeners match your search or filters. Try adjusting them.'**
  String get ventor_sessions_empty;

  /// No description provided for @ventor_sessions_experience_empty.
  ///
  /// In en, this message translates to:
  /// **'No life experiences listed'**
  String get ventor_sessions_experience_empty;

  /// No description provided for @ventor_sessions_reviews.
  ///
  /// In en, this message translates to:
  /// **'{count} reviews'**
  String ventor_sessions_reviews(int count);

  /// No description provided for @ventor_sessions_sessions_count.
  ///
  /// In en, this message translates to:
  /// **'{count} sessions'**
  String ventor_sessions_sessions_count(String count);

  /// No description provided for @ventor_sessions_surprise_title.
  ///
  /// In en, this message translates to:
  /// **'Not sure who to pick?'**
  String get ventor_sessions_surprise_title;

  /// No description provided for @ventor_sessions_surprise_cta.
  ///
  /// In en, this message translates to:
  /// **'Surprise Me ✨'**
  String get ventor_sessions_surprise_cta;

  /// No description provided for @ventor_sessions_filters_title.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get ventor_sessions_filters_title;

  /// No description provided for @ventor_sessions_filters_reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get ventor_sessions_filters_reset;

  /// No description provided for @ventor_sessions_filters_apply.
  ///
  /// In en, this message translates to:
  /// **'Apply filters'**
  String get ventor_sessions_filters_apply;

  /// No description provided for @ventor_sessions_filter_price.
  ///
  /// In en, this message translates to:
  /// **'Price per minute'**
  String get ventor_sessions_filter_price;

  /// No description provided for @ventor_sessions_filter_price_range.
  ///
  /// In en, this message translates to:
  /// **'{min} – {max}'**
  String ventor_sessions_filter_price_range(String min, String max);

  /// No description provided for @ventor_sessions_filter_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get ventor_sessions_filter_language;

  /// No description provided for @ventor_sessions_filter_gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get ventor_sessions_filter_gender;

  /// No description provided for @ventor_sessions_gender_female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get ventor_sessions_gender_female;

  /// No description provided for @ventor_sessions_gender_male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get ventor_sessions_gender_male;

  /// No description provided for @ventor_sessions_gender_prefer_not.
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get ventor_sessions_gender_prefer_not;

  /// No description provided for @ventor_sessions_filter_rating.
  ///
  /// In en, this message translates to:
  /// **'Minimum rating'**
  String get ventor_sessions_filter_rating;

  /// No description provided for @ventor_sessions_filter_rating_any.
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get ventor_sessions_filter_rating_any;

  /// No description provided for @ventor_sessions_filter_rating_min.
  ///
  /// In en, this message translates to:
  /// **'{rating}+'**
  String ventor_sessions_filter_rating_min(String rating);

  /// No description provided for @ventor_sessions_filter_favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get ventor_sessions_filter_favorites;

  /// No description provided for @ventor_sessions_filter_favorites_any.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get ventor_sessions_filter_favorites_any;

  /// No description provided for @ventor_sessions_filter_favorites_only.
  ///
  /// In en, this message translates to:
  /// **'Favorites only'**
  String get ventor_sessions_filter_favorites_only;

  /// No description provided for @ventor_sessions_filter_favorites_not.
  ///
  /// In en, this message translates to:
  /// **'Not favorites'**
  String get ventor_sessions_filter_favorites_not;

  /// No description provided for @ventor_sessions_about_me.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get ventor_sessions_about_me;

  /// No description provided for @ventor_sessions_help_with.
  ///
  /// In en, this message translates to:
  /// **'I can help with'**
  String get ventor_sessions_help_with;

  /// No description provided for @ventor_sessions_languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get ventor_sessions_languages;

  /// No description provided for @ventor_sessions_listen_voice.
  ///
  /// In en, this message translates to:
  /// **'Listen to my voice'**
  String get ventor_sessions_listen_voice;

  /// No description provided for @ventor_sessions_reviews_title.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get ventor_sessions_reviews_title;

  /// No description provided for @ventor_sessions_rate_per_min.
  ///
  /// In en, this message translates to:
  /// **'{rate} / min'**
  String ventor_sessions_rate_per_min(String rate);

  /// No description provided for @ventor_sessions_choose_duration.
  ///
  /// In en, this message translates to:
  /// **'Choose duration'**
  String get ventor_sessions_choose_duration;

  /// No description provided for @ventor_sessions_duration_minutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String ventor_sessions_duration_minutes(int minutes);

  /// No description provided for @ventor_sessions_duration_popular.
  ///
  /// In en, this message translates to:
  /// **'Most popular'**
  String get ventor_sessions_duration_popular;

  /// No description provided for @ventor_sessions_details_title.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get ventor_sessions_details_title;

  /// No description provided for @ventor_sessions_gender_label.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get ventor_sessions_gender_label;

  /// No description provided for @ventor_sessions_country_label.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get ventor_sessions_country_label;

  /// No description provided for @ventor_sessions_city_label.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get ventor_sessions_city_label;

  /// No description provided for @ventor_sessions_life_experience_title.
  ///
  /// In en, this message translates to:
  /// **'Life experience'**
  String get ventor_sessions_life_experience_title;

  /// No description provided for @ventor_sessions_boundaries_title.
  ///
  /// In en, this message translates to:
  /// **'Boundaries'**
  String get ventor_sessions_boundaries_title;

  /// No description provided for @ventor_sessions_boundaries_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Topics this listener prefers not to discuss.'**
  String get ventor_sessions_boundaries_subtitle;

  /// No description provided for @ventor_sessions_boundaries_none.
  ///
  /// In en, this message translates to:
  /// **'No specific boundaries listed.'**
  String get ventor_sessions_boundaries_none;

  /// No description provided for @ventor_sessions_availability_title.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get ventor_sessions_availability_title;

  /// No description provided for @ventor_sessions_availability_days.
  ///
  /// In en, this message translates to:
  /// **'Available days'**
  String get ventor_sessions_availability_days;

  /// No description provided for @ventor_sessions_availability_hours.
  ///
  /// In en, this message translates to:
  /// **'Available hours'**
  String get ventor_sessions_availability_hours;

  /// No description provided for @ventor_sessions_availability_timezone.
  ///
  /// In en, this message translates to:
  /// **'Time zone'**
  String get ventor_sessions_availability_timezone;

  /// No description provided for @ventor_sessions_availability_instant.
  ///
  /// In en, this message translates to:
  /// **'Instant calls'**
  String get ventor_sessions_availability_instant;

  /// No description provided for @ventor_sessions_availability_instant_yes.
  ///
  /// In en, this message translates to:
  /// **'Accepts instant calls'**
  String get ventor_sessions_availability_instant_yes;

  /// No description provided for @ventor_sessions_availability_instant_no.
  ///
  /// In en, this message translates to:
  /// **'Scheduled sessions only'**
  String get ventor_sessions_availability_instant_no;

  /// No description provided for @ventor_sessions_session_lengths.
  ///
  /// In en, this message translates to:
  /// **'Session lengths'**
  String get ventor_sessions_session_lengths;

  /// No description provided for @ventor_sessions_day_mon.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get ventor_sessions_day_mon;

  /// No description provided for @ventor_sessions_day_tue.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get ventor_sessions_day_tue;

  /// No description provided for @ventor_sessions_day_wed.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get ventor_sessions_day_wed;

  /// No description provided for @ventor_sessions_day_thu.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get ventor_sessions_day_thu;

  /// No description provided for @ventor_sessions_day_fri.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get ventor_sessions_day_fri;

  /// No description provided for @ventor_sessions_day_sat.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get ventor_sessions_day_sat;

  /// No description provided for @ventor_sessions_day_sun.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get ventor_sessions_day_sun;

  /// No description provided for @ventor_sessions_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get ventor_sessions_continue;

  /// No description provided for @ventor_sessions_choose_time_title.
  ///
  /// In en, this message translates to:
  /// **'Choose call time'**
  String get ventor_sessions_choose_time_title;

  /// No description provided for @ventor_sessions_choose_time_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick when you’d like to talk with {name} for {duration}.'**
  String ventor_sessions_choose_time_subtitle(String name, String duration);

  /// No description provided for @ventor_sessions_choose_time_window.
  ///
  /// In en, this message translates to:
  /// **'Listener availability: {hours} ({timezone})'**
  String ventor_sessions_choose_time_window(String hours, String timezone);

  /// No description provided for @ventor_sessions_time_instant_title.
  ///
  /// In en, this message translates to:
  /// **'Instant call'**
  String get ventor_sessions_time_instant_title;

  /// No description provided for @ventor_sessions_time_instant_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect as soon as the listener accepts.'**
  String get ventor_sessions_time_instant_subtitle;

  /// No description provided for @ventor_sessions_time_nearest_title.
  ///
  /// In en, this message translates to:
  /// **'Nearest available time'**
  String get ventor_sessions_time_nearest_title;

  /// No description provided for @ventor_sessions_time_nearest_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Suggested: {slot}'**
  String ventor_sessions_time_nearest_subtitle(String slot);

  /// No description provided for @ventor_sessions_time_schedule_title.
  ///
  /// In en, this message translates to:
  /// **'Choose from availability'**
  String get ventor_sessions_time_schedule_title;

  /// No description provided for @ventor_sessions_time_schedule_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick a time within this listener’s weekly hours.'**
  String get ventor_sessions_time_schedule_subtitle;

  /// No description provided for @ventor_sessions_time_no_slots.
  ///
  /// In en, this message translates to:
  /// **'No upcoming slots match this listener’s availability.'**
  String get ventor_sessions_time_no_slots;

  /// No description provided for @ventor_sessions_time_summary_instant.
  ///
  /// In en, this message translates to:
  /// **'Instant call'**
  String get ventor_sessions_time_summary_instant;

  /// No description provided for @ventor_sessions_time_summary_nearest.
  ///
  /// In en, this message translates to:
  /// **'Nearest time · {slot}'**
  String ventor_sessions_time_summary_nearest(String slot);

  /// No description provided for @ventor_sessions_time_summary_scheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled · {slot}'**
  String ventor_sessions_time_summary_scheduled(String slot);

  /// No description provided for @ventor_sessions_confirm_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm session'**
  String get ventor_sessions_confirm_title;

  /// No description provided for @ventor_sessions_confirm_heading.
  ///
  /// In en, this message translates to:
  /// **'Review your session'**
  String get ventor_sessions_confirm_heading;

  /// No description provided for @ventor_sessions_confirm_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Check the details, choose voice or video, then continue to payment.'**
  String get ventor_sessions_confirm_subtitle;

  /// No description provided for @ventor_sessions_confirm_summary_title.
  ///
  /// In en, this message translates to:
  /// **'Your selections'**
  String get ventor_sessions_confirm_summary_title;

  /// No description provided for @ventor_sessions_confirm_duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get ventor_sessions_confirm_duration;

  /// No description provided for @ventor_sessions_confirm_time.
  ///
  /// In en, this message translates to:
  /// **'Call time'**
  String get ventor_sessions_confirm_time;

  /// No description provided for @ventor_sessions_confirm_rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get ventor_sessions_confirm_rate;

  /// No description provided for @ventor_sessions_confirm_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get ventor_sessions_confirm_total;

  /// No description provided for @ventor_sessions_confirm_call_type.
  ///
  /// In en, this message translates to:
  /// **'Call type'**
  String get ventor_sessions_confirm_call_type;

  /// No description provided for @ventor_sessions_call_voice.
  ///
  /// In en, this message translates to:
  /// **'Voice call'**
  String get ventor_sessions_call_voice;

  /// No description provided for @ventor_sessions_call_video.
  ///
  /// In en, this message translates to:
  /// **'Video call'**
  String get ventor_sessions_call_video;

  /// No description provided for @ventor_sessions_confirm_tips_title.
  ///
  /// In en, this message translates to:
  /// **'Tips before you connect'**
  String get ventor_sessions_confirm_tips_title;

  /// No description provided for @ventor_sessions_confirm_tip_quiet.
  ///
  /// In en, this message translates to:
  /// **'Find a quiet place so you can speak freely.'**
  String get ventor_sessions_confirm_tip_quiet;

  /// No description provided for @ventor_sessions_confirm_tip_honest.
  ///
  /// In en, this message translates to:
  /// **'Share what you need — you don’t have to filter your feelings.'**
  String get ventor_sessions_confirm_tip_honest;

  /// No description provided for @ventor_sessions_confirm_tip_boundaries.
  ///
  /// In en, this message translates to:
  /// **'Respect the listener’s boundaries shown on their profile.'**
  String get ventor_sessions_confirm_tip_boundaries;

  /// No description provided for @ventor_sessions_confirm_tip_leave.
  ///
  /// In en, this message translates to:
  /// **'You can leave the session anytime if you feel uncomfortable.'**
  String get ventor_sessions_confirm_tip_leave;

  /// No description provided for @ventor_sessions_confirm_you_pay.
  ///
  /// In en, this message translates to:
  /// **'Amount to pay'**
  String get ventor_sessions_confirm_you_pay;

  /// No description provided for @ventor_sessions_pay_now.
  ///
  /// In en, this message translates to:
  /// **'Pay {amount}'**
  String ventor_sessions_pay_now(String amount);

  /// No description provided for @ventor_sessions_pay_mock.
  ///
  /// In en, this message translates to:
  /// **'Payment demo: {amount} for {minutes}-min {mode} with {name}.'**
  String ventor_sessions_pay_mock(
    String name,
    int minutes,
    String mode,
    String amount,
  );

  /// No description provided for @ventor_sessions_permission_title.
  ///
  /// In en, this message translates to:
  /// **'App permissions'**
  String get ventor_sessions_permission_title;

  /// No description provided for @ventor_sessions_permission_note_voice.
  ///
  /// In en, this message translates to:
  /// **'We’ll ask for microphone access now so you’re fully prepared before payment and the call starts.'**
  String get ventor_sessions_permission_note_voice;

  /// No description provided for @ventor_sessions_permission_note_video.
  ///
  /// In en, this message translates to:
  /// **'We’ll ask for microphone and camera access now so you’re fully prepared before payment and the call starts.'**
  String get ventor_sessions_permission_note_video;

  /// No description provided for @ventor_sessions_permission_mic.
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get ventor_sessions_permission_mic;

  /// No description provided for @ventor_sessions_permission_camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get ventor_sessions_permission_camera;

  /// No description provided for @ventor_sessions_permission_allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get ventor_sessions_permission_allow;

  /// No description provided for @ventor_sessions_permission_granted.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get ventor_sessions_permission_granted;

  /// No description provided for @ventor_sessions_permission_settings.
  ///
  /// In en, this message translates to:
  /// **'Permission denied. Enable it in Settings so you can join the call.'**
  String get ventor_sessions_permission_settings;

  /// No description provided for @ventor_sessions_permission_required_hint.
  ///
  /// In en, this message translates to:
  /// **'Allow the required permissions to continue to payment.'**
  String get ventor_sessions_permission_required_hint;

  /// No description provided for @ventor_sessions_speech_language_title.
  ///
  /// In en, this message translates to:
  /// **'Speech language'**
  String get ventor_sessions_speech_language_title;

  /// No description provided for @ventor_sessions_speech_language_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the language you’ll speak so {name} is ready for this session.'**
  String ventor_sessions_speech_language_subtitle(String name);

  /// No description provided for @ventor_sessions_speech_language_required.
  ///
  /// In en, this message translates to:
  /// **'Select a speech language to continue.'**
  String get ventor_sessions_speech_language_required;

  /// No description provided for @ventor_sessions_confirm_session_price.
  ///
  /// In en, this message translates to:
  /// **'Session price'**
  String get ventor_sessions_confirm_session_price;

  /// No description provided for @ventor_sessions_voice_change_title.
  ///
  /// In en, this message translates to:
  /// **'Optional add-on'**
  String get ventor_sessions_voice_change_title;

  /// No description provided for @ventor_sessions_voice_change_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Turn this on if you want your voice disguised during the call.'**
  String get ventor_sessions_voice_change_subtitle;

  /// No description provided for @ventor_sessions_voice_change_option.
  ///
  /// In en, this message translates to:
  /// **'Change my voice in the call'**
  String get ventor_sessions_voice_change_option;

  /// No description provided for @ventor_sessions_voice_change_price.
  ///
  /// In en, this message translates to:
  /// **'+{amount}'**
  String ventor_sessions_voice_change_price(String amount);

  /// No description provided for @ventor_sessions_voice_change_fee_label.
  ///
  /// In en, this message translates to:
  /// **'Voice change'**
  String get ventor_sessions_voice_change_fee_label;

  /// No description provided for @ventor_sessions_discount_title.
  ///
  /// In en, this message translates to:
  /// **'Promo & rewards'**
  String get ventor_sessions_discount_title;

  /// No description provided for @ventor_sessions_discount_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Apply a promo code or use a discount from your rewards.'**
  String get ventor_sessions_discount_subtitle;

  /// No description provided for @ventor_sessions_promo_code_label.
  ///
  /// In en, this message translates to:
  /// **'Promo code'**
  String get ventor_sessions_promo_code_label;

  /// No description provided for @ventor_sessions_promo_code_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter code'**
  String get ventor_sessions_promo_code_hint;

  /// No description provided for @ventor_sessions_promo_apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get ventor_sessions_promo_apply;

  /// No description provided for @ventor_sessions_promo_empty.
  ///
  /// In en, this message translates to:
  /// **'Enter a promo code first.'**
  String get ventor_sessions_promo_empty;

  /// No description provided for @ventor_sessions_promo_invalid.
  ///
  /// In en, this message translates to:
  /// **'That promo code isn’t valid.'**
  String get ventor_sessions_promo_invalid;

  /// No description provided for @ventor_sessions_promo_percent_label.
  ///
  /// In en, this message translates to:
  /// **'Promo · {percent}% off'**
  String ventor_sessions_promo_percent_label(int percent);

  /// No description provided for @ventor_sessions_promo_fixed_label.
  ///
  /// In en, this message translates to:
  /// **'Promo · {amount} off'**
  String ventor_sessions_promo_fixed_label(String amount);

  /// No description provided for @ventor_sessions_rewards_discount_label.
  ///
  /// In en, this message translates to:
  /// **'Your rewards'**
  String get ventor_sessions_rewards_discount_label;

  /// No description provided for @ventor_sessions_confirm_discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get ventor_sessions_confirm_discount;

  /// No description provided for @ventor_sessions_discount_applied.
  ///
  /// In en, this message translates to:
  /// **'Saving {amount}'**
  String ventor_sessions_discount_applied(String amount);

  /// No description provided for @ventor_sessions_discount_remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get ventor_sessions_discount_remove;

  /// No description provided for @ventor_sessions_tab_find.
  ///
  /// In en, this message translates to:
  /// **'Find'**
  String get ventor_sessions_tab_find;

  /// No description provided for @ventor_sessions_tab_booked.
  ///
  /// In en, this message translates to:
  /// **'My sessions'**
  String get ventor_sessions_tab_booked;

  /// No description provided for @ventor_sessions_booked_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your booked and past sessions.'**
  String get ventor_sessions_booked_subtitle;

  /// No description provided for @ventor_sessions_booked_empty.
  ///
  /// In en, this message translates to:
  /// **'You don’t have any booked sessions yet.'**
  String get ventor_sessions_booked_empty;

  /// No description provided for @ventor_sessions_booked_empty_cta.
  ///
  /// In en, this message translates to:
  /// **'Find a listener'**
  String get ventor_sessions_booked_empty_cta;

  /// No description provided for @ventor_sessions_booked_status_upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get ventor_sessions_booked_status_upcoming;

  /// No description provided for @ventor_sessions_booked_status_live.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get ventor_sessions_booked_status_live;

  /// No description provided for @ventor_sessions_booked_status_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get ventor_sessions_booked_status_completed;

  /// No description provided for @ventor_sessions_booked_status_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get ventor_sessions_booked_status_cancelled;

  /// No description provided for @ventor_sessions_booked_instant_now.
  ///
  /// In en, this message translates to:
  /// **'Instant · happening now'**
  String get ventor_sessions_booked_instant_now;

  /// No description provided for @ventor_sessions_booked_speech_language.
  ///
  /// In en, this message translates to:
  /// **'Speaking {language}'**
  String ventor_sessions_booked_speech_language(String language);

  /// No description provided for @ventor_sessions_booked_voice_change_on.
  ///
  /// In en, this message translates to:
  /// **'Voice change on'**
  String get ventor_sessions_booked_voice_change_on;

  /// No description provided for @ventor_sessions_booked_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid {amount}'**
  String ventor_sessions_booked_paid(String amount);

  /// No description provided for @ventor_sessions_booked_join.
  ///
  /// In en, this message translates to:
  /// **'Join now'**
  String get ventor_sessions_booked_join;

  /// No description provided for @ventor_sessions_booked_details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get ventor_sessions_booked_details;

  /// No description provided for @ventor_sessions_details_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Session details'**
  String get ventor_sessions_details_screen_title;

  /// No description provided for @ventor_sessions_details_heading.
  ///
  /// In en, this message translates to:
  /// **'Your booking'**
  String get ventor_sessions_details_heading;

  /// No description provided for @ventor_sessions_details_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Review everything you selected for this session.'**
  String get ventor_sessions_details_subtitle;

  /// No description provided for @ventor_sessions_voice_change_off.
  ///
  /// In en, this message translates to:
  /// **'Voice change off'**
  String get ventor_sessions_voice_change_off;

  /// No description provided for @ventor_sessions_cancel_cta.
  ///
  /// In en, this message translates to:
  /// **'Cancel session'**
  String get ventor_sessions_cancel_cta;

  /// No description provided for @ventor_sessions_cancel_title.
  ///
  /// In en, this message translates to:
  /// **'Cancel this session?'**
  String get ventor_sessions_cancel_title;

  /// No description provided for @ventor_sessions_cancel_body.
  ///
  /// In en, this message translates to:
  /// **'We’ll refund the full session amount to your ventor balance so you can book another session anytime.'**
  String get ventor_sessions_cancel_body;

  /// No description provided for @ventor_sessions_cancel_refund_label.
  ///
  /// In en, this message translates to:
  /// **'Full refund to balance'**
  String get ventor_sessions_cancel_refund_label;

  /// No description provided for @ventor_sessions_cancel_balance_note.
  ///
  /// In en, this message translates to:
  /// **'{amount} will be stored in your ventor balance.'**
  String ventor_sessions_cancel_balance_note(String amount);

  /// No description provided for @ventor_sessions_cancel_keep.
  ///
  /// In en, this message translates to:
  /// **'Keep session'**
  String get ventor_sessions_cancel_keep;

  /// No description provided for @ventor_sessions_cancel_confirm.
  ///
  /// In en, this message translates to:
  /// **'Cancel & refund'**
  String get ventor_sessions_cancel_confirm;

  /// No description provided for @ventor_sessions_cancel_success.
  ///
  /// In en, this message translates to:
  /// **'Session cancelled. {amount} was refunded to your balance — book another session whenever you’re ready.'**
  String ventor_sessions_cancel_success(String amount);

  /// No description provided for @ventor_sessions_cancel_policy_title.
  ///
  /// In en, this message translates to:
  /// **'Cancellation policy'**
  String get ventor_sessions_cancel_policy_title;

  /// No description provided for @ventor_sessions_cancel_policy_body.
  ///
  /// In en, this message translates to:
  /// **'If you cancel, the full amount ({amount}) is refunded to your ventor balance so you can book another session.'**
  String ventor_sessions_cancel_policy_body(String amount);

  /// No description provided for @ventor_sessions_booked_was_paid.
  ///
  /// In en, this message translates to:
  /// **'Was {amount}'**
  String ventor_sessions_booked_was_paid(String amount);

  /// No description provided for @ventor_sessions_cancelled_refund_title.
  ///
  /// In en, this message translates to:
  /// **'Full refund · {amount}'**
  String ventor_sessions_cancelled_refund_title(String amount);

  /// No description provided for @ventor_sessions_cancelled_refund_subtitle.
  ///
  /// In en, this message translates to:
  /// **'This amount was returned to your ventor balance. Book another session whenever you’re ready.'**
  String get ventor_sessions_cancelled_refund_subtitle;

  /// No description provided for @ventor_sessions_cancelled_rebook.
  ///
  /// In en, this message translates to:
  /// **'Book again'**
  String get ventor_sessions_cancelled_rebook;

  /// No description provided for @ventor_sessions_booked_tap_mock.
  ///
  /// In en, this message translates to:
  /// **'Opening session with {name} (demo).'**
  String ventor_sessions_booked_tap_mock(String name);

  /// No description provided for @ventor_call_tips_title.
  ///
  /// In en, this message translates to:
  /// **'Before you join'**
  String get ventor_call_tips_title;

  /// No description provided for @ventor_call_permissions_heading.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get ventor_call_permissions_heading;

  /// No description provided for @ventor_call_permissions_subtitle_voice.
  ///
  /// In en, this message translates to:
  /// **'Allow your microphone so you can speak in this voice session.'**
  String get ventor_call_permissions_subtitle_voice;

  /// No description provided for @ventor_call_permissions_subtitle_video.
  ///
  /// In en, this message translates to:
  /// **'Allow microphone and camera for this video session.'**
  String get ventor_call_permissions_subtitle_video;

  /// No description provided for @ventor_call_permission_mic.
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get ventor_call_permission_mic;

  /// No description provided for @ventor_call_permission_camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get ventor_call_permission_camera;

  /// No description provided for @ventor_call_permission_allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get ventor_call_permission_allow;

  /// No description provided for @ventor_call_permission_granted.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get ventor_call_permission_granted;

  /// No description provided for @ventor_call_permission_settings.
  ///
  /// In en, this message translates to:
  /// **'Permission denied. Enable it in Settings to join the call.'**
  String get ventor_call_permission_settings;

  /// No description provided for @ventor_call_enter.
  ///
  /// In en, this message translates to:
  /// **'Enter call'**
  String get ventor_call_enter;

  /// No description provided for @ventor_call_end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get ventor_call_end;

  /// No description provided for @ventor_call_mute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get ventor_call_mute;

  /// No description provided for @ventor_call_speaker.
  ///
  /// In en, this message translates to:
  /// **'Speaker'**
  String get ventor_call_speaker;

  /// No description provided for @ventor_call_flip.
  ///
  /// In en, this message translates to:
  /// **'Flip'**
  String get ventor_call_flip;

  /// No description provided for @ventor_call_speaking.
  ///
  /// In en, this message translates to:
  /// **'Session in progress — speak freely'**
  String get ventor_call_speaking;

  /// No description provided for @ventor_call_rating_title.
  ///
  /// In en, this message translates to:
  /// **'How was your session with {name}?'**
  String ventor_call_rating_title(String name);

  /// No description provided for @ventor_call_rating_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your rating helps other ventors find great listeners.'**
  String get ventor_call_rating_subtitle;

  /// No description provided for @ventor_call_rating_stars_hint.
  ///
  /// In en, this message translates to:
  /// **'{count}-star rating'**
  String ventor_call_rating_stars_hint(int count);

  /// No description provided for @ventor_call_rating_review_hint.
  ///
  /// In en, this message translates to:
  /// **'Optional note about your experience…'**
  String get ventor_call_rating_review_hint;

  /// No description provided for @ventor_call_tip_title.
  ///
  /// In en, this message translates to:
  /// **'Say thanks with a tip'**
  String get ventor_call_tip_title;

  /// No description provided for @ventor_call_tip_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Optional — send {name} a tip for being there for you.'**
  String ventor_call_tip_subtitle(String name);

  /// No description provided for @ventor_call_tip_none.
  ///
  /// In en, this message translates to:
  /// **'No tip'**
  String get ventor_call_tip_none;

  /// No description provided for @ventor_call_rating_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit rating'**
  String get ventor_call_rating_submit;

  /// No description provided for @ventor_call_rating_submit_with_tip.
  ///
  /// In en, this message translates to:
  /// **'Submit & tip {amount}'**
  String ventor_call_rating_submit_with_tip(String amount);

  /// No description provided for @ventor_call_rating_thanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks for your feedback!'**
  String get ventor_call_rating_thanks;

  /// No description provided for @ventor_call_rating_thanks_with_tip.
  ///
  /// In en, this message translates to:
  /// **'Thanks! Your {amount} tip was sent.'**
  String ventor_call_rating_thanks_with_tip(String amount);

  /// No description provided for @ventor_call_report_listener.
  ///
  /// In en, this message translates to:
  /// **'Report listener'**
  String get ventor_call_report_listener;

  /// No description provided for @ventor_call_report_submitted.
  ///
  /// In en, this message translates to:
  /// **'Listener reported'**
  String get ventor_call_report_submitted;

  /// No description provided for @ventor_call_report_title.
  ///
  /// In en, this message translates to:
  /// **'Report listener'**
  String get ventor_call_report_title;

  /// No description provided for @ventor_call_report_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us what went wrong with {name}. Our team will review your report.'**
  String ventor_call_report_subtitle(String name);

  /// No description provided for @ventor_call_report_reason_inappropriate.
  ///
  /// In en, this message translates to:
  /// **'Inappropriate behavior'**
  String get ventor_call_report_reason_inappropriate;

  /// No description provided for @ventor_call_report_reason_harassment.
  ///
  /// In en, this message translates to:
  /// **'Harassment or abuse'**
  String get ventor_call_report_reason_harassment;

  /// No description provided for @ventor_call_report_reason_hate_speech.
  ///
  /// In en, this message translates to:
  /// **'Hate speech or discrimination'**
  String get ventor_call_report_reason_hate_speech;

  /// No description provided for @ventor_call_report_reason_safety.
  ///
  /// In en, this message translates to:
  /// **'Safety concern'**
  String get ventor_call_report_reason_safety;

  /// No description provided for @ventor_call_report_reason_not_listening.
  ///
  /// In en, this message translates to:
  /// **'Wasn’t listening or supportive'**
  String get ventor_call_report_reason_not_listening;

  /// No description provided for @ventor_call_report_reason_technical.
  ///
  /// In en, this message translates to:
  /// **'Technical issue'**
  String get ventor_call_report_reason_technical;

  /// No description provided for @ventor_call_report_reason_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get ventor_call_report_reason_other;

  /// No description provided for @ventor_call_report_other_hint.
  ///
  /// In en, this message translates to:
  /// **'Please describe what happened…'**
  String get ventor_call_report_other_hint;

  /// No description provided for @ventor_call_report_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit report'**
  String get ventor_call_report_submit;

  /// No description provided for @ventor_call_report_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get ventor_call_report_cancel;

  /// No description provided for @ventor_call_report_received_title.
  ///
  /// In en, this message translates to:
  /// **'We’ve received your report'**
  String get ventor_call_report_received_title;

  /// No description provided for @ventor_call_report_received_body.
  ///
  /// In en, this message translates to:
  /// **'We’ll look carefully into your report. If needed, we’ll refund you and provide any appropriate compensation.'**
  String get ventor_call_report_received_body;

  /// No description provided for @ventor_call_report_received_ok.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get ventor_call_report_received_ok;

  /// No description provided for @ventor_home_greeting_morning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get ventor_home_greeting_morning;

  /// No description provided for @ventor_home_greeting_afternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get ventor_home_greeting_afternoon;

  /// No description provided for @ventor_home_greeting_evening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get ventor_home_greeting_evening;

  /// No description provided for @ventor_home_safe_place.
  ///
  /// In en, this message translates to:
  /// **'You\'re in a safe place.'**
  String get ventor_home_safe_place;

  /// No description provided for @ventor_home_mood_prompt.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today?'**
  String get ventor_home_mood_prompt;

  /// No description provided for @ventor_home_mood_great.
  ///
  /// In en, this message translates to:
  /// **'Great'**
  String get ventor_home_mood_great;

  /// No description provided for @ventor_home_mood_okay.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get ventor_home_mood_okay;

  /// No description provided for @ventor_home_mood_anxious.
  ///
  /// In en, this message translates to:
  /// **'Anxious'**
  String get ventor_home_mood_anxious;

  /// No description provided for @ventor_home_mood_sad.
  ///
  /// In en, this message translates to:
  /// **'Sad'**
  String get ventor_home_mood_sad;

  /// No description provided for @ventor_home_mood_angry.
  ///
  /// In en, this message translates to:
  /// **'Angry'**
  String get ventor_home_mood_angry;

  /// No description provided for @ventor_home_mood_write_title.
  ///
  /// In en, this message translates to:
  /// **'Feeling {mood}'**
  String ventor_home_mood_write_title(String mood);

  /// No description provided for @ventor_home_mood_write_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Write a little about your emotions. Checking in daily builds your streak.'**
  String get ventor_home_mood_write_subtitle;

  /// No description provided for @ventor_home_mood_write_hint.
  ///
  /// In en, this message translates to:
  /// **'What\'s on your mind right now…'**
  String get ventor_home_mood_write_hint;

  /// No description provided for @ventor_home_mood_submit.
  ///
  /// In en, this message translates to:
  /// **'Save check-in'**
  String get ventor_home_mood_submit;

  /// No description provided for @ventor_home_mood_saved.
  ///
  /// In en, this message translates to:
  /// **'Check-in saved. Keep going for your 7-day streak!'**
  String get ventor_home_mood_saved;

  /// No description provided for @ventor_home_mood_already_done.
  ///
  /// In en, this message translates to:
  /// **'You already checked in today. Come back tomorrow!'**
  String get ventor_home_mood_already_done;

  /// No description provided for @ventor_home_mood_streak_complete.
  ///
  /// In en, this message translates to:
  /// **'7-day streak complete! Claim your {percent}% session discount.'**
  String ventor_home_mood_streak_complete(int percent);

  /// No description provided for @ventor_home_reco_default.
  ///
  /// In en, this message translates to:
  /// **'You might benefit from talking to listeners who are patient and great at listening.'**
  String get ventor_home_reco_default;

  /// No description provided for @ventor_home_reco_great.
  ///
  /// In en, this message translates to:
  /// **'Beautiful energy today. A supportive listener can help you celebrate what\'s going well.'**
  String get ventor_home_reco_great;

  /// No description provided for @ventor_home_reco_okay.
  ///
  /// In en, this message translates to:
  /// **'A calm chat can help you unpack the day and feel a little lighter.'**
  String get ventor_home_reco_okay;

  /// No description provided for @ventor_home_reco_anxious.
  ///
  /// In en, this message translates to:
  /// **'You might benefit from talking to listeners who are patient and great at listening.'**
  String get ventor_home_reco_anxious;

  /// No description provided for @ventor_home_reco_sad.
  ///
  /// In en, this message translates to:
  /// **'Gentle, compassionate listeners can sit with you when things feel heavy.'**
  String get ventor_home_reco_sad;

  /// No description provided for @ventor_home_reco_angry.
  ///
  /// In en, this message translates to:
  /// **'A grounded listener can help you release tension without judgment.'**
  String get ventor_home_reco_angry;

  /// No description provided for @ventor_home_find_listener.
  ///
  /// In en, this message translates to:
  /// **'Find a Listener ›'**
  String get ventor_home_find_listener;

  /// No description provided for @ventor_home_streak_title.
  ///
  /// In en, this message translates to:
  /// **'🔥 {count} day streak'**
  String ventor_home_streak_title(int count);

  /// No description provided for @ventor_home_streak_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep going, you\'re doing great!'**
  String get ventor_home_streak_subtitle;

  /// No description provided for @ventor_home_streak_claim.
  ///
  /// In en, this message translates to:
  /// **'Claim'**
  String get ventor_home_streak_claim;

  /// No description provided for @ventor_home_streak_claimed_badge.
  ///
  /// In en, this message translates to:
  /// **'Claimed'**
  String get ventor_home_streak_claimed_badge;

  /// No description provided for @ventor_home_streak_claimed.
  ///
  /// In en, this message translates to:
  /// **'Nice! You unlocked a {percent}% session discount in Rewards.'**
  String ventor_home_streak_claimed(int percent);

  /// No description provided for @ventor_home_day_mon.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get ventor_home_day_mon;

  /// No description provided for @ventor_home_day_tue.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get ventor_home_day_tue;

  /// No description provided for @ventor_home_day_wed.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get ventor_home_day_wed;

  /// No description provided for @ventor_home_day_thu.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get ventor_home_day_thu;

  /// No description provided for @ventor_home_day_fri.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get ventor_home_day_fri;

  /// No description provided for @ventor_home_day_sat.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get ventor_home_day_sat;

  /// No description provided for @ventor_home_day_sun.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get ventor_home_day_sun;

  /// No description provided for @ventor_home_instant_section_title.
  ///
  /// In en, this message translates to:
  /// **'Book an instant call'**
  String get ventor_home_instant_section_title;

  /// No description provided for @ventor_home_instant_section_subtitle.
  ///
  /// In en, this message translates to:
  /// **'We’ll match you with the best available listener right now.'**
  String get ventor_home_instant_section_subtitle;

  /// No description provided for @ventor_home_instant_title.
  ///
  /// In en, this message translates to:
  /// **'Instant match'**
  String get ventor_home_instant_title;

  /// No description provided for @ventor_home_instant_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Let the system find a great listener for you.'**
  String get ventor_home_instant_subtitle;

  /// No description provided for @ventor_home_instant_matching.
  ///
  /// In en, this message translates to:
  /// **'Finding your best listener…'**
  String get ventor_home_instant_matching;

  /// No description provided for @ventor_home_instant_cta.
  ///
  /// In en, this message translates to:
  /// **'Book now'**
  String get ventor_home_instant_cta;

  /// No description provided for @ventor_home_instant_none.
  ///
  /// In en, this message translates to:
  /// **'No listeners are available for an instant call right now. Try again shortly.'**
  String get ventor_home_instant_none;

  /// No description provided for @ventor_home_upcoming_title.
  ///
  /// In en, this message translates to:
  /// **'Upcoming session'**
  String get ventor_home_upcoming_title;

  /// No description provided for @ventor_home_upcoming_live_now.
  ///
  /// In en, this message translates to:
  /// **'Live now'**
  String get ventor_home_upcoming_live_now;

  /// No description provided for @ventor_home_recent_title.
  ///
  /// In en, this message translates to:
  /// **'Continue where you left off'**
  String get ventor_home_recent_title;

  /// No description provided for @ventor_home_see_all.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get ventor_home_see_all;

  /// No description provided for @ventor_home_recent_with.
  ///
  /// In en, this message translates to:
  /// **'You & {name}'**
  String ventor_home_recent_with(String name);

  /// No description provided for @ventor_home_yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get ventor_home_yesterday;

  /// No description provided for @ventor_home_recent_meta.
  ///
  /// In en, this message translates to:
  /// **'{when} · {minutes} min'**
  String ventor_home_recent_meta(String when, int minutes);

  /// No description provided for @ventor_home_motivation.
  ///
  /// In en, this message translates to:
  /// **'Small steps every day lead to big changes.'**
  String get ventor_home_motivation;

  /// No description provided for @ventor_home_notifications_soon.
  ///
  /// In en, this message translates to:
  /// **'Notifications coming soon.'**
  String get ventor_home_notifications_soon;
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
