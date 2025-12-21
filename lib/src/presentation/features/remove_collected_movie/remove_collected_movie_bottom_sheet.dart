import 'package:flutter/material.dart';
import 'package:movie_shaker/src/presentation/common/remove_bottom_sheet.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/collections_route_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';

final class RemoveCollectedMovieBottomSheet extends StatelessWidget {
  const RemoveCollectedMovieBottomSheet({
    required this.collectionName,
    required this.movieId,
    super.key,
  });

  final String collectionName;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return RemoveBottomSheet(
      onPressed: () => MovieCollectionDetailsRoute(
        collectionName: collectionName,
        $extra: CollectionsRouteExtra.removeMovie(
          collectionName: collectionName,
          movieId: movieId,
        ),
      ).go(context),
    );
  }
}
