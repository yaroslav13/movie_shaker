import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class ScoreArcExampleView extends StatefulWidget with LabeledWidgetMixin {
  const ScoreArcExampleView({super.key});

  @override
  State<ScoreArcExampleView> createState() => _ScoreArcExampleViewState();

  @override
  String get label => 'ScoreArc Example';
}

final class _ScoreArcExampleViewState extends State<ScoreArcExampleView> {
  double _value = 7.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: MsText(widget.label)),
      body: Padding(
        padding: const EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            ScoreArc(
              value: _value,
              labelBuilder: (v) => '${v * 10 ~/ 1}%',
            ),
            const SizedBox(height: 24),
            Text('Value: ${_value.toStringAsFixed(1)}'),
            Slider(
              value: _value,
              max: 10,
              onChanged: (v) => setState(() => _value = v),
            ),
          ],
        ),
      ),
    );
  }
}
