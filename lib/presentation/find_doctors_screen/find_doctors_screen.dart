import '../find_doctors_screen/widgets/doctors_item_widget.dart';
import '../find_doctors_screen/widgets/finddoctors_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class FindDoctorsScreen extends StatelessWidget {
  FindDoctorsScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 24.v),
                child: Column(children: [
                  CustomSearchView(
                      controller: searchController,
                      hintText:
                          AppLocalizations.of(context)!.lbl_find_a_doctor),
                  SizedBox(height: 28.v),
                  _buildCategories(context),
                  SizedBox(height: 24.v),
                  _buildRecommendedDoctors(context),
                  SizedBox(height: 26.v),
                  _buildYourRecentDoctors(context),
                  SizedBox(height: 5.v)
                ]))));
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
        title: AppbarSubtitleOne(
            text: AppLocalizations.of(context)!.lbl_find_doctors));
  }

  /// Section Widget
  Widget _buildCategories(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(AppLocalizations.of(context)!.lbl_category,
              style: theme.textTheme.titleMedium),
          SizedBox(height: 16.v),
          Padding(
              padding: EdgeInsets.only(right: 5.h),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 83.v,
                      crossAxisCount: 4,
                      mainAxisSpacing: 22.h,
                      crossAxisSpacing: 22.h),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return FinddoctorsItemWidget();
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildRecommendedDoctors(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(AppLocalizations.of(context)!.recommended_doctors,
              style: theme.textTheme.titleMedium),
          SizedBox(height: 11.v),
          Container(
              margin: EdgeInsets.only(right: 2.h),
              padding: EdgeInsets.symmetric(vertical: 15.v),
              decoration: AppDecoration.outlineGray300
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgEllipse8888x88,
                        height: 88.adaptSize,
                        width: 88.adaptSize,
                        radius: BorderRadius.circular(44.h),
                        margin: EdgeInsets.only(bottom: 12.v)),
                    Padding(
                        padding: EdgeInsets.only(top: 2.v, bottom: 7.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  AppLocalizations.of(context)!
                                      .dr_marcus_horizon,
                                  style: CustomTextStyles.titleMedium16),
                              SizedBox(height: 9.v),
                              Text(
                                  AppLocalizations.of(context)!
                                      .lbl_chardiologist,
                                  style: CustomTextStyles.bodyMediumGray500),
                              SizedBox(height: 4.v),
                              SizedBox(width: 167.h, child: Divider()),
                              SizedBox(height: 22.v),
                              Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgStar,
                                    height: 16.adaptSize,
                                    width: 16.adaptSize,
                                    margin: EdgeInsets.only(bottom: 1.v)),
                                Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                        AppLocalizations.of(context)!.lbl_4_7,
                                        style: CustomTextStyles
                                            .labelLargeAmber500)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgLocationErrorcontainer,
                                    height: 16.adaptSize,
                                    width: 16.adaptSize,
                                    margin: EdgeInsets.only(
                                        left: 24.h, bottom: 1.v)),
                                Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                        AppLocalizations.of(context)!
                                            .lbl_800m_away,
                                        style: CustomTextStyles
                                            .titleSmallErrorContainer))
                              ])
                            ]))
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildYourRecentDoctors(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(AppLocalizations.of(context)!.recommended_doctors,
              style: theme.textTheme.titleMedium),
          SizedBox(height: 18.v),
          SizedBox(
              height: 89.v,
              child: ListView.separated(
                  padding: EdgeInsets.only(right: 2.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 24.h);
                  },
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return DoctorsItemWidget();
                  }))
        ]));
  }
}
