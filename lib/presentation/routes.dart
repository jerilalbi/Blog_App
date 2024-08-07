import 'package:blog_app/domain/models/BlogModel.dart';
import 'package:blog_app/presentation/Blog/BlogView.dart';
import 'package:blog_app/presentation/Home/home.dart';
import 'package:blog_app/presentation/favourite/favourite.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String home = "/";
  static const String blogPage = "/blog";
  static const String favouritePage = "/favourite";

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => const HomePage(),
    blogPage: (context) =>
        BlogviewPage(blog: ModalRoute.of(context)!.settings.arguments as Blog),
    favouritePage: (context) => const FavouritePage(),
  };
}
