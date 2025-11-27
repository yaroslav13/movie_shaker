import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/presentation/features/movie_collections/movie_collections_state.dart';
import 'package:movie_shaker/src/presentation/features/movie_collections/movie_collections_state_notifier.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/collections_route_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:movie_shaker/src/presentation/utils/snack_bar_extension.dart';
import 'package:ui_components/ui_components.dart';

final class MovieCollectionsScreen extends HookConsumerWidget {
  const MovieCollectionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieCollectionsStateNotifierProvider);
    final navigationState = GoRouterState.of(context);

    ref.listen(
      movieCollectionsStateNotifierProvider,
      (previous, current) {
        final hasCreateCollectionError = current.hasCreateCollectionError;

        if (previous?.hasCreateCollectionError != hasCreateCollectionError &&
            hasCreateCollectionError) {
          unawaited(
            context.showErrorSnackBar(
              context.localizations.yourCollectionDisappeared,
              onClosed: () => ref
                  .read(movieCollectionsStateNotifierProvider.notifier)
                  .onCreateCollectionErrorSnackBarClosed(),
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

    useEffect(
      () {
        if (navigationState.extra case final CollectionsRouteExtra extra) {
          ref
              .read(movieCollectionsStateNotifierProvider.notifier)
              .onNewCollectionNameEntered(extra.newCollectionName);
        }

        return;
      },
      [navigationState.extra],
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

              return MovieCollectionCard(
                title: collection.name,
                subtitle: context.localizations.moviesCount(
                  collection.moviesCount,
                ),
                posterUrls: collection.movies
                    .map((movie) => movie.posterUrl)
                    .toList(),
              );
            },
          ),
        },
      ),
    );
  }
}
