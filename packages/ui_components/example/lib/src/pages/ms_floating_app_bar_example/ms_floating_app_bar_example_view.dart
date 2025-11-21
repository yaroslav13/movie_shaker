import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class MsFloatingAppBarExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const MsFloatingAppBarExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MsFloatingAppBar.backgroundImage(
            title: label,
            iconTheme: const IconThemeData(color: Colors.black),
            imageUrl:
                'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60',
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item #$index'),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  @override
  String get label => 'MS Floating App Bar Example';
}
