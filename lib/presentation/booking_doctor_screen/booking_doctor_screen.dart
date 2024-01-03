import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';
import 'package:mahad_s_application3/widgets/custom_icon_button.dart';
import 'package:mahad_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class BookingDoctorScreen extends StatelessWidget {
  BookingDoctorScreen({Key? key}) : super(key: key);

  TextEditingController shareController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 28.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.v),
                      _buildDoctorInformation(context),
                      SizedBox(height: 38.v),
                      _buildDate1(context),
                      SizedBox(height: 15.v),
                      Divider(),
                      SizedBox(height: 17.v),
                      _buildReason1(context),
                      SizedBox(height: 15.v),
                      Divider(),
                      SizedBox(height: 19.v),
                      _buildPaymentDetail(context),
                      SizedBox(height: 13.v),
                      Divider(endIndent: 8.h),
                      SizedBox(height: 20.v),
                      _buildPaymentMethod(context)
                    ])),
            bottomNavigationBar: _buildCheckout(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h),
            onTap: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(
            text: AppLocalizations.of(context)!.lbl_appointment));
  }

  /// Section Widget
  Widget _buildDoctorInformation(BuildContext context) {
    return Padding(
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
                          child: Text(
                              AppLocalizations.of(context)!.lbl_800m_away,
                              style: theme.textTheme.labelLarge))
                    ])
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildDate1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 1.h),
          child: _buildAdminFee(context,
              adminFee: AppLocalizations.of(context)!.lbl_admin_fee,
              price: AppLocalizations.of(context)!.lbl_change)),
      SizedBox(height: 7.v),
      Padding(
          padding: EdgeInsets.only(right: 42.h),
          child: Row(children: [
            CustomIconButton(
                height: 36.adaptSize,
                width: 36.adaptSize,
                padding: EdgeInsets.all(8.h),
                decoration: IconButtonStyleHelper.fillOnErrorContainerTL18,
                child: CustomImageView(imagePath: ImageConstant.imgCalendar)),
            Padding(
                padding: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 6.v),
                child: Text(AppLocalizations.of(context)!.wednesday_jun_23,
                    style: CustomTextStyles.titleSmallBluegray700))
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildReason1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildCard(context,
          visaText: AppLocalizations.of(context)!.lbl_reason,
          changeText: AppLocalizations.of(context)!.lbl_change),
      SizedBox(height: 7.v),
      CustomTextFormField(
          width: 122.h,
          controller: shareController,
          hintText: AppLocalizations.of(context)!.lbl_chest_pain,
          hintStyle: theme.textTheme.titleSmall!,
          textInputAction: TextInputAction.done,
          prefix: Container(
              padding: EdgeInsets.all(8.h),
              margin: EdgeInsets.only(right: 15.h),
              decoration: BoxDecoration(
                  color: theme.colorScheme.onErrorContainer,
                  borderRadius: BorderRadius.circular(18.h)),
              child: CustomImageView(
                  imagePath: ImageConstant.imgShare,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 36.v),
          contentPadding: EdgeInsets.symmetric(vertical: 6.v))
    ]);
  }

  /// Section Widget
  Widget _buildPaymentDetail(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(AppLocalizations.of(context)!.lbl_payment_detail,
          style: CustomTextStyles.titleMedium16),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child: _buildTotal(context,
              totalLabel: AppLocalizations.of(context)!.lbl_consultation,
              priceLabel: AppLocalizations.of(context)!.lbl_60_00)),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child: _buildAdminFee(context,
              adminFee: AppLocalizations.of(context)!.lbl_admin_fee,
              price: AppLocalizations.of(context)!.lbl_01_00)),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child: _buildAdminFee(context,
              adminFee: AppLocalizations.of(context)!.aditional_discount,
              price: AppLocalizations.of(context)!.lbl)),
      SizedBox(height: 12.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child: _buildTotal(context,
              totalLabel: AppLocalizations.of(context)!.lbl_total,
              priceLabel: AppLocalizations.of(context)!.lbl_61_00))
    ]);
  }

  /// Section Widget
  Widget _buildPaymentMethod(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text(AppLocalizations.of(context)!.lbl_payment_method,
              style: CustomTextStyles.titleMedium16)),
      SizedBox(height: 10.v),
      _buildCard(context,
          visaText: AppLocalizations.of(context)!.lbl_visa,
          changeText: AppLocalizations.of(context)!.lbl_change)
    ]);
  }

  /// Section Widget
  Widget _buildCheckout(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 24.h, bottom: 26.v),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 5.v, bottom: 2.v),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.lbl_total,
                        style: CustomTextStyles.titleSmallGray500),
                    Padding(
                        padding: EdgeInsets.only(top: 3.v),
                        child: Text(AppLocalizations.of(context)!.lbl_61_002,
                            style: theme.textTheme.titleMedium))
                  ])),
          CustomElevatedButton(
              height: 50.v,
              width: 192.h,
              text: AppLocalizations.of(context)!.lbl_checkout,
              buttonTextStyle: CustomTextStyles.titleSmallWhiteA700_1,
              onPressed: () {
                // onTapCheckout(context);
              })
        ]));
  }

  /// Common widget
  Widget _buildAdminFee(
    BuildContext context, {
    required String adminFee,
    required String price,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(adminFee,
          style: CustomTextStyles.bodyMediumGray500
              .copyWith(color: appTheme.gray500)),
      Text(price,
          style: CustomTextStyles.bodyMediumOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary))
    ]);
  }

  /// Common widget
  Widget _buildTotal(
    BuildContext context, {
    required String totalLabel,
    required String priceLabel,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(totalLabel,
          style: theme.textTheme.titleSmall!
              .copyWith(color: theme.colorScheme.onPrimary)),
      Text(priceLabel,
          style: CustomTextStyles.titleSmallPrimary_1
              .copyWith(color: theme.colorScheme.primary))
    ]);
  }

  /// Common widget
  Widget _buildCard(
    BuildContext context, {
    required String visaText,
    required String changeText,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v),
        decoration: AppDecoration.outlineGray300
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(visaText,
                      style: CustomTextStyles.titleMediumInterPrimaryContainer
                          .copyWith(
                              color: theme.colorScheme.primaryContainer))),
              Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Text(changeText,
                      style: CustomTextStyles.labelLargePrimary_1
                          .copyWith(color: theme.colorScheme.primary)))
            ]));
  }
}
