import 'dart:convert';
import 'dart:developer';
import 'dart:io';

class ApiClient {
  final client = HttpClient();

  void getPost() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    // final url = Uri(
    //   scheme: 'https',
    //   host: "jsonplaceholder.typicode.com",
    //   path: "posts",
    // );
    final request = await client.getUrl(url);
    final response = await request.close();
    response.transform(utf8.decoder).listen(
          (event) {
            log(event);
            log('1');
          },
        );
  }
}
