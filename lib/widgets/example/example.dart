import 'package:flutter/material.dart';
import 'package:work_with_http/domain/api_clients/api_client.dart';
import 'package:work_with_http/widgets/example/example_model.dart';

class Example extends StatefulWidget {
  const Example({super.key});
  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final model = ExampleWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ExampleModelProvider(
          model: model,
          child: const Column(
            children: [
              _ReloadButton(),
              _CreateButton(),
              Expanded(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: _PostsWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => ExampleModelProvider.read(context)?.model.reloadPosts(),
      child: const Text('Обновить посты'),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => ExampleModelProvider.read(context)?.model.createPosts(),
      child: const Text('Создать пост'),
    );
  }
}

class _PostsWidget extends StatelessWidget {
  const _PostsWidget();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
