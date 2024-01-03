import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:mahad_s_application3/widgets/custom_outlined_button.dart';

class OnboardingFourScreen extends StatelessWidget {
  const OnboardingFourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 60.v),
                child: Column(children: [
                  Spacer(flex: 40),
                  _buildGetStartedSection(context),
                  Spacer(flex: 59),
                  CustomElevatedButton(
                      text: AppLocalizations.of(context)!.login_text,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.loginScreen);
                      }),
                  SizedBox(height: 16.v),
                  CustomOutlinedButton(
                      text: AppLocalizations.of(context)!.signup_text,
                      buttonStyle: CustomButtonStyles.outlinePrimary,
                      buttonTextStyle: CustomTextStyles.titleMediumPrimary,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.signUpScreen);
                      })
                ]))));
  }

  /// Section Widget
  Widget _buildGetStartedSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 41.h),
        child: Column(children: [
          CustomImageView(
              imagePath: ImageConstant.appLogo, height: 120.v, width: 120.h),
          // SizedBox(height: 5.v),
          // Text("lbl_helthio", style: CustomTextStyles.headlineSmallPrimary),
          SizedBox(height: 38.v),
          Text(AppLocalizations.of(context)!.lets_get_started, style: theme.textTheme.headlineSmall),
          // SizedBox(height: 7.v),
          // SizedBox(
          //     width: 244.h,
          //     child: Text("msg_login_to_enjoy_the",
          //         maxLines: 2,
          //         overflow: TextOverflow.ellipsis,
          //         textAlign: TextAlign.center,
          //         style: CustomTextStyles.titleMediumGray600
          //             .copyWith(height: 1.50)))
        ]));
  }
}
