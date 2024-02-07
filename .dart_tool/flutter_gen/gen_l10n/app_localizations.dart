import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @login_text.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_text;

  /// No description provided for @signup_text.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup_text;

  /// No description provided for @onBoarding_one_txt.
  ///
  /// In en, this message translates to:
  /// **'Connect with the Barber you love'**
  String get onBoarding_one_txt;

  /// No description provided for @onBoarding_two_txt.
  ///
  /// In en, this message translates to:
  /// **'Find best hair specialists in one place'**
  String get onBoarding_two_txt;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @lets_get_started.
  ///
  /// In en, this message translates to:
  /// **'Let’s get started!'**
  String get lets_get_started;

  /// No description provided for @onBoarding_three_txt.
  ///
  /// In en, this message translates to:
  /// **'Book an appointment with our Barber'**
  String get onBoarding_three_txt;

  /// No description provided for @lbl_or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get lbl_or;

  /// No description provided for @don_t_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get don_t_have_an_account;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password;

  /// No description provided for @sign_in_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get sign_in_with_apple;

  /// No description provided for @sign_in_with_facebook.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Facebook'**
  String get sign_in_with_facebook;

  /// No description provided for @sign_in_with_google.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get sign_in_with_google;

  /// No description provided for @sign_up_with_google.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get sign_up_with_google;

  /// No description provided for @lbl_enter_your_name.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get lbl_enter_your_name;

  /// No description provided for @lbl_log_in2.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get lbl_log_in2;

  /// No description provided for @already_have_an.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_an;

  /// No description provided for @lbl_go_to_home.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get lbl_go_to_home;

  /// No description provided for @lbl_success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get lbl_success;

  /// No description provided for @your_account_has.
  ///
  /// In en, this message translates to:
  /// **'Your account has been \nsuccessfully registered'**
  String get your_account_has;

  /// No description provided for @lbl_xyz_gmail_com.
  ///
  /// In en, this message translates to:
  /// **'xyz@gmail.com'**
  String get lbl_xyz_gmail_com;

  /// No description provided for @lbl_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get lbl_email;

  /// No description provided for @lbl_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get lbl_phone;

  /// No description provided for @enter_your_email_or_your_phone_number_we_will_send_you_confirmation_code.
  ///
  /// In en, this message translates to:
  /// **'Enter your email or your phone number, we will send you confirmation code'**
  String get enter_your_email_or_your_phone_number_we_will_send_you_confirmation_code;

  /// No description provided for @lbl_forgot_your_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Your Password?'**
  String get lbl_forgot_your_password;

  /// No description provided for @lbl_1234567890.
  ///
  /// In en, this message translates to:
  /// **'1234567890'**
  String get lbl_1234567890;

  /// No description provided for @lbl_08528188.
  ///
  /// In en, this message translates to:
  /// **'08528188*** '**
  String get lbl_08528188;

  /// No description provided for @lbl_resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get lbl_resend;

  /// No description provided for @lbl_verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get lbl_verify;

  /// No description provided for @didn_t_receive_the.
  ///
  /// In en, this message translates to:
  /// **'Didn’t receive the code?'**
  String get didn_t_receive_the;

  /// No description provided for @enter_code_that.
  ///
  /// In en, this message translates to:
  /// **'Enter code that we have sent to your number 08528188*** '**
  String get enter_code_that;

  /// No description provided for @enter_code_that2.
  ///
  /// In en, this message translates to:
  /// **'Enter code that we have sent to your number '**
  String get enter_code_that2;

  /// No description provided for @enter_verification.
  ///
  /// In en, this message translates to:
  /// **'Enter Verification Code'**
  String get enter_verification;

  /// No description provided for @lbl_create_password.
  ///
  /// In en, this message translates to:
  /// **'Create Password'**
  String get lbl_create_password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password;

  /// No description provided for @create_new_password.
  ///
  /// In en, this message translates to:
  /// **'Create New Password'**
  String get create_new_password;

  /// No description provided for @create_your_new.
  ///
  /// In en, this message translates to:
  /// **'Create your new password to login'**
  String get create_your_new;

  /// No description provided for @enter_new_password.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enter_new_password;

  /// No description provided for @lbl_barber.
  ///
  /// In en, this message translates to:
  /// **'Barber'**
  String get lbl_barber;

  /// No description provided for @lbl_User.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get lbl_User;

  /// No description provided for @lbl_hospital.
  ///
  /// In en, this message translates to:
  /// **'Hospital'**
  String get lbl_hospital;

  /// No description provided for @lbl_book_now.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get lbl_book_now;

  /// No description provided for @early_protection.
  ///
  /// In en, this message translates to:
  /// **'Style for Everyone'**
  String get early_protection;

  /// No description provided for @find_your_desire.
  ///
  /// In en, this message translates to:
  /// **'Find your desire \nhealth solution'**
  String get find_your_desire;

  /// No description provided for @search_barber_shops.
  ///
  /// In en, this message translates to:
  /// **'Search barber, BarberShops...'**
  String get search_barber_shops;

  /// No description provided for @dr_marcus_horizon2.
  ///
  /// In en, this message translates to:
  /// **'Marcus Horizon D'**
  String get dr_marcus_horizon2;

  /// No description provided for @lbl_cardio.
  ///
  /// In en, this message translates to:
  /// **'Cardio'**
  String get lbl_cardio;

  /// No description provided for @lbl_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get lbl_category;

  /// No description provided for @lbl_dentist.
  ///
  /// In en, this message translates to:
  /// **'Dentist'**
  String get lbl_dentist;

  /// No description provided for @lbl_dr_luke.
  ///
  /// In en, this message translates to:
  /// **'Luke'**
  String get lbl_dr_luke;

  /// No description provided for @lbl_dr_marcus.
  ///
  /// In en, this message translates to:
  /// **'Marcus'**
  String get lbl_dr_marcus;

  /// No description provided for @lbl_dr_maria.
  ///
  /// In en, this message translates to:
  /// **'Maria'**
  String get lbl_dr_maria;

  /// No description provided for @lbl_dr_stevi.
  ///
  /// In en, this message translates to:
  /// **'Stevi'**
  String get lbl_dr_stevi;

  /// No description provided for @lbl_find_a_doctor.
  ///
  /// In en, this message translates to:
  /// **'Find a barber'**
  String get lbl_find_a_doctor;

  /// No description provided for @lbl_find_doctors.
  ///
  /// In en, this message translates to:
  /// **'Find barbers'**
  String get lbl_find_doctors;

  /// No description provided for @lbl_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get lbl_general;

  /// No description provided for @lbl_lungs.
  ///
  /// In en, this message translates to:
  /// **'Lungs'**
  String get lbl_lungs;

  /// No description provided for @lbl_surgeon.
  ///
  /// In en, this message translates to:
  /// **'Surgeon'**
  String get lbl_surgeon;

  /// No description provided for @recommended_doctors.
  ///
  /// In en, this message translates to:
  /// **'Recommended barbers'**
  String get recommended_doctors;

  /// No description provided for @your_recent_doctors.
  ///
  /// In en, this message translates to:
  /// **'Your Recent barbers'**
  String get your_recent_doctors;

  /// No description provided for @lbl_01_00_pm.
  ///
  /// In en, this message translates to:
  /// **'01:00 PM'**
  String get lbl_01_00_pm;

  /// No description provided for @lbl_02_00_pm.
  ///
  /// In en, this message translates to:
  /// **'02:00 PM'**
  String get lbl_02_00_pm;

  /// No description provided for @lbl_03_00_pm.
  ///
  /// In en, this message translates to:
  /// **'03:00 PM'**
  String get lbl_03_00_pm;

  /// No description provided for @lbl_04_00_pm.
  ///
  /// In en, this message translates to:
  /// **'04:00 PM'**
  String get lbl_04_00_pm;

  /// No description provided for @lbl_07_00_pm.
  ///
  /// In en, this message translates to:
  /// **'07:00 PM'**
  String get lbl_07_00_pm;

  /// No description provided for @lbl_08_00_pm.
  ///
  /// In en, this message translates to:
  /// **'08:00 PM'**
  String get lbl_08_00_pm;

  /// No description provided for @lbl_09_00_am.
  ///
  /// In en, this message translates to:
  /// **'09:00 AM'**
  String get lbl_09_00_am;

  /// No description provided for @lbl_10_00_am.
  ///
  /// In en, this message translates to:
  /// **'10:00 AM'**
  String get lbl_10_00_am;

  /// No description provided for @lbl_11_00_am.
  ///
  /// In en, this message translates to:
  /// **'11:00 AM'**
  String get lbl_11_00_am;

  /// No description provided for @lbl_21.
  ///
  /// In en, this message translates to:
  /// **'21'**
  String get lbl_21;

  /// No description provided for @lbl_22.
  ///
  /// In en, this message translates to:
  /// **'22'**
  String get lbl_22;

  /// No description provided for @lbl_23.
  ///
  /// In en, this message translates to:
  /// **'23'**
  String get lbl_23;

  /// No description provided for @lbl_24.
  ///
  /// In en, this message translates to:
  /// **'24'**
  String get lbl_24;

  /// No description provided for @lbl_25.
  ///
  /// In en, this message translates to:
  /// **'25'**
  String get lbl_25;

  /// No description provided for @lbl_26.
  ///
  /// In en, this message translates to:
  /// **'26'**
  String get lbl_26;

  /// No description provided for @lbl_about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get lbl_about;

  /// No description provided for @lbl_book_apointment.
  ///
  /// In en, this message translates to:
  /// **'Book Apointment'**
  String get lbl_book_apointment;

  /// No description provided for @lbl_fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get lbl_fri;

  /// No description provided for @lbl_mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get lbl_mon;

  /// No description provided for @lbl_sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get lbl_sat;

  /// No description provided for @lbl_thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get lbl_thu;

  /// No description provided for @lbl_tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get lbl_tue;

  /// No description provided for @lbl_wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get lbl_wed;

  /// No description provided for @lorem_ipsum_dolor.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam... '**
  String get lorem_ipsum_dolor;

  /// No description provided for @lbl.
  ///
  /// In en, this message translates to:
  /// **'-'**
  String get lbl;

  /// No description provided for @lbl_01_00.
  ///
  /// In en, this message translates to:
  /// **'\$01.00'**
  String get lbl_01_00;

  /// No description provided for @lbl_60_00.
  ///
  /// In en, this message translates to:
  /// **'\$60.00'**
  String get lbl_60_00;

  /// No description provided for @lbl_61_00.
  ///
  /// In en, this message translates to:
  /// **'\$61.00'**
  String get lbl_61_00;

  /// No description provided for @lbl_61_002.
  ///
  /// In en, this message translates to:
  /// **'\$ 61.00'**
  String get lbl_61_002;

  /// No description provided for @lbl_admin_fee.
  ///
  /// In en, this message translates to:
  /// **'Admin Fee'**
  String get lbl_admin_fee;

  /// No description provided for @lbl_appointment.
  ///
  /// In en, this message translates to:
  /// **'Appointment'**
  String get lbl_appointment;

  /// No description provided for @lbl_chest_pain.
  ///
  /// In en, this message translates to:
  /// **'Chest pain'**
  String get lbl_chest_pain;

  /// No description provided for @lbl_consultation.
  ///
  /// In en, this message translates to:
  /// **'Consultation'**
  String get lbl_consultation;

  /// No description provided for @lbl_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get lbl_date;

  /// No description provided for @lbl_reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get lbl_reason;

  /// No description provided for @aditional_discount.
  ///
  /// In en, this message translates to:
  /// **'Aditional Discount'**
  String get aditional_discount;

  /// No description provided for @wednesday_jun_23.
  ///
  /// In en, this message translates to:
  /// **'Wednesday, Jun 23, 2021 | 10:00 AM'**
  String get wednesday_jun_23;

  /// No description provided for @lbl_10_min_ago.
  ///
  /// In en, this message translates to:
  /// **'10 min ago'**
  String get lbl_10_min_ago;

  /// No description provided for @lbl_5_min_ago.
  ///
  /// In en, this message translates to:
  /// **'5 min ago'**
  String get lbl_5_min_ago;

  /// No description provided for @lbl_online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get lbl_online;

  /// No description provided for @lbl_send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get lbl_send;

  /// No description provided for @consultion_start.
  ///
  /// In en, this message translates to:
  /// **'Consultion Start'**
  String get consultion_start;

  /// No description provided for @i_don_t_have_any.
  ///
  /// In en, this message translates to:
  /// **'I don,t have any fever, but headchace is painful'**
  String get i_don_t_have_any;

  /// No description provided for @i_have_suffering.
  ///
  /// In en, this message translates to:
  /// **'I have suffering from headache and cold for 3 days, I took 2 tablets of dolo, but still pain'**
  String get i_have_suffering;

  /// No description provided for @ok_do_you_have.
  ///
  /// In en, this message translates to:
  /// **'Ok, Do you have fever? is the\nheadchace severe'**
  String get ok_do_you_have;

  /// No description provided for @type_message.
  ///
  /// In en, this message translates to:
  /// **'Type message ...'**
  String get type_message;

  /// No description provided for @you_can_consult.
  ///
  /// In en, this message translates to:
  /// **'You can consult your problem to the barber'**
  String get you_can_consult;

  /// No description provided for @lbl_10_30_am.
  ///
  /// In en, this message translates to:
  /// **'10:30 AM'**
  String get lbl_10_30_am;

  /// No description provided for @lbl_26_06_2022.
  ///
  /// In en, this message translates to:
  /// **'26/06/2022'**
  String get lbl_26_06_2022;

  /// No description provided for @lbl_28_06_2022.
  ///
  /// In en, this message translates to:
  /// **'28/06/2022'**
  String get lbl_28_06_2022;

  /// No description provided for @lbl_2_00_pm.
  ///
  /// In en, this message translates to:
  /// **'2:00 PM'**
  String get lbl_2_00_pm;

  /// No description provided for @lbl_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get lbl_cancel;

  /// No description provided for @lbl_confirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get lbl_confirmed;

  /// No description provided for @lbl_psikeater.
  ///
  /// In en, this message translates to:
  /// **'Psikeater'**
  String get lbl_psikeater;

  /// No description provided for @lbl_reschedule.
  ///
  /// In en, this message translates to:
  /// **'Reschedule'**
  String get lbl_reschedule;

  /// No description provided for @lbl_canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get lbl_canceled;

  /// No description provided for @lbl_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get lbl_completed;

  /// No description provided for @lbl_schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get lbl_schedule;

  /// No description provided for @lbl_upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get lbl_upcoming;

  /// No description provided for @lbl_08_57.
  ///
  /// In en, this message translates to:
  /// **'08:57'**
  String get lbl_08_57;

  /// No description provided for @lbl_09_04.
  ///
  /// In en, this message translates to:
  /// **'09:04'**
  String get lbl_09_04;

  /// No description provided for @lbl_10_24.
  ///
  /// In en, this message translates to:
  /// **'10.24'**
  String get lbl_10_24;

  /// No description provided for @do_you_have_fever.
  ///
  /// In en, this message translates to:
  /// **'Do you have fever?'**
  String get do_you_have_fever;

  /// No description provided for @i_don_t_have_any2.
  ///
  /// In en, this message translates to:
  /// **'I don,t have any fever, but headchace...'**
  String get i_don_t_have_any2;

  /// No description provided for @lbl_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get lbl_all;

  /// No description provided for @lbl_group.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get lbl_group;

  /// No description provided for @lbl_message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get lbl_message;

  /// No description provided for @lbl_private.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get lbl_private;

  /// No description provided for @lbl_5_min_read.
  ///
  /// In en, this message translates to:
  /// **'5 min read'**
  String get lbl_5_min_read;

  /// No description provided for @lbl_5min_read2.
  ///
  /// In en, this message translates to:
  /// **'5min read'**
  String get lbl_5min_read2;

  /// No description provided for @lbl_6_min_read.
  ///
  /// In en, this message translates to:
  /// **'6 min read'**
  String get lbl_6_min_read;

  /// No description provided for @lbl_8_min_read.
  ///
  /// In en, this message translates to:
  /// **'8 min read'**
  String get lbl_8_min_read;

  /// No description provided for @lbl_articles.
  ///
  /// In en, this message translates to:
  /// **'Articles'**
  String get lbl_articles;

  /// No description provided for @lbl_diet.
  ///
  /// In en, this message translates to:
  /// **'Diet'**
  String get lbl_diet;

  /// No description provided for @lbl_fitness.
  ///
  /// In en, this message translates to:
  /// **'Fitness'**
  String get lbl_fitness;

  /// No description provided for @lbl_jun_10_2021.
  ///
  /// In en, this message translates to:
  /// **'Jun 10, 2021'**
  String get lbl_jun_10_2021;

  /// No description provided for @lbl_jun_10_20212.
  ///
  /// In en, this message translates to:
  /// **'Jun 10, 2021 '**
  String get lbl_jun_10_20212;

  /// No description provided for @lbl_jun_12_2021.
  ///
  /// In en, this message translates to:
  /// **'Jun 12, 2021'**
  String get lbl_jun_12_2021;

  /// No description provided for @lbl_jun_8_2021.
  ///
  /// In en, this message translates to:
  /// **'Jun 8, 2021 '**
  String get lbl_jun_8_2021;

  /// No description provided for @lbl_jun_9_2021.
  ///
  /// In en, this message translates to:
  /// **'Jun 9, 2021 '**
  String get lbl_jun_9_2021;

  /// No description provided for @beauty_tips_for.
  ///
  /// In en, this message translates to:
  /// **'Beauty Tips For Face: 10 Dos and Don\'ts for Naturally Beautiful Skin'**
  String get beauty_tips_for;

  /// No description provided for @comparing_the_astrazeneca.
  ///
  /// In en, this message translates to:
  /// **'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines'**
  String get comparing_the_astrazeneca;

  /// No description provided for @popular_articles.
  ///
  /// In en, this message translates to:
  /// **'Popular Articles'**
  String get popular_articles;

  /// No description provided for @related_articles.
  ///
  /// In en, this message translates to:
  /// **'Related Articles'**
  String get related_articles;

  /// No description provided for @search_articles.
  ///
  /// In en, this message translates to:
  /// **'Search articles, news'**
  String get search_articles;

  /// No description provided for @the_25_healthiest.
  ///
  /// In en, this message translates to:
  /// **'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist'**
  String get the_25_healthiest;

  /// No description provided for @the_horror_of_the.
  ///
  /// In en, this message translates to:
  /// **'The Horror Of The Second Wave Of COVID-19'**
  String get the_horror_of_the;

  /// No description provided for @traditional_herbal.
  ///
  /// In en, this message translates to:
  /// **'Traditional Herbal Medicine Treatments for COVID-19'**
  String get traditional_herbal;

  /// No description provided for @trending_articles.
  ///
  /// In en, this message translates to:
  /// **'Trending Articles'**
  String get trending_articles;

  /// No description provided for @lbl_100ml.
  ///
  /// In en, this message translates to:
  /// **'100ml'**
  String get lbl_100ml;

  /// No description provided for @lbl_10_99.
  ///
  /// In en, this message translates to:
  /// **'10.99'**
  String get lbl_10_99;

  /// No description provided for @lbl_3pcs.
  ///
  /// In en, this message translates to:
  /// **'3pcs'**
  String get lbl_3pcs;

  /// No description provided for @lbl_50ml.
  ///
  /// In en, this message translates to:
  /// **'50ml'**
  String get lbl_50ml;

  /// No description provided for @lbl_5_99.
  ///
  /// In en, this message translates to:
  /// **'\$5.99'**
  String get lbl_5_99;

  /// No description provided for @lbl_6_99.
  ///
  /// In en, this message translates to:
  /// **'\$6.99'**
  String get lbl_6_99;

  /// No description provided for @lbl_7_99.
  ///
  /// In en, this message translates to:
  /// **'\$7.99'**
  String get lbl_7_99;

  /// No description provided for @lbl_8_99.
  ///
  /// In en, this message translates to:
  /// **'\$8.99'**
  String get lbl_8_99;

  /// No description provided for @lbl_betadine.
  ///
  /// In en, this message translates to:
  /// **'Betadine'**
  String get lbl_betadine;

  /// No description provided for @lbl_bodrex_herbal.
  ///
  /// In en, this message translates to:
  /// **'Bodrex Herbal'**
  String get lbl_bodrex_herbal;

  /// No description provided for @lbl_bodrexin.
  ///
  /// In en, this message translates to:
  /// **'Bodrexin'**
  String get lbl_bodrexin;

  /// No description provided for @lbl_konidin.
  ///
  /// In en, this message translates to:
  /// **'Konidin'**
  String get lbl_konidin;

  /// No description provided for @lbl_popular_product.
  ///
  /// In en, this message translates to:
  /// **'Popular Product'**
  String get lbl_popular_product;

  /// No description provided for @lbl_product_on_sale.
  ///
  /// In en, this message translates to:
  /// **'Product on Sale'**
  String get lbl_product_on_sale;

  /// No description provided for @search_drugs_category.
  ///
  /// In en, this message translates to:
  /// **'Search drugs, category'**
  String get search_drugs_category;

  /// No description provided for @lbl_4_0.
  ///
  /// In en, this message translates to:
  /// **'4.0'**
  String get lbl_4_0;

  /// No description provided for @lbl_add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get lbl_add_to_cart;

  /// No description provided for @lbl_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get lbl_description;

  /// No description provided for @obh_combi_is_a.
  ///
  /// In en, this message translates to:
  /// **'OBH COMBI  is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing... '**
  String get obh_combi_is_a;

  /// No description provided for @lbl_1_00.
  ///
  /// In en, this message translates to:
  /// **'\$1.00'**
  String get lbl_1_00;

  /// No description provided for @lbl_2.
  ///
  /// In en, this message translates to:
  /// **'2'**
  String get lbl_2;

  /// No description provided for @lbl_25_98.
  ///
  /// In en, this message translates to:
  /// **'\$25.98'**
  String get lbl_25_98;

  /// No description provided for @lbl_26_98.
  ///
  /// In en, this message translates to:
  /// **'\$26.98'**
  String get lbl_26_98;

  /// No description provided for @lbl_26_982.
  ///
  /// In en, this message translates to:
  /// **'\$ 26.98'**
  String get lbl_26_982;

  /// No description provided for @lbl_my_cart.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get lbl_my_cart;

  /// No description provided for @lbl_subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get lbl_subtotal;

  /// No description provided for @lbl_taxes.
  ///
  /// In en, this message translates to:
  /// **'Taxes'**
  String get lbl_taxes;

  /// No description provided for @lbl_1111_abcd_rd_102.
  ///
  /// In en, this message translates to:
  /// **'1111 abcd Rd #102 Alexandria, Virginia(VA), 22314'**
  String get lbl_1111_abcd_rd_102;

  /// No description provided for @confirm_location.
  ///
  /// In en, this message translates to:
  /// **'Confirm Location'**
  String get confirm_location;

  /// No description provided for @confirm_your_address.
  ///
  /// In en, this message translates to:
  /// **'Confirm your address'**
  String get confirm_your_address;

  /// No description provided for @search_location.
  ///
  /// In en, this message translates to:
  /// **'Search location, ZIP code'**
  String get search_location;

  /// No description provided for @lbl_103lbs.
  ///
  /// In en, this message translates to:
  /// **'103lbs'**
  String get lbl_103lbs;

  /// No description provided for @lbl_215bpm.
  ///
  /// In en, this message translates to:
  /// **'215bpm'**
  String get lbl_215bpm;

  /// No description provided for @lbl_756cal.
  ///
  /// In en, this message translates to:
  /// **'756cal'**
  String get lbl_756cal;

  /// No description provided for @lbl_amelia_renata.
  ///
  /// In en, this message translates to:
  /// **'Amelia Renata'**
  String get lbl_amelia_renata;

  /// No description provided for @lbl_appointmnet.
  ///
  /// In en, this message translates to:
  /// **'Appointmnet'**
  String get lbl_appointmnet;

  /// No description provided for @lbl_calories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get lbl_calories;

  /// No description provided for @lbl_faqs.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get lbl_faqs;

  /// No description provided for @lbl_heart_rate.
  ///
  /// In en, this message translates to:
  /// **'Heart rate'**
  String get lbl_heart_rate;

  /// No description provided for @lbl_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get lbl_logout;

  /// No description provided for @lbl_my_saved.
  ///
  /// In en, this message translates to:
  /// **'My Saved'**
  String get lbl_my_saved;

  /// No description provided for @lbl_my_shpos.
  ///
  /// In en, this message translates to:
  /// **'My Shops'**
  String get lbl_my_shpos;

  /// No description provided for @lbl_add_shop.
  ///
  /// In en, this message translates to:
  /// **'Add Shop'**
  String get lbl_add_shop;

  /// No description provided for @lbl_weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get lbl_weight;

  /// No description provided for @lbl_00_05_24.
  ///
  /// In en, this message translates to:
  /// **'00:05:24'**
  String get lbl_00_05_24;

  /// No description provided for @lbl_1.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get lbl_1;

  /// No description provided for @lbl_15_99.
  ///
  /// In en, this message translates to:
  /// **'\$15.99'**
  String get lbl_15_99;

  /// No description provided for @lbl_20pcs.
  ///
  /// In en, this message translates to:
  /// **'20pcs'**
  String get lbl_20pcs;

  /// No description provided for @lbl_4_7.
  ///
  /// In en, this message translates to:
  /// **'4.7'**
  String get lbl_4_7;

  /// No description provided for @lbl_75ml.
  ///
  /// In en, this message translates to:
  /// **'75ml'**
  String get lbl_75ml;

  /// No description provided for @lbl_800m_away.
  ///
  /// In en, this message translates to:
  /// **'800m away'**
  String get lbl_800m_away;

  /// No description provided for @lbl_9_99.
  ///
  /// In en, this message translates to:
  /// **'\$9.99'**
  String get lbl_9_99;

  /// No description provided for @lbl_ambulance.
  ///
  /// In en, this message translates to:
  /// **'Shops'**
  String get lbl_ambulance;

  /// No description provided for @lbl_change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get lbl_change;

  /// No description provided for @lbl_chardiologist.
  ///
  /// In en, this message translates to:
  /// **'Chardiologist'**
  String get lbl_chardiologist;

  /// No description provided for @lbl_checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get lbl_checkout;

  /// No description provided for @lbl_covid_19.
  ///
  /// In en, this message translates to:
  /// **'Covid-19'**
  String get lbl_covid_19;

  /// No description provided for @lbl_details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get lbl_details;

  /// No description provided for @lbl_dr_alysa_hana.
  ///
  /// In en, this message translates to:
  /// **'Alysa Hana'**
  String get lbl_dr_alysa_hana;

  /// No description provided for @lbl_dr_maria_elena.
  ///
  /// In en, this message translates to:
  /// **'Maria Elena'**
  String get lbl_dr_maria_elena;

  /// No description provided for @lbl_jamal.
  ///
  /// In en, this message translates to:
  /// **'Jamal'**
  String get lbl_jamal;

  /// No description provided for @lbl_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get lbl_login;

  /// No description provided for @lbl_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get lbl_next;

  /// No description provided for @lbl_obh_combi.
  ///
  /// In en, this message translates to:
  /// **'OBH Combi'**
  String get lbl_obh_combi;

  /// No description provided for @lbl_panadol.
  ///
  /// In en, this message translates to:
  /// **'Panadol'**
  String get lbl_panadol;

  /// No description provided for @lbl_payment_detail.
  ///
  /// In en, this message translates to:
  /// **'Payment Detail'**
  String get lbl_payment_detail;

  /// No description provided for @lbl_payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get lbl_payment_method;

  /// No description provided for @lbl_pharmacy.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy'**
  String get lbl_pharmacy;

  /// No description provided for @lbl_read_more.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get lbl_read_more;

  /// No description provided for @lbl_see_all.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get lbl_see_all;

  /// No description provided for @lbl_send_otp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get lbl_send_otp;

  /// No description provided for @lbl_sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get lbl_sign_up;

  /// No description provided for @lbl_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get lbl_skip;

  /// No description provided for @lbl_top_barbers.
  ///
  /// In en, this message translates to:
  /// **'Best Barbers'**
  String get lbl_top_barbers;

  /// No description provided for @lbl_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get lbl_total;

  /// No description provided for @lbl_visa.
  ///
  /// In en, this message translates to:
  /// **'VISA'**
  String get lbl_visa;

  /// No description provided for @dr_marcus_horizon.
  ///
  /// In en, this message translates to:
  /// **'Marcus Horizon'**
  String get dr_marcus_horizon;

  /// No description provided for @enter_your_email.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enter_your_email;

  /// No description provided for @enter_your_password.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enter_your_password;

  /// No description provided for @hello_how_can_i.
  ///
  /// In en, this message translates to:
  /// **'Hello, How can i help you?'**
  String get hello_how_can_i;

  /// No description provided for @swipe_back_to_menu.
  ///
  /// In en, this message translates to:
  /// **'Swipe back to menu'**
  String get swipe_back_to_menu;

  /// No description provided for @network_err.
  ///
  /// In en, this message translates to:
  /// **'Network Error'**
  String get network_err;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong!'**
  String get something_went_wrong;

  /// No description provided for @msg_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome '**
  String get msg_welcome;

  /// No description provided for @please_create_an_account_first.
  ///
  /// In en, this message translates to:
  /// **'Please create an account first'**
  String get please_create_an_account_first;

  /// No description provided for @please_enter_correct_email_and_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter correct email or password'**
  String get please_enter_correct_email_and_password;

  /// No description provided for @please_enter_valid_username_email_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid username, email or password'**
  String get please_enter_valid_username_email_password;

  /// No description provided for @sign_up_failed.
  ///
  /// In en, this message translates to:
  /// **'Sign up failed'**
  String get sign_up_failed;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
