import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mahad_s_application3/controllers/firebase/auth_methods.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:mahad_s_application3/widgets/custom_outlined_button.dart';
import 'package:mahad_s_application3/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isloading = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 10.v),
                  CustomImageView(
                    imagePath: ImageConstant.appLogo,
                    height: 120.v,
                    width: 120.h,
                  ),
                  SizedBox(height: 25.v),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: AppLocalizations.of(context)!.enter_your_email,
                    textInputType: TextInputType.emailAddress,
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgCheckmark,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(maxHeight: 56.v),
                    contentPadding: EdgeInsets.only(
                      top: 18.v,
                      right: 12.h,
                      bottom: 18.v,
                    ),
                  ),
                  SizedBox(height: 16.v),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: AppLocalizations.of(context)!.enter_your_password,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgLock,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ),
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
                    obscureText: !showPassword,
                  ),
                  SizedBox(height: 10.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.resetPasswordTabContainerScreen,
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forgot_password,
                        style: CustomTextStyles.titleSmallPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.v),
                  CustomElevatedButton(
                    isLoading: this.isloading,
                    text: AppLocalizations.of(context)!.lbl_login,
                    onPressed: () async {
                      setState(() {
                        this.isloading = true;
                      });
                      String status = await sl.get<AuthMethods>().signinUser(
                          email: emailController.text,
                          password: passwordController.text);

                      if (status == "failed") {
                        setState(() {
                          this.isloading = false;
                        });
                        Fluttertoast.showToast(
                            msg: "Please create an account first",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                      } else if (status == "success") {
                        setState(() {
                          this.isloading = false;
                        });
                        Fluttertoast.showToast(
                            msg: "Welcome " +
                                sl.get<AuthMethods>().currentUserData!.username,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor:
                                ColorSchemes.primaryColorScheme.primary,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.homeContainerScreen,
                        );
                      } else {
                        setState(() {
                          this.isloading = false;
                        });
                        Fluttertoast.showToast(
                            msg: "Please enter correct email and password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                      }
                    },
                  ),
                  SizedBox(height: 25.v),
                  Padding(
                    padding: EdgeInsets.only(left: 48.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.v),
                          child: Text(
                            AppLocalizations.of(context)!.don_t_have_an_account,
                            style: CustomTextStyles.bodyMediumGray600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.signUpScreen,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(
                              AppLocalizations.of(context)!.lbl_sign_up,
                              style: CustomTextStyles.titleSmallPrimary_1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 34.v),
                  _buildDivider(context),
                  SizedBox(height: 29.v),
                  _buildSocial(context),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      // leading: AppbarLeadingImage(
      //   imagePath: ImageConstant.imgArrowLeft,
      //   margin: EdgeInsets.only(left: 24.h),
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      // ),
      centerTitle: true,
      title: AppbarSubtitleTwo(text: AppLocalizations.of(context)!.login_text),
    );
  }

  /// Section Widget
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
        CustomOutlinedButton(
          onPressed: () async {
            String status = await sl.get<AuthMethods>().signInWithGoogle();
            if (status == "success") {
              Fluttertoast.showToast(
                  msg: "Welcome " +
                      sl.get<AuthMethods>().currentUser!.user!.displayName!,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: ColorSchemes.primaryColorScheme.primary,
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.pushNamed(
                context,
                AppRoutes.homeContainerScreen,
              );
            } else {
              Fluttertoast.showToast(
                  msg: "Please create an account first",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 16.0);
            }
          },
          text: AppLocalizations.of(context)!.sign_in_with_google,
          leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgGoogle,
              height: 20.v,
              width: 19.h,
            ),
          ),
        ),
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
