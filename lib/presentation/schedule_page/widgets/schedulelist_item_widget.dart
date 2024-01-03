import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class SchedulelistItemWidget extends StatelessWidget {
  const SchedulelistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dr_marcus_horizon,
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 4.v),
                      Text(
                        AppLocalizations.of(context)!.lbl_chardiologist,
                        style: CustomTextStyles.labelLargeBluegray400,
                      ),
                    ],
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  height: 46.adaptSize,
                  width: 46.adaptSize,
                ),
              ],
            ),
          ),
          SizedBox(height: 25.v),
          Padding(
            padding: EdgeInsets.only(right: 47.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCalendarBlueGray700,
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    AppLocalizations.of(context)!.lbl_26_06_2022,
                    style: CustomTextStyles.labelLargeBluegray700,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgSearchBlueGray700,
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  margin: EdgeInsets.only(left: 12.h),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    AppLocalizations.of(context)!.lbl_10_30_am,
                    style: CustomTextStyles.labelLargeBluegray700,
                  ),
                ),
                Container(
                  height: 6.adaptSize,
                  width: 6.adaptSize,
                  margin: EdgeInsets.only(
                    left: 17.h,
                    top: 5.v,
                    bottom: 5.v,
                  ),
                  decoration: BoxDecoration(
                    color: appTheme.green600,
                    borderRadius: BorderRadius.circular(
                      3.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    AppLocalizations.of(context)!.lbl_confirmed,
                    style: CustomTextStyles.labelLargeBluegray700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 13.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomElevatedButton(
                  height: 46.v,
                  text: AppLocalizations.of(context)!.lbl_cancel,
                  margin: EdgeInsets.only(right: 7.h),
                  buttonStyle: CustomButtonStyles.fillGray,
                  buttonTextStyle: CustomTextStyles.titleSmallBluegray700,
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  height: 46.v,
                  text: AppLocalizations.of(context)!.lbl_reschedule,
                  margin: EdgeInsets.only(left: 7.h),
                  buttonStyle: CustomButtonStyles.fillBlue,
                  buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
