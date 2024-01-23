import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class PopularproductItemWidget extends StatelessWidget {
  const PopularproductItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 6.h,
            vertical: 9.v,
          ),
          decoration: AppDecoration.outlineGray300.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder11,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 11.v),
              CustomImageView(
                imagePath: ImageConstant.imgEf58faa9a71e47e,
                height: 58.v,
                width: 56.h,
                radius: BorderRadius.circular(
                  29.h,
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 16.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  AppLocalizations.of(context)!.lbl_panadol,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  AppLocalizations.of(context)!.lbl_20pcs,
                  style: theme.textTheme.labelLarge,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.lbl_15_99,
                      style: CustomTextStyles.titleSmallBlack900,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgPlus,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(left: 42.h),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
