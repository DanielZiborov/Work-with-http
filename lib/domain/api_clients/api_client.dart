import 'dart:convert';
import 'dart:io';
import 'package:work_with_http/domain/entity/post.dart';
import 'package:path/path.dart';

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

  Future<Post?> createPost({
    required String title,
    required String body,
  }) async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final parameters = <String, dynamic>{
      'title': title,
      'body': body,
      'userId': 109,
    };
    final request = await client.postUrl(url);
    request.headers.set('Content-type', 'application/json; charset=UTF-8');
    request.write(jsonEncode(parameters));
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();

    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final post = Post.fromJson(json);
    return post;
  }

  Future<void> fileUpload(File file) async {
    final url = Uri.parse("https://example.com");

    final request = await client.postUrl(url);

    request.headers.set(HttpHeaders.contentTypeHeader, ContentType.binary);
    request.headers.add('filename', basename(file.path));
    request.contentLength = file.lengthSync();
    final FileStream = file.openRead();
    await request.addStream(FileStream);

    final httpResponse = await request.close();

    if (httpResponse.statusCode != 200) {
      throw Exception('ERROR UPLOADING FILE');
    } else {
      return;
    }
  }
}

// final url = Uri(
    //   scheme: 'https',
    //   host: "jsonplaceholder.typicode.com",
    //   path: "posts",
    // );
