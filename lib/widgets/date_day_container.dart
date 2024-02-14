import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/theme/app_decoration.dart';

class DateDayContainer extends StatelessWidget {
  final String day;
  final String date;

  const DateDayContainer({
    required this.day,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 9.v),
      decoration: AppDecoration.outlineGray300
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 5.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              day,
              style: theme.textTheme.labelMedium!
                  .copyWith(color: appTheme.gray500),
            ),
          ),
          SizedBox(height: 4.v),
          Text(
            date,
            style: theme.textTheme.titleMedium!
                .copyWith(color: theme.colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
