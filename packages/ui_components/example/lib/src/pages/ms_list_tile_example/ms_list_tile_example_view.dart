import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class MsListTileExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const MsListTileExampleView({super.key});

  void _onItemTap(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tapped on Item #$index')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 20,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return MsListTile(
            title: Text('Item #$index'),
            subtitle: Text('Subtitle for item #$index'),
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _onItemTap(context, index),
          );
        },
      ),
    );
  }

  @override
  String get label => 'Ms List Tile Example';
}
