import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class DoctorsItemWidget extends StatelessWidget {
  const DoctorsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.h,
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse8864x64,
            height: 64.adaptSize,
            width: 64.adaptSize,
            radius: BorderRadius.circular(
              32.h,
            ),
          ),
          SizedBox(height: 9.v),
          Text(
            AppLocalizations.of(context)!.lbl_dr_marcus,
            style: CustomTextStyles.labelLargeErrorContainer,
          ),
        ],
      ),
    );
  }
}
