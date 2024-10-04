import 'package:flutter/material.dart';
import 'package:work_with_http/domain/api_clients/api_client.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    ApiClient().getPost();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
