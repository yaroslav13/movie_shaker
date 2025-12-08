import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/presentation/features/movie_collection_details/movie_collection_details_notifier.dart';
import 'package:movie_shaker/src/presentation/features/movie_collection_details/movie_collection_details_state.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

const _smallCollectionThreshold = 6;

final class MovieCollectionDetailsScreen extends HookConsumerWidget {
  const MovieCollectionDetailsScreen({
    required this.collectionName,
    super.key,
  });

  final String collectionName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref
            .read(
              movieCollectionDetailsNotifierProvider(
                collectionName: collectionName,
              ).notifier,
            )
            .onStart();

        return;
      },
      const [],
    );

    return Scaffold(
      body: Stack(
        children: [
          _Body(collectionName: collectionName),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: MsEdgeInsets.contentLarge.add(
                EdgeInsets.only(
                  top: MediaQuery.viewPaddingOf(context).top,
                ),
              ),
              child: RoundedBackButton(
                onPressed: () => const CollectionsRoute().go(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _Body extends HookConsumerWidget {
  const _Body({
    required this.collectionName,
  });

  final String collectionName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      movieCollectionDetailsNotifierProvider(collectionName: collectionName),
    );

    return switch (state) {
      MovieCollectionDetailsStateLoading() => Center(
        child: MsProgressIndicator.moviePosters(),
      ),
      MovieCollectionDetailsStateError() => LoadingErrorStub(
        onRetry: () => ref
            .read(
              movieCollectionDetailsNotifierProvider(
                collectionName: collectionName,
              ).notifier,
            )
            .onRetryPressed(),
      ),
      MovieCollectionDetailsStateData(:final movies) =>
        movies.isEmpty
            ? NoItemsStub.emptyCollection()
            : TwoDimensionalScrollableView(
                itemCount: movies.length,
                columns: movies.length >= _smallCollectionThreshold ? 3 : 6,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return MovieCard.expanded(
                    borderRadius: MsBorderRadius.extraLarge,
                    imageUrl: movie.posterUrl,
                    onTap: () => CollectedMovieDetailsRoute(
                      id: movie.id,
                      collectionName: collectionName,
                    ).go(context),
                  );
                },
              ),
    };
  }
}
