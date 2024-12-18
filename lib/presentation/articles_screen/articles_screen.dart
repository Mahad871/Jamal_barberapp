import '../articles_screen/widgets/eightynine_item_widget.dart';
import '../articles_screen/widgets/frametwentyfour_item_widget.dart';
import '../articles_screen/widgets/sixtyfour_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:mahad_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mahad_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:mahad_s_application3/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class ArticlesScreen extends StatelessWidget {
  ArticlesScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 24.v),
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 4.h, right: 24.h),
                                  child: CustomSearchView(
                                      controller: searchController,
                                      hintText: "msg_search_articles")),
                              SizedBox(height: 28.v),
                              _buildPopularArticles(context),
                              SizedBox(height: 27.v),
                              _buildTrendingArticles(context),
                              SizedBox(height: 26.v),
                              _buildArticles(context)
                            ]))))));
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
        title: AppbarSubtitleOne(text: "lbl_articles"),
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
  Widget _buildPopularArticles(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_popular_articles", style: CustomTextStyles.titleMedium16),
          SizedBox(height: 10.v),
          Wrap(
              runSpacing: 5.v,
              spacing: 5.h,
              children: List<Widget>.generate(
                  3, (index) => FrametwentyfourItemWidget()))
        ]));
  }

  /// Section Widget
  Widget _buildTrendingArticles(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 4.h, right: 24.h),
          child: _buildRelatedArticles(context,
              relatedArticlesText: "msg_trending_articles",
              seeAllText: "lbl_see_all")),
      SizedBox(height: 10.v),
      Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
              height: 219.v,
              child: ListView.separated(
                  padding: EdgeInsets.only(left: 4.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 15.h);
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return EightynineItemWidget();
                  })))
    ]);
  }

  /// Section Widget
  Widget _buildArticles(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 4.h, right: 24.h),
          child: _buildRelatedArticles(context,
              relatedArticlesText: "msg_related_articles",
              seeAllText: "lbl_see_all")),
      SizedBox(height: 12.v),
      Padding(
          padding: EdgeInsets.only(right: 20.h),
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 10.v);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return SixtyfourItemWidget();
              }))
    ]);
  }

  /// Common widget
  Widget _buildRelatedArticles(
    BuildContext context, {
    required String relatedArticlesText,
    required String seeAllText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(relatedArticlesText,
          style: CustomTextStyles.titleMediumBlack900
              .copyWith(color: appTheme.black900)),
      Padding(
          padding: EdgeInsets.only(bottom: 3.v),
          child: Text(seeAllText,
              style: CustomTextStyles.labelLargePrimary_1
                  .copyWith(color: theme.colorScheme.primary)))
    ]);
  }
}
