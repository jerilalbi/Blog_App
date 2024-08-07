import 'package:blog_app/domain/models/BlogModel.dart';
import 'package:blog_app/hive_boxes/blog_box.dart';
import 'package:blog_app/hive_boxes/fav_blog_box.dart';
import 'package:hive/hive.dart';

Future<void> saveBlogsData(String data) async {
  Box<BlogsBox> blogBox = Hive.box<BlogsBox>("blogs");
  await blogBox.put("blogsJsonData", BlogsBox(jsonBlogsData: data));
}

String getBlogsDataLocal() {
  Box<BlogsBox> blogBox = Hive.box<BlogsBox>("blogs");
  return blogBox.get("blogsJsonData")!.jsonBlogsData!;
}

Future<void> addFavBlogs(Blog blog) async {
  Box<FavBlogsBox> favBlogBox = Hive.box<FavBlogsBox>("fav_blogs");
  await favBlogBox.put(blog.id,
      FavBlogsBox(id: blog.id, title: blog.title, imgUrl: blog.imageUrl));
}

Future<List<FavBlogsBox>> getFavBlogs() async {
  Box<FavBlogsBox> favBlogBox = Hive.box<FavBlogsBox>("fav_blogs");
  return favBlogBox.values.toList();
}

bool checkFavourite(String key) {
  Box<FavBlogsBox> favBlogBox = Hive.box<FavBlogsBox>("fav_blogs");
  return favBlogBox.containsKey(key);
}

Future<void> removeFromFav(String key) async {
  Box<FavBlogsBox> favBlogBox = Hive.box<FavBlogsBox>("fav_blogs");
  favBlogBox.delete(key);
}
