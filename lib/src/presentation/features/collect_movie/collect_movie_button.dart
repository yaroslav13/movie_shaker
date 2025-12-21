import 'package:flutter/material.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/collection_picker_route_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:ui_components/ui_components.dart';

final class CollectMovieButton extends StatelessWidget {
  const CollectMovieButton({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BookmarkButton(
      onPressed: () => CollectionPickerRoute(
        CollectionPickerRouteExtra(movie: movie),
      ).go(context),
    );
  }
}
