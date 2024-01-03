import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mahad_s_application3/core/app_export.dart';
import 'package:mahad_s_application3/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _timerStarted = false;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    if (!_timerStarted) {
      _timerStarted = true;
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, AppRoutes.onboardingOneScreen);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    precacheImage(AssetImage(ImageConstant.appLogo), context).then((value) {
      startTimer();
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.appLogo,
                height: 130.v,
                width: 117.h,
              ),
              SizedBox(height: 15.v),
              Text(
                AppLocalizations.of(context)!.lbl_jamal,
                style: theme.textTheme.displayMedium,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
