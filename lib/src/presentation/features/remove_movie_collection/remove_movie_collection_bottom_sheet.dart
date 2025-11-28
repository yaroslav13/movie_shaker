import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/collections_route_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

final class RemoveMovieCollectionBottomSheet extends StatelessWidget {
  const RemoveMovieCollectionBottomSheet({
    required this.collectionName,
    super.key,
  });

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsTextButtonTheme>();
    final viewPadding = MediaQuery.viewPaddingOf(context);

    return SizedBox(
      width: double.infinity,
      child: MsTextButton.text(
        padding: theme?.padding?.add(
          EdgeInsets.only(bottom: viewPadding.bottom),
        ),
        onPressed: () => CollectionsRoute(
          CollectionsRouteExtra.remove(collectionName: collectionName),
        ).go(context),
        text: context.localizations.remove,
      ),
    );
  }
}
