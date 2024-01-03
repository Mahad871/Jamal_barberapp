import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_export.dart';
import 'package:mahad_s_application3/theme/theme_helper.dart';
import 'package:mahad_s_application3/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:mahad_s_application3/dependencyInjection/injection_container.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  setupInjectionContainer();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ThemeHelper().changeTheme('primary');

  // Cache all images in ImageConstant
  // await precacheImages();
  runApp(MyApp());
}

// Future<void> precacheImages(BuildContext context) async {
//   for (var imagePath in ImageConstant.appLogo) {
//     await precacheImage(AssetImage(imagePath),context);
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // precacheImage(AssetImage(ImageConstant.appLogo), context);
    return MaterialApp(
      locale: Locale('en'),
      theme: theme,
      title: 'Jamal',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigatorService.navigatorKey,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale(
          'en',
          '',
        ),
        Locale(
          'ar',
          '',
        ),
      ],
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}