import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/presentation/reset_password_email_page/reset_password_email_page.dart';
import 'package:mahad_s_application3/presentation/reset_password_phone_page/reset_password_phone_page.dart';

class ResetPasswordTabContainerScreen extends StatefulWidget {
  const ResetPasswordTabContainerScreen({Key? key}) : super(key: key);

  @override
  ResetPasswordTabContainerScreenState createState() =>
      ResetPasswordTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class ResetPasswordTabContainerScreenState
    extends State<ResetPasswordTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 24.h),
                  onTap: () {
                    onTapImgArrowLeft(context);
                  },
                ),
                SizedBox(height: 45.v),
                _buildTitleSection(context),
                SizedBox(height: 23.v),
                _buildTabview(context),
                SizedBox(
                  height: 525.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      ResetPasswordEmailPage(),
                      ResetPasswordPhonePage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTitleSection(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.lbl_forgot_your_password,
              style: theme.textTheme.headlineSmall,
            ),
            SizedBox(height: 8.v),
            Container(
              width: 319.h,
              margin: EdgeInsets.only(right: 8.h),
              child: Text(
                AppLocalizations.of(context)!
                    .enter_your_email_or_your_phone_number_we_will_send_you_confirmation_code,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    CustomTextStyles.titleMediumGray500.copyWith(height: 1.50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 51.v,
      width: 327.h,
      decoration: BoxDecoration(
        color: appTheme.gray100,
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.primary,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: appTheme.blueGray400,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
        ),
        indicatorPadding: EdgeInsets.all(4.0.h),
        indicator: BoxDecoration(
          color: appTheme.whiteA700,
          borderRadius: BorderRadius.circular(8.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.black900.withOpacity(0.05),
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(0, 0),
            ),
          ],
        ),
        tabs: [
          Tab(child: Text(AppLocalizations.of(context)!.lbl_email)),
          Tab(child: Text(AppLocalizations.of(context)!.lbl_phone)),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
