import 'package:blog_app/core/api.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<http.Response> getMethod(String url) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + url),
          headers: {'x-hasura-admin-secret': secretKey});
      if (response.statusCode != 200) {
        throw Exception("falied to load data ${response.statusCode}");
      }
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
