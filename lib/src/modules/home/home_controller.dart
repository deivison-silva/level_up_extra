import 'dart:convert';
import '/src/shared/models/post_model.dart';
import 'package:http/http.dart' as http;

class HomeController {
  Future getPosts(posts) async {
    final baseURL = "http://jsonplaceholder.typicode.com";
    var url = Uri.parse('$baseURL/posts');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      posts = json.map((e) => PostModel.fromJson(e)).toList();
      return posts;
    }
  }
}
