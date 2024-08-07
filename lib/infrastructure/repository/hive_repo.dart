import 'package:blog_app/hive_boxes/blog_box.dart';
import 'package:hive/hive.dart';

Future<void> saveBlogsData(String data) async {
  Box<BlogsBox> blogBox = Hive.box<BlogsBox>("blogs");
  await blogBox.add(BlogsBox(jsonBlogsData: data));
}

String getBlogsDataLocal() {
  Box<BlogsBox> blogBox = Hive.box<BlogsBox>("blogs");
  return blogBox.values.first.jsonBlogsData!;
}
