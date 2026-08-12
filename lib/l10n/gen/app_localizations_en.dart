// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class VentingMobLocalizationsEn extends VentingMobLocalizations {
  VentingMobLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_currency => 'IQD';

  @override
  String get common_yes => 'Yes';

  @override
  String get common_submit => 'Submit';

  @override
  String get common_alert => 'Alert';

  @override
  String get common_copied => 'Copied!';

  @override
  String get common_skip => 'Skip';

  @override
  String get common_cancel => 'Cancel';

  @override
  String get common_clear => 'Clear';

  @override
  String get common_retry => 'Retry';

  @override
  String get common_ok => 'OK';

  @override
  String get common_okay => 'Okay';

  @override
  String get common_next => 'Next';

  @override
  String get common_back => 'Back';

  @override
  String get common_pay => 'Pay';

  @override
  String get common_confirm => 'Confirm';

  @override
  String get common_done => 'Done';

  @override
  String get common_save => 'Save';

  @override
  String get common_delete => 'Delete';

  @override
  String get common_maybe_later => 'Maybe Later';

  @override
  String get common_noDataFound => 'No data found';

  @override
  String get common_generalErrorMsg => 'An error occurred';

  @override
  String get common_connectionLost => 'No Internet Connection';

  @override
  String get common_connectionLostMessage =>
      'Looks like you\'re offline. Please check your connection and try again.';

  @override
  String get common_rechargeRequired => 'Recharge Required';

  @override
  String get common_lowBalanceMessage =>
      'You have Low Balance for this service, please recharge and try again';

  @override
  String get splash_welcome_to => 'Welcome to';

  @override
  String get splash_zain_iraq => 'Zain Iraq';

  @override
  String get auth_enter_mobile_number_getVerificationCode =>
      'Get Verification Code';

  @override
  String get auth_enter_mobile_number_phoneNumber => 'Phone Number';

  @override
  String get auth_enter_mobile_number_mobileNumberLength =>
      'Mobile Number Length is less than expectations';

  @override
  String get auth_enter_mobile_number_mobileNumberNotUsed =>
      'Please Enter Valid Number';

  @override
  String get auth_enter_mobile_number_mobileNumberNotZain =>
      'Mobile number is not a Zain number';

  @override
  String
  get auth_enter_mobile_number_pleaseEnterYourZainPhoneNumberToContinue =>
      'Enter your Zain number to continue';

  @override
  String get auth_enter_mobile_number_alreadyRegistered =>
      'This phone number already has an account on the app';

  @override
  String get auth_enter_mobile_number_loginButton => 'Login';

  @override
  String get auth_enter_mobile_number_forgotPasswordButton => 'Forgot Password';

  @override
  String get auth_enter_mobile_number_or => 'or';

  @override
  String get auth_enter_mobile_number_simBlocked =>
      'This service is not available for your line';

  @override
  String get auth_enter_mobile_number_simBlockedIneligible =>
      'The service will be available soon for your line';

  @override
  String get auth_enter_mobile_number_simBlockedDisconnected =>
      'Your SIM is in a recycled, blocked, or barred state. Please call support for more information.';

  @override
  String get auth_enter_mobile_number_simBlockedActivate =>
      'To activate, please make sure your SIM is inside your device and call using the button below.';

  @override
  String get auth_enter_mobile_number_simBlockedCritical =>
      'Please visit a Zain service center to get a new SIM';

  @override
  String get auth_enter_mobile_number_mobileNumberRequired =>
      'Please enter your mobile number';

  @override
  String get auth_enter_mobile_number_enterPhoneNumberHint =>
      'Enter phone number';

  @override
  String get auth_enter_mobile_number_otpRequestFailureTitle => 'OTP Error';

  @override
  String get auth_enter_mobile_number_otpRequestFailureResend => 'Resend';

  @override
  String get auth_otp_authentication_enterOTP_lead =>
      'A one time passcode has been sent to ';

  @override
  String get auth_otp_authentication_enterOTP_tail =>
      '. \nThe code will be valid for ';

  @override
  String get auth_otp_authentication_enterOTP_validityDuration => '180 seconds';

  @override
  String get auth_otp_authentication_enterOTP_tailSuffix => '.';

  @override
  String get auth_otp_authentication_didntReceiveCode =>
      'Didn\'t receive code?';

  @override
  String get auth_otp_authentication_resendCode => 'Resend code';

  @override
  String get auth_otp_authentication_resendCodeIn => 'Resend code in';

  @override
  String get auth_otp_authentication_triesLeft => 'Attempts Remaining';

  @override
  String get auth_otp_authentication_otpverificationtext => 'OTP Verification';

  @override
  String get auth_otp_authentication_title => 'OTP Authentication';

  @override
  String get auth_otp_authentication_verifyWithOtp =>
      'Verify with One-Time Password';

  @override
  String get auth_otp_authentication_blockTitle =>
      'You have exceeded the limit';

  @override
  String get auth_otp_authentication_blockDescription =>
      'For your security access is paused due to multiple incorrect attempts';

  @override
  String get auth_otp_authentication_blockTimeRemaining => 'Time Remaining';

  @override
  String auth_otp_authentication_blockTryAgainIn(String time) {
    return 'Please try again in $time';
  }

  @override
  String get auth_biometric_activation_enableFaceId => 'Enable Face ID';

  @override
  String get auth_biometric_activation_enableTouchId => 'Enable Touch ID';

  @override
  String get auth_biometric_activation_enablePinCode => 'Enable Pin Code';

  @override
  String get auth_biometric_activation_faceId_message =>
      'Make logging in effortless with Face ID';

  @override
  String get auth_biometric_activation_touchId_message =>
      'Make logging in effortless with Touch ID';

  @override
  String get auth_biometric_activation_pincode_message =>
      'Make logging in effortless with Pin Code';

  @override
  String get auth_biometric_activation_successRegistrationFaceId =>
      'Face ID Enabled and PIN Created Successfully!';

  @override
  String get auth_biometric_activation_successRegistrationMessageFaceId =>
      'You can now sign in instantly using Face ID.';

  @override
  String get auth_biometric_activation_successRegistrationTocuhId =>
      'Touch ID Enabled and PIN Created Successfully!';

  @override
  String get auth_biometric_activation_successRegistrationMessageTocuhId =>
      'You can now sign in instantly using Touch ID.';

  @override
  String get auth_biometric_activation_successRegistrationPinId =>
      'PIN Created Successfully!';

  @override
  String get auth_biometric_activation_successRegistrationMessagePinId =>
      'You can now sign in instantly using Pin Code.';

  @override
  String get auth_biometric_activation_addLater => 'Add Later';

  @override
  String get auth_enable_quick_login_title => 'You\'re one tap away 🔓';

  @override
  String get auth_enable_quick_login_subtitle =>
      'Enable biometric login for instant, secure access — no typing needed.';

  @override
  String get auth_enable_quick_login_proceed_biometric =>
      'Enable biometric login';

  @override
  String get auth_set_password_title => 'Set password';

  @override
  String get auth_set_password_description =>
      'Set a secure password for your account.';

  @override
  String get auth_set_password_continue => 'Continue';

  @override
  String get auth_set_password_must_contain => 'Must contain at least;';

  @override
  String get auth_setup_pin_code_setAppCode => 'Set your app security code';

  @override
  String get auth_setup_pin_code_setAppCodeDesc =>
      'For your security, please create a 6-digit app code to use when Face ID is unavailable.';

  @override
  String get auth_setup_pin_code_confirmAppCode => 'Confirm your app code';

  @override
  String get auth_setup_pin_code_confirmAppCodeDesc =>
      'For verification, please re-enter your 6-digit app code. This confirms your code for use when Face ID is unavailable';

  @override
  String get auth_setup_pin_code_createPinBtn => 'Create  Pin';

  @override
  String get auth_setup_pin_code_createCodeBtn => 'Create code';

  @override
  String get auth_setup_pin_code_confirmPinErrorMessage =>
      'The codes do not match. Please try again';

  @override
  String get auth_setup_pin_code_continueButton => 'Continue';

  @override
  String get auth_captcha_title => 'Verify you\'re human';

  @override
  String get auth_captcha_subtitle => 'Enter the text shown below';

  @override
  String get auth_captcha_inputLabel => 'Characters';

  @override
  String get auth_captcha_inputHint => 'Enter text here';

  @override
  String get auth_captcha_refreshSemantics => 'Show a new code';

  @override
  String get auth_captcha_error => 'That doesn\'t match. Try again.';

  @override
  String get auth_captcha_success => 'Verified';

  @override
  String get auth_captcha_verifyButton => 'Verify';

  @override
  String get auth_enter_full_name_enterYourName => 'Enter your name';

  @override
  String get auth_enter_full_name_fullNameHint => 'eg. John Doe';

  @override
  String get auth_returning_user_welcomeBack => 'Welcome Back';

  @override
  String get auth_returning_user_chooseLoginMethod =>
      'Choose your preferred login method';

  @override
  String get auth_returning_user_mobileNumberLabel => 'Mobile Number:';

  @override
  String get auth_returning_user_loginWithOTP => 'Login with OTP';

  @override
  String get auth_returning_user_switch_to_otp_title => 'Switch to OTP Login';

  @override
  String get auth_returning_user_switch_to_otp_message =>
      'By continuing, your password will be removed. You will use OTP for future logins.';

  @override
  String get auth_returning_user_loginWithPassword => 'Login with Password';

  @override
  String get auth_session_expired_title => 'Session expired';

  @override
  String auth_session_expired_message(String phoneNumber) {
    return 'Your session has expired. Please sign in again to continue using the app with $phoneNumber.';
  }

  @override
  String get auth_login_with_password_title => 'Enter password';

  @override
  String get auth_login_with_password_description =>
      'Please enter your password for';

  @override
  String get auth_returning_user_loginWithAnotherNumber =>
      'Need to login with another number?';

  @override
  String get auth_returning_user_loginWithAnotherAccount =>
      'Login with a different account';

  @override
  String get auth_returning_user_faceIDLogin => 'Face ID Login';

  @override
  String get auth_returning_user_touchIDLogin => 'Touch ID Login';

  @override
  String get auth_returning_user_orWord => 'OR';

  @override
  String get auth_returning_user_confirm_logout_switch_title =>
      'Logout to Switch';

  @override
  String get auth_returning_user_confirm_logout_switch_description =>
      'You\'ll be logged out from your current account before signing in with another.';

  @override
  String get auth_returning_user_confirm_logout_switch_confirm_button_title =>
      'Logout';

  @override
  String get auth_returning_user_confirm_logout_switch_cancel_button_title =>
      'Cancel';

  @override
  String get home_tab_home_tab => 'Home';

  @override
  String get home_tab_welcoming_message_morning => 'Good Morning';

  @override
  String get home_tab_welcoming_message_afternoon => 'Good Afternoon';

  @override
  String get home_tab_welcoming_message_evening => 'Good Evening';

  @override
  String get home_tab_prepaid_validityTill => 'Validity till';

  @override
  String get home_tab_prepaid_myresources => 'My Resources';

  @override
  String get home_tab_prepaid_gold => 'Gold';

  @override
  String get home_tab_prepaid_mamnoon => 'Mamnoon';

  @override
  String get home_tab_postpaid_totalBill => 'Total Bill';

  @override
  String get home_tab_postpaid_paybill => 'Pay Bill';

  @override
  String get home_tab_postpaid_unbilledAmount => 'Unbilled Amount';

  @override
  String get home_tab_postpaid_pastDue => 'Past Due';

  @override
  String get home_tab_postpaid_advancePayment => 'Advance Payment';

  @override
  String get home_sim_restricted_banner_title => 'Your SIM has a restriction';

  @override
  String get home_sim_restricted_banner_subtitle =>
      'Please contact support for assistance.';

  @override
  String get sim_support_warn_recharge_title => 'Recharge your line';

  @override
  String get sim_support_warn_recharge_subtitle =>
      'Your line needs a top-up. Recharge to restore full service and app features.';

  @override
  String get sim_support_dunning_title => 'Payment or recharge needed';

  @override
  String get sim_support_dunning_subtitle =>
      'There is an outstanding bill or balance issue. Pay or recharge to unlock all services.';

  @override
  String get sim_support_postpaid_title => 'Postpaid line restricted';

  @override
  String get sim_support_postpaid_subtitle =>
      'Your postpaid account needs attention. Contact customer support for help.';

  @override
  String get sim_support_prepaid_ineligible_title =>
      'Service not available for this line';

  @override
  String get sim_support_prepaid_ineligible_subtitle =>
      'This offer or service is not available on your prepaid line. Please contact support.';

  @override
  String get sim_support_prepaid_line_issue_title => 'Prepaid line issue';

  @override
  String get sim_support_prepaid_line_issue_subtitle =>
      'Your prepaid line is suspended or blocked. Contact support to resolve it.';

  @override
  String get sim_support_activate_title => 'Activate your SIM';

  @override
  String get sim_support_activate_subtitle =>
      'Insert your Zain SIM in this device, then dial *100# to activate.';

  @override
  String get auth_enter_mobile_number_dial_activate_sim => 'Dial *100#';

  @override
  String get home_tab_loyalty_welcome_to_the_zain_loyalty_program =>
      'Welcome to Zain Loyalty Program';

  @override
  String get loyalty_tutorial_discover_mamnoon =>
      'Discover \"Mamnoon\" program !';

  @override
  String get loyalty_tutorial_watch_video_description =>
      'Watch the video to learn how to earn points and redeem them for rewards and gifts';

  @override
  String get home_tab_loyalty_free_gift => 'Scratch Card Reward';

  @override
  String get home_tab_loyalty_gift_text =>
      'Scratch the card below to reveal your gift';

  @override
  String get home_tab_loyalty_congratulations => 'Congratulations';

  @override
  String get home_tab_loyalty_already_clamed_git_title =>
      'You have already got your daily gift';

  @override
  String get home_tab_loyalty_already_clamed_git_desc =>
      'You have already claimed your reward.. come back later as we gift every 24 hours!';

  @override
  String get home_tab_loyalty_you_got_100_mb_free => 'You got 100MB Free!';

  @override
  String get home_tab_loyalty_next_gift_text =>
      'Come back in 24 hours to claim your next free gift!';

  @override
  String get home_tab_loyalty_gift_disclaimer_text =>
      'Use your finger to scratch the card completely.';

  @override
  String loyalty_not_eligible_title(String name) {
    return 'Dear $name,';
  }

  @override
  String get loyalty_not_eligible_subtitle => '';

  @override
  String get loyalty_not_eligible_body_blacklisted =>
      'For more information please contact call center.';

  @override
  String get home_tab_recent_activities_recentactivities => 'Recent Activities';

  @override
  String get home_tab_recent_activities_recentlyused => 'Recently Used';

  @override
  String get home_tab_banner_view_details => 'Details';

  @override
  String get home_tab_games_zain_games => 'Zain Games';

  @override
  String get home_tab_games_games_title => 'Games';

  @override
  String get home_tab_games_play_and_win => 'Play games everyday and win MBs';

  @override
  String get home_tab_new_releases => 'New Releases';

  @override
  String get home_tab_most_popular => 'Most Popular Bundles';

  @override
  String get home_tab_view_details => 'View Details';

  @override
  String get home_tab_feature_card_kafoo_line => 'Kafoo Line';

  @override
  String get home_tab_feature_zain_fi_title => 'Zain-Fi Devices';

  @override
  String get home_tab_feature_zain_fi_description =>
      'Stay connected and experience|lightning-fast speeds on the go|with Zain-Fi devices.';

  @override
  String get home_tab_feature_esim_title => 'eSIM';

  @override
  String get home_tab_feature_esim_description =>
      'Switching to an eSIM is quick and easy, and it\'s eco-friendly.';

  @override
  String get home_tab_bundle_fastest_45g_internet => 'Fastest 4.5G+ Internet';

  @override
  String get home_tab_bundle_high_speed_data => 'High Speed Data';

  @override
  String get home_tab_bundle_new_release_1 => 'Latest Data Bundle';

  @override
  String get home_tab_bundle_new_release_2 => 'Premium Internet Pack';

  @override
  String get home_tab_fill_name_welcome_to_zain => 'Welcome to Zain';

  @override
  String get home_tab_fill_name_what_should_we_call_you =>
      'What should we call you?';

  @override
  String get home_tab_fill_name_enter_your_name => 'Enter Your Name';

  @override
  String get home_tab_fill_name_maybe_later => 'Maybe Later';

  @override
  String get user_resources_kafoo_credit => 'Kafoo Credit';

  @override
  String get user_resources_free_credit => 'Free Credit';

  @override
  String get user_resources_calls => 'Calls';

  @override
  String get user_resources_data => 'Data';

  @override
  String get user_resources_sms => 'SMS';

  @override
  String get user_resources_roaming => 'Roaming';

  @override
  String get user_resources_international => 'International';

  @override
  String get user_resources_unit_min => 'Min';

  @override
  String get user_resources_unit_sms => 'SMS';

  @override
  String get user_resources_unlimited_internet => '∞ Unlimited Internet';

  @override
  String get user_resources_unit_gb_internet => 'GB Internet';

  @override
  String get user_resources_unit_mb_internet => 'MB Internet';

  @override
  String get user_resources_unit_gb => 'GB';

  @override
  String get user_resources_unit_mb => 'MB';

  @override
  String get user_resources_out_of => 'out of';

  @override
  String user_resources_days_remaining(int days) {
    return '$days Days Remaining';
  }

  @override
  String get resource_details => 'Resource Details';

  @override
  String get resource_details_empty_category =>
      'You are not subscribed to any offer';

  @override
  String get offers_tab_offers_tab => 'Offers';

  @override
  String get offers_tab_offer_internet => 'Internet';

  @override
  String get offers_tab_offer_sms => 'SMS';

  @override
  String get offers_tab_offer_minutes => 'Minutes';

  @override
  String get offers_tab_offer_free_credits => 'Free Credits';

  @override
  String get offers_tab_offer_free_socials => 'Free Socials';

  @override
  String get offers_tab_offer_details => 'Details';

  @override
  String get offers_tab_offer_subscribe => 'Subscribe';

  @override
  String get offers_tab_offer_insufficient_error =>
      'Insufficient balance. Recharge your account to subscribe to this offer.';

  @override
  String get offers_tab_offer_call => 'Call';

  @override
  String get offers_tab_offer_earn_mamnoon_points => 'Mamnoon Points';

  @override
  String get offers_tab_offer_bonus_credit => 'Bonus Credit';

  @override
  String get offers_tab_credit => 'Credit';

  @override
  String get offers_tab_kaffoo_variant_standard => 'Kafoo';

  @override
  String get offers_tab_kaffoo_variant_two_plus_one => 'Kafoo 2+1';

  @override
  String get offers_tab_variant_bikaifi => 'BIKAIFI';

  @override
  String get offers_tab_variant_super_card => 'SUPER CARD';

  @override
  String get offers_tab_variant_unlimited => 'Unlimited';

  @override
  String get offers_tab_variant_free_social => 'Free Social';

  @override
  String get kaffoo_free_social_customise_title => 'Customise your Apps';

  @override
  String get kaffoo_free_social_customise_subtitle =>
      'Replace any included app with another from the same category';

  @override
  String get kaffoo_free_social_swap_confirm_title =>
      'Swap. Personalize. Enjoy.';

  @override
  String get kaffoo_free_social_your_free_apps_title => 'Your Free Apps';

  @override
  String get kaffoo_free_social_customise_button => 'Customise';

  @override
  String get kaffoo_free_social_app_replacement_title => 'App Replacement';

  @override
  String get kaffoo_free_social_first_replacement_prefix =>
      '1st Replacement is ';

  @override
  String get kaffoo_free_social_replacement_free => 'Free';

  @override
  String kaffoo_free_social_replacements_per_cycle(int maxCount) {
    return 'Up to $maxCount replacements per cycle';
  }

  @override
  String get kaffoo_free_social_replacement_changes_label => 'Changes';

  @override
  String get kaffoo_free_social_replacement_no_changes => 'No Changes';

  @override
  String get kaffoo_free_social_replacement_free_change => 'Free Change';

  @override
  String kaffoo_free_social_replacement_pricing_note(
    String price,
    String currency,
  ) {
    return '1 free, then $price $currency each';
  }

  @override
  String kaffoo_free_social_replacement_limit_reached(int maxCount) {
    return 'All $maxCount replacements have been used. You have reached the limit.';
  }

  @override
  String get kaffoo_free_social_replacement_confirm_free_title =>
      'Free App Change';

  @override
  String get kaffoo_free_social_replacement_confirm_free_desc =>
      'No FEE will be deducted from your balance if you continue.';

  @override
  String get kaffoo_free_social_replacement_confirm_paid_title =>
      'Confirm App Changes';

  @override
  String kaffoo_free_social_replacement_confirm_paid_desc(
    String price,
    String currency,
  ) {
    return '$price $currency will be deducted from your balance if you continue.';
  }

  @override
  String get kaffoo_free_social_apps_new_tag => 'NEW';

  @override
  String get kaffoo_free_social_select_apps_title => 'Select your Free Apps';

  @override
  String get kaffoo_free_social_select_apps_hint =>
      'Choose 5 apps from the groups below';

  @override
  String get kaffoo_free_social_light_apps_title => 'Light Apps';

  @override
  String get kaffoo_free_social_heavy_apps_title => 'Heavy Apps';

  @override
  String kaffoo_free_social_choose_up_to(int count) {
    return '(choose upto $count)';
  }

  @override
  String get kaffoo_free_social_selected_label => 'Selected';

  @override
  String get kaffoo_free_social_total_selected => 'Selected';

  @override
  String get kaffoo_free_social_reset => 'Reset';

  @override
  String get kaffoo_free_social_continue => 'Continue';

  @override
  String get kaffoo_free_social_more => 'More';

  @override
  String kaffoo_free_social_max_selection_reached(int count) {
    return 'You can only select up to $count apps from this group. Deselect one to choose another.';
  }

  @override
  String get kaffoo_free_social_review_selection_title =>
      'Review Your Selection';

  @override
  String get kaffoo_free_social_review_selected_prefix => 'You selected ';

  @override
  String get kaffoo_free_social_review_selected_suffix => ' free apps';

  @override
  String get kaffoo_free_social_good_choice => 'Good Choice';

  @override
  String get kaffoo_free_social_bundle_price_note =>
      'This won\'t affect the price of your bundle.';

  @override
  String get offers_tab_variant_tiktok => 'TIKTOK';

  @override
  String get offers_tab_select_package => 'Select Package';

  @override
  String get offers_tab_already_subscribed_warning =>
      'You\'re already subscribed to this offer';

  @override
  String get offers_tab_offer_minutes_with_family => 'Minutes with Family';

  @override
  String get offers_tab_offer_free_sms => 'Free SMS';

  @override
  String get offers_tab_kaffoo_offer_free_sms => 'Free SMS';

  @override
  String get offers_tab_offer_3rd_month_free => '3rd Month Free';

  @override
  String get offers_tab_appExclusiveBadge => 'App Exclusive';

  @override
  String get offers_tab_hotOfferBadge => 'Hot Offer';

  @override
  String get offers_tab_hot => 'Hot';

  @override
  String get offers_tab_search => 'Search';

  @override
  String get account_tab_restricted => 'Restricted';

  @override
  String get offers_tab_subscription_successful => 'Subscription successful!';

  @override
  String get offers_tab_subscription_success_description =>
      'Your selected bundle has been successfully activated. You can now enjoy your';

  @override
  String get offers_tab_subscription_success_body =>
      'Your selected bundle has been successfully activated.\nYou can now enjoy your benefits instantly';

  @override
  String get offers_tab_subscription_activated_bundle => 'Activated Bundle';

  @override
  String get offers_tab_subscription_balance_updated =>
      'Thankyou ! your balance has been updated';

  @override
  String get offers_tab_subscription_conflict_title =>
      'Subscription Conflict Detected';

  @override
  String get offers_tab_subscription_conflict_description =>
      'You currently have an active subscription that conflicts with this offer. Only one bundle of this type can be active at a time.';

  @override
  String get offers_tab_confirm_subscription => 'Confirm Subscription';

  @override
  String get offers_tab_confirm_subscription_details1 =>
      'You are about to subscribe to the selected bundle. Charges will apply as per your plan.';

  @override
  String get offers_tab_confirm_subscription_details2 =>
      'Would you like to continue?';

  @override
  String get offers_tab_confirm_subscription_yes_please => 'yes, Please';

  @override
  String get offers_tab_confirm_subscription_no_cancel => 'No Cancel';

  @override
  String get offers_tab_confirm_subscription_button_confirm => 'Confirm';

  @override
  String get offers_tab_confirm_subscription_maybe_later => 'Maybe Later';

  @override
  String get offers_tab_restricted => 'Restricted';

  @override
  String get offers_tab_offer_subscribed_successfully =>
      'Offer subscribed successfully';

  @override
  String get offers_tab_error_subscribing_offer => 'Error subscribing offer';

  @override
  String get offers_tab_subscription_not_eligible_title => 'Not Eligible';

  @override
  String get offers_tab_subscription_not_eligible_description =>
      'You are not eligible for this offer.';

  @override
  String get offers_tab_subscription_unable_title => 'Oops!';

  @override
  String get offers_tab_subscription_unable_description =>
      'We were unable to process your subscription. Please try again later.';

  @override
  String get offers_tab_gift_sent_successfully => 'Gift sent successfully';

  @override
  String get offers_tab_error_sending_gift => 'Error sending gift';

  @override
  String get offers_tab_no_offers_found => 'No offers found';

  @override
  String get offers_tab_confirm_gift => 'Confirm Gift';

  @override
  String get offers_tab_you_are_about_to_gift => 'You are about to gift';

  @override
  String get offers_tab_priced_at => 'priced at';

  @override
  String get offers_tab_to_the_number => 'to the number';

  @override
  String get offers_tab_would_you_like_to_continue =>
      'Would you like to continue ?';

  @override
  String get offers_tab_send_gift => 'Send Gift';

  @override
  String get offers_tab_enter_gift_number_prompt =>
      'Please enter the Zain number you want to send the gift to';

  @override
  String get offers_tab_filter_offers => 'Filter Offers';

  @override
  String get offers_tab_offer_type => 'Offer Type';

  @override
  String get offers_tab_offer_duration => 'Offer Duration';

  @override
  String get offers_tab_apply_filters => 'Apply Filters';

  @override
  String get offers_tab_clear_filters => 'Reset';

  @override
  String get offers_tab_sort_direction => 'Sort Direction';

  @override
  String get offers_tab_sort_by => 'Sort By';

  @override
  String get offers_tab_sort_ascending => 'Ascending';

  @override
  String get offers_tab_sort_descending => 'Descending';

  @override
  String get offers_tab_sort_by_price => 'Price';

  @override
  String get offers_tab_sort_by_validity => 'Validity';

  @override
  String get offers_tab_sort_by_mbs => 'MBs';

  @override
  String get offers_tab_sort_by_alphabetical => 'Alphabetical';

  @override
  String get offers_tab_offer_roaming => 'Roaming';

  @override
  String get offers_tab_roaming_search_hint => 'Search for country';

  @override
  String get offers_tab_offer_roam_internet => 'Roam Internet';

  @override
  String get offers_tab_offer_roam_mins => 'Roam Mins';

  @override
  String get offers_tab_offer_roam_sms => 'Roam SMS';

  @override
  String get offers_tab_offer_int_internet => 'Int Internet';

  @override
  String get offers_tab_offer_int_mins => 'Int Mins';

  @override
  String get offers_tab_offer_int_sms => 'Int SMS';

  @override
  String get offers_tab_filter_type_bundle_to_gift => 'Bundle to gift';

  @override
  String get offers_tab_filter_type_hot_bundle => 'Hot Bundle';

  @override
  String get offers_tab_filter_duration_daily => 'Daily';

  @override
  String get offers_tab_filter_duration_2_days => '2 Days';

  @override
  String get offers_tab_filter_duration_3_days => '3 Days';

  @override
  String get offers_tab_filter_duration_weekly => 'Weekly';

  @override
  String get offers_tab_filter_duration_10_days => '10 Days';

  @override
  String get offers_tab_filter_duration_14_days => '14 Days';

  @override
  String get offers_tab_filter_duration_20_days => '20 Days';

  @override
  String get offers_tab_filter_duration_monthly => 'Monthly';

  @override
  String get offers_tab_filter_duration_yearly => 'Yearly';

  @override
  String offers_tab_validity_days_count(int days) {
    return '$days Days';
  }

  @override
  String offers_tab_validity_weeks_count(int weeks) {
    return '$weeks Week';
  }

  @override
  String get offers_tab_gift_this_offer => 'Gift this offer';

  @override
  String get offers_tile_header_validity_prefix => 'Validity: ';

  @override
  String offers_tab_offer_validity(int days) {
    return 'Validity: $days Days';
  }

  @override
  String get offers_tab_view_details => 'View Details';

  @override
  String get offers_tab_offer_more_details => 'More Details';

  @override
  String get account_tab_profile_tab => 'Account';

  @override
  String get account_tab_settings => 'Settings';

  @override
  String get account_tab_settings_subtitle => 'Manage your account';

  @override
  String get account_tab_sim_status => 'Sim Status';

  @override
  String get account_tab_active => 'Active';

  @override
  String get account_tab_change_password => 'Change Password';

  @override
  String get change_password_screen_title => 'Change password';

  @override
  String get forgot_password_screen_title => 'Forgot password';

  @override
  String get forgot_password_set_password => 'SET PASSWORD';

  @override
  String get change_password_password_hint => 'Password';

  @override
  String get change_password_confirm_password_hint => 'Confirm password';

  @override
  String get change_password_rules_title => 'Your password should contain:';

  @override
  String get change_password_rule_min_length => 'At least 8 characters';

  @override
  String get change_password_rule_number => 'At least 1 number';

  @override
  String get change_password_rule_upper_lower =>
      'At least one upper-case & lower-case letter';

  @override
  String get change_password_rule_matched => 'Passwords are matched';

  @override
  String get change_password_validate_with_otp => 'VALIDATE WITH OTP';

  @override
  String get change_password_success_title => 'Password Changed';

  @override
  String get change_password_success_message =>
      'You have successfully changed your password';

  @override
  String get forgot_password_success_title => 'Password reset';

  @override
  String get forgot_password_success_message =>
      'You have successfully reset your password. You can sign in with your new password.';

  @override
  String get account_tab_manage_payment_card => 'Manage Payment Card';

  @override
  String get account_tab_manage_subsecription => 'Manage Subscriptions';

  @override
  String get manage_subscription_active_subscription => 'Active Subscriptions';

  @override
  String get manage_subscription_browse_more_offers => 'Browse More Offers';

  @override
  String get manage_subscription_no_subscriptions =>
      'You are not subscribed to any offer';

  @override
  String get manage_subscription_expiring_in => 'Expiring in';

  @override
  String get manage_subscription_day => 'Day';

  @override
  String get manage_subscription_days => 'Days';

  @override
  String get manage_subscription_unsubscribe => 'Unsubscribe';

  @override
  String get manage_subscription_recharge => 'Recharge';

  @override
  String get manage_subscription_resubscribe => 'Resubscribe';

  @override
  String get manage_subscription_pending_recharge => 'Pending recharge';

  @override
  String get manage_subscription_renew_cancelled => 'Renew Cancelled';

  @override
  String get manage_subscription_confirm_unsubscribe =>
      'Confirm Unsubscription';

  @override
  String get manage_subscription_confirm_unsubscribe_description =>
      'Unsubscribing will stop this offer and all its benefits.';

  @override
  String get manage_subscription_keep_offer => 'Keep Offer';

  @override
  String get manage_subscription_unsubscribe_success =>
      'You have successfully unsubscribed.';

  @override
  String get manage_subscription_renews_on => 'Renews on';

  @override
  String get manage_subscription_expires_on => 'Expires on';

  @override
  String get manage_subscription_renew_with_balance => 'Renew with balance';

  @override
  String get manage_subscription_renew_success =>
      'Subscription renewed successfully.';

  @override
  String get manage_subscription_confirm_renew_title => 'Confirm renewal';

  @override
  String get manage_subscription_confirm_renew_body =>
      'Resubscribing will renew this offer and restore its benefits.';

  @override
  String get manage_subscription_status_active => 'Active';

  @override
  String get manage_subscription_view_details => 'View details';

  @override
  String get manage_subscription_cannot_unsubscribe =>
      'This subscription cannot be unsubscribed.';

  @override
  String get account_tab_biometric_login => 'Biometric Login';

  @override
  String get account_tab_biometric_enable_dialog_title =>
      'Enable Biometric Login';

  @override
  String get account_tab_biometric_enable_dialog_description =>
      'You will need to enter your password and complete biometric authentication to enable biometric login.';

  @override
  String get account_tab_biometric_disable_dialog_title =>
      'Disable Biometric Login';

  @override
  String get account_tab_biometric_disable_dialog_description =>
      'Biometric login will be turned off. You can enable it again anytime from Settings.';

  @override
  String get account_tab_biometric_enable_button => 'Enable';

  @override
  String get account_tab_biometric_disable_button => 'Disable';

  @override
  String get account_tab_biometric_confirm_password_title => 'Confirm Password';

  @override
  String get account_tab_biometric_confirm_password_description =>
      'Enter your current password to enable biometric login.';

  @override
  String get account_tab_biometric_password_required =>
      'Please enter your password.';

  @override
  String get account_tab_biometric_wrong_password =>
      'The password you entered is incorrect.';

  @override
  String get account_tab_change_language => 'Select Language';

  @override
  String get account_tab_select_language => 'Select language';

  @override
  String get account_tab_select_language_subtitle =>
      'choose your preferred language to continue';

  @override
  String get account_tab_delete_my_account => 'Delete My Account';

  @override
  String get account_tab_delete_account => 'Delete Account';

  @override
  String get account_tab_delete_your_account => 'Delete Your Account';

  @override
  String get account_tab_delete_account_description_paragraph1 =>
      'You are about to delete your account which will remove your data from the app and log you out. You will have to register again to access the app.';

  @override
  String get account_tab_delete_account_description_paragraph2 =>
      'This does not affect your mobile line and benefits, so you will still have access to your subscriptions, allowances, and other Zain features.';

  @override
  String get account_tab_confirm_delete_account_title =>
      'Confirm Delete Account';

  @override
  String get account_tab_confirm_delete_account_description =>
      'Are you sure you want to delete your account?';

  @override
  String get account_tab_delete_account_confirm_button_title => 'Delete';

  @override
  String get account_tab_delete_account_cancel_button_title => 'Cancel';

  @override
  String get account_tab_confirm_logout_title => 'Confirm logout';

  @override
  String get account_tab_confirm_logout_description =>
      'Are you sure you want to log out?';

  @override
  String get account_tab_confirm_logout_confirm_button_title => 'Logout';

  @override
  String get account_tab_confirm_logout_cancel_button_title => 'Cancel';

  @override
  String get main_container_exit_app_title => 'Exit app';

  @override
  String get main_container_exit_app_description =>
      'Are you sure you want to exit the app?';

  @override
  String get main_container_exit_app_confirm => 'Exit';

  @override
  String get account_tab_support => 'Support';

  @override
  String get account_tab_support_subtitle => 'We\'re here to help';

  @override
  String get account_tab_whatsapp_care => 'WhatsApp Zain Care';

  @override
  String get account_tab_help_and_support => 'Help & Support';

  @override
  String get help_and_support_tutorials => 'Tutorials';

  @override
  String get help_and_support_tutorial_registration => 'Registration';

  @override
  String get help_and_support_tutorial_forget_password => 'Forget Password';

  @override
  String get help_and_support_tutorial_recharge_by_voucher =>
      'Recharge by voucher';

  @override
  String get help_and_support_tutorial_recharge_by_credit_card =>
      'Recharge by credit card';

  @override
  String get help_and_support_tutorial_offers_subscription =>
      'Offers Subscription';

  @override
  String get help_and_support_support_live_chat => 'Live Chat';

  @override
  String get help_and_support_support_live_chat_failed =>
      'Failed to launch Live Chat. Please try again.';

  @override
  String get help_and_support_support_ticket_management => 'Ticket Management';

  @override
  String get help_and_support_ticket_select_complaint_type =>
      'Select complaint type';

  @override
  String get help_and_support_ticket_sort_by_date => 'Sort by Date';

  @override
  String get help_and_support_ticket_sort_by_latest => 'Sort by Latest';

  @override
  String get help_and_support_ticket_sort_by_oldest => 'Sort by Oldest';

  @override
  String get account_tab_find_zain_near_me => 'Find Zain Near Me';

  @override
  String get account_tab_edit_profile => 'Edit Profile';

  @override
  String get account_tab_enter_full_name_fullNameHint => 'Enter your full name';

  @override
  String get account_tab_logout => 'Logout';

  @override
  String get account_tab_could_not_launch_whatsapp =>
      'Could not launch WhatsApp';

  @override
  String get menu_tab_menu => 'Services';

  @override
  String get menu_tab_digital_services => 'Digital Services';

  @override
  String get menu_tab_manage_data_usage => 'Data Usage';

  @override
  String get manage_data_usage_subtitle =>
      'Set your internet usage from KAFOO credit';

  @override
  String get manage_data_usage_limit_description =>
      'Select your limit that can be spent on internet when you have enough credit from KAFOO bundle';

  @override
  String manage_data_usage_header_assigned_credit(
    String amount,
    String currency,
  ) {
    return 'You assigned $amount $currency from your credit for internet usage!';
  }

  @override
  String get manage_data_usage_header_amount_reset =>
      'This amount will reset with each successful bundle renewal';

  @override
  String manage_data_blocking_message(String date) {
    return 'You cannot perform the operation now, please try again after $date';
  }

  @override
  String get menu_tab_manage_subscriptions => 'Subscriptions';

  @override
  String get menu_tab_view_free_units => 'View Free Units';

  @override
  String get menu_tab_recharge => 'Recharge';

  @override
  String get menu_tab_give_feedback => 'Give Feedback';

  @override
  String get give_feedback_title => 'We Value Your Feedback';

  @override
  String get give_feedback_description =>
      'Your comments help us enhance our services. Please rate your experience and share any issues or suggestions.';

  @override
  String get give_feedback_hint => 'Write your feedback here....';

  @override
  String get give_feedback_hint_negative => 'Oh oh! Please help us to improve';

  @override
  String get give_feedback_hint_positive => 'So we are doing great?';

  @override
  String get give_feedback_send_button => 'Send Feedback';

  @override
  String get give_feedback_success_message => 'Thank you for your feedback!';

  @override
  String get menu_tab_get_your_credit_info => 'Credit Info';

  @override
  String get get_credit_info_no_activity_found => 'No activity found';

  @override
  String get get_credit_info_last_3_days => '(last 3 days)';

  @override
  String get get_credit_info_service_type => 'Service Type';

  @override
  String get get_credit_info_time => 'Time';

  @override
  String get get_credit_info_b_number => 'B Number';

  @override
  String get get_credit_info_service_type_received_amount => 'Received amount';

  @override
  String get get_credit_info_service_type_transferred_amount =>
      'Transferred amount';

  @override
  String get get_credit_info_service_type_adjustment => 'Adjustment';

  @override
  String get get_credit_info_service_type_service_fee => 'Service Fee';

  @override
  String get get_credit_info_service_type_balance_recharge =>
      'Balance Recharge';

  @override
  String get get_credit_info_service_type_call => 'Call';

  @override
  String get get_credit_info_service_type_video_call => 'Video Call';

  @override
  String get get_credit_info_service_type_call_roaming => 'Call Roaming';

  @override
  String get get_credit_info_service_type_sms_roaming => 'SMS Roaming';

  @override
  String get get_credit_info_service_type_sms => 'SMS';

  @override
  String get get_credit_info_service_type_mms => 'MMS';

  @override
  String get get_credit_info_service_type_data => 'Data';

  @override
  String get get_credit_info_service_type_data_roaming => 'Data Roaming';

  @override
  String get get_credit_info_service_type_bundle_fee => 'Bundle Fee';

  @override
  String get get_credit_info_service_type_installment => 'Installment';

  @override
  String get get_credit_info_service_type_unknown => 'N/A';

  @override
  String get recharge_choose_recharge_method => 'Choose Your Recharge Method';

  @override
  String get recharge_recharge_method_voucher_pin => 'Voucher PIN';

  @override
  String get recharge_recharge_method_credit_debit => 'Credit/Debit Card';

  @override
  String get recharge_recharge_method_zain_cash => 'Zain Cash';

  @override
  String get recharge_voucher_pin_enter_or_scan_voucher =>
      'Enter or Scan Voucher';

  @override
  String get recharge_voucher_pin_enter_the_16_digit_voucher_pin =>
      'Enter the 16-digit voucher PIN';

  @override
  String get recharge_voucher_pin_recharge => 'Recharge';

  @override
  String
  get recharge_voucher_pin_please_enter_zain_number_you_want_to_recharge =>
      'Please enter Zain number you want to recharge';

  @override
  String get recharge_voucher_pin_recharge_to_others => 'Another Number';

  @override
  String get recharge_voucher_pin_recharge_failed => 'Voucher Recharge Failed';

  @override
  String get recharge_voucher_pin_recharge_failed_message =>
      'Invalid code entered, please check and re-enter 16-digit voucher code';

  @override
  String get recharge_voucher_pin_voucher_already_used_message =>
      'This voucher has already been used.';

  @override
  String get recharge_voucher_pin_success_message =>
      'You Have successfully recharge';

  @override
  String get recharge_success_via => 'Via';

  @override
  String get recharge_success_method_voucher => 'Voucher';

  @override
  String get recharge_success_via_credit_card_to => 'Via Credit Card to';

  @override
  String get recharge_success_recharge_another_number =>
      'Recharge another number';

  @override
  String get common_back_to_home => 'Back to home';

  @override
  String get recharge_credit_debit_card_credit_debit_card =>
      'Credit/Debit Card';

  @override
  String get recharge_credit_debit_card_enter_the_amount_you_want_to_recharge =>
      'Enter the amount you want to recharge';

  @override
  String get recharge_credit_debit_card_enter_the_amount_you_want_to_pay =>
      'Enter the amount you want to pay your bill with';

  @override
  String get recharge_credit_debit_card_select_amount => 'Select Amount';

  @override
  String get recharge_credit_debit_card_select_amount_you_want_to_recharge =>
      'Select the amount you want to recharge';

  @override
  String get recharge_credit_debit_card_payment_unsuccessful =>
      'Payment Unsuccessful';

  @override
  String get recharge_credit_debit_card_payment_unsuccessful_message =>
      'Your credit card payment was not successful. Please ensure your card details are correct and try again.';

  @override
  String get recharge_credit_debit_card_3ds_cancelled =>
      'Payment authentication was cancelled.';

  @override
  String get recharge_credit_debit_card_3ds_webview_title =>
      'Secure verification';

  @override
  String get recharge_credit_debit_card_payment_successful =>
      'Payment successful';

  @override
  String get recharge_credit_debit_card_payment_successful_message =>
      'Your payment has been successfully processed';

  @override
  String get recharge_credit_debit_card_additional_fees =>
      'Additional fees might be applied by the bank or the credit card issuer';

  @override
  String get recharge_credit_debit_card_your_card_number => 'Your card number';

  @override
  String get recharge_credit_debit_card_your_name_on_card =>
      'Your name on the card';

  @override
  String get recharge_credit_debit_card_powered_by => 'Powered by';

  @override
  String get recharge_credit_debit_card_recharge_with_zain_cash =>
      'Recharge with Zain Cash';

  @override
  String get recharge_credit_debit_card_totalAmount => 'Total Amount';

  @override
  String get recharge_credit_debit_card_current_balance => 'Current Balance';

  @override
  String get recharge_credit_debit_card_expiry_hint => 'MM/YY';

  @override
  String get recharge_credit_debit_card_cvv_hint => 'CVV';

  @override
  String get recharge_credit_debit_card_expiry_error_month =>
      'Month must be between 01 and 12';

  @override
  String get recharge_credit_debit_card_expiry_error_past =>
      'Expiry date cannot be in the past';

  @override
  String recharge_credit_debit_card_expiry_error_future(int maxYears) {
    return 'Expiry date cannot be more than $maxYears years in the future';
  }

  @override
  String get recharge_zain_cash_pay_bill_with_zain_cash =>
      'Pay Bill with Zain Cash';

  @override
  String get recharge_zain_cash_webview_pay_with_zain_cash =>
      'Pay with Zain Cash';

  @override
  String get recharge_zain_cash_webview_error_loading =>
      'Error loading Zain Cash';

  @override
  String get recharge_zain_cash_enter_recharge_amount =>
      'Please enter the recharge amount';

  @override
  String get recharge_zain_cash_confirm_amount_title => 'Confirm amount';

  @override
  String recharge_zain_cash_confirm_amount_message(String amount) {
    return 'You are about to pay $amount. Do you want to continue?';
  }

  @override
  String get recharge_transfer_credit_transferCredit => 'Transfer Credit';

  @override
  String
  get recharge_transfer_credit_please_enter_zain_number_you_want_to_send_credit_to =>
      'Please enter Zain number you want to transfer credit';

  @override
  String get recharge_transfer_credit_please_enter_amount_of_money =>
      'Please enter the amount of money you would like to send';

  @override
  String get recharge_transfer_credit_noContactsPermissionButton =>
      'Activate from settings';

  @override
  String get recharge_transfer_credit_no_permission_for_contact =>
      'no permission to read your contacts list';

  @override
  String get recharge_transfer_credit_no_contacts_to_show =>
      'no contacts to show';

  @override
  String get recharge_transfer_credit_select_contact => 'Select Contact';

  @override
  String get recharge_transfer_credit_transferAmount => 'Transfer Amount';

  @override
  String get recharge_transfer_credit_confirmTransfer => 'Confirm Transfer';

  @override
  String recharge_transfer_credit_confirmTransferMessage(
    String phoneNumber,
    String amount,
  ) {
    return 'Are you sure you want to transfer to $phoneNumber a credit of $amount';
  }

  @override
  String get recharge_transfer_credit_transfer => 'Transfer';

  @override
  String get contact_list_no_contacts_to_show => 'no contacts to show';

  @override
  String get contact_list_no_permission_for_contact =>
      'no permission to read your contacts list';

  @override
  String get contact_list_no_permission_button => 'Activate from settings';

  @override
  String get recharge_transfer_credit_search => 'Who are you looking for?';

  @override
  String get contact_list_select_contact => 'Select Contact';

  @override
  String get loyalty_dashboard_how_to_earn_points => 'How to Earn Points';

  @override
  String get loyalty_dashboard_redeem_points => 'Redeem Points';

  @override
  String get loyalty_dashboard_hot_bundles => 'Hot Bundles';

  @override
  String get loyalty_dashboard_points_history => 'Point History';

  @override
  String get loyalty_dashboard_help => 'Help';

  @override
  String get loyalty_dashboard_platinum => 'Platinum';

  @override
  String get loyalty_dashboard_silver => 'Silver';

  @override
  String get loyalty_redeem_points_bundles => 'Bundles';

  @override
  String get loyalty_redeem_points_credits => 'Credits';

  @override
  String get loyalty_redeem_points_stores => 'Stores';

  @override
  String get loyalty_redeem_points_stores_location_services_disabled_message =>
      'Please enable location services to find nearby stores.';

  @override
  String get loyalty_redeem_points_stores_permission_denied_message =>
      'Please enable location permission to find nearby stores.';

  @override
  String get loyalty_redeem_points_stores_permission_denied_forever_message =>
      'Location permission is permanently denied. Please open app settings to enable it.';

  @override
  String get loyalty_redeem_points_stores_enable_location_services =>
      'Enable Location Services';

  @override
  String get loyalty_redeem_points_stores_request_permission_again =>
      'Request Permission Again';

  @override
  String get loyalty_redeem_points_stores_open_app_settings => 'Open Settings';

  @override
  String get loyalty_redeem_points_points => 'Points';

  @override
  String get loyalty_hot_bundles_loyalty_points_label => 'Loyalty Points';

  @override
  String get loyalty_redeem_points_no_bundles_available =>
      'No bundles available';

  @override
  String get loyalty_bundles_redeem_success_message =>
      'Your bundle has been activated successfully.';

  @override
  String
  get loyalty_redeem_points_please_enter_amount_of_points_you_want_to_redeem_to_credit =>
      'Please enter the amount of points you want to redeem to credit';

  @override
  String
  get loyalty_redeem_points_redeem_mamnoon_points_to_credit_to_be_used_for_all_networks =>
      'Redeem Mamnoon points to credit to be used for all networks';

  @override
  String get loyalty_extend_validity_select_length_of_extension =>
      'Select extension period';

  @override
  String get loyalty_extend_validity_select_extension_subtitle =>
      'Choose how long you want to extend your line validity';

  @override
  String loyalty_extend_validity_option_subtitle(String duration) {
    return 'Extend validity for $duration';
  }

  @override
  String get loyalty_extend_validity_service_active_info =>
      'Service will be active for selected period';

  @override
  String get loyalty_extend_validity_extension_label => 'Extension';

  @override
  String get loyalty_extend_validity_total_price_label => 'Total Price';

  @override
  String get loyalty_extend_validity_day => 'Day';

  @override
  String get loyalty_extend_validity_days => 'Days';

  @override
  String get loyalty_extend_validity_week => 'Week';

  @override
  String get loyalty_extend_validity_weeks => 'Weeks';

  @override
  String get loyalty_extend_validity_month => 'Month';

  @override
  String get loyalty_extend_validity_months => 'Months';

  @override
  String get loyalty_extend_validity_year => 'Year';

  @override
  String get loyalty_extend_validity_extendValidity => 'Extend Validity';

  @override
  String get loyalty_extend_validity_extendValidityAlertTitle =>
      'Confirm Extension';

  @override
  String get loyalty_extend_validity_extendValidityAlertBody1 =>
      'Your credit validity will be extended for';

  @override
  String get loyalty_extend_validity_extendValidityAlertBody2 =>
      'with a fee of';

  @override
  String get loyalty_extend_validity_extension_successful =>
      'Extension Successful';

  @override
  String get loyalty_extend_validity_success_message =>
      'The validity has been successfully extended.';

  @override
  String get loyalty_extend_validity_noThanks => 'No, Thanks';

  @override
  String get digital_services_explore => 'EXPLORE';

  @override
  String get digital_services_all => 'All';

  @override
  String get digital_services_games => 'GAMES';

  @override
  String get digital_services_ehealth_insurance => 'E-HEALTH & INSURANCE';

  @override
  String get digital_services_elearning => 'E-LEARNING';

  @override
  String get digital_services_entertainment => 'Entertainment';

  @override
  String get digital_services_zain_world_kids => 'ZAIN WORLD KIDS';

  @override
  String get digital_services_esports_service => 'ESPORTS SERVICE';

  @override
  String get digital_services_appstore => 'APP STORE';

  @override
  String get digital_services_voucher_and_estores => 'VOUCHER & E-STORES';

  @override
  String get digital_services_no_services_available => 'No service available';

  @override
  String get digital_services_details => 'Details';

  @override
  String get update_version_update_version_cancel => 'Cancel';

  @override
  String get update_version_update_required_skip => 'Skip';

  @override
  String get update_version_update_version_update_badge => 'NEW UPDATE';

  @override
  String get update_version_update_version_update_now => 'Update the app now!';

  @override
  String get update_version_update_required_now => 'Update the app now!';

  @override
  String get update_version_update_version_update_title => 'Update Required';

  @override
  String get update_version_update_required_title => 'Update Required';

  @override
  String get update_version_update_version_update_desc =>
      'A new version of the app is available.\nGet the latest version to enjoy our newest services,\nenhanced features, and the best possible experience.';

  @override
  String get update_version_update_required_desc =>
      'A new version of the app is available.\nGet the latest version to enjoy our newest services,\nenhanced features, and the best possible experience.';

  @override
  String get update_version_update_highlight_better_performance_title =>
      'Better Performance';

  @override
  String get update_version_update_highlight_bug_fixes_title => 'Bug Fixes';

  @override
  String get update_version_update_highlight_security_improvements_title =>
      'Security Improvements';

  @override
  String get edit_profile_screen_title => 'Edit Profile';

  @override
  String get edit_profile_photo_sheet_title => 'Edit Profile Photo';

  @override
  String get edit_profile_remove_current_photo => 'Remove Current Photo';

  @override
  String get edit_profile_select_new_photo => 'Select New Photo';

  @override
  String get edit_profile_capture_new_photo => 'Capture New Photo';

  @override
  String get edit_profile_full_name => 'Full Name';

  @override
  String get edit_profile_save_changes => 'Save Changes';

  @override
  String get edit_profile_confirm_changes_title => 'Confirm Changes';

  @override
  String get edit_profile_confirm_changes_message =>
      'Are you sure you want to save these changes?';

  @override
  String get edit_profile_yes_please => 'Yes, Please';

  @override
  String get edit_profile_back => 'Back';

  @override
  String get edit_profile_remove_photo_title => 'Remove Photo';

  @override
  String get edit_profile_remove_photo_message =>
      'Are you sure you want to remove Current Photo?';

  @override
  String get common_something_went_wrong => 'Something went wrong';

  @override
  String get common_something_went_wrong_message =>
      'We didn\'t see that coming. Please try again in a moment.';

  @override
  String get common_contact_support => 'Contact Support';

  @override
  String get zain_near_me_list_of_stores => 'List of Store';

  @override
  String get zain_near_me_map_view => 'Map View';

  @override
  String get zain_near_me_no_stores_found => 'No stores found';

  @override
  String get zain_near_me_enable_location_message =>
      'Please Enable Location Permission to use this feature';

  @override
  String get zain_near_me_enable_location_button =>
      'Enable Location Permission';

  @override
  String get zain_near_me_request_permission_again =>
      'Request Permission Again';

  @override
  String get zain_near_me_open_settings => 'Open Settings';

  @override
  String get zain_near_me_map_view_coming_soon => 'Map view coming soon';

  @override
  String get zain_near_me_permission_permanently_denied =>
      'Location permission is permanently denied. Please open app settings to enable it.';

  @override
  String get zain_near_me_get_directions => 'Get Directions';

  @override
  String get zain_near_me_close => 'Close';

  @override
  String get zain_near_me_store_location_not_available =>
      'Store location not available';

  @override
  String zain_near_me_distance_km_away(String distance) {
    return '$distance km away';
  }

  @override
  String get zain_near_me_opening_hours_day => 'Day';

  @override
  String get zain_near_me_opening_hours_work_hours => 'Work hours';

  @override
  String get zain_near_me_opening_hours_rest_hours => 'Rest hours';

  @override
  String get zain_near_me_opening_hours_closed => 'Closed';

  @override
  String zain_near_me_store_status_opens_closes(
    String startTime,
    String endTime,
  ) {
    return 'Opens $startTime • Closes $endTime';
  }

  @override
  String get zain_near_me_store_status_closed => 'Closed';

  @override
  String get zain_near_me_day_sunday => 'Sunday';

  @override
  String get zain_near_me_day_monday => 'Monday';

  @override
  String get zain_near_me_day_tuesday => 'Tuesday';

  @override
  String get zain_near_me_day_wednesday => 'Wednesday';

  @override
  String get zain_near_me_day_thursday => 'Thursday';

  @override
  String get zain_near_me_day_friday => 'Friday';

  @override
  String get zain_near_me_day_saturday => 'Saturday';

  @override
  String get zain_near_me_time_am => 'AM';

  @override
  String get zain_near_me_time_pm => 'PM';

  @override
  String get kafoo_intro_slide1_title => 'What\'s KAFOO?';

  @override
  String get kafoo_intro_slide1_description =>
      'Kafoo bundles portfolio gives you multiplied credit and unlimited flexibility to make calls and SMS across all local networks and use 4.5G+ Internet.';

  @override
  String get kafoo_intro_slide2_title => 'What\'s KAFOO Family?';

  @override
  String get kafoo_intro_slide2_description =>
      'With the all-new KAFOO Family Bundles, you can enjoy all the benefits of KAFOO and also share them with your family and friends.';

  @override
  String get kafoo_intro_slide3_title => 'Free Social Media with KAFOO!';

  @override
  String get kafoo_intro_slide3_description =>
      'Enjoy unlimited free social media with all your favorite apps. Avail 20% bonus credit when subscribing through the app on KAFOO 20, 25, and 30.';

  @override
  String get kafoo_intro_explore_bundles => 'Explore KAFOO Bundles!';

  @override
  String get notifications_screen_title => 'Notification';

  @override
  String get notifications_mark_all_as_read => 'Mark All as Read';

  @override
  String get notifications_show_unread_only => 'Show Unread Only';

  @override
  String get notifications_error_fetching => 'Error fetching notifications';

  @override
  String get auth_native_biometric_title => 'Enable Biometric Login';

  @override
  String get auth_native_biometric_subtitle =>
      'You will be able to login more quickly';

  @override
  String get auth_native_biometric_enable_button => 'Enable Biometric';

  @override
  String get auth_native_biometric_skip_button => 'Skip';

  @override
  String get loyalty_dashboard_mamnoon_rewards => 'Mamnoon Rewards';

  @override
  String get loyalty_dashboard_mamnoon_gifts_discounts => 'Gifts and Discounts';

  @override
  String get loyalty_dashboard_mamnoon_redeem => 'Redeem';

  @override
  String get loyalty_dashboard_mamnoon_enter_points => 'Enter Points';

  @override
  String get loyalty_dashboard_mamnoon_cancel => 'Cancel';

  @override
  String get loyalty_dashboard_mamnoon_please_confirm => 'Please Confirm';

  @override
  String loyalty_dashboard_mamnoon_points_redeem_for_gifts(int points) {
    return '$points points will be Redeemed for this gift.';
  }

  @override
  String loyalty_dashboard_points_range_error(int minPoints, int maxPoints) {
    return 'Points should be between $minPoints and $maxPoints.';
  }

  @override
  String get loyalty_dashboard_redemption_history => 'Rewards history';

  @override
  String get loyalty_dashboard_no_redemption_history =>
      'There is no redemption history';

  @override
  String get loyalty_dashboard_you_currently_have => 'You currently have:';

  @override
  String loyalty_dashboard_total_spendable_points(int totalSpendablePoints) {
    return '$totalSpendablePoints Points';
  }

  @override
  String get loyalty_dashboard_congratulations => 'Congratulations!';

  @override
  String get loyalty_dashboard_points_redeemed_successfully =>
      'Your points are successfully redeemed!';

  @override
  String get loyalty_dashboard_redemption_failed => 'Redemption failed';

  @override
  String get loyalty_dashboard_see_details => 'SEE DETAILS';

  @override
  String get loyalty_statement_points_earned => 'Points earned';

  @override
  String get loyalty_statement_points_redeemed => 'Points redeemed';

  @override
  String get loyalty_statement_your_point_history => 'Points history';

  @override
  String get loyalty_statement_no_history_available => 'No history available';

  @override
  String get loyalty_statement_type => 'Type';

  @override
  String get loyalty_statement_partner => 'Partner';

  @override
  String get loyalty_statement_mamnoon_points => 'Mamnoon Points';

  @override
  String get loyalty_statement_points_redemption => 'Points Redemption';

  @override
  String get loyalty_statement_close => 'CLOSE';

  @override
  String get loyalty_statement_redeem_again => 'REDEEM AGAIN';

  @override
  String loyalty_dashboard_valid_until(String validUntil) {
    return 'Valid until $validUntil';
  }

  @override
  String get loyalty_dashboard_faq => 'FAQ';

  @override
  String get loyalty_help_no_faq_items_available => 'No FAQ items available';

  @override
  String get loyalty_help_and_faq => 'Help & FAQ';

  @override
  String get loyalty_help_contact_us => 'Contact us';

  @override
  String loyalty_dashboard_zain_network(String zainNetworkNumber) {
    return 'Zain Network: $zainNetworkNumber';
  }

  @override
  String loyalty_dashboard_other_networks(String otherNetworksNumber) {
    return 'Other Networks: $otherNetworksNumber';
  }

  @override
  String get loyalty_help_whatsapp_zain_care => 'WhatsApp Zain Care';

  @override
  String get loyalty_help_could_not_open_email_client =>
      'Could not open email client';

  @override
  String get loyalty_dashboard_gifts_and_discounts => 'Gifts and Discounts';

  @override
  String get loyalty_store_details => 'Store Details';

  @override
  String get loyalty_store_promo_code_copied => 'Promo code copied!';

  @override
  String get loyalty_store_could_not_open_google_maps =>
      'Could not open Google Maps';

  @override
  String get loyalty_store_view_on_map => 'VIEW ON MAP';

  @override
  String get loyalty_store_redeem_offer => 'REDEEM';

  @override
  String loyalty_store_normal_redemption_visit_message(String storeName) {
    return 'To get this offer please visit $storeName';
  }

  @override
  String get loyalty_store_report_merchant => 'REPORT MERCHANT';

  @override
  String get loyalty_store_report_merchant_confirm => 'Report merchant?';

  @override
  String get loyalty_store_report_merchant_guideline =>
      'Please only report merchants who do not fulfill the offers listed on our app';

  @override
  String get loyalty_store_got_it => 'GOT IT';

  @override
  String get loyalty_store_enter_valid_points => 'Enter valid points';

  @override
  String loyalty_store_minimum_points_required(String minPoints) {
    return 'Minimum $minPoints points required';
  }

  @override
  String get loyalty_store_not_enough_points => 'You don’t have enough points';

  @override
  String loyalty_store_maximum_allowed_points(String maxPoints) {
    return 'Maximum allowed is $maxPoints points';
  }

  @override
  String loyalty_store_earn_more_points_to_upgrade(
    String points,
    String nextTier,
  ) {
    return 'Earn more $points points to upgrade to $nextTier';
  }

  @override
  String loyalty_dashboard_mamnoon_earn_points_to_redeem(int missing_points) {
    return 'Earn $missing_points extra points to redeem this offer';
  }

  @override
  String get start_date_end_date => 'Start date - End date';

  @override
  String get select_date => 'Select Date';

  @override
  String get clear_filter => 'Clear Filter';

  @override
  String get end_date => 'End Date';

  @override
  String get mon => 'Mon';

  @override
  String get tue => 'Tue';

  @override
  String get wed => 'Wed';

  @override
  String get thu => 'Thu';

  @override
  String get fri => 'Fri';

  @override
  String get sat => 'Sat';

  @override
  String get sun => 'Sun';

  @override
  String get loyalty_info_details_title => 'Mamnoon Rewards Points';

  @override
  String get loyalty_how_to_earn_points => 'How to Earn Points';

  @override
  String get loyalty_expiring_on => 'Expiring on';

  @override
  String get onboarding_welcome_to_zain => 'Welcome to Zain';

  @override
  String get onboarding_experience_best_services =>
      'Fast, stable, and reliable coverage built for everyday communication, streaming, gaming, and work.';

  @override
  String get onboarding_manage_your_account => 'Manage Your Account';

  @override
  String get onboarding_account_description =>
      'Check your balance, recharge, and manage subscriptions easily';

  @override
  String get onboarding_explore_offers => 'Explore Offers';

  @override
  String get onboarding_offers_description =>
      'Discover amazing offers and bundles tailored for you';

  @override
  String get onboarding_get_started => 'Get Started';

  @override
  String get error_could_not_open_link => 'Could not open link';

  @override
  String get digital_services_more_details => 'More Details';

  @override
  String get common_see_more => 'See More';

  @override
  String get common_show_qr_code => 'SHOW QR CODE';

  @override
  String get common_show_barcode => 'SHOW BARCODE';

  @override
  String get common_promo_code => 'Promo Code';

  @override
  String get common_promo_code_copied => 'Promo code copied!';

  @override
  String get common_all => 'All';

  @override
  String get service_data => 'Data';

  @override
  String get service_minutes => 'Minutes';

  @override
  String get service_sms => 'SMS';

  @override
  String get common_redeem_offer => 'Redeem Offer';

  @override
  String get redeem_offer_confirmation_message =>
      'points will be Redeemed for this gift';

  @override
  String get redeem_offer_button => 'REDEEM OFFER';

  @override
  String get common_congratulations => 'Congratulations!';

  @override
  String get redeem_barcode_success_message =>
      'Your barcode has been redeemed successfully';

  @override
  String get common_close => 'CLOSE';

  @override
  String get barcode_error_unable_to_generate => 'Unable to generate barcode';

  @override
  String get redeem_offer_success_discount_received =>
      'You have got the discount';

  @override
  String redeem_offer_show_to_merchant(String merchantName) {
    return 'Show the dialog to the merchant $merchantName to get:';
  }

  @override
  String get qr_scan_get_discount => 'Scan the QR code to get the discount';

  @override
  String get redeem_offer_copy_code => 'Copy Code';

  @override
  String get report_merchant_success_title => 'Merchant reported';

  @override
  String get report_merchant_success_message =>
      'We will look into this and make sure it does not happen again';

  @override
  String get redeem_offer_success_discount_text_1 =>
      'You\'ve got the discount. Show the counter to the merchant';

  @override
  String get common_unable_to_generate_barcode => 'Unable to generate barcode';

  @override
  String get redeem_offer_success_to_get => 'to get:';

  @override
  String get common_code => 'code:';

  @override
  String get common_details => 'Details';

  @override
  String get common_redeem_on => 'Redeem on';

  @override
  String get common_choose_governorate => 'Choose Governorate';

  @override
  String get common_select => 'SELECT';

  @override
  String get common_clear_filter => 'CLEAR FILTER';

  @override
  String get common_selected => 'Selected';

  @override
  String get scan_card => 'Scan Card';

  @override
  String get initializing_camera => 'Initializing camera...';

  @override
  String get camera_no_available => 'No cameras available';

  @override
  String get camera_permission_required => 'Camera permission is required';

  @override
  String get camera_permission_settings =>
      'Camera permission is required. Please enable it in Settings.';

  @override
  String get camera_init_failed => 'Failed to initialize camera';

  @override
  String get camera_init_failed_generic => 'Failed to initialize camera';

  @override
  String get position_card => 'Position card within the frame';

  @override
  String get card_not_detected => 'Card Not Detected';

  @override
  String get card_not_detected_desc =>
      'Could not detect a card number. Please try again.';

  @override
  String get try_again => 'Try Again';

  @override
  String get error_processing_image => 'Error processing image';

  @override
  String get open_settings => 'Open Settings';

  @override
  String get use_scanned_code => 'Use scanned code';

  @override
  String get enter_manually => 'Enter manually';

  @override
  String get instruction_digits =>
      'To start scanning, place the sixteen-digit number inside the yellow box.';

  @override
  String get instruction_qr =>
      'To start scanning, place the QR code inside the yellow box.';

  @override
  String get scanner_mode_digits => 'DIGITS';

  @override
  String get scanner_mode_qr => 'QR CODE';

  @override
  String get voucher_pin_scanner => 'Voucher Pin Scanner';

  @override
  String get zain_cash_recharge_failed => 'Zain Cash Recharge Failed';

  @override
  String get transaction_failed => 'Transaction failed';

  @override
  String get submit_new_ticket => 'Submit New Ticket';

  @override
  String get submit_ticket_attachments => 'Attachments';

  @override
  String get submit_ticket_upload_attachment => 'Upload Attachment';

  @override
  String submit_ticket_upload_files_hint(Object maxFiles) {
    return 'Upload up to $maxFiles files (PDF, JPG, JPEG, PNG)';
  }

  @override
  String get submit_ticket_attachment_invalid_file_type =>
      'File type not supported. Please upload PDF, JPG, JPEG, or PNG.';

  @override
  String get submit_ticket_attachment_duplicate_file =>
      'This file has already been uploaded.';

  @override
  String get submit_ticket_attachment_unreadable_file => 'Unable to read file.';

  @override
  String submit_ticket_attachment_size_limit_exceeded(Object maxSizeMb) {
    return 'Total attachment size must be less than $maxSizeMb MB.';
  }

  @override
  String get submit_ticket_hint_upload_images =>
      'Upload up to 3 images (optional)';

  @override
  String get submit_ticket_description => 'Description';

  @override
  String get submit_ticket_describe_your_issue => 'Describe your issue…';

  @override
  String get submit_ticket_complaint_type => 'Complaint Type';

  @override
  String get submit_ticket_location => 'Location';

  @override
  String get submit_ticket_governorate => 'Governorate';

  @override
  String get submit_ticket_city => 'City';

  @override
  String get submit_ticket_enter_your_answer => 'Enter your answer';

  @override
  String get submit_ticket_date_future_error => 'Date cannot be in the future';

  @override
  String get submit_ticket_time_future_error => 'Invalid time';

  @override
  String get submit_ticket_additional_questions => 'Additional Questions';

  @override
  String get submit_ticket_success_message =>
      'Your ticket has been submitted successfully. We will get back to you soon.';

  @override
  String get submit_ticket_select_summary => 'Select summary';

  @override
  String get submit_ticket_select_option => 'Select an option';

  @override
  String get submit_ticket_summary => 'Summary';

  @override
  String submit_ticket_ticket_files_count(Object ticketId, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# files',
      one: '# file',
    );
    return 'Ticket #$ticketId • $_temp0';
  }

  @override
  String ticket_count_label(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Tickets',
      one: '# Ticket',
    );
    return '$_temp0';
  }

  @override
  String submit_ticket_attachment_count(Object count) {
    return '$count Attachment(s)';
  }

  @override
  String get submit_ticket_no_attachments => 'No attachments';

  @override
  String get submit_ticket_answers => 'Answers';

  @override
  String get submit_ticket_details => 'Ticket Details';

  @override
  String get submit_ticket_no_tickets => 'No tickets yet';

  @override
  String get submit_ticket_create_hint =>
      'Submit a new ticket using the button below.';

  @override
  String get submit_ticket_retry => 'Retry';

  @override
  String get submit_ticket_submit_ticket => 'Submit Ticket';

  @override
  String get submit_ticket_my_tickets => 'My Tickets';

  @override
  String get submit_ticket_search => 'Search tickets…';

  @override
  String get submit_ticket_summary_label => 'Summary:';

  @override
  String get submit_ticket_created => 'Created:';

  @override
  String get submit_ticket_view_details => 'View Details';

  @override
  String get submit_ticket_reopen => 'Re-open Ticket';

  @override
  String get submit_ticket_reopen_instruction =>
      'Select a reason and provide additional details.';

  @override
  String get submit_ticket_reopen_success => 'Success opening ticket';

  @override
  String get submit_ticket_additional_details =>
      'Additional details (optional)';

  @override
  String get submit_ticket_no_matches => 'No matches found';

  @override
  String get submit_ticket_no_results_hint =>
      'We couldn\'t find any tickets matching your search.';

  @override
  String get submit_ticket_description_hint => 'Describe your issue…';

  @override
  String get submit_ticket_scan_card => 'Scan Card';

  @override
  String get submit_ticket_initializing_camera => 'Initializing camera...';

  @override
  String get submit_ticket_camera_no_available => 'No cameras available';

  @override
  String get submit_ticket_camera_permission_required =>
      'Camera permission is required';

  @override
  String get submit_ticket_camera_permission_settings =>
      'Camera permission is required. Please enable it in Settings.';

  @override
  String get submit_ticket_camera_init_failed => 'Failed to initialize camera';

  @override
  String get submit_ticket_camera_init_failed_generic =>
      'Failed to initialize camera';

  @override
  String get submit_ticket_position_card => 'Position card within the frame';

  @override
  String get submit_ticket_card_not_detected => 'Card Not Detected';

  @override
  String get submit_ticket_card_not_detected_desc =>
      'Could not detect a card number. Please try again.';

  @override
  String get submit_ticket_try_again => 'Try Again';

  @override
  String get submit_ticket_error_processing_image => 'Error processing image';

  @override
  String get submit_ticket_open_settings => 'Open Settings';

  @override
  String get submit_ticket_use_scanned_code => 'Use scanned code';

  @override
  String get submit_ticket_enter_manually => 'Enter Manually';

  @override
  String get submit_ticket_voucher_pin_scanner => 'Voucher Pin Scanner';

  @override
  String get submit_ticket_submit_new_ticket => 'Submit New Ticket';

  @override
  String get submit_ticket_ticket_submitted => 'Ticket Submitted!';

  @override
  String submit_ticket_ticket_number(Object ticketNumber) {
    return 'Ticket #$ticketNumber';
  }

  @override
  String get submit_ticket_usim_required => 'USIM Required';

  @override
  String submit_ticket_usim_required_desc(Object summary) {
    return 'You need USIM to create ticket in \"$summary\".';
  }

  @override
  String get common_item => 'Item';

  @override
  String get enter_card_number => 'Enter card number';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get week => 'This Week';

  @override
  String get older => 'Older';

  @override
  String get confirm_delete_title => 'Delete notification?';

  @override
  String get confirm_delete_description =>
      'This action cannot be undone. The notification will be permanently removed.';

  @override
  String get time_just_now => 'Just now';

  @override
  String time_minutes_ago(int count) {
    return '$count minute(s) ago';
  }

  @override
  String time_hours_ago(int count) {
    return '$count hour(s) ago';
  }

  @override
  String time_days_ago(int count) {
    return '$count day(s) ago';
  }

  @override
  String time_weeks_ago(int count) {
    return '$count week(s) ago';
  }

  @override
  String time_months_ago(int count) {
    return '$count month(s) ago';
  }

  @override
  String time_years_ago(int count) {
    return '$count year(s) ago';
  }

  @override
  String get notifications_no_unread => 'No unread notifications';

  @override
  String get notifications_show_all => 'Show all';

  @override
  String get general_error => 'General error';

  @override
  String get common_error => 'Error';

  @override
  String get authentication_failed =>
      'Authentication failed. Please try again.';

  @override
  String get failed_to_check_authentication_status =>
      'Failed to check authentication status';

  @override
  String get common_page_not_found_title => 'Page not found';

  @override
  String get common_page_not_found_description =>
      'The page you are looking for does not exist.';

  @override
  String get common_go_home => 'Go Home';

  @override
  String get loyalty_statement_date => 'Date';

  @override
  String get common_not_applicable => 'N/A';

  @override
  String get offers_tab_service_types_joiner => ', and ';

  @override
  String get common_no_internet_connection_short => 'No internet connection';

  @override
  String get recharge_hyper_pay_no_bridge_response =>
      'No response from payment service';

  @override
  String get recharge_hyper_pay_payment_failed => 'Payment failed';

  @override
  String recharge_hyper_pay_unknown_response_type(String responseType) {
    return 'Unknown payment response: $responseType';
  }

  @override
  String get recharge_hyper_pay_platform_error => 'Platform error';

  @override
  String get common_unknown_error => 'Something went wrong. Please try again.';

  @override
  String get onboarding_stay_connected_across_iraq =>
      'Stay Connected Across Iraq';

  @override
  String get onboarding_connectivity => 'Connectivity';

  @override
  String get onboarding_account_dashboard => 'Account Dashboard';

  @override
  String get onboarding_everything_in_one_place => 'Everything in One Place';

  @override
  String get onboarding_manage_services_description =>
      'Manage balance, recharge, subscriptions, internet packages, and usage instantly.';

  @override
  String get onboarding_loyalty_program => 'Loyalty Program';

  @override
  String get onboarding_rewards_more => 'Rewards & More';

  @override
  String get onboarding_loyalty_description =>
      'Unlock exclusive offers, collect rewards, discover entertainment, and enjoy personalized deals.';

  @override
  String get onboarding_join_zain => 'Join Zain';

  @override
  String get onboarding_join_customers => 'Join 20M+ Satisfied Customers';

  @override
  String get onboarding_create_account_description =>
      'Create your account in seconds and start managing your services instantly.';

  @override
  String get imtiyaz_merchant_details_confirm_redeption_popup_title =>
      'Please Confirm';

  @override
  String get zain_loyalty_promo_codes_redemption_popup_title => 'Confirmation';

  @override
  String redeem_offer_confirmation_no_points_message(String merchantName) {
    return 'Are you sure you want to reveal the offer for $merchantName?';
  }

  @override
  String get common_success => 'Success';

  @override
  String get ticket_location_picker_selectLocation => 'Select location';

  @override
  String get ticket_location_picker_readingAddress => 'Reading address…';

  @override
  String get ticket_location_picker_addressUnavailable =>
      'Address unavailable for this point';

  @override
  String get submit_ticket_location_pick_prompt =>
      'We need you to pick the issue location on the map.';

  @override
  String get submit_ticket_tap_to_pick_on_map => 'Tap to pick on map';

  @override
  String get bundle_sharing_view_users => 'Manage lines';

  @override
  String get bundle_sharing_offer_management => 'Offer Management';

  @override
  String get bundle_sharing_add_user => 'Add Member';

  @override
  String bundle_sharing_remaining_out_of_iqd(String amount) {
    return 'Remaining out of $amount IQD';
  }

  @override
  String bundle_sharing_remaining_users(int count) {
    return 'You can add a total of $count members';
  }

  @override
  String bundle_sharing_member_label(int index) {
    return 'Member $index';
  }

  @override
  String bundle_sharing_valid_till(String date) {
    return 'Valid until $date';
  }

  @override
  String get bundle_sharing_enter_number => 'Enter Zain number';

  @override
  String get bundle_sharing_confirm => 'Confirm';

  @override
  String bundle_sharing_confirm_add_and_assign(String number, String amount) {
    return 'Add $number and assign them $amount?';
  }

  @override
  String get bundle_sharing_parent_member => 'You can\'t add your own number';

  @override
  String get bundle_sharing_already_member => 'This number is already a member';

  @override
  String get bundle_sharing_user_not_on_kafoo => 'User not on Kafoo';

  @override
  String bundle_sharing_user_not_on_kafoo_message(String number) {
    return '$number is not a Kafoo member yet. Invite them to migrate.';
  }

  @override
  String get bundle_sharing_invite_to_kafoo => 'Invite to Kafoo';

  @override
  String get bundle_sharing_invite_success => 'Invitation sent';

  @override
  String bundle_sharing_invite_success_message(String number) {
    return 'We\'ve invited $number. You can add them once they migrate to Kafoo.';
  }

  @override
  String get bundle_sharing_ineligible_number_title => 'Ineligible number';

  @override
  String get bundle_sharing_ineligible_number_message =>
      'This number can\'t be added to your family bundle.';

  @override
  String bundle_sharing_add_success(String amount) {
    return '$amount shared with the member';
  }

  @override
  String get bundle_sharing_quota => 'Sharing Credit';

  @override
  String get bundle_sharing_back => 'Back';

  @override
  String bundle_sharing_confirm_remove_member(String number) {
    return 'Remove $number from your family bundle?';
  }

  @override
  String get bundle_sharing_remove_success => 'Member removed';

  @override
  String get bundle_sharing_change_quota => 'Manage Sharing Quota';

  @override
  String get bundle_sharing_save_changes => 'Save Changes';

  @override
  String bundle_sharing_confirm_quota_changes_message(
    String number,
    String amount,
  ) {
    return 'Are you sure you want to add additional shared credit with $number for $amount?';
  }

  @override
  String get send_a_gift => 'Send a Gift';

  @override
  String get choose_preferred_language =>
      'Choose your preferred language to continue';

  @override
  String get language_save_changes => 'Save Changes';

  @override
  String bundle_validity_days(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Days',
      one: '1 Day',
      zero: '0 Days',
    );
    return '$_temp0';
  }

  @override
  String get welcome_tagline => 'A safe space to be lighter';

  @override
  String get welcome_i_am_ventor => 'I am a Ventor';

  @override
  String get welcome_i_am_listener => 'I am a Listener';

  @override
  String get onboarding_skip => 'Skip';

  @override
  String get onboarding_next => 'Next';

  @override
  String get onboarding_page1_title => 'venting';

  @override
  String get onboarding_page1_tagline => 'BE HEARD. FEEL BETTER.';

  @override
  String get onboarding_page1_description =>
      'A safe place to share your thoughts and feel understood.';

  @override
  String get onboarding_page2_title => 'Talk Freely. We\'re Here to Listen.';

  @override
  String get onboarding_page2_description =>
      'Connect with compassionate listeners who truly care.';

  @override
  String get onboarding_page3_title => 'Your Privacy Comes First';

  @override
  String get onboarding_page3_description =>
      'Your conversations are private and secure. You stay in control.';

  @override
  String get onboarding_page4_title => 'Invite Friends. Earn Rewards.';

  @override
  String get onboarding_page4_description =>
      'Invite your friends and earn points, discounts, and exclusive perks.';

  @override
  String get onboarding_page5_title => 'A Community That Cares';

  @override
  String get onboarding_page5_description =>
      'You\'re not alone. Join a community that listens and supports.';

  @override
  String get change_language => 'Change Language';

  @override
  String get ventor_onboarding_page1_title => 'A Safe Place to Be Heard';

  @override
  String get ventor_onboarding_page1_description =>
      'Sometimes all you need is someone who listens.';

  @override
  String get ventor_onboarding_page2_title => 'Express Yourself';

  @override
  String get ventor_onboarding_page2_description =>
      'Talk freely with verified listeners in a private and judgment-free environment.';

  @override
  String get ventor_onboarding_page3_title => 'Find the Right Listener';

  @override
  String get ventor_onboarding_page3_description =>
      'Choose a listener based on language, expertise, personality, reviews, and voice introduction.';

  @override
  String get ventor_onboarding_page4_title => 'Your Privacy Comes First';

  @override
  String get ventor_onboarding_page4_description =>
      'Stay anonymous. You decide what to share. Every conversation is private.';

  @override
  String get listener_onboarding_page1_title => 'Be the Listener Someone Needs';

  @override
  String get listener_onboarding_page1_description =>
      'Your empathy can help someone feel lighter, heard, and less alone.';

  @override
  String get listener_onboarding_page2_title => 'Listen with Compassion';

  @override
  String get listener_onboarding_page2_description =>
      'Support people through tough moments in a private, judgment-free space.';

  @override
  String get listener_onboarding_page3_title => 'Build Your Listener Profile';

  @override
  String get listener_onboarding_page3_description =>
      'Share your languages, expertise, personality, and a voice introduction.';

  @override
  String get listener_onboarding_page4_title => 'Support on Your Schedule';

  @override
  String get listener_onboarding_page4_description =>
      'Choose when you\'re available and make a difference whenever it works for you.';

  @override
  String get sign_up_lets_get_started => 'Let\'s Get Started';

  @override
  String get sign_up_create_account_subtitle =>
      'Create an account to begin your journey.';

  @override
  String get auth_ventor_title => 'Welcome, Ventor';

  @override
  String get auth_ventor_subtitle =>
      'Sign in or create an account to talk and feel heard.';

  @override
  String get auth_listener_title => 'Welcome, Listener';

  @override
  String get auth_listener_subtitle =>
      'Sign in or create an account to listen and support others.';

  @override
  String get auth_continue_with_apple => 'Continue with Apple';

  @override
  String get auth_continue_with_google => 'Continue with Google';

  @override
  String get auth_continue_with_email => 'Continue with Email';

  @override
  String get sign_in_welcome_back => 'Welcome Back';

  @override
  String get sign_in_subtitle => 'Sign in to continue your journey.';

  @override
  String get sign_in_dont_have_account => 'Don\'t have an account?';

  @override
  String get sign_in_sign_up => 'Sign Up';

  @override
  String get sign_up_continue_with_apple => 'Continue with Apple';

  @override
  String get sign_up_continue_with_google => 'Continue with Google';

  @override
  String get sign_up_continue_with_email => 'Continue with Email';

  @override
  String get sign_in_continue_with_apple => 'Sign in with Apple';

  @override
  String get sign_in_continue_with_google => 'Sign in with Google';

  @override
  String get sign_in_continue_with_email => 'Sign in with Email';

  @override
  String get sign_up_or => 'or';

  @override
  String get email_registration_title => 'Continue with Email';

  @override
  String get email_registration_subtitle =>
      'Enter your email and password to continue.';

  @override
  String get email_registration_ventor_subtitle =>
      'Sign in or create your Ventor account with email.';

  @override
  String get email_registration_listener_subtitle =>
      'Sign in or create your Listener account with email.';

  @override
  String get email_sign_in_title => 'Sign in with Email';

  @override
  String get email_sign_in_subtitle =>
      'Enter your email and password to continue.';

  @override
  String get email_registration_email_label => 'Email';

  @override
  String get email_registration_email_hint => 'Enter your email';

  @override
  String get email_registration_password_label => 'Password';

  @override
  String get email_registration_password_hint => 'Enter your password';

  @override
  String get email_sign_in_password_hint => 'Enter your password';

  @override
  String get email_registration_password_must_contain =>
      'Password must contain:';

  @override
  String get email_registration_rule_min_length => 'At least 8 characters';

  @override
  String get email_registration_rule_uppercase => 'One uppercase letter';

  @override
  String get email_registration_rule_number => 'One number';

  @override
  String get email_registration_create_account => 'Continue';

  @override
  String get email_sign_in_button => 'Sign In';

  @override
  String get email_registration_invalid_email =>
      'Please enter a valid email address';

  @override
  String get account_created_title => 'Account Created!';

  @override
  String get account_created_subtitle =>
      'We\'ve sent a verification link to your email address.';

  @override
  String get account_created_check_email => 'Check Your Email';

  @override
  String get account_created_resend_email => 'Resend Email';

  @override
  String account_created_resend_email_countdown(String time) {
    return 'Resend Email ($time)';
  }

  @override
  String get listener_reg_continue => 'Continue';

  @override
  String get listener_reg_skip_for_now => 'Skip for now';

  @override
  String listener_reg_step_of(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String listener_reg_steps_remaining(int count) {
    return '$count steps remaining';
  }

  @override
  String get listener_reg_last_step => 'Last step';

  @override
  String get listener_reg_step1_title => 'Welcome! Let\'s get you started';

  @override
  String get listener_reg_step1_subtitle =>
      'Create your account to begin your journey as a listener.';

  @override
  String get listener_reg_add_profile_photo => 'Add photo';

  @override
  String get listener_reg_change_profile_photo => 'Change photo';

  @override
  String get listener_reg_profile_photo_required =>
      'Please add a profile photo';

  @override
  String get listener_reg_full_name => 'Full name';

  @override
  String get listener_reg_email => 'Email';

  @override
  String get listener_reg_phone => 'Phone number';

  @override
  String get listener_reg_invalid_phone =>
      'Please enter a valid phone number for the selected country';

  @override
  String get listener_reg_select_country => 'Select country';

  @override
  String get listener_reg_search_country => 'Search by country or code';

  @override
  String get listener_reg_password => 'Password';

  @override
  String get listener_reg_agree_prefix => 'I agree to the ';

  @override
  String get listener_reg_terms => 'Terms of Service';

  @override
  String get listener_reg_agree_and => ' and ';

  @override
  String get listener_reg_privacy => 'Privacy Policy';

  @override
  String get listener_reg_already_have => 'Already have an account?';

  @override
  String get listener_reg_sign_in => 'Sign in';

  @override
  String get listener_reg_step_coming_soon =>
      'This step is coming next. Continue to preview the flow.';

  @override
  String get listener_reg_step_create_account => 'Create Account';

  @override
  String get listener_reg_step_verify_email => 'Verify Email';

  @override
  String get listener_reg_step_profile_photo => 'Profile Photo';

  @override
  String get listener_reg_step_boundaries => 'Things You Don\'t Want';

  @override
  String get listener_reg_boundaries_title => 'Set your boundaries';

  @override
  String get listener_reg_boundaries_subtitle =>
      'Topics you don\'t want to discuss. We will respect your choice.';

  @override
  String get listener_reg_boundary_suicide => 'Suicide or self-harm';

  @override
  String get listener_reg_boundary_domestic_violence => 'Domestic violence';

  @override
  String get listener_reg_boundary_sexual => 'Sexual topics';

  @override
  String get listener_reg_boundary_addiction => 'Addiction';

  @override
  String get listener_reg_boundary_politics => 'Politics';

  @override
  String get listener_reg_boundary_religion => 'Religion';

  @override
  String get listener_reg_boundary_illegal => 'Illegal activities';

  @override
  String get listener_reg_boundary_other => 'Other';

  @override
  String get listener_reg_boundary_other_hint => 'Please specify';

  @override
  String get listener_reg_step_about_you => 'About You';

  @override
  String get listener_reg_about_title => 'Tell us about yourself';

  @override
  String get listener_reg_about_subtitle =>
      'This helps us match you with the right conversations.';

  @override
  String get listener_reg_date_of_birth => 'Date of birth';

  @override
  String get listener_reg_select_date => 'Select date';

  @override
  String get listener_reg_country => 'Country';

  @override
  String get listener_reg_city => 'City';

  @override
  String get listener_reg_enter_city => 'Enter your city';

  @override
  String get listener_reg_select_city => 'Select city';

  @override
  String get listener_reg_search_city => 'Search or type a city';

  @override
  String get listener_reg_type_city => 'Type your city name above to continue.';

  @override
  String listener_reg_use_city(String city) {
    return 'Use \"$city\"';
  }

  @override
  String get listener_reg_languages_you_speak => 'Languages you speak';

  @override
  String get listener_reg_select_languages => 'Select languages';

  @override
  String get listener_reg_search_language => 'Search languages';

  @override
  String get listener_reg_done => 'Done';

  @override
  String get listener_reg_step_languages => 'Languages';

  @override
  String get listener_reg_step_expertise => 'Areas You\'re Comfortable With';

  @override
  String get listener_reg_areas_title => 'What would you like to listen to?';

  @override
  String get listener_reg_areas_subtitle =>
      'Choose the topics you feel comfortable supporting others with.';

  @override
  String get listener_reg_area_relationships => 'Relationships';

  @override
  String get listener_reg_area_marriage => 'Marriage';

  @override
  String get listener_reg_area_parenting => 'Parenting';

  @override
  String get listener_reg_area_career_work => 'Career & Work';

  @override
  String get listener_reg_area_stress_anxiety => 'Stress & Anxiety';

  @override
  String get listener_reg_area_loneliness => 'Loneliness';

  @override
  String get listener_reg_area_student_life => 'Student Life';

  @override
  String get listener_reg_area_financial_stress => 'Financial Stress';

  @override
  String get listener_reg_area_health_wellness => 'Health & Wellness';

  @override
  String get listener_reg_area_other => 'Other';

  @override
  String get listener_reg_area_other_hint => 'Please specify';

  @override
  String get listener_reg_step_voice_intro => 'Voice Introduction';

  @override
  String get listener_reg_voice_title => 'Record a short introduction';

  @override
  String get listener_reg_voice_subtitle =>
      'Introduce yourself so users can get to know you.';

  @override
  String get listener_reg_voice_speak_hint => 'Speak for about 60 seconds';

  @override
  String get listener_reg_voice_record => 'Record';

  @override
  String get listener_reg_voice_stop => 'Stop';

  @override
  String get listener_reg_voice_play => 'Play';

  @override
  String get listener_reg_voice_tip => 'Tip: Be natural, kind, and authentic.';

  @override
  String get listener_reg_voice_tips_title => 'Recording Tips';

  @override
  String get listener_reg_voice_tip_1 => 'Speak naturally.';

  @override
  String get listener_reg_voice_tip_2 =>
      'Smile while speaking—it changes your tone.';

  @override
  String get listener_reg_voice_tip_3 => 'Don\'t rush.';

  @override
  String get listener_reg_voice_tip_4 => 'Avoid reading like a robot.';

  @override
  String get listener_reg_voice_tip_5 => 'Keep it between 45 and 60 seconds.';

  @override
  String get listener_reg_voice_tip_6 => 'Record in a quiet place.';

  @override
  String get listener_reg_voice_example_title =>
      'You may use the following structure:';

  @override
  String get listener_reg_voice_example_body =>
      'Hello! My name is [Display Name].\n\nThank you for taking a moment to listen to my introduction.\n\nI\'m here because I genuinely enjoy listening to people and creating a safe, judgment-free space where you can express yourself openly.\n\nWhether you\'re feeling stressed, overwhelmed, lonely, or simply need someone to talk to, I\'m here to listen with empathy and respect.\n\nYou don\'t need to prepare anything before our conversation. Just come as you are, and we\'ll take it one step at a time.\n\nIf you think we\'d be a good match, I\'d be happy to talk with you.\n\nI look forward to meeting you, and I hope you have a wonderful day.';

  @override
  String get listener_reg_voice_mic_permission =>
      'Microphone permission is required to record your introduction.';

  @override
  String get listener_reg_voice_mic_permission_settings =>
      'Microphone permission is required. Please enable it in Settings.';

  @override
  String get listener_reg_voice_record_failed =>
      'Could not start recording. Please try again.';

  @override
  String get listener_reg_voice_plugin_restart =>
      'Recording plugin is not ready. Fully stop the app and run it again (hot restart is not enough).';

  @override
  String get listener_reg_step_availability => 'Availability';

  @override
  String get listener_reg_avail_title => 'Set your availability';

  @override
  String get listener_reg_avail_subtitle =>
      'Choose when you are usually available to talk.';

  @override
  String get listener_reg_avail_timezone => 'Time zone';

  @override
  String get listener_reg_avail_search_timezone => 'Search time zones';

  @override
  String get listener_reg_avail_weekly => 'Weekly availability';

  @override
  String get listener_reg_avail_hours => 'Available hours';

  @override
  String get listener_reg_avail_from => 'From';

  @override
  String get listener_reg_avail_to => 'To';

  @override
  String get listener_reg_avail_instant_call => 'Accept instant call';

  @override
  String get listener_reg_avail_instant_call_hint =>
      'Instant calls can help you earn more income.';

  @override
  String get listener_reg_avail_session_length => 'Session length';

  @override
  String listener_reg_avail_session_min(int minutes) {
    return '$minutes min';
  }

  @override
  String get listener_reg_avail_day_mon => 'M';

  @override
  String get listener_reg_avail_day_tue => 'T';

  @override
  String get listener_reg_avail_day_wed => 'W';

  @override
  String get listener_reg_avail_day_thu => 'T';

  @override
  String get listener_reg_avail_day_fri => 'F';

  @override
  String get listener_reg_avail_day_sat => 'S';

  @override
  String get listener_reg_avail_day_sun => 'S';

  @override
  String get listener_reg_avail_manage_later_note =>
      'You can manage your availability in more detail from inside the app after you finish registration.';

  @override
  String get listener_reg_step_experience => 'Life Experience';

  @override
  String get listener_reg_experience_title => 'Share your life experiences';

  @override
  String get listener_reg_experience_subtitle =>
      'Select what applies to you. This helps people find someone who understands.';

  @override
  String get listener_reg_exp_section_relationship => 'Relationship';

  @override
  String get listener_reg_exp_section_family => 'Family';

  @override
  String get listener_reg_exp_section_experiences =>
      'Experiences (select all that apply)';

  @override
  String get listener_reg_exp_single => 'Single';

  @override
  String get listener_reg_exp_in_relationship => 'In a relationship';

  @override
  String get listener_reg_exp_married => 'Married';

  @override
  String get listener_reg_exp_divorced => 'Divorced';

  @override
  String get listener_reg_exp_widowed => 'Widowed';

  @override
  String get listener_reg_exp_parent => 'Parent';

  @override
  String get listener_reg_exp_single_parent => 'Single parent';

  @override
  String get listener_reg_exp_caregiver => 'Caregiver';

  @override
  String get listener_reg_exp_career_change => 'Career change';

  @override
  String get listener_reg_exp_job_loss => 'Job loss';

  @override
  String get listener_reg_exp_startup_founder => 'Startup founder';

  @override
  String get listener_reg_exp_financial_struggle => 'Financial struggle';

  @override
  String get listener_reg_exp_life_stages => 'Life stages';

  @override
  String get listener_reg_exp_grief_loss => 'Grief / Loss';

  @override
  String get listener_reg_exp_anxiety_stress => 'Anxiety / Stress';

  @override
  String get listener_reg_exp_health_challenge => 'Health challenge';

  @override
  String get listener_reg_exp_addiction_recovery => 'Addiction recovery';

  @override
  String get listener_reg_exp_add_more => 'Add more';

  @override
  String get listener_reg_add_experience_title => 'Add experience';

  @override
  String get listener_reg_add_experience_hint => 'Enter an experience';

  @override
  String get listener_reg_add => 'Add';

  @override
  String get listener_reg_cancel => 'Cancel';

  @override
  String get listener_reg_step_guidelines => 'Community Guidelines';

  @override
  String get listener_reg_step_identity => 'Identity Verification';

  @override
  String get listener_reg_identity_title => 'Verify your identity';

  @override
  String get listener_reg_identity_subtitle =>
      'This helps us keep our community safe and trusted.';

  @override
  String get listener_reg_identity_upload_id_title => 'Upload Government ID';

  @override
  String get listener_reg_identity_upload_id_subtitle =>
      'Passport, Driver\'s License or National ID.';

  @override
  String get listener_reg_identity_selfie_title => 'Take a selfie';

  @override
  String get listener_reg_identity_selfie_subtitle =>
      'Make sure your face is clearly visible';

  @override
  String get listener_reg_identity_liveness_title => 'Liveness check';

  @override
  String get listener_reg_identity_liveness_subtitle =>
      'We\'ll ask you to move your head slightly';

  @override
  String get listener_reg_identity_start => 'Start Verification';

  @override
  String get listener_reg_identity_secure_note =>
      'Your data is encrypted and secure';

  @override
  String get listener_reg_step_review_submit => 'Review & Submit';

  @override
  String get listener_profile_under_review_title =>
      'Your profile is under review';

  @override
  String get listener_profile_under_review_subtitle =>
      'Our team is reviewing your information to ensure a safe and trusted community.';

  @override
  String get listener_profile_review_time_title => 'Review time';

  @override
  String get listener_profile_review_time_body =>
      'It usually takes 2–3 working days. We\'ll notify you as soon as there\'s an update.';

  @override
  String get listener_profile_got_it => 'Got it';

  @override
  String get listener_profile_go_to_dashboard => 'Go to Dashboard';

  @override
  String get listener_profile_approved_title =>
      'Your profile has been approved!';

  @override
  String get listener_profile_approved_subtitle =>
      'Congratulations! You are now part of the Venting listener community.';

  @override
  String get listener_profile_approved_badge => 'Approved';

  @override
  String get listener_profile_rejected_title => 'Your profile was not approved';

  @override
  String get listener_profile_rejected_subtitle =>
      'We\'re unable to approve your profile at this time for the following reason(s).';

  @override
  String get listener_profile_reasons_title => 'Reason(s)';

  @override
  String get listener_profile_reject_reason_voice =>
      'The voice introduction is too short.';

  @override
  String get listener_profile_reject_reason_experience =>
      'Please provide more details about your experience.';

  @override
  String get listener_profile_reject_reason_id =>
      'The uploaded ID is not clear.';

  @override
  String get listener_profile_what_you_can_do => 'What can you do?';

  @override
  String get listener_profile_what_you_can_do_body =>
      'You can go back and update the information that needs attention.';

  @override
  String get listener_profile_review_edit => 'Review & Edit';

  @override
  String listener_profile_edit_step_hint(String step) {
    return 'You can edit the $step step.';
  }

  @override
  String get listener_reg_step_notifications => 'Notifications';

  @override
  String get listener_reg_notif_title => 'Stay Updated';

  @override
  String get listener_reg_notif_subtitle =>
      'Get notified when your profile review is complete, and about sessions, rewards, and important updates.';

  @override
  String get listener_reg_notif_enable => 'Enable Notifications';

  @override
  String get listener_reg_notif_skip => 'Skip';

  @override
  String get ventor_reg_title => 'Choose a nickname';

  @override
  String get ventor_reg_subtitle => 'This is how listeners will see you.';

  @override
  String get ventor_reg_nickname_hint => 'e.g. QuietSoul';

  @override
  String get ventor_reg_nickname_required => 'Please enter a nickname';

  @override
  String get ventor_reg_avatar_label => 'Add a profile avatar (optional)';

  @override
  String get ventor_reg_change_anytime =>
      'You can change it anytime from your profile settings';

  @override
  String get home_tab_dashboard => 'Dashboard';

  @override
  String get home_tab_sessions => 'Sessions';

  @override
  String get home_tab_availability => 'Availability';

  @override
  String get home_tab_earnings => 'Earnings';

  @override
  String get home_tab_rewards => 'Rewards';

  @override
  String get home_tab_profile => 'Profile';

  @override
  String get listener_home_dashboard_placeholder =>
      'Your listener overview will appear here.';

  @override
  String get listener_home_sessions_placeholder =>
      'Upcoming and past listening sessions will appear here.';

  @override
  String get listener_home_availability_placeholder =>
      'Manage when you are available to take calls.';

  @override
  String get listener_home_earnings_placeholder =>
      'Track your listener earnings and payouts here.';

  @override
  String get listener_earnings_total => 'Total Earnings';

  @override
  String listener_earnings_trend_up(int percent) {
    return '+$percent% from last month';
  }

  @override
  String get listener_earnings_sessions => 'Sessions';

  @override
  String get listener_earnings_hours => 'Hours';

  @override
  String listener_earnings_hours_value(String hours) {
    return '${hours}h';
  }

  @override
  String get listener_earnings_rate => 'Rate / 30 min';

  @override
  String get listener_earnings_overview => 'Earnings Overview';

  @override
  String get listener_earnings_recent_payout => 'Recent Payout';

  @override
  String get listener_earnings_status_paid => 'Paid';

  @override
  String get listener_earnings_payout_methods => 'Payout Methods';

  @override
  String get listener_earnings_default => 'Default';

  @override
  String get listener_home_profile_placeholder =>
      'Your listener profile and settings will appear here.';

  @override
  String get listener_profile_title => 'My Profile';

  @override
  String get listener_profile_email => 'Email';

  @override
  String get listener_profile_date_of_birth => 'Date of birth';

  @override
  String get listener_profile_view_profile => 'View Profile';

  @override
  String get listener_profile_active_now => 'Active now';

  @override
  String listener_profile_reviews_count(int count) {
    return '$count reviews';
  }

  @override
  String get listener_profile_voice_introduction => 'Voice Introduction';

  @override
  String get listener_profile_edit_voice_title => 'Edit Voice Introduction';

  @override
  String get listener_profile_edit_voice_subtitle =>
      'Re-record a short introduction so ventors can get to know you.';

  @override
  String get listener_profile_edit_voice_re_record => 'Re-record';

  @override
  String get listener_profile_about_me => 'About Me';

  @override
  String get listener_profile_edit_about_me_title => 'Edit About Me';

  @override
  String get listener_profile_edit_about_me_subtitle =>
      'Share a short introduction so ventors know what to expect from you.';

  @override
  String get listener_profile_edit_about_me_hint =>
      'Write something about yourself...';

  @override
  String listener_profile_edit_about_me_counter(int current, int max) {
    return '$current/$max';
  }

  @override
  String get listener_profile_see_more => 'See more';

  @override
  String get listener_profile_see_less => 'See less';

  @override
  String get listener_profile_good_at => 'What I\'m Good At';

  @override
  String get listener_profile_experiences => 'Experiences';

  @override
  String get listener_profile_edit_experiences_title => 'Edit Experiences';

  @override
  String get listener_profile_edit_experiences_subtitle =>
      'Update the life experiences that shape how you listen and support others.';

  @override
  String get listener_profile_experiences_empty =>
      'No experiences added yet. Tap Edit to add some.';

  @override
  String get listener_profile_comfort_areas => 'What I\'m Good At';

  @override
  String get listener_profile_edit_comfort_areas_title => 'Edit Comfort Areas';

  @override
  String get listener_profile_edit_comfort_areas_subtitle =>
      'Choose topics you\'re comfortable listening to and supporting.';

  @override
  String get listener_profile_comfort_areas_empty =>
      'No comfort areas selected yet. Tap Edit to choose topics.';

  @override
  String get listener_profile_boundaries => 'Boundaries';

  @override
  String get listener_profile_edit_boundaries_title => 'Edit Boundaries';

  @override
  String get listener_profile_edit_boundaries_subtitle =>
      'Topics you don\'t want to discuss. We will respect your choice.';

  @override
  String get listener_profile_boundaries_empty =>
      'No boundaries set yet. Tap Edit to choose topics you prefer to avoid.';

  @override
  String get listener_profile_add_more => '+ Add more';

  @override
  String get listener_profile_languages => 'Languages';

  @override
  String get listener_profile_country => 'Country';

  @override
  String get listener_profile_city => 'City';

  @override
  String get listener_profile_edit_city_title => 'Edit City';

  @override
  String get listener_profile_edit_city_subtitle =>
      'Update the city shown on your listener profile.';

  @override
  String get listener_profile_experience => 'Experience';

  @override
  String get listener_profile_availability_label => 'Availability';

  @override
  String get listener_profile_response_time => 'Response Time';

  @override
  String get listener_profile_reviews => 'Reviews';

  @override
  String listener_profile_view_all_reviews(int count) {
    return 'View all ($count)';
  }

  @override
  String get listener_profile_all_reviews_title => 'All Reviews';

  @override
  String listener_profile_all_reviews_subtitle(String rating, int count) {
    return '$rating · $count reviews';
  }

  @override
  String get listener_profile_all_reviews_empty =>
      'No reviews yet. Reviews from ventors will appear here.';

  @override
  String get listener_profile_review_today => 'Today';

  @override
  String get listener_profile_review_yesterday => 'Yesterday';

  @override
  String listener_profile_review_days_ago(int count) {
    return '$count days ago';
  }

  @override
  String listener_profile_review_weeks_ago(int count) {
    return '$count weeks ago';
  }

  @override
  String listener_profile_review_months_ago(int count) {
    return '$count months ago';
  }

  @override
  String listener_profile_review_years_ago(int count) {
    return '$count years ago';
  }

  @override
  String get listener_profile_next_availability => 'Next Availability';

  @override
  String get listener_profile_available_now => 'Available Now';

  @override
  String listener_profile_until_time(String time) {
    return 'Until $time';
  }

  @override
  String get listener_profile_tomorrow => 'Tomorrow';

  @override
  String get listener_profile_account_settings => 'Account & Settings';

  @override
  String get listener_profile_notification_preferences =>
      'Notification Preferences';

  @override
  String get listener_profile_privacy_visibility => 'Privacy & Visibility';

  @override
  String get listener_profile_payment_payouts => 'Payment & Payouts';

  @override
  String get listener_profile_help_support => 'Help & Support';

  @override
  String get listener_help_topics => 'Help Topics';

  @override
  String get listener_help_getting_started => 'Getting Started';

  @override
  String get listener_help_managing_sessions => 'Managing Sessions';

  @override
  String get listener_help_earnings_payouts => 'Earnings & Payouts';

  @override
  String get listener_help_account_profile => 'Account & Profile';

  @override
  String get listener_help_safety_boundaries => 'Safety & Boundaries';

  @override
  String get listener_help_community_guidelines => 'Community Guidelines';

  @override
  String get listener_help_faqs => 'FAQs';

  @override
  String get listener_help_app_technical => 'App & Technical';

  @override
  String get listener_help_contact_us => 'Contact Us';

  @override
  String get listener_help_whatsapp => 'WhatsApp';

  @override
  String get listener_help_whatsapp_subtitle => 'Chat with our support team';

  @override
  String get listener_help_whatsapp_failed =>
      'Could not open WhatsApp. Please try again.';

  @override
  String get listener_help_email_support => 'Email Support';

  @override
  String get listener_help_email_failed =>
      'Could not open email. Please try again.';

  @override
  String get listener_profile_settings_section_account => 'Account';

  @override
  String get listener_profile_settings_section_preferences => 'Preferences';

  @override
  String get listener_profile_settings_section_earnings => 'Earnings & Payouts';

  @override
  String get listener_profile_settings_section_support => 'Support';

  @override
  String get listener_profile_settings_email => 'Email Address';

  @override
  String get listener_profile_settings_phone => 'Phone Number';

  @override
  String get listener_profile_settings_two_factor =>
      'Two-Factor Authentication';

  @override
  String get listener_profile_settings_payout_methods => 'Payout Methods';

  @override
  String get listener_profile_settings_feedback => 'Give Us Feedback';

  @override
  String get listener_profile_settings_about => 'About Venting';

  @override
  String get listener_confirm_logout_title => 'Log Out';

  @override
  String get listener_confirm_logout_heading =>
      'Are you sure you want to log out?';

  @override
  String get listener_confirm_logout_subtitle =>
      'You will need to sign in again to access your account.';

  @override
  String get listener_confirm_logout_confirm => 'Log Out';

  @override
  String get listener_confirm_delete_title => 'Delete Account';

  @override
  String get listener_confirm_delete_heading =>
      'Are you sure you want to delete your account?';

  @override
  String get listener_confirm_delete_subtitle =>
      'This permanently removes your listener profile and data. You will need to register again.';

  @override
  String get listener_confirm_delete_confirm => 'Delete';

  @override
  String get listener_confirm_cancel => 'Cancel';

  @override
  String get listener_about_tagline =>
      'The safe place to be heard and make a real impact.';

  @override
  String listener_about_version(String version, String build) {
    return 'Version $version ($build)';
  }

  @override
  String get listener_about_whats_new => 'What\'s New';

  @override
  String get listener_about_terms => 'Terms of Service';

  @override
  String get listener_about_privacy => 'Privacy Policy';

  @override
  String get listener_about_community_guidelines => 'Community Guidelines';

  @override
  String get listener_about_licenses => 'Licenses';

  @override
  String get listener_whats_new_subtitle =>
      'Highlights from the latest Venting updates.';

  @override
  String get listener_whats_new_date_aug_2026 => 'August 2026';

  @override
  String get listener_whats_new_date_jul_2026 => 'July 2026';

  @override
  String get listener_whats_new_1_2_0_item_1 =>
      'New listener Account & Settings experience.';

  @override
  String get listener_whats_new_1_2_0_item_2 =>
      'Payment & Payouts with bank details and history.';

  @override
  String get listener_whats_new_1_2_0_item_3 =>
      'Privacy controls for countries and profile visibility.';

  @override
  String get listener_whats_new_1_2_0_item_4 =>
      'Help & Support with WhatsApp and help topics.';

  @override
  String get listener_whats_new_1_1_0_item_1 =>
      'Improved session reminders and notification preferences.';

  @override
  String get listener_whats_new_1_1_0_item_2 =>
      'Faster profile editing for languages, city, and bio.';

  @override
  String get listener_whats_new_1_1_0_item_3 =>
      'Stability and performance improvements.';

  @override
  String get listener_profile_settings_on => 'On';

  @override
  String get listener_profile_settings_off => 'Off';

  @override
  String listener_profile_settings_version(String version) {
    return 'Version $version';
  }

  @override
  String get listener_change_password_current_label => 'Current Password';

  @override
  String get listener_change_password_current_hint => 'Enter current password';

  @override
  String get listener_change_password_new_label => 'New Password';

  @override
  String get listener_change_password_new_hint => 'Enter new password';

  @override
  String get listener_change_password_confirm_label => 'Confirm New Password';

  @override
  String get listener_change_password_confirm_hint => 'Confirm new password';

  @override
  String get listener_change_password_rule_hint =>
      'Min. 8 characters with a number and symbol';

  @override
  String get listener_change_password_update => 'Update Password';

  @override
  String get listener_change_password_current_required =>
      'Please enter your current password';

  @override
  String get listener_change_password_mismatch => 'Passwords do not match';

  @override
  String get listener_change_password_same_as_current =>
      'New password must be different from your current password';

  @override
  String get listener_edit_phone_title => 'Phone Number';

  @override
  String get listener_edit_phone_subtitle =>
      'Update the phone number linked to your listener account.';

  @override
  String get listener_notif_section_push => 'Push Notifications';

  @override
  String get listener_notif_receive_push => 'Receive push notifications';

  @override
  String get listener_notif_section_notify_about => 'Notify me about';

  @override
  String get listener_notif_new_session_requests => 'New session requests';

  @override
  String get listener_notif_section_session_reminders => 'Session reminders';

  @override
  String get listener_notif_session_reminder_15 =>
      'Session reminder before 15 min';

  @override
  String get listener_notif_session_reminder_10 =>
      'Session reminder before 10 min';

  @override
  String get listener_notif_session_reminder_5 =>
      'Session reminder before 5 min';

  @override
  String get listener_notif_messages => 'Messages';

  @override
  String get listener_notif_reviews_feedback => 'Reviews & feedback';

  @override
  String get listener_notif_tips_earnings => 'Tips & earnings';

  @override
  String get listener_notif_promotions_updates => 'Promotions & updates';

  @override
  String get listener_notif_section_email => 'Email Notifications';

  @override
  String get listener_notif_receive_email => 'Receive email notifications';

  @override
  String get listener_notif_save => 'Save Preferences';

  @override
  String get listener_privacy_section_visibility => 'Profile Visibility';

  @override
  String get listener_privacy_online_status => 'Online status';

  @override
  String get listener_privacy_show_when_online => 'Show when I\'m online';

  @override
  String get listener_privacy_show_profile_in => 'Show my profile in';

  @override
  String get listener_privacy_all_countries => 'All countries';

  @override
  String get listener_privacy_specific_countries => 'Specific countries';

  @override
  String get listener_privacy_select_countries => 'Select countries';

  @override
  String listener_privacy_countries_count(int count) {
    return '$count countries';
  }

  @override
  String get listener_privacy_countries_required =>
      'Please select at least one country';

  @override
  String get listener_privacy_visible_countries_title =>
      'Profile visibility by country';

  @override
  String get listener_privacy_section_information => 'Profile Information';

  @override
  String get listener_privacy_show_languages => 'Show languages I speak';

  @override
  String get listener_privacy_show_comfort_areas => 'Show topics I\'m good at';

  @override
  String get listener_privacy_show_experience_ratings =>
      'Show experience & ratings';

  @override
  String get listener_privacy_show_boundaries => 'Show my boundaries';

  @override
  String get listener_privacy_section_activity => 'Activity & Data';

  @override
  String get listener_privacy_allow_search_indexing =>
      'Allow search engine indexing';

  @override
  String get listener_privacy_search_indexing_hint =>
      'Turn off to keep your profile out of search engines.';

  @override
  String get listener_privacy_save => 'Save Changes';

  @override
  String get listener_payout_your_balance => 'Your Balance';

  @override
  String get listener_payout_available => 'Available for payout';

  @override
  String get listener_payout_total_earnings => 'Total Earnings';

  @override
  String get listener_payout_this_month => 'This Month';

  @override
  String get listener_payout_add_method => 'Add method';

  @override
  String get listener_payout_history => 'Payout History';

  @override
  String get listener_payout_history_empty => 'No payout history yet.';

  @override
  String get listener_payout_detail_date => 'Date';

  @override
  String get listener_payout_detail_method => 'Method';

  @override
  String get listener_payout_detail_reference => 'Reference';

  @override
  String get listener_payout_status_completed => 'Completed';

  @override
  String get listener_payout_status_pending => 'Pending';

  @override
  String get listener_payout_status_failed => 'Failed';

  @override
  String get listener_payout_min_hint =>
      'You can request a payout when your available balance reaches at least \$100.';

  @override
  String get listener_payout_need_method =>
      'Please add a bank account before requesting a payout.';

  @override
  String get listener_payout_request_submitted => 'Payout request submitted.';

  @override
  String get listener_payout_bank_subtitle =>
      'Enter your bank account details to receive payouts.';

  @override
  String get listener_payout_bank_holder => 'Account holder name';

  @override
  String get listener_payout_bank_holder_hint => 'Full name on the account';

  @override
  String get listener_payout_bank_name => 'Bank name';

  @override
  String get listener_payout_bank_name_hint => 'Enter bank name';

  @override
  String get listener_payout_bank_iban => 'IBAN / Account number';

  @override
  String get listener_payout_bank_iban_hint => 'Enter IBAN or account number';

  @override
  String get listener_payout_bank_swift => 'SWIFT / BIC';

  @override
  String get listener_payout_bank_swift_hint => 'Optional';

  @override
  String get listener_payout_bank_optional => '(optional)';

  @override
  String get listener_payout_bank_required => 'This field is required';

  @override
  String get listener_payout_bank_iban_invalid =>
      'Enter a valid IBAN or account number';

  @override
  String get listener_payout_request => 'Request Payout';

  @override
  String get listener_profile_edit => 'Edit';

  @override
  String get listener_profile_about_me_body =>
      'I\'m here to listen and support you in a safe, judgment-free space. I truly believe that sometimes all we need is someone who listens with an open heart.';

  @override
  String listener_profile_experience_value(int years) {
    return '$years+ years';
  }

  @override
  String get listener_profile_usually_available => 'Usually available';

  @override
  String listener_profile_response_within(int minutes) {
    return 'Usually within $minutes min';
  }

  @override
  String get listener_profile_tag_stress_anxiety => 'Stress & Anxiety';

  @override
  String get listener_profile_tag_relationships => 'Relationships';

  @override
  String get listener_profile_tag_overthinking => 'Overthinking';

  @override
  String get listener_profile_tag_life_transitions => 'Life Transitions';

  @override
  String get listener_profile_tag_parenting => 'Parenting';

  @override
  String get ventor_home_dashboard_placeholder =>
      'Find listeners and start a conversation from here.';

  @override
  String get ventor_home_sessions_placeholder =>
      'Your venting sessions and history will appear here.';

  @override
  String get ventor_home_rewards_placeholder =>
      'Rewards and achievements for ventors will appear here.';

  @override
  String get ventor_home_profile_placeholder =>
      'Your ventor profile and settings will appear here.';

  @override
  String get ventor_profile_anonymous => 'Anonymous';

  @override
  String get ventor_profile_sessions => 'Sessions';

  @override
  String get ventor_profile_avg_rating => 'Avg. Rating';

  @override
  String get ventor_profile_day_streak => 'Day Streak';

  @override
  String get ventor_profile_mood_journey => 'Mood Journey';

  @override
  String get ventor_profile_today => 'Today';

  @override
  String get ventor_profile_day_mon => 'Mon';

  @override
  String get ventor_profile_day_tue => 'Tue';

  @override
  String get ventor_profile_day_wed => 'Wed';

  @override
  String get ventor_profile_day_thu => 'Thu';

  @override
  String get ventor_profile_day_fri => 'Fri';

  @override
  String get ventor_profile_day_sat => 'Sat';

  @override
  String get ventor_profile_day_sun => 'Sun';

  @override
  String get ventor_profile_achievements => 'Achievements';

  @override
  String get ventor_profile_see_all => 'See all';

  @override
  String get ventor_profile_achievement_first_step => 'First Step';

  @override
  String get ventor_profile_achievement_first_step_desc => '1 Session';

  @override
  String get ventor_profile_achievement_be_heard => 'Be Heard';

  @override
  String get ventor_profile_achievement_be_heard_desc => '5 Sessions';

  @override
  String get ventor_profile_achievement_week_warrior => 'Week Warrior';

  @override
  String get ventor_profile_achievement_week_warrior_desc => '7 Day Streak';

  @override
  String get ventor_profile_achievement_active_mind => 'Active Mind';

  @override
  String get ventor_profile_achievement_active_mind_desc => '20 Sessions';

  @override
  String get ventor_profile_achievement_first_step_detail =>
      'Complete your first venting session. Taking that first step shows courage — and it unlocks your journey on Venting.';

  @override
  String get ventor_profile_achievement_be_heard_detail =>
      'Finish 5 sessions where you shared how you feel. Being heard consistently helps build trust and emotional clarity.';

  @override
  String get ventor_profile_achievement_week_warrior_detail =>
      'Keep a 7-day streak by checking in or completing sessions. Small daily habits can make a big difference.';

  @override
  String get ventor_profile_achievement_active_mind_detail =>
      'Reach 20 total sessions. This badge celebrates showing up for yourself again and again.';

  @override
  String ventor_profile_achievements_subtitle(int unlocked, int total) {
    return '$unlocked of $total unlocked';
  }

  @override
  String get ventor_profile_achievement_unlocked => 'Unlocked';

  @override
  String get ventor_profile_achievement_locked => 'Locked';

  @override
  String ventor_profile_total_points(String points) {
    return '$points Total Points';
  }

  @override
  String get ventor_profile_view_rewards => 'View Rewards';

  @override
  String get ventor_profile_my_listeners => 'My Listeners';

  @override
  String get ventor_profile_add_favorite => 'Add Favorite';

  @override
  String get ventor_profile_quote =>
      'It\'s okay to not be okay. You don\'t have to go through it alone.';

  @override
  String get ventor_profile_edit_title => 'Edit Profile';

  @override
  String get ventor_profile_edit_subtitle =>
      'Update your display name and profile photo.';

  @override
  String get ventor_profile_edit_name_label => 'Display name';

  @override
  String get ventor_profile_edit_name_hint => 'Enter your name';

  @override
  String get ventor_profile_edit_change_photo => 'Change photo';

  @override
  String get ventor_profile_edit_photo_gallery => 'Choose from gallery';

  @override
  String get ventor_profile_edit_photo_camera => 'Take a photo';

  @override
  String get ventor_profile_settings_title => 'Settings';

  @override
  String get ventor_profile_settings_privacy => 'Privacy';

  @override
  String get ventor_profile_settings_privacy_sub => 'Control your privacy';

  @override
  String get ventor_profile_settings_notifications => 'Notifications';

  @override
  String get ventor_profile_settings_notifications_sub => 'Manage what you get';

  @override
  String get ventor_profile_settings_help_sub => 'We\'re here for you';

  @override
  String get ventor_notif_section_push => 'Push notifications';

  @override
  String get ventor_notif_receive_push => 'Receive push notifications';

  @override
  String get ventor_notif_section_session_reminders => 'Session reminders';

  @override
  String get ventor_notif_session_reminder_30 => '30 minutes before';

  @override
  String get ventor_notif_session_reminder_15 => '15 minutes before';

  @override
  String get ventor_notif_session_reminder_10 => '10 minutes before';

  @override
  String get ventor_notif_session_reminder_5 => '5 minutes before';

  @override
  String get ventor_notif_section_activity => 'Notify me about';

  @override
  String get ventor_notif_rewards_updates => 'Rewards & points';

  @override
  String get ventor_notif_promotions => 'Promotions & tips';

  @override
  String get ventor_notif_section_email => 'Email';

  @override
  String get ventor_notif_receive_email => 'Receive email updates';

  @override
  String get ventor_notif_save => 'Save';

  @override
  String get ventor_privacy_section_profile => 'Profile visibility';

  @override
  String get ventor_privacy_show_mood_journey => 'Show Mood Journey';

  @override
  String get ventor_privacy_show_achievements => 'Show Achievements';

  @override
  String get ventor_privacy_show_stats => 'Show Sessions & Streak';

  @override
  String get ventor_privacy_show_favorite_listeners => 'Show My Listeners';

  @override
  String get ventor_privacy_section_discovery => 'Discovery';

  @override
  String get ventor_privacy_allow_discovery => 'Allow listeners to find me';

  @override
  String get ventor_privacy_allow_discovery_sub =>
      'Let matching listeners discover your profile when looking for someone to talk to.';

  @override
  String get ventor_privacy_save => 'Save';

  @override
  String get listener_avail_title => 'Availability';

  @override
  String get listener_avail_weekly_schedule => 'Set Weekly Schedule';

  @override
  String get listener_avail_weekly_subtitle =>
      'Choose when you\'re available to help.';

  @override
  String get listener_avail_day_off => 'Day off';

  @override
  String get listener_avail_session_settings => 'Session Settings';

  @override
  String get listener_avail_session_length => 'Preferred Session Length';

  @override
  String get listener_avail_break_between => 'Break Between Sessions';

  @override
  String get listener_avail_languages => 'Languages';

  @override
  String listener_avail_min_value(int minutes) {
    return '$minutes min';
  }

  @override
  String get listener_avail_instant_calls => 'Accept Instant Calls';

  @override
  String get listener_avail_instant_calls_hint =>
      'Allow ventors to reach you for immediate sessions without scheduling.';

  @override
  String get listener_avail_day_available => 'Available on this day';

  @override
  String get listener_avail_add_slot => 'Add time slot';

  @override
  String get listener_avail_remove_slot => 'Remove';

  @override
  String listener_sessions_filter_upcoming(int count) {
    return 'Upcoming ($count)';
  }

  @override
  String listener_sessions_filter_missed(int count) {
    return 'Missed ($count)';
  }

  @override
  String get listener_sessions_filter_history => 'History';

  @override
  String get listener_sessions_upcoming_title => 'Upcoming Sessions';

  @override
  String get listener_sessions_active_title => 'Active Sessions';

  @override
  String get listener_sessions_history_title => 'Past Sessions';

  @override
  String get listener_sessions_requests_title => 'Session Requests';

  @override
  String get listener_sessions_new_request => 'New request';

  @override
  String get listener_sessions_decline => 'Decline';

  @override
  String get listener_sessions_accept => 'Accept';

  @override
  String get listener_sessions_waiting => 'They\'re waiting for you';

  @override
  String get listener_sessions_join_now => 'Join call now';

  @override
  String get listener_sessions_today => 'Today';

  @override
  String get listener_sessions_tomorrow => 'Tomorrow';

  @override
  String listener_sessions_minutes_ago(int minutes) {
    return '${minutes}m ago';
  }

  @override
  String listener_sessions_hours_ago(int hours) {
    return '${hours}h ago';
  }

  @override
  String listener_sessions_days_ago(int days) {
    return '${days}d ago';
  }

  @override
  String get listener_sessions_stats_title => 'Request outcomes';

  @override
  String get listener_sessions_accepted => 'Accepted';

  @override
  String get listener_sessions_declined => 'Declined';

  @override
  String get listener_sessions_stats_missed => 'Missed to enter';

  @override
  String get listener_sessions_status_accepted => 'Session accepted';

  @override
  String get listener_sessions_status_declined => 'Request declined';

  @override
  String get listener_sessions_status_completed => 'Completed';

  @override
  String get listener_sessions_no_missed => 'No missed sessions.';

  @override
  String get listener_sessions_no_history => 'No past sessions yet.';

  @override
  String get listener_sessions_chosen_you => 'Why they chose you';

  @override
  String get listener_sessions_penalty_note =>
      'For each session you miss without entering, 20% of the session cost will be deducted from your balance.';

  @override
  String get listener_sessions_missed_title => 'Missed sessions';

  @override
  String get listener_sessions_status_missed => 'Missed — not entered';

  @override
  String listener_sessions_penalty_deducted(String amount) {
    return '$amount deducted (20%)';
  }

  @override
  String get listener_call_instructions_title => 'Before you join';

  @override
  String get listener_call_mode_video =>
      'This is a video call — the ventor chose camera on.';

  @override
  String get listener_call_mode_audio =>
      'This is a voice-only call — the ventor chose audio.';

  @override
  String get listener_call_instructions_heading =>
      'Guidelines for this session';

  @override
  String get listener_call_instruction_respect =>
      'Treat the ventor with respect and kindness. This is a safe space for them to share.';

  @override
  String get listener_call_instruction_listen =>
      'Listen actively without interrupting. Let them lead the conversation.';

  @override
  String get listener_call_instruction_safe =>
      'Keep the conversation supportive. Do not give medical or legal advice.';

  @override
  String listener_call_instruction_time(int minutes) {
    return 'Stay for the full $minutes-minute session unless they end early.';
  }

  @override
  String get listener_call_instruction_boundaries =>
      'Respect boundaries. If a topic feels outside your comfort zone, guide them gently.';

  @override
  String get listener_call_permissions_heading => 'Allow camera & microphone';

  @override
  String get listener_call_permissions_subtitle =>
      'The ventor decides whether the call is audio or video. Please allow both so you are ready either way.';

  @override
  String get listener_call_permission_mic => 'Microphone';

  @override
  String get listener_call_permission_camera => 'Camera';

  @override
  String get listener_call_permission_allow => 'Allow';

  @override
  String get listener_call_permission_granted => 'Allowed';

  @override
  String get listener_call_permission_settings =>
      'Permission denied. Enable it in Settings to join the call.';

  @override
  String get listener_call_join_now => 'Join call';

  @override
  String get listener_call_end => 'End';

  @override
  String get listener_call_mute => 'Mute';

  @override
  String get listener_call_speaker => 'Speaker';

  @override
  String get listener_call_flip => 'Flip';

  @override
  String get listener_call_chat => 'Chat';

  @override
  String get listener_call_rating_title => 'How was your conversation?';

  @override
  String get listener_call_rating_subtitle => 'Your feedback helps us improve';

  @override
  String get listener_call_rating_felt_heard => 'Did they feel heard?';

  @override
  String get listener_call_rating_talk_again =>
      'Would you take another session with them?';

  @override
  String get listener_call_yes => 'Yes';

  @override
  String get listener_call_no => 'No';

  @override
  String get listener_call_rating_submit => 'Submit';

  @override
  String get listener_call_report_session => 'Report session';

  @override
  String get listener_call_report_title => 'Report session';

  @override
  String get listener_call_report_subtitle =>
      'Tell us what happened. Our team will review your report.';

  @override
  String get listener_call_report_reason_inappropriate =>
      'Inappropriate behavior';

  @override
  String get listener_call_report_reason_harassment => 'Harassment or abuse';

  @override
  String get listener_call_report_reason_hate_speech =>
      'Hate speech or discrimination';

  @override
  String get listener_call_report_reason_safety => 'Safety concern';

  @override
  String get listener_call_report_reason_technical => 'Technical issue';

  @override
  String get listener_call_report_reason_other => 'Other';

  @override
  String get listener_call_report_submit => 'Submit report';

  @override
  String get listener_call_report_cancel => 'Cancel';

  @override
  String get listener_call_report_success =>
      'Report submitted. Our team will review it shortly.';

  @override
  String listener_dashboard_greeting_morning(String name) {
    return 'Good morning, $name 👋';
  }

  @override
  String listener_dashboard_greeting_afternoon(String name) {
    return 'Good afternoon, $name 👋';
  }

  @override
  String listener_dashboard_greeting_evening(String name) {
    return 'Good evening, $name 👋';
  }

  @override
  String get listener_dashboard_subtitle => 'You\'re making a real difference.';

  @override
  String get listener_dashboard_impact_title => 'Today\'s Impact';

  @override
  String get listener_dashboard_period_today => 'Today';

  @override
  String get listener_dashboard_period_week => 'This week';

  @override
  String get listener_dashboard_period_month => 'This month';

  @override
  String get listener_dashboard_sessions => 'Sessions';

  @override
  String get listener_dashboard_hours => 'Hours';

  @override
  String get listener_dashboard_people_helped => 'People helped';

  @override
  String get listener_dashboard_currently => 'You\'re Currently';

  @override
  String get listener_dashboard_available => 'Available';

  @override
  String get listener_dashboard_offline => 'Offline';

  @override
  String get listener_dashboard_accepting => 'Accepting new sessions';

  @override
  String get listener_dashboard_paused => 'Not accepting new sessions';

  @override
  String get listener_dashboard_go_offline => 'Go Offline';

  @override
  String get listener_dashboard_go_online => 'Go Online';

  @override
  String get listener_dashboard_upcoming_title => 'Upcoming Session';

  @override
  String listener_dashboard_at_time(String time) {
    return 'At $time';
  }

  @override
  String listener_dashboard_session_minutes(int minutes) {
    return '$minutes min session';
  }

  @override
  String get listener_dashboard_waiting => 'They\'re waiting for you.';

  @override
  String get listener_dashboard_view => 'View';

  @override
  String get listener_dashboard_reminder_title => 'Daily Reminder';

  @override
  String get listener_dashboard_reminder_message =>
      'Your presence can be the reason someone feels better today.';

  @override
  String get listener_dashboard_setup_title => 'Complete your setup';

  @override
  String get listener_dashboard_setup_subtitle =>
      'Finish the remaining steps before going live.';

  @override
  String get listener_dashboard_setup_identity => 'Identity Verified';

  @override
  String get listener_dashboard_setup_profile => 'Profile Info';

  @override
  String get listener_dashboard_setup_availability => 'Availability';

  @override
  String get listener_dashboard_setup_training => 'Training';

  @override
  String get listener_dashboard_setup_tutorial => 'First Session Tutorial';

  @override
  String get listener_dashboard_setup_done => 'Done';

  @override
  String get listener_dashboard_setup_in_progress => 'In Progress';

  @override
  String get listener_dashboard_setup_locked => 'Locked';

  @override
  String get listener_dashboard_setup_continue => 'Continue Setup';

  @override
  String get listener_dashboard_setup_coming_soon =>
      'Training and tutorials are coming soon.';

  @override
  String get listener_training_title => 'Active Listening Training';

  @override
  String get listener_training_subtitle =>
      'Complete all modules to become a trusted listener.';

  @override
  String get listener_training_continue_learning => 'Continue Learning';

  @override
  String get listener_training_finish => 'Finish Training';

  @override
  String get listener_training_status_completed => 'Completed';

  @override
  String get listener_training_status_in_progress => 'In progress';

  @override
  String get listener_training_status_not_started => 'Not started';

  @override
  String get listener_training_module_art_of_listening =>
      'The Art of Listening';

  @override
  String get listener_training_module_empathy => 'Empathy & Understanding';

  @override
  String get listener_training_module_boundaries => 'Boundaries & Ethics';

  @override
  String get listener_training_module_difficult_situations =>
      'Handling Difficult Situations';

  @override
  String get listener_training_module_crisis_awareness => 'Crisis Awareness';

  @override
  String get listener_dashboard_profile_approved_title => 'Profile approved';

  @override
  String get listener_dashboard_profile_approved_message =>
      'Before taking sessions, complete the onboarding journey and tutorials.';

  @override
  String get listener_dashboard_locked_accept_title => 'Accept Sessions';

  @override
  String get listener_dashboard_locked_accept_subtitle =>
      'Unlock after completing required steps.';

  @override
  String get listener_dashboard_locked_earnings_title =>
      'Earnings (This Month)';

  @override
  String get listener_dashboard_locked_earnings_subtitle =>
      'Complete tutorials to see your earnings.';

  @override
  String get listener_dashboard_locked_earnings_footnote =>
      'Complete tutorials to see your earnings.';

  @override
  String get listener_dashboard_no_requests =>
      'No upcoming requests yet. Requests will appear here once you go live.';

  @override
  String get listener_dashboard_helpful_tip_title => 'Helpful Tip';

  @override
  String get listener_dashboard_helpful_tip_message =>
      'Complete your tutorials to build trust and get more session requests.';

  @override
  String get listener_dashboard_notifications_empty =>
      'You\'re all caught up. New notifications will appear here.';

  @override
  String get listener_dashboard_notifications_just_now => 'Just now';

  @override
  String listener_dashboard_notifications_minutes_ago(int count) {
    return '${count}m ago';
  }

  @override
  String listener_dashboard_notifications_hours_ago(int count) {
    return '${count}h ago';
  }

  @override
  String listener_dashboard_notifications_days_ago(int count) {
    return '${count}d ago';
  }

  @override
  String get listener_dashboard_notifications_delete => 'Delete';
}
