import 'package:hive/hive.dart';

part 'fav_blog_box.g.dart';

@HiveType(typeId: 1)
class FavBlogsBox extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? imgUrl;

  FavBlogsBox({this.id, this.title, this.imgUrl});
}
