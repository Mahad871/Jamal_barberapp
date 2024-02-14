import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class TimePillContainer extends StatefulWidget {
  TimePillContainer({Key? key, required this.time})
      : super(
          key: key,
        );
  String time = "09:00 AM";

  @override
  State<TimePillContainer> createState() => _TimePillContainerState();
}

class _TimePillContainerState extends State<TimePillContainer> {
  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 11.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        widget.time,
        style: TextStyle(
          color: appTheme.gray500,
          fontSize: 15.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.whiteA700,
      selectedColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.gray300,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(
          15.h,
        ),
      ),
    );
  }
}
