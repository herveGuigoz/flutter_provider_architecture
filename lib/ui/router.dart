import 'package:flutter/material.dart';

import 'pages/home_page/home_page.dart';
import 'pages/login_page/login_page.dart';
import 'pages/counter_page/counter_page.dart';
import 'pages/post_page/post_page.dart';
import '../domain/entities/post.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case 'counter':
        return MaterialPageRoute(builder: (_) => CounterPage());
      case 'post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostPage(post: post));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
