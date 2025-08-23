import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class TextFormFieldExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const TextFormFieldExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: MsTextFormField(),
        ),
      ),
    );
  }

  @override
  String get label => 'Text Form Field Example';
}
