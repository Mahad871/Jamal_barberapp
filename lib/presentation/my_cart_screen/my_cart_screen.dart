import '../my_cart_screen/widgets/mycart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v),
                child: Column(children: [
                  _buildMyCart(context),
                  SizedBox(height: 34.v),
                  _buildPaymentDetail(context),
                  SizedBox(height: 19.v),
                  _buildPaymentMethod(context),
                  SizedBox(height: 5.v)
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
              // onTapArrowLeft(context);
            }),
        centerTitle: true,
        title:
            AppbarSubtitleOne(text: AppLocalizations.of(context)!.lbl_my_cart));
  }

  /// Section Widget
  Widget _buildMyCart(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.v);
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return MycartItemWidget();
        });
  }

  /// Section Widget
  Widget _buildPaymentDetail(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(AppLocalizations.of(context)!.lbl_payment_detail,
          style: CustomTextStyles.titleMedium16),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 4.h),
          child: _buildTotal(context,
              totalLabel: AppLocalizations.of(context)!.lbl_subtotal,
              priceLabel: AppLocalizations.of(context)!.lbl_25_98)),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child: _buildCard(context,
              visaLabel: AppLocalizations.of(context)!.lbl_taxes,
              changeLabel: AppLocalizations.of(context)!.lbl_1_00)),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 4.h),
          child: _buildTotal(context,
              totalLabel: AppLocalizations.of(context)!.lbl_total,
              priceLabel: AppLocalizations.of(context)!.lbl_26_98)),
      SizedBox(height: 13.v),
      Divider()
    ]);
  }

  /// Section Widget
  Widget _buildPaymentMethod(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 1.h),
          child: Text(AppLocalizations.of(context)!.lbl_payment_method,
              style: CustomTextStyles.titleMedium16)),
      SizedBox(height: 10.v),
      Padding(
          padding: EdgeInsets.only(left: 1.h),
          child: _buildCard(context,
              visaLabel: AppLocalizations.of(context)!.lbl_visa, changeLabel: AppLocalizations.of(context)!.lbl_change))
    ]);
  }

  /// Section Widget
  Widget _buildCheckout(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 26.v),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 5.v, bottom: 1.v),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.lbl_total,
                        style: CustomTextStyles.titleSmallGray500),
                    Padding(
                        padding: EdgeInsets.only(top: 3.v),
                        child: Text(AppLocalizations.of(context)!.lbl_26_98,
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
          style: theme.textTheme.titleSmall!
              .copyWith(color: theme.colorScheme.onPrimary))
    ]);
  }

  /// Common widget
  Widget _buildCard(
    BuildContext context, {
    required String visaLabel,
    required String changeLabel,
  }) {
    return Container(
        padding: EdgeInsets.all(13.h),
        decoration: AppDecoration.outlineGray300
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(visaLabel,
                      style: CustomTextStyles.titleMediumInterPrimaryContainer
                          .copyWith(
                              color: theme.colorScheme.primaryContainer))),
              Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Text(changeLabel,
                      style: CustomTextStyles.labelLargePrimary_1
                          .copyWith(color: theme.colorScheme.primary)))
            ]));
  }
}
