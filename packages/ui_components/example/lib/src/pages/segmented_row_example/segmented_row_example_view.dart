import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class SegmentedRowExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const SegmentedRowExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SegmentedRow(
              segments: [
                SegmentData(
                  icon: Icon(Icons.home),
                  label: 'Segment 1',
                  caption: 'Caption 1',
                ),
                SegmentData(
                  icon: Icon(Icons.home),
                  label: 'Segment 2',
                  caption: 'Caption 2',
                ),
                SegmentData(
                  icon: Icon(Icons.home),
                  label: 'Segment 3',
                  caption: 'Caption 3',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  String get label => 'Segmented Row Example';
}
