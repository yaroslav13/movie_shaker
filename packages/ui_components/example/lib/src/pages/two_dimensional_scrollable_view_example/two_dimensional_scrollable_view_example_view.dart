import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class TwoDimensionalScrollableViewExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const TwoDimensionalScrollableViewExampleView({super.key});

  static const _columns = 3;
  static const _itemCount = 30;

  static const _posterUrls = [
    'https://media.printables.com/media/prints/5322/images/34243_38525894-79c4-48db-99b9-7782e2723276/thumbs/inside/1920x1440/jpg/20190824172724_019184.webp',
    'https://media.printables.com/media/prints/5322/images/34243_38525894-79c4-48db-99b9-7782e2723276/thumbs/inside/1920x1440/jpg/20190824172724_019184.webp',
    'https://media.printables.com/media/prints/5322/images/34243_38525894-79c4-48db-99b9-7782e2723276/thumbs/inside/1920x1440/jpg/20190824172724_019184.webp',
    'https://media.printables.com/media/prints/5322/images/34243_38525894-79c4-48db-99b9-7782e2723276/thumbs/inside/1920x1440/jpg/20190824172724_019184.webp',
    'https://media.printables.com/media/prints/5322/images/34243_38525894-79c4-48db-99b9-7782e2723276/thumbs/inside/1920x1440/jpg/20190824172724_019184.webp',
    'https://media.printables.com/media/prints/5322/images/34243_38525894-79c4-48db-99b9-7782e2723276/thumbs/inside/1920x1440/jpg/20190824172724_019184.webp',
    'https://media.printables.com/media/prints/5322/images/34243_38525894-79c4-48db-99b9-7782e2723276/thumbs/inside/1920x1440/jpg/20190824172724_019184.webp',
    'https://media.printables.com/media/prints/5322/images/34243_38525894-79c4-48db-99b9-7782e2723276/thumbs/inside/1920x1440/jpg/20190824172724_019184.webp',
  ];

  String _urlForIndex(int index) {
    return _posterUrls[index % _posterUrls.length];
  }

  void _onTap(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tapped #$index')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TwoDimensionalScrollableView(
          itemCount: _itemCount,
          columns: _columns,
          itemBuilder: (context, index) {
            return MovieCard.expanded(
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              imageUrl: _urlForIndex(index),
              onTap: () => _onTap(context, index),
            );
          },
        ),
      ),
    );
  }

  @override
  String get label => 'Two Dimensional Scrollable View';
}
