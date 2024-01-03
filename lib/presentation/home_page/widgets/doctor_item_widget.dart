import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class DoctorItemWidget extends StatelessWidget {
  DoctorItemWidget({
    Key? key,
    this.onTap,
  }) : super(
          key: key,
        );

  VoidCallback? onTap;

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
            child: Flexible(
              child: Container(
                margin: EdgeInsets.only(right: 1.h),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse88,
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
                              AppLocalizations.of(context)!.lbl_4_7,
                              style:
                                  CustomTextStyles.labelLargeAmber500SemiBold,
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
          ),
          SizedBox(height: 18.v),
          Text(
            AppLocalizations.of(context)!.dr_marcus_horizon,
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
              Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                ),
                child: Text(
                  AppLocalizations.of(context)!.lbl_800m_away,
                  style: CustomTextStyles.titleSmallGray500,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
