import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/widgets/custom_elevated_button.dart';

class SignUpSuccessDialog extends StatelessWidget {
  const SignUpSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
          width: mediaQueryData.size.width,
          padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 36.v),
          decoration: AppDecoration.white
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 26.v),
                Container(
                    height: 102.adaptSize,
                    width: 102.adaptSize,
                    padding:
                        EdgeInsets.symmetric(horizontal: 29.h, vertical: 34.v),
                    decoration: AppDecoration.fillgreen.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder51),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgCheckmarkGreen600,
                        height: 41.v,
                        width: 41.h,
                        radius: BorderRadius.circular(3.h),
                        alignment: Alignment.center)),
                SizedBox(height: 43.v),
                Text(AppLocalizations.of(context)!.lbl_success, style: theme.textTheme.titleLarge),
                SizedBox(height: 6.v),
                SizedBox(
                    width: 172.h,
                    child: Text(AppLocalizations.of(context)!.your_account_has,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyLargeBluegray400
                            .copyWith(height: 1.50))),
                SizedBox(height: 22.v),
                CustomElevatedButton(
                    text: AppLocalizations.of(context)!.lbl_go_to_home,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.homeContainerScreen);
                    })
              ])),
    );
  }
}
