import 'package:clean_architecture/infrastructure/locator.dart';
import 'package:clean_architecture/ui/router.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
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
