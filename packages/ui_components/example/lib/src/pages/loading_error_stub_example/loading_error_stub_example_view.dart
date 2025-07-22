import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class LoadingErrorStubExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const LoadingErrorStubExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: const LoadingErrorStub(),
    );
  }

  @override
  String get label => 'Loading Error Stub Example';
}
