import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:blog_app/core/api.dart';
import 'package:blog_app/domain/models/BlogModel.dart';
import 'package:blog_app/infrastructure/repository/api_repo.dart';
import 'package:http/http.dart' as http;

Future<List<BlogModel>> fetchBlogData() async {
  try {
    final response = await ApiHelper().getMethod("/api/rest/blogs");
    List<BlogModel> blogData = List.from(json
        .decode(response.body)["blogs"]
        .map((val) => BlogModel.fromJson(val)));
    return blogData;
  } catch (e) {
    throw Exception("Failed to fetch data");
  }
}
