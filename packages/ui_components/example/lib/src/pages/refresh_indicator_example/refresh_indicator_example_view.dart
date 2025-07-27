import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class RefreshIndicatorExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const RefreshIndicatorExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: PullToRefreshWidget(
        onRefresh: () async => Future.delayed(const Duration(seconds: 40)),
        child: ListView(
          children: List.generate(
            5,
            (index) => ListTile(
              title: Text('Item $index'),
              subtitle: const Text('Pull down to refresh'),
            ),
          ),
        ),
      ),
    );
  }

  @override
  String get label => 'Refresh Indicator Example';
}
