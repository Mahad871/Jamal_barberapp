import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/models/service_model.dart';

// ignore: must_be_immutable
class ServiceCardWidget extends StatelessWidget {
  ServiceModel serviceModel;
  VoidCallback? onTapTrash;
  ServiceCardWidget({Key? key, required this.serviceModel, this.onTapTrash})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.v),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder11,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 4.v,
              bottom: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 192.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imageNotFound,
                        height: 50.adaptSize,
                        width: 50.adaptSize,
                        radius: BorderRadius.circular(
                          25.h,
                        ),
                        margin: EdgeInsets.only(top: 15.v, right: 15.h),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            serviceModel.name,
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 3.v),
                          Text(
                            serviceModel.id.toString(),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: theme.textTheme
                                .labelSmall, //Origional Value : labelLarge
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(right: 33.h),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       CustomImageView(
                //         imagePath: ImageConstant.imgMenuGray500,
                //         height: 18.adaptSize,
                //         width: 18.adaptSize,
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: 10.h),
                //         child: Text(
                //           AppLocalizations.of(context)!.lbl_1,
                //           style: CustomTextStyles.titleMedium16,
                //         ),
                //       ),
                //       CustomImageView(
                //         imagePath: ImageConstant.imgPlus,
                //         height: 18.adaptSize,
                //         width: 18.adaptSize,
                //         margin: EdgeInsets.only(left: 12.h),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // GestureDetector(
                //   onTap: onTapTrash,
                //   child: CustomImageView(
                //     imagePath: ImageConstant.imgTrashGray500,
                //     height: 18.adaptSize,
                //     width: 18.adaptSize,
                //     alignment: Alignment.centerRight,
                //   ),
                // ),
                SizedBox(height: 47.v),
                Text(
                  '\$' + serviceModel.price.toString(),
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
