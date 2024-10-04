import 'package:flutter/material.dart';
import 'package:work_with_http/domain/entity/post.dart';

class ExampleWidgetModel extends ChangeNotifier {
  final _posts = <Post>[];
  List<Post> get posts => _posts;
}

class ExampleModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;
  const ExampleModelProvider({
    super.key,
    required this.model,
    required super.child,
  });

  static ExampleModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType()?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }
}
