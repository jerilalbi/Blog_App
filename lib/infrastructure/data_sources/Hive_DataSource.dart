import 'package:blog_app/hive_boxes/blog_box.dart';
import 'package:blog_app/hive_boxes/fav_blog_box.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDatasource {
  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BlogsBoxAdapter());
    Hive.registerAdapter(FavBlogsBoxAdapter());
    await Hive.openBox<BlogsBox>("blogs");
    await Hive.openBox<FavBlogsBox>("fav_blogs");
  }
}
