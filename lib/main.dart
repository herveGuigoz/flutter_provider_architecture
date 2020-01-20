import 'package:clean_architecture/data_source/api.dart';
import 'package:clean_architecture/service/comments_service.dart';
import 'package:clean_architecture/service/counter_service.dart';
import 'package:clean_architecture/service/login_service.dart';
import 'package:clean_architecture/service/posts_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './ui/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginService(api: Api())),
        ChangeNotifierProvider(create: (_) => PostsService()),
        ChangeNotifierProvider(create: (_) => CommentsService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: 'login',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
