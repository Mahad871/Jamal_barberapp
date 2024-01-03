import '../top_doctor_screen/widgets/topdoctor_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';

class TopDoctorScreen extends StatelessWidget {
  const TopDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 24.h, top: 24.v, right: 24.h),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16.v);
                    },
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return TopdoctorItemWidget(navigateToDoctorDetails: () {
                        Navigator.pushNamed(
                            context, AppRoutes.doctorDetailScreen);
                      });
                    }))));
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
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleTwo(
            text: AppLocalizations.of(context)!.lbl_top_barbers),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.symmetric(horizontal: 16.h))
        ]);
  }
}
