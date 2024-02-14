import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/models/shops_model.dart';

// ignore: must_be_immutable
class ShopItemWidget extends StatelessWidget {
  ShopItemWidget({
    Key? key,
    // this.onTap,
    required this.shop,
  }) : super(
          key: key,
        );

  // VoidCallback? onTap;
  ShopModel shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 6.h, right: 6.h, top: 8.v),
      height: 108.v,
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 1.h),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CustomImageView(
                    imagePath: shop.shopImage == ''
                        ? ImageConstant.imageNotFound
                        : shop.shopImage,
                    height: 71.adaptSize,
                    width: 71.adaptSize,
                    radius: BorderRadius.circular(
                      35.h,
                    ),
                    alignment: Alignment.bottomCenter,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgStar,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Text(
                            shop.rating.toString() == ''
                                ? '0'
                                : shop.rating.toString(),
                            style: CustomTextStyles.labelLargeAmber500SemiBold,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 18.v),
          Text(
            shop.shopName.toString(),
            style: CustomTextStyles.titleMediumErrorContainer,
            softWrap: true,
          ),
          SizedBox(height: 9.v),
          Text(
            AppLocalizations.of(context)!.lbl_chardiologist,
            style: CustomTextStyles.titleSmallGray500,
            softWrap: true,
          ),
          SizedBox(height: 5.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 16.adaptSize,
                width: 16.adaptSize,
                margin: EdgeInsets.only(bottom: 4.v),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 8.h,
                  ),
                  child: Text(
                    shop.shopAddress.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleSmallGray500,
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
