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
              const ReloadButton(),
              const CreateButton(),
              Expanded(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  // child: _PostsWidget(),
                  child:Placeholder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReloadButton extends StatelessWidget {
  const ReloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
