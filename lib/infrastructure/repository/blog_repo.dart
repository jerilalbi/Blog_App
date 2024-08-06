import 'dart:async';
import 'dart:convert';

import 'package:blog_app/domain/models/BlogModel.dart';
import 'package:blog_app/infrastructure/repository/api_repo.dart';

Future<BlogModel> fetchBlogData() async {
  try {
    final response = await ApiHelper().getMethod("/api/rest/blogs");
    final jsonResponse = json.decode(response.body);
    BlogModel blogDatas = BlogModel.fromJson(jsonResponse);
    return blogDatas;
  } catch (e) {
    throw Exception("Failed to fetch data");
  }
}
