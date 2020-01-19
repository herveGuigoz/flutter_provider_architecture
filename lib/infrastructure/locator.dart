import 'package:clean_architecture/service/comments_service.dart';
import 'package:clean_architecture/service/posts_service.dart';
import 'package:get_it/get_it.dart';

import '../data_source/api.dart';

import '../service/login_service.dart';
import '../service/counter_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => CounterService());
  // locator.registerFactory(() => AuthenticationService());
  locator.registerLazySingleton(() => LoginService(api: Api()));
  locator.registerLazySingleton(() => PostsService());
  locator.registerFactory(() => CommentsService());
  /*
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
  */
}
