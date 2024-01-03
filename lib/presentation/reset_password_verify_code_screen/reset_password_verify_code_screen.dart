import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:mahad_s_application3/widgets/custom_pin_code_text_field.dart';

class ResetPasswordVerifyCodeScreen extends StatelessWidget {
  const ResetPasswordVerifyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 23.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeft,
                          height: 40.adaptSize,
                          width: 40.adaptSize,
                          margin: EdgeInsets.only(left: 1.h),
                          onTap: () {
                            // onTapImgArrowLeft(context);
                          }),
                      SizedBox(height: 42.v),
                      _buildTitleSection(context),
                      SizedBox(height: 31.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: CustomPinCodeTextField(
                              context: context, onChanged: (value) {})),
                      SizedBox(height: 40.v),
                      CustomElevatedButton(
                          text: AppLocalizations.of(context)!.lbl_verify,
                          margin: EdgeInsets.only(left: 1.h),
                          onPressed: () {
                            // onTapVerify(context);
                          }),
                      SizedBox(height: 25.v),
                      Align(
                          alignment: Alignment.center,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    AppLocalizations.of(context)!
                                        .didn_t_receive_the,
                                    style: CustomTextStyles.bodyMediumGray600),
                                Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                        AppLocalizations.of(context)!
                                            .lbl_resend,
                                        style: CustomTextStyles
                                            .titleSmallPrimary_1))
                              ])),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  Widget _buildTitleSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(AppLocalizations.of(context)!.enter_verification,
              style: theme.textTheme.headlineSmall),
          SizedBox(height: 10.v),
          Container(
              width: 273.h,
              margin: EdgeInsets.only(right: 54.h),
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: AppLocalizations.of(context)!.enter_code_that2,
                        style: CustomTextStyles.titleMediumGray500Medium),
                    TextSpan(
                        text: AppLocalizations.of(context)!.lbl_08528188,
                        style: CustomTextStyles.titleMediumMedium16)
                  ]),
                  textAlign: TextAlign.left))
        ]));
  }
}
