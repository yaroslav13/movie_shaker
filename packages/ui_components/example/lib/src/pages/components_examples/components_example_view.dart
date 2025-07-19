import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';

final class ComponentsExampleView extends StatefulWidget
    with LabeledWidgetMixin {
  const ComponentsExampleView({super.key});

  @override
  State<ComponentsExampleView> createState() => _ComponentsExampleViewState();

  @override
  String get label => 'UI Components Example';
}

final class _ComponentsExampleViewState extends State<ComponentsExampleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}
