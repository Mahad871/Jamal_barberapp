import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class TopdoctorItemWidget extends StatelessWidget {
  TopdoctorItemWidget({
    Key? key,
    this.navigateToDoctorDetails,
  }) : super(
          key: key,
        );

  VoidCallback? navigateToDoctorDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToDoctorDetails!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.v),
        decoration: AppDecoration.outlineGray300.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder11,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle959,
              height: 111.adaptSize,
              width: 111.adaptSize,
              radius: BorderRadius.circular(
                8.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 7.v,
                bottom: 5.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.dr_marcus_horizon2,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    AppLocalizations.of(context)!.lbl_chardiologist,
                    style: theme.textTheme.labelLarge,
                  ),
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
                          AppLocalizations.of(context)!.lbl_4_7,
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
                          AppLocalizations.of(context)!.lbl_800m_away,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
