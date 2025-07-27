import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class GlassesProgressIndicatorExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const GlassesProgressIndicatorExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: const Center(
        child: GlassesProgressIndicator(),
      ),
    );
  }

  @override
  String get label => 'Glasses Progress Indicator Example';
}
