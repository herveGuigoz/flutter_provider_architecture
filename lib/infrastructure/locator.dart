import '../service/counter_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => CounterService());
  /*
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
  */
}
