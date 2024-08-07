import 'package:blog_app/hive_boxes/blog_box.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDatasource {
  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BlogsBoxAdapter());
    await Hive.openBox<BlogsBox>("blogs");
  }
}
