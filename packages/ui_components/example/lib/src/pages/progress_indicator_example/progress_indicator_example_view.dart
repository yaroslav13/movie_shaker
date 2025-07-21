import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class ProgressIndicatorExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const ProgressIndicatorExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: const Center(
        child: DotsProgressIndicator(),
      ),
    );
  }

  @override
  String get label => 'Dots Progress Indicator Example';
}
