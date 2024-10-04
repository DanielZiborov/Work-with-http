import 'dart:convert';
import 'dart:io';

import 'package:work_with_http/domain/entity/post.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Post>> getPost() async {
    final json = await get("https://jsonplaceholder.typicode.com/posts")
        as List<dynamic>;

    final posts =
        json.map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();
    return posts;
  }

  Future<dynamic> get(String str) async {
    final url = Uri.parse(str);
    final request = await client.getUrl(url);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString);

    return json;
  }
}

// final url = Uri(
    //   scheme: 'https',
    //   host: "jsonplaceholder.typicode.com",
    //   path: "posts",
    // );
