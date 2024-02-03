import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/models/shops_models.dart';

// ignore: must_be_immutable
class MyShopDetailsItem extends StatefulWidget {
  MyShopDetailsItem(
      {Key? key, this.navigateToShopDetails, required this.shopModel})
      : super(
          key: key,
        );

  VoidCallback? navigateToShopDetails;
  ShopModel shopModel;

  @override
  State<MyShopDetailsItem> createState() => _MyShopDetailsItemState();
}

class _MyShopDetailsItemState extends State<MyShopDetailsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.v),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder11,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomImageView(
            imagePath: ImageConstant.appLogo,
            height: 111.adaptSize,
            width: 111.adaptSize,
            radius: BorderRadius.circular(
              8.h,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 7.v,
                bottom: 5.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.shopModel.shopName.toString(),
                    style: theme.textTheme.titleMedium,
                  ),
                  // SizedBox(height: 8.v),
                  // Text(
                  //   AppLocalizations.of(context)!.lbl_chardiologist,
                  //   style: theme.textTheme.labelLarge,
                  // ),
                  SizedBox(height: 8.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgStar,
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text(
                          widget.shopModel.rating.toString() == ''
                              ? '0'
                              : widget.shopModel.rating.toString(),
                          style: CustomTextStyles.labelLargeAmber500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 11.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgLocation,
                        height: 13.adaptSize,
                        width: 13.adaptSize,
                        margin: EdgeInsets.only(bottom: 2.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          widget.shopModel.shopAddress.toString(),
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
