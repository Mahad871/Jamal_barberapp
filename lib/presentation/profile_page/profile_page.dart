import '../profile_page/widgets/profilelistsection_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/custom_icon_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.white,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [theme.colorScheme.primary, Colors.white])),
                child: Container(
                    width: double.maxFinite,
                    decoration: AppDecoration.linear,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 44.v),
                          Expanded(child: _buildProfileSection(context)),
                          SizedBox(height: 27.v),
                          // _buildProfileListSection(context),
                          // SizedBox(height: 38.v),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.h, vertical: 29.v),
                                decoration: AppDecoration.white.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.customBorderTL30),
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5.v),
                                      _buildMySaveSection(context),
                                      SizedBox(height: 14.v),
                                      Divider(),
                                      SizedBox(height: 14.v),
                                      _buildAppointmentSection(context),
                                      SizedBox(height: 14.v),
                                      Divider(),
                                      SizedBox(height: 14.v),
                                      _buildPaymentSection(context),
                                      SizedBox(height: 14.v),
                                      Divider(),
                                      SizedBox(height: 14.v),
                                      _buildFaqsSection(context),
                                      SizedBox(height: 14.v),
                                      Divider(),
                                      SizedBox(height: 14.v),
                                      _buildLogoutSection(context)
                                    ])),
                          )
                        ])))));
  }

  /// Section Widget
  Widget _buildProfileSection(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 122.v,
          width: 121.h,
          child: Stack(alignment: Alignment.bottomRight, children: [
            CustomImageView(
                imagePath: ImageConstant.imgEllipse27,
                height: 100.adaptSize,
                width: 100.adaptSize,
                radius: BorderRadius.circular(40.h),
                alignment: Alignment.center),
            CustomIconButton(
                height: 34.adaptSize,
                width: 34.adaptSize,
                padding: EdgeInsets.all(4.h),
                decoration: IconButtonStyleHelper.fillWhiteA,
                alignment: Alignment.bottomRight,
                child: CustomImageView(imagePath: ImageConstant.imgCamera))
          ])),
      SizedBox(height: 19.v),
      Text("lbl_amelia_renata".tr,
          style: CustomTextStyles.titleMediumWhiteA700_1)
    ]);
  }

  /// Section Widget
  Widget _buildProfileListSection(BuildContext context) {
    return SizedBox(
        height: 75.v,
        child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 44.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 31.5.h),
                  child: SizedBox(
                      height: 44.v,
                      child: VerticalDivider(
                          width: 1.h,
                          thickness: 1.v,
                          color: appTheme.blue300)));
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return ProfilelistsectionItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildMySaveSection(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.imgLocationPrimary,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 17.v, bottom: 11.v),
          child:
              Text("lbl_my_saved".tr, style: CustomTextStyles.titleMedium16)),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 26.v,
          width: 24.h,
          margin: EdgeInsets.only(top: 11.v, bottom: 10.v))
    ]);
  }

  /// Section Widget
  Widget _buildAppointmentSection(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.imgMenuPrimary,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 17.v, bottom: 11.v),
          child: Text("lbl_appointmnet".tr,
              style: CustomTextStyles.titleMedium16)),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 26.v,
          width: 24.h,
          margin: EdgeInsets.only(top: 11.v, bottom: 10.v))
    ]);
  }

  /// Section Widget
  Widget _buildPaymentSection(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.imgFile,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 17.v, bottom: 11.v),
          child: Text("lbl_payment_method".tr,
              style: CustomTextStyles.titleMedium16)),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 26.v,
          width: 24.h,
          margin: EdgeInsets.only(top: 10.v, bottom: 11.v))
    ]);
  }

  /// Section Widget
  Widget _buildFaqsSection(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.imgCar,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 16.v, bottom: 12.v),
          child: Text("lbl_faqs".tr, style: CustomTextStyles.titleMedium16)),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 26.v,
          width: 24.h,
          margin: EdgeInsets.only(top: 11.v, bottom: 10.v))
    ]);
  }

  /// Section Widget
  Widget _buildLogoutSection(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
            AppRoutes.onboardingFourScreen, (route) => false);
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
            height: 48.v,
            width: 43.h,
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: 48.v,
                      width: 43.h,
                      decoration: BoxDecoration(
                          color: appTheme.red50,
                          borderRadius: BorderRadius.circular(24.h)))),
              CustomImageView(
                  imagePath: ImageConstant.imgIcRoundLogout,
                  height: 26.v,
                  width: 24.h,
                  alignment: Alignment.center)
            ])),
        Padding(
            padding: EdgeInsets.only(left: 18.h, top: 18.v, bottom: 11.v),
            child: Text("lbl_logout".tr,
                style: CustomTextStyles.titleMediumRedA200)),
        Spacer(),
        CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: 26.v,
            width: 24.h,
            margin: EdgeInsets.only(top: 11.v, bottom: 10.v))
      ]),
    );
  }
}
