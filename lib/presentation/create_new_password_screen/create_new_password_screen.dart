import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:mahad_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({Key? key}) : super(key: key);

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 42.v),
                    child: Column(children: [
                      _buildTitle(context),
                      SizedBox(height: 24.v),
                      CustomTextFormField(
                          controller: newpasswordController,
                          hintText:
                              AppLocalizations.of(context)!.enter_your_password,
                          textInputType: TextInputType.visiblePassword,
                          prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgLock,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)),
                          prefixConstraints: BoxConstraints(maxHeight: 56.v),
                          suffix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(12.h, 16.v, 24.h, 16.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgCheckmarkGray500,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)),
                          suffixConstraints: BoxConstraints(maxHeight: 56.v),
                          obscureText: true),
                      SizedBox(height: 16.v),
                      CustomTextFormField(
                          controller: confirmpasswordController,
                          hintText:
                              AppLocalizations.of(context)!.confirm_password,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgLock,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)),
                          prefixConstraints: BoxConstraints(maxHeight: 56.v),
                          suffix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(30.h, 16.v, 24.h, 16.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgCheckmarkGray500,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)),
                          suffixConstraints: BoxConstraints(maxHeight: 56.v),
                          obscureText: true),
                      SizedBox(height: 24.v),
                      CustomElevatedButton(
                          text:
                              AppLocalizations.of(context)!.lbl_create_password,
                          onPressed: () {
                            // onTapCreatePassword(context);
                          }),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, right: 311.h),
            onTap: () {
              // onTapArrowLeft(context);
            }));
  }

  /// Section Widget
  Widget _buildTitle(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(AppLocalizations.of(context)!.create_new_password,
          style: theme.textTheme.headlineSmall),
      SizedBox(height: 12.v),
      Text(AppLocalizations.of(context)!.create_your_new,
          style: CustomTextStyles.titleMediumGray500)
    ]);
  }
}
