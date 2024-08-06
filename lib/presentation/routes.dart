import 'package:blog_app/presentation/Home/home.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String home = "/";
  static const String blogPage = "/blog";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case blogPage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
