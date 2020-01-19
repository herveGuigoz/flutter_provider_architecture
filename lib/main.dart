import 'package:flutter/material.dart';

import './service/common/locator.dart';
import './ui/router.dart';

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
