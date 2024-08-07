import 'package:hive/hive.dart';

part 'blog_box.g.dart';

@HiveType(typeId: 0)
class BlogsBox extends HiveObject {
  @HiveField(0)
  final String? jsonBlogsData;

  BlogsBox({this.jsonBlogsData});
}
