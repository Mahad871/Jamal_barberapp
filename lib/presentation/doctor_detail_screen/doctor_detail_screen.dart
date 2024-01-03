import '../doctor_detail_screen/widgets/am_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:mahad_s_application3/widgets/custom_icon_button.dart';
import 'package:readmore/readmore.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.v),
                child: Column(children: [
                  _buildDoctorInformation(context),
                  SizedBox(height: 31.v),
                  _buildDateTime(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildNinetyFour(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h),
            onTap: () {
              // onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: AppLocalizations.of(context)!.lbl_details),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.symmetric(horizontal: 16.h),
              onTap: () {
                // onTapOverflowMenu(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildDoctorInformation(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 41.h),
          child: Row(children: [
            CustomImageView(
                imagePath: ImageConstant.imgRectangle959,
                height: 111.adaptSize,
                width: 111.adaptSize,
                radius: BorderRadius.circular(8.h)),
            Padding(
                padding: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 5.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.dr_marcus_horizon,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 8.v),
                      Text(AppLocalizations.of(context)!.lbl_chardiologist,
                          style: theme.textTheme.labelLarge),
                      SizedBox(height: 8.v),
                      Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgStar,
                            height: 16.adaptSize,
                            width: 16.adaptSize),
                        Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(AppLocalizations.of(context)!.lbl_4_7,
                                style: CustomTextStyles.labelLargeAmber500))
                      ]),
                      SizedBox(height: 11.v),
                      Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgLocation,
                            height: 13.adaptSize,
                            width: 13.adaptSize,
                            margin: EdgeInsets.only(bottom: 2.v)),
                        Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: Text(AppLocalizations.of(context)!.lbl_800m_away,
                                style: theme.textTheme.labelLarge))
                      ])
                    ]))
          ])),
      SizedBox(height: 17.v),
      Text(AppLocalizations.of(context)!.lbl_about, style: CustomTextStyles.titleMedium16),
      SizedBox(height: 8.v),
      SizedBox(
          width: 305.h,
          child: ReadMoreText(AppLocalizations.of(context)!.lorem_ipsum_dolor,
              trimLines: 3,
              colorClickableText: theme.colorScheme.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: AppLocalizations.of(context)!.lbl_read_more,
              moreStyle:
                  CustomTextStyles.bodySmallGray600.copyWith(height: 1.50),
              lessStyle:
                  CustomTextStyles.bodySmallGray600.copyWith(height: 1.50)))
    ]);
  }

  /// Section Widget
  Widget _buildDateTime(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildThirtyOne(context,
            dynamicText1: AppLocalizations.of(context)!.lbl_mon, dynamicText2: AppLocalizations.of(context)!.lbl_21),
        Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: _buildThirtyOne(context,
                dynamicText1: AppLocalizations.of(context)!.lbl_tue, dynamicText2: AppLocalizations.of(context)!.lbl_22)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: _buildThirtyOne(context,
                dynamicText1: AppLocalizations.of(context)!.lbl_wed, dynamicText2: AppLocalizations.of(context)!.lbl_23)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: _buildThirtyOne(context,
                dynamicText1: AppLocalizations.of(context)!.lbl_thu, dynamicText2: AppLocalizations.of(context)!.lbl_24)),
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: _buildThirtyOne(context,
                dynamicText1: AppLocalizations.of(context)!.lbl_fri, dynamicText2: AppLocalizations.of(context)!.lbl_25)),
        Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: _buildThirtyOne(context,
                dynamicText1: AppLocalizations.of(context)!.lbl_sat, dynamicText2: AppLocalizations.of(context)!.lbl_26))
      ]),
      SizedBox(height: 32.v),
      Divider(),
      SizedBox(height: 32.v),
      Wrap(
          runSpacing: 9.v,
          spacing: 9.h,
          children: List<Widget>.generate(9, (index) => AmItemWidget()))
    ]);
  }

  /// Section Widget
  Widget _buildNinetyFour(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 28.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 50.adaptSize,
              width: 50.adaptSize,
              padding: EdgeInsets.all(13.h),
              decoration: IconButtonStyleHelper.fillOnErrorContainer,
              child: CustomImageView(imagePath: ImageConstant.imgMusicPrimary)),
          Expanded(
              child: CustomElevatedButton(
                  height: 50.v,
                  text: AppLocalizations.of(context)!.lbl_book_apointment,
                  margin: EdgeInsets.only(left: 16.h),
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700_1,
                  onPressed: () {
                    // onTapBookApointment(context);
                  }))
        ]));
  }

  /// Common widget
  Widget _buildThirtyOne(
    BuildContext context, {
    required String dynamicText1,
    required String dynamicText2,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 9.v),
        decoration: AppDecoration.outlineGray300
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 5.v),
              Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(dynamicText1,
                      style: theme.textTheme.labelMedium!
                          .copyWith(color: appTheme.gray500))),
              SizedBox(height: 4.v),
              Text(dynamicText2,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: theme.colorScheme.onPrimary))
            ]));
  }
}
