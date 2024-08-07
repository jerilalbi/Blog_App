import 'dart:async';
import 'dart:convert';

import 'package:blog_app/domain/models/BlogModel.dart';
import 'package:blog_app/infrastructure/repository/api_repo.dart';
import 'package:blog_app/infrastructure/repository/hive_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<BlogModel> fetchBlogData() async {
  try {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      final response = getBlogsDataLocal();
      final jsonResponse = json.decode(response);
      BlogModel blogDatas = BlogModel.fromJson(jsonResponse);
      return blogDatas;
    } else {
      final response = await ApiHelper().getMethod("/api/rest/blogs");
      saveBlogsData(response.body);
      final jsonResponse = json.decode(response.body);
      BlogModel blogDatas = BlogModel.fromJson(jsonResponse);
      return blogDatas;
    }
  } catch (e) {
    throw Exception("Failed to fetch data $e");
  }
}
