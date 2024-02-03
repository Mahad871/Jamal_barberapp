import 'package:flutter/material.dart';
import 'package:mahad_s_application3/presentation/my_shops/add_shop_screen.dart';
import 'package:mahad_s_application3/presentation/my_shops/my_shops_screen.dart';
import 'package:mahad_s_application3/presentation/my_shops/widgets/my_shop_details_item.dart';
import 'package:mahad_s_application3/presentation/onBoarding/onboarding_four_screen/onboarding_four_screen.dart';
import 'package:mahad_s_application3/presentation/onBoarding/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:mahad_s_application3/presentation/onBoarding/onboarding_three_screen/onboarding_three_screen.dart';
import 'package:mahad_s_application3/presentation/onBoarding/onboarding_two_screen/onboarding_two_screen.dart';
import 'package:mahad_s_application3/presentation/profile_page/profile_page.dart';
import 'package:mahad_s_application3/presentation/sign_up_success_dialog/sign_up_success_dialog.dart';
import 'package:mahad_s_application3/presentation/splash_screen/splash_screen.dart';
import 'package:mahad_s_application3/presentation/login_screen/login_screen.dart';
import 'package:mahad_s_application3/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:mahad_s_application3/presentation/reset_password_tab_container_screen/reset_password_tab_container_screen.dart';
import 'package:mahad_s_application3/presentation/reset_password_verify_code_screen/reset_password_verify_code_screen.dart';
import 'package:mahad_s_application3/presentation/create_new_password_screen/create_new_password_screen.dart';
import 'package:mahad_s_application3/presentation/home_container_screen/home_container_screen.dart';
import 'package:mahad_s_application3/presentation/top_doctor_screen/top_barber_screen.dart';
import 'package:mahad_s_application3/presentation/find_doctors_screen/find_doctors_screen.dart';
import 'package:mahad_s_application3/presentation/doctor_detail_screen/doctor_detail_screen.dart';
import 'package:mahad_s_application3/presentation/booking_doctor_screen/booking_doctor_screen.dart';
import 'package:mahad_s_application3/presentation/chat_with_doctor_screen/chat_with_doctor_screen.dart';
import 'package:mahad_s_application3/presentation/audio_call_screen/audio_call_screen.dart';
import 'package:mahad_s_application3/presentation/video_call_screen/video_call_screen.dart';
import 'package:mahad_s_application3/presentation/articles_screen/articles_screen.dart';
import 'package:mahad_s_application3/presentation/pharmacy_screen/pharmacy_screen.dart';
import 'package:mahad_s_application3/presentation/drugs_detail_screen/drugs_detail_screen.dart';
import 'package:mahad_s_application3/presentation/my_cart_screen/my_cart_screen.dart';
import 'package:mahad_s_application3/presentation/location_screen/location_screen.dart';
import 'package:mahad_s_application3/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String onboardingOneScreen = '/onboarding_one_screen';
  static const String onboardingTwoScreen = '/onboarding_two_screen';
  static const String onboardingThreeScreen = '/onboarding_three_screen';
  static const String onboardingFourScreen = '/onboarding_four_screen';
  static const String loginScreen = '/login_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String signUpSuccessScreen = '/sign_up_success_screen';
  static const String resetPasswordEmailPage = '/reset_password_email_page';
  static const String resetPasswordTabContainerScreen =
      '/reset_password_tab_container_screen';
  static const String resetPasswordPhonePage = '/reset_password_phone_page';
  static const String resetPasswordVerifyCodeScreen =
      '/reset_password_verify_code_screen';
  static const String createNewPasswordScreen = '/create_new_password_screen';
  static const String homePage = '/home_page';
  static const String homeContainerScreen = '/home_container_screen';
  static const String topDoctorScreen = '/top_doctor_screen';
  static const String myShopsScreen = '/my_shops_screen';
  static const String myShopDetailsScreen = '/my_shops_details_screen';
  static const String addShopScreen = '/add_shop_screen';

  static const String findDoctorsScreen = '/find_doctors_screen';
  static const String doctorDetailScreen = '/doctor_detail_screen';
  static const String bookingDoctorScreen = '/booking_doctor_screen';
  static const String chatWithDoctorScreen = '/chat_with_doctor_screen';
  static const String audioCallScreen = '/audio_call_screen';
  static const String videoCallScreen = '/video_call_screen';
  static const String schedulePage = '/schedule_page';
  static const String scheduleTabContainerPage = '/schedule_tab_container_page';
  static const String messageHistoryPage = '/message_history_page';
  static const String messageHistoryTabContainerPage =
      '/message_history_tab_container_page';
  static const String articlesScreen = '/articles_screen';
  static const String pharmacyScreen = '/pharmacy_screen';
  static const String drugsDetailScreen = '/drugs_detail_screen';
  static const String myCartScreen = '/my_cart_screen';
  static const String locationScreen = '/location_screen';
  static const String profilePage = '/profile_page';
  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    onboardingOneScreen: (context) => OnboardingOneScreen(),
    onboardingTwoScreen: (context) => OnboardingTwoScreen(),
    onboardingThreeScreen: (context) => OnboardingThreeScreen(),
    onboardingFourScreen: (context) => OnboardingFourScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    signUpSuccessScreen: (context) => SignUpSuccessDialog(),
    resetPasswordTabContainerScreen: (context) =>
        ResetPasswordTabContainerScreen(),
    resetPasswordVerifyCodeScreen: (context) => ResetPasswordVerifyCodeScreen(),
    createNewPasswordScreen: (context) => CreateNewPasswordScreen(),
    homeContainerScreen: (context) => HomeContainerScreen(),
    topDoctorScreen: (context) => TopBarbers(),
    findDoctorsScreen: (context) => FindDoctorsScreen(),
    doctorDetailScreen: (context) => DoctorDetailScreen(),
    bookingDoctorScreen: (context) => BookingDoctorScreen(),
    chatWithDoctorScreen: (context) => ChatWithDoctorScreen(),
    // audioCallScreen: (context) => AudioCallScreen(),
    // videoCallScreen: (context) => VideoCallScreen(),
    // articlesScreen: (context) => ArticlesScreen(),
    pharmacyScreen: (context) => PharmacyScreen(),
    // drugsDetailScreen: (context) => DrugsDetailScreen(),
    myCartScreen: (context) => MyCartScreen(),
    locationScreen: (context) => LocationScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    profilePage: (context) => ProfilePage(),
    myShopsScreen: (context) => MyShopsScreen(),
    // myShopDetailsScreen: (context) => MyShopDetailsItem(),
    addShopScreen: (context) => AddShopScreen(),
  };

  static WidgetBuilder getSplashScreen() => routes[splashScreen]!;
  static WidgetBuilder getOnboardingOneScreen() => routes[onboardingOneScreen]!;
  static WidgetBuilder getOnboardingTwoScreen() => routes[onboardingTwoScreen]!;
  static WidgetBuilder getOnboardingThreeScreen() =>
      routes[onboardingThreeScreen]!;
  static WidgetBuilder getOnboardingFourScreen() =>
      routes[onboardingFourScreen]!;
  static WidgetBuilder getLoginScreen() => routes[loginScreen]!;
  static WidgetBuilder getSignUpScreen() => routes[signUpScreen]!;
  static WidgetBuilder getResetPasswordTabContainerScreen() =>
      routes[resetPasswordTabContainerScreen]!;
  static WidgetBuilder getResetPasswordVerifyCodeScreen() =>
      routes[resetPasswordVerifyCodeScreen]!;
  static WidgetBuilder getCreateNewPasswordScreen() =>
      routes[createNewPasswordScreen]!;
  static WidgetBuilder getHomeContainerScreen() => routes[homeContainerScreen]!;
  static WidgetBuilder getTopDoctorScreen() => routes[topDoctorScreen]!;
  static WidgetBuilder getMyShopsScreen() => routes[myShopsScreen]!;
  static WidgetBuilder getFindDoctorsScreen() => routes[findDoctorsScreen]!;
  static WidgetBuilder getDoctorDetailScreen() => routes[doctorDetailScreen]!;
  static WidgetBuilder getBookingDoctorScreen() => routes[bookingDoctorScreen]!;
  static WidgetBuilder getChatWithDoctorScreen() =>
      routes[chatWithDoctorScreen]!;
  static WidgetBuilder getAudioCallScreen() => routes[audioCallScreen]!;
  static WidgetBuilder getVideoCallScreen() => routes[videoCallScreen]!;
  static WidgetBuilder getArticlesScreen() => routes[articlesScreen]!;
  static WidgetBuilder getPharmacyScreen() => routes[pharmacyScreen]!;
  static WidgetBuilder getDrugsDetailScreen() => routes[drugsDetailScreen]!;
  static WidgetBuilder getMyCartScreen() => routes[myCartScreen]!;
  static WidgetBuilder getLocationScreen() => routes[locationScreen]!;
  static WidgetBuilder getAppNavigationScreen() => routes[appNavigationScreen]!;
}
