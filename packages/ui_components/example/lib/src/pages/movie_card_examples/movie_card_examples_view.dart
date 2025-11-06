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
  void _onMovieCardTap(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tapped on Movie Card $index'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.label),
      ),
      body: SafeArea(
        child: StaggeredGridView(
          itemCount: 6,
          itemBuilder: (_, i) {
            return MovieCard(
              action: const _IndependentLikeButton(),
              onTap: () => _onMovieCardTap(i),
              imageUrl:
                  'https://media.printables.com/media/prints/5322/images/34243_38525894-79c4-48db-99b9-7782e2723276/thumbs/inside/1920x1440/jpg/20190824172724_019184.webp',
            );
          },
        ),
      ),
    );
  }
}

final class _IndependentLikeButton extends StatefulWidget {
  const _IndependentLikeButton();

  @override
  State<_IndependentLikeButton> createState() => _IndependentLikeButtonState();
}

final class _IndependentLikeButtonState extends State<_IndependentLikeButton> {
  var _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      isLiked: _isLiked,
      onChanged: (isLiked) => setState(() {
        _isLiked = isLiked;
      }),
    );
  }
}
