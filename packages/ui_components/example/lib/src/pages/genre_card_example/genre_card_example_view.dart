import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class GenreCardExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const GenreCardExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    const genres = ['Action', 'Drama', 'Science Fiction', 'Comedy', 'Thriller'];

    return Scaffold(
      appBar: AppBar(title: MsText(label)),
      body: Center(
        child: SizedBox(
          height: 300,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: genres.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final genre = genres[index];

              return GenreCard(
                genre: genre,
                margin: const EdgeInsets.symmetric(horizontal: 4),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  String get label => 'GenreCard Example';
}
