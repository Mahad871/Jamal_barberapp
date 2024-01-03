import 'package:get_it/get_it.dart';
import 'package:mahad_s_application3/controllers/firebase/auth_methods.dart';
import 'package:mahad_s_application3/providers/user_provider.dart';

final GetIt sl = GetIt.instance;

void setupInjectionContainer() {
  // Register your dependencies here
  // Example:
  sl.registerLazySingleton(() => AuthMethods());
  sl.registerLazySingleton(() => UserProvider());
  
}
