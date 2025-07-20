import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class MovieCardExamplesView extends StatefulWidget
    with LabeledWidgetMixin {
  const MovieCardExamplesView({super.key});

  @override
  State<MovieCardExamplesView> createState() => _MovieCardExamplesViewState();

  @override
  String get label => 'Movie Card Examples';
}

final class _MovieCardExamplesViewState extends State<MovieCardExamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.label),
      ),
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: List.generate(
            6,
            (i) => MovieCard(
              imageUrl:
                  'https://media.printables.com/media/prints/5322/images/34243_38525894-79c4-48db-99b9-7782e2723276/thumbs/inside/1920x1440/jpg/20190824172724_019184.webp',
              title: 'Movie Title $i',
              subtitle: 'Subtitle $i',
            ),
          ),
        ),
      ),
    );
  }
}
