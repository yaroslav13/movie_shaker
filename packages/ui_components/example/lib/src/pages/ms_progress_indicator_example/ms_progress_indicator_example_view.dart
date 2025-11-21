import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class MsProgressIndicatorExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const MsProgressIndicatorExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: MsProgressIndicator.moviePosters(),
      ),
    );
  }

  @override
  String get label => 'Ms Progress Indicator Example';
}
