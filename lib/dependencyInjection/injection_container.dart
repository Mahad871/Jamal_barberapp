import 'package:get_it/get_it.dart';
import 'package:mahad_s_application3/controllers/appointment_methods.dart';
import 'package:mahad_s_application3/controllers/firebase/auth_methods.dart';
import 'package:mahad_s_application3/controllers/language_controller.dart';
import 'package:mahad_s_application3/controllers/services_methods.dart';
import 'package:mahad_s_application3/controllers/shop_methods.dart';
import 'package:mahad_s_application3/providers/user_provider.dart';

final GetIt sl = GetIt.instance;

/// Sets up the dependency injection container.
/// Register your dependencies here.
/// Example:
/// - [AuthMethods]: Singleton instance of the authentication methods.
/// - [UserProvider]: Singleton instance of the user provider.
/// - [LanguageController]: Singleton instance of the language controller.
/// - [ShopMethods]: Singleton instance of the shop methods.
/// - [ServicesMethods]: Singleton instance of the services methods.
void setupInjectionContainer() {
  // Register your dependencies here
  // Example:
  sl.registerLazySingleton(() => AuthMethods());
  sl.registerLazySingleton(() => UserProvider());
  sl.registerLazySingleton(() => LanguageController());
  sl.registerLazySingleton(() => ShopMethods());
  sl.registerLazySingleton(() => ServiceMethods());
  sl.registerLazySingleton(() => AppointmentMethods());
}
