import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mahad_s_application3/controllers/firebase/auth_methods.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/models/user_model.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_checkbox_button.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:mahad_s_application3/widgets/custom_outlined_button.dart';
import 'package:mahad_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController passwordEditTextController = TextEditingController();

  bool agreeCheckBox = false;
  bool showPassword = false;
  bool isloading = false;

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
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.appLogo,
                            height: 120.v,
                            width: 120.h,
                          ),
                          SizedBox(height: 25.v),
                          _buildNameEditText(context),
                          SizedBox(height: 16.v),
                          _buildEmailEditText(context),
                          SizedBox(height: 16.v),
                          _buildPasswordEditText(context),
                          // SizedBox(height: 16.v),
                          // _buildAgreeCheckBox(context),
                          SizedBox(height: 29.v),
                          CustomElevatedButton(
                              isLoading: this.isloading,
                              text: AppLocalizations.of(context)!.lbl_sign_up,
                              onPressed: () async {
                                setState(() {
                                  this.isloading = true;
                                });
                                UserModel user = UserModel(
                                  username: nameEditTextController.text,
                                  email: emailEditTextController.text,
                                  password: passwordEditTextController.text,
                                  bookings: [],
                                  isBarber: true,
                                );
                                bool done = await sl
                                    .get<AuthMethods>()
                                    .createUser(user);
                                setState(() {
                                  this.isloading = false;
                                });
                                if (done) {
                                  Navigator.pushNamed(
                                      context, AppRoutes.signUpSuccessScreen);
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "please enter valid username, email or password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                  );
                                }
                              }),
                          SizedBox(height: 26.v),
                          Padding(
                            padding: EdgeInsets.only(left: 44.h),
                            child: Row(
                              children: [
                                Text(
                                    AppLocalizations.of(context)!
                                        .already_have_an,
                                    style: CustomTextStyles.bodyMediumGray600),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AppRoutes.loginScreen);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 4.h),
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .lbl_log_in2,
                                            style: CustomTextStyles
                                                .titleSmallPrimary_1)))
                              ],
                            ),
                          ),
                          SizedBox(height: 5.v),
                          _buildDivider(context),
                          SizedBox(height: 5.v),
                          InkWell(
                            enableFeedback: true,
                            child: CustomOutlinedButton(
                              text: AppLocalizations.of(context)!
                                  .sign_up_with_google,
                              onPressed: () async {
                                bool condition = await sl
                                    .get<AuthMethods>()
                                    .signUpWithGoogle();
                                if (condition) {
                                  Navigator.pushNamed(
                                      context, AppRoutes.signUpSuccessScreen);
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Sign up failed",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                  );
                                }

                                // print('pressed !!!!!!!!');
                              },
                              leftIcon: Container(
                                margin: EdgeInsets.only(right: 30.h),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgGoogle,
                                  height: 20.v,
                                  width: 19.h,
                                ),
                              ),
                            ),
                          ),
                        ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      // leading: AppbarLeadingImage(
      //     imagePath: ImageConstant.imgArrowLeft,
      //     margin: EdgeInsets.only(left: 24.h),
      //     onTap: () {
      //       Navigator.pop(context);
      //     }),
      centerTitle: true,
      title: AppbarSubtitleTwo(text: AppLocalizations.of(context)!.lbl_sign_up),
    );
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return CustomTextFormField(
        controller: nameEditTextController,
        hintText: AppLocalizations.of(context)!.lbl_enter_your_name,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        contentPadding: EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return CustomTextFormField(
        controller: emailEditTextController,
        hintText: AppLocalizations.of(context)!.enter_your_email,
        textInputType: TextInputType.emailAddress,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        contentPadding: EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildPasswordEditText(BuildContext context) {
    return CustomTextFormField(
        controller: passwordEditTextController,
        hintText: AppLocalizations.of(context)!.enter_your_password,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        suffix: IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: Icon(
            showPassword ? Icons.visibility : Icons.visibility_off,
            size: 28.h,
            color: Colors.grey.shade500,
          ),
        ),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        obscureText: !showPassword);
  }

  /// Section Widget
  Widget _buildAgreeCheckBox(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 28.h),
        child: CustomCheckboxButton(
            text: "msg_i_agree_to_the_medidoc",
            isExpandedText: true,
            value: agreeCheckBox,
            onChange: (value) {
              agreeCheckBox = value;
            }));
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
        text: AppLocalizations.of(context)!.lbl_sign_up,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.signUpSuccessScreen);
        });
  }

  Widget _buildDivider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.v, bottom: 9.v),
          child: SizedBox(width: 137.h, child: Divider()),
        ),
        Text(AppLocalizations.of(context)!.lbl_or,
            style: theme.textTheme.bodyLarge),
        Padding(
          padding: EdgeInsets.only(top: 8.v, bottom: 9.v),
          child: SizedBox(width: 137.h, child: Divider()),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSocial(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.v),
        // CustomOutlinedButton(
        //   text: "msg_sign_in_with_apple".tr,
        //   leftIcon: Container(
        //     margin: EdgeInsets.only(right: 30.h),
        //     child: CustomImageView(
        //       imagePath: ImageConstant.imgApple,
        //       height: 20.v,
        //       width: 16.h,
        //     ),
        //   ),
        // ),
        // SizedBox(height: 16.v),
        // CustomOutlinedButton(
        //   text: "msg_sign_in_with_facebook".tr,
        //   leftIcon: Container(
        //     padding: EdgeInsets.fromLTRB(7.h, 4.v, 6.h, 4.v),
        //     margin: EdgeInsets.only(right: 30.h),
        //     decoration: BoxDecoration(
        //       color: appTheme.blue600,
        //       borderRadius: BorderRadius.circular(10.h),
        //     ),
        //     child: CustomImageView(
        //       imagePath: ImageConstant.imgFacebook,
        //       height: 11.v,
        //       width: 6.h,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
