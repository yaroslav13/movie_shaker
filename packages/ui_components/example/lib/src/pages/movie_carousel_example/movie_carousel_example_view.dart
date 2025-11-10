import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class MovieCarouselExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const MovieCarouselExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: SafeArea(
        child: MovieCarousel(
          itemBuilder: (_, index) => MovieCard.expanded(
            imageUrl: 'https://picsum.photos/200/300?random=$index',
          ),
          itemCount: 10,
        ),
      ),
    );
  }

  @override
  String get label => 'Movie Carousel Example';
}
