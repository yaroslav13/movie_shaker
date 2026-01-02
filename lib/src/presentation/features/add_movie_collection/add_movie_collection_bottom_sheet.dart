import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/presentation/features/add_movie_collection/add_movie_collection_state_notifier.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/collections_branch_route_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

final class AddMovieCollectionBottomSheet extends HookConsumerWidget {
  const AddMovieCollectionBottomSheet({super.key});

  void _onCreatePressed(BuildContext context, String collectionName) {
    CollectionsRoute(
      CollectionsRouteExtra.addCollection(collectionName: collectionName),
    ).go(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addMovieCollectionStateNotifierProvider);
    final focusNode = useFocusNode();

    final viewInsets = MediaQuery.viewInsetsOf(context);

    return SafeArea(
      child: Padding(
        padding:
            MsEdgeInsets.contentLarge.copyWith(top: 0) +
            EdgeInsets.only(bottom: viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MsText.titleLarge(context, context.localizations.newCollection),
            const SizedBox(height: MsSpacings.medium),
            MsText.bodyMedium(
              context,
              context.localizations.buildANewListForMoviesYouWantToTrack,
            ),
            const SizedBox(height: MsSpacings.extraLarge),
            TapRegion(
              onTapOutside: (_) => focusNode.unfocus(),
              child: MsTextFormField.relaxed(
                focusNode: focusNode,
                labelText: context.localizations.collectionName,
                onChanged: (value) => ref
                    .read(addMovieCollectionStateNotifierProvider.notifier)
                    .onCollectionNameChanged(value),
              ),
            ),
            const SizedBox(height: MsSpacings.extraLarge),
            MsElevatedButton(
              onPressed: state.collectionName.isEmpty
                  ? null
                  : () => _onCreatePressed(context, state.collectionName),
              child: MsText(context.localizations.create.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}
