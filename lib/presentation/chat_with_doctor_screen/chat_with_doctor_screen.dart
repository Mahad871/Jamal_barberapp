import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:mahad_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ChatWithDoctorScreen extends StatelessWidget {
  ChatWithDoctorScreen({Key? key}) : super(key: key);

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 42.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 7.v),
                      _buildConsultationStart(context),
                      SizedBox(height: 20.v),
                      _buildCloseRow(context,
                          doctorName: AppLocalizations.of(context)!.dr_marcus_horizon,
                          timeAgo: AppLocalizations.of(context)!.lbl_10_min_ago),
                      SizedBox(height: 10.v),
                      Container(
                          margin: EdgeInsets.only(right: 122.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.h, vertical: 7.v),
                          decoration: AppDecoration.fillGray.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderBL8),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 4.v),
                                Text(AppLocalizations.of(context)!.hello_how_can_i,
                                    style: theme.textTheme.bodyMedium)
                              ])),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 90.h),
                          child: _buildChatTileRow(context,
                              dynamicText: AppLocalizations.of(context)!.i_have_suffering)),
                      SizedBox(height: 15.v),
                      _buildCloseRow(context,
                          doctorName: AppLocalizations.of(context)!.dr_marcus_horizon,
                          timeAgo: AppLocalizations.of(context)!.lbl_5_min_ago),
                      SizedBox(height: 10.v),
                      Container(
                          width: 221.h,
                          margin: EdgeInsets.only(right: 106.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.h, vertical: 9.v),
                          decoration: AppDecoration.fillGray.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderBL8),
                          child: Container(
                              width: 186.h,
                              margin: EdgeInsets.only(right: 9.h),
                              child: Text(AppLocalizations.of(context)!.ok_do_you_have,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(height: 1.50)))),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 90.h),
                          child: _buildChatTileRow(context,
                              dynamicText: AppLocalizations.of(context)!.i_don_t_have_any)),
                      SizedBox(height: 15.v),
                      _buildCloseRow(context,
                          doctorName: AppLocalizations.of(context)!.dr_marcus_horizon,
                          timeAgo: AppLocalizations.of(context)!.lbl_online),
                      SizedBox(height: 10.v),
                      Container(
                          height: 22.v,
                          width: 58.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.h, vertical: 8.v),
                          decoration: AppDecoration.fillGray.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderBL5),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgGroup141,
                              height: 5.v,
                              width: 32.h,
                              alignment: Alignment.bottomCenter))
                    ])),
            bottomNavigationBar: _buildNinetyNineRow(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 14.h),
            onTap: () {
              // onTapArrowLeft(context);
            }),
        title: AppbarSubtitleThree(
            text: AppLocalizations.of(context)!.dr_marcus_horizon,
            margin: EdgeInsets.only(left: 9.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgUVideo,
              margin: EdgeInsets.only(left: 20.h, top: 8.v, right: 8.h),
              onTap: () {
                // onTapUVideo(context);
              }),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgUPhoneAlt,
              margin: EdgeInsets.only(left: 10.h, top: 8.v, right: 8.h),
              onTap: () {
                // onTapUPhoneAlt(context);
              }),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent1,
              margin: EdgeInsets.fromLTRB(16.h, 10.v, 28.h, 6.v))
        ]);
  }

  /// Section Widget
  Widget _buildConsultationStart(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 39.h, vertical: 14.v),
        decoration: AppDecoration.outlineGray3001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.consultion_start,
                  style: CustomTextStyles.titleMediumPrimary),
              SizedBox(height: 8.v),
              Text(AppLocalizations.of(context)!.you_can_consult, style: theme.textTheme.labelLarge)
            ]));
  }

  /// Section Widget
  Widget _buildNinetyNineRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 26.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomTextFormField(
              width: 207.h,
              controller: messageController,
              hintText: AppLocalizations.of(context)!.type_message,
              hintStyle: CustomTextStyles.bodyMediumGray500,
              textInputAction: TextInputAction.done,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 15.v, 17.h, 15.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgMenu,
                      height: 20.adaptSize,
                      width: 20.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 50.v),
              contentPadding:
                  EdgeInsets.only(left: 19.h, top: 16.v, bottom: 16.v),
              borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
              filled: true,
              fillColor: appTheme.whiteA700),
          CustomElevatedButton(
              height: 50.v,
              width: 111.h,
              text: AppLocalizations.of(context)!.lbl_send,
              margin: EdgeInsets.only(left: 9.h),
              buttonTextStyle: CustomTextStyles.titleSmallWhiteA700_1)
        ]));
  }

  /// Common widget
  Widget _buildCloseRow(
    BuildContext context, {
    required String doctorName,
    required String timeAgo,
  }) {
    return Row(children: [
      CustomImageView(
          imagePath: ImageConstant.imgClose,
          height: 40.adaptSize,
          width: 40.adaptSize),
      Padding(
          padding: EdgeInsets.only(left: 13.h, top: 3.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(doctorName,
                style: theme.textTheme.titleSmall!
                    .copyWith(color: theme.colorScheme.onPrimary)),
            SizedBox(height: 7.v),
            Text(timeAgo,
                style: theme.textTheme.labelMedium!
                    .copyWith(color: appTheme.gray500))
          ]))
    ]);
  }

  /// Common widget
  Widget _buildChatTileRow(
    BuildContext context, {
    required String dynamicText,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 6.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Container(
                      width: 165.h,
                      margin: EdgeInsets.only(left: 9.h, top: 4.v, bottom: 1.v),
                      child: Text(dynamicText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumWhiteA700.copyWith(
                              color: appTheme.whiteA700, height: 1.43)))),
              CustomImageView(
                  imagePath: ImageConstant.imgCheckmarkWhiteA700,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.only(left: 36.h, top: 30.v))
            ]));
  }
}
