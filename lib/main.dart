import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:mahad_s_application3/controllers/language_controller.dart';
import 'package:mahad_s_application3/controllers/services_methods.dart';
import 'package:mahad_s_application3/controllers/shop_methods.dart';
import 'package:mahad_s_application3/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  final prefs = await SharedPreferences.getInstance();
  final String languageCode = prefs.getString('language_code') ?? '';
  // Cache all images in ImageConstant
  // await precacheImages();
  runApp(MyApp(
    locale: languageCode,
  ));
}

// Future<void> precacheImages(BuildContext context) async {
//   for (var imagePath in ImageConstant.appLogo) {
//     await precacheImage(AssetImage(imagePath),context);
//   }
// }

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({Key? key, required this.locale}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // precacheImage(AssetImage(ImageConstant.appLogo), context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => sl.get<LanguageController>()),
          ChangeNotifierProvider(create: (_) => sl.get<ShopMethods>()),
          // ChangeNotifierProvider(create: (_) => sl.get<ServicesMethods>()),
          // ChangeNotifierProvider(create: (_) => sl.get<UserProvider>()),
        ],
        child: Consumer<LanguageController>(
          builder: (context, provider, child) {
            if (provider.appLocal == null) {
              if (locale.isEmpty) {
                provider.changeLanguage(Locale('en'));
              } else {
                provider.changeLanguage(Locale(locale));
              }
            }
            return MaterialApp(
              theme: theme,
              title: 'Jamal',
              debugShowCheckedModeBanner: false,
              locale: Provider.of<LanguageController>(context).appLocal,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'), // English
                Locale('ar'), // Spanish
              ],
              routes: AppRoutes.routes,
              initialRoute: AppRoutes.loginScreen,
            );
          },
        ));
  }
}
