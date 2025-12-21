import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/domain/exceptions/collection_modification_exception.dart';
import 'package:movie_shaker/src/presentation/features/movie_collections/movie_collections_state.dart';
import 'package:movie_shaker/src/presentation/features/movie_collections/movie_collections_state_notifier.dart';
import 'package:movie_shaker/src/presentation/hooks/navigation_hook.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/collections_route_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:movie_shaker/src/presentation/utils/snack_bar_extension.dart';
import 'package:ui_components/ui_components.dart';

final class MovieCollectionsScreen extends HookConsumerWidget {
  const MovieCollectionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieCollectionsStateNotifierProvider);

    ref.listen(
      movieCollectionsStateNotifierProvider,
      (previous, current) {
        final previousCollectionChangeFailure =
            previous?.collectionChangeFailure;
        final collectionChangeFailure = current.collectionChangeFailure;

        if (previousCollectionChangeFailure != collectionChangeFailure &&
            collectionChangeFailure != null) {
          final errorMessage = switch (collectionChangeFailure) {
            CollectionRemovalException() =>
              context.localizations.yourCollectionDoNotWantToDisappear,
            CollectionCreationException() =>
              context.localizations.yourCollectionDisappeared,
          };

          unawaited(
            context.showErrorSnackBar(
              errorMessage,
              onClosed: () => ref
                  .read(movieCollectionsStateNotifierProvider.notifier)
                  .onErrorSnackBarClosed(),
            ),
          );
        }
      },
    );

    useEffect(
      () {
        ref.read(movieCollectionsStateNotifierProvider.notifier).onStart();

        return;
      },
      const [],
    );

    useNavigationExtraEffect<CollectionsRouteExtra>(
      (extra) {
        switch (extra) {
          case AddCollectionsRouteExtra(:final collectionName):
            ref
                .read(movieCollectionsStateNotifierProvider.notifier)
                .onNewCollectionNameEntered(collectionName);
          case RemoveCollectionsRouteExtra(:final collectionName):
            ref
                .read(movieCollectionsStateNotifierProvider.notifier)
                .onRemoveCollectionPressed(collectionName);
          case UpdatedCollectionsRouteExtra(:final collectionName):
            ref
                .read(movieCollectionsStateNotifierProvider.notifier)
                .onCollectionUpdated(collectionName);
          case _:
            break;
        }
      },
    );

    return Scaffold(
      floatingActionButton: state is MovieCollectionsStateData
          ? MsFloatingActionButton.add(
              context,
              onPressed: () => const AddMovieCollectionRoute().go(context),
            )
          : null,
      body: SafeArea(
        child: switch (state) {
          MovieCollectionsStateLoading() => Center(
            child: MsProgressIndicator.moviePosters(),
          ),
          MovieCollectionsStateError() => LoadingErrorStub(
            onRetry: () => ref
                .read(movieCollectionsStateNotifierProvider.notifier)
                .onRetryPressed(),
          ),
          MovieCollectionsStateData() => StaggeredGridView.largeSpacing(
            noItemsBuilder: (_) => NoItemsStub.noCollections(),
            itemCount: state.collections.length,
            itemBuilder: (_, index) {
              final collection = state.collections[index];
              final collectionName = collection.name;

              return MovieCollectionCard(
                title: collectionName,
                subtitle: context.localizations.moviesCount(
                  collection.moviesCount,
                ),
                posterUrls: collection.movies
                    .map((movie) => movie.posterUrl)
                    .toList(),
                onTap: () => MovieCollectionDetailsRoute(
                  collectionName: collectionName,
                ).go(context),
                onLongPress: () => RemoveMovieCollectionRoute(
                  collectionName: collectionName,
                ).go(context),
              );
            },
          ),
        },
      ),
    );
  }
}
