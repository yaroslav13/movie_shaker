import 'package:example/src/pages/components_examples/components_example_view.dart';
import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';

final class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final class _MainScreenState extends State<MainScreen> {
  final _destinations = <Widget>[
    const ComponentsExampleView(),
  ];

  String _getWidgetTitle(Widget widget) {
    if (widget is LabeledWidgetMixin) {
      return (widget as LabeledWidgetMixin).label;
    }

    return '$widget';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        children: _destinations
            .map(
              (widget) => ListTile(
                title: Text(_getWidgetTitle(widget)),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (_) => widget),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
