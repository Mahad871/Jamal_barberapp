import 'package:mahad_s_application3/presentation/my_shops/widgets/my_shop_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';

class MyShopsScreen extends StatelessWidget {
  const MyShopsScreen({Key? key}) : super(key: key);

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
                  return MyShopDetailsItem(navigateToShopDetails: () {
                    Navigator.pushNamed(context, AppRoutes.doctorDetailScreen);
                  });
                })),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.addShopScreen);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
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
        title:
            AppbarSubtitleTwo(text: AppLocalizations.of(context)!.lbl_my_shpos),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.symmetric(horizontal: 16.h))
        ]);
  }
}
