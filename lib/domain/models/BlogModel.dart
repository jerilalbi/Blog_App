import 'dart:convert';

BlogModel productModelFromJson(String str) =>
    BlogModel.fromJson(json.decode(str));

class BlogModel {
  List<Blog> blogs;

  BlogModel({
    required this.blogs,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        blogs: List<Blog>.from(json["blogs"].map((val) => Blog.fromJson(val))),
      );
}

class Blog {
  String id;
  String imageUrl;
  String title;

  Blog({
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        imageUrl: json["image_url"],
        title: json["title"],
      );
}
