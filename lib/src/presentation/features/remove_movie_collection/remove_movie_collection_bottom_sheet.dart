import 'package:flutter/material.dart';
import 'package:movie_shaker/src/presentation/common/remove_bottom_sheet.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/collections_branch_route_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';

final class RemoveMovieCollectionBottomSheet extends StatelessWidget {
  const RemoveMovieCollectionBottomSheet({
    required this.collectionName,
    super.key,
  });

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return RemoveBottomSheet(
      onPressed: () => CollectionsRoute(
        CollectionsRouteExtra.removeCollection(collectionName: collectionName),
      ).go(context),
    );
  }
}
