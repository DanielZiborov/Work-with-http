import 'package:flutter/material.dart';
import 'package:work_with_http/domain/api_clients/api_client.dart';
import 'package:work_with_http/domain/entity/post.dart';

class ExampleWidgetModel extends ChangeNotifier {
  final apiClient  = ApiClient();
  var _posts = <Post>[];
  List<Post> get posts => _posts;

  Future<void> reloadPosts() async{
    final posts = await apiClient.getPost();
    _posts += posts;
    notifyListeners();
  }
  void createPosts(){}
}

class ExampleModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;
  const ExampleModelProvider({
    super.key,
    required this.model,
    required super.child,
  }):super(notifier: model);

  static ExampleModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<ExampleModelProvider>()?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }


}


