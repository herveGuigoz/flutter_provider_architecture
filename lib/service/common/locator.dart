import 'package:get_it/get_it.dart';

import '../../data_source/api.dart';

import '../counter_service.dart';
import '../login_service.dart';
import '../comments_service.dart';
import '../posts_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => CounterService());
  locator.registerLazySingleton(() => LoginService(api: Api()));
  locator.registerLazySingleton(() => PostsService());
  locator.registerFactory(() => CommentsService());
}
