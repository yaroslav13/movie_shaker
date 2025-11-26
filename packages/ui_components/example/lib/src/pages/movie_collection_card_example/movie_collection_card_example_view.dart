import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class MovieCollectionCardExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const MovieCollectionCardExampleView({super.key});

  void _onTap(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      MsSnackBar.error(context, message),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Collection Card Example'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          childAspectRatio: 3 / 4,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return MovieCollectionCard(
            title: 'Collection Title $index',
            subtitle: 'Subtitle $index',
            onTap: () => _onTap(context, 'Tapped on Collection Title $index'),
            posterUrls: List.generate(
              index.isEven ? 1 : 4,
              (i) =>
                  'https://picsum.photos/seed/${index * 4 + i}/200/300', // Placeholder images
            ),
          );
        },
      ),
    );
  }

  @override
  String get label => 'Movie Collection Card Example';
}
