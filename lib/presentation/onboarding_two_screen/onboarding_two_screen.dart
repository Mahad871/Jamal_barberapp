import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                      theme.colorScheme.secondaryContainer,
                      theme.colorScheme.onError
                    ])),
                child: SizedBox(
                    height: 768.v,
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      CustomImageView(
                          imagePath: ImageConstant.appLogo,
                          width: mediaQueryData.size.width, // Adjusted width

                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 52.v)),
                      _buildOnboardingTwoNext(context)
                    ])))));
  }

  /// Section Widget
  Widget _buildOnboardingTwoNext(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 42.h, vertical: 31.v),
            decoration: AppDecoration.white
                .copyWith(borderRadius: BorderRadiusStyle.customBorderTL64),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 230.h,
                      margin: EdgeInsets.only(left: 2.h, right: 58.h),
                      child: Text(
                          AppLocalizations.of(context)!.onBoarding_two_txt,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleLarge!
                              .copyWith(height: 1.50))),
                  SizedBox(height: 12.v),
                  Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          height: 8.v,
                          child: AnimatedSmoothIndicator(
                              activeIndex: 1,
                              count: 3,
                              effect: ScrollingDotsEffect(
                                  spacing: 4,
                                  activeDotColor: theme.colorScheme.primary,
                                  dotColor: appTheme.blue50,
                                  dotHeight: 8.v,
                                  dotWidth: 8.h)))),
                  SizedBox(height: 54.v),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.onboardingFourScreen);
                            },
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: 20.v, bottom: 18.v),
                                child: Text(
                                    AppLocalizations.of(context)!.lbl_skip,
                                    style:
                                        CustomTextStyles.titleSmallPrimary))),
                        CustomElevatedButton(
                            width: 145.h,
                            text: AppLocalizations.of(context)!.lbl_next,
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.onboardingThreeScreen);
                            })
                      ]),
                  SizedBox(height: 4.v)
                ])));
  }
}