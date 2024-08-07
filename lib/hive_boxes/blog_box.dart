import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Blogs extends HiveObject {
  @HiveField(0)
  final String? jsonBlogsData;

  Blogs({this.jsonBlogsData});
}
