import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/presentation/features/movie_collection_details/delegates/movie_collection_shaker_delegate.dart';
import 'package:movie_shaker/src/presentation/features/movie_collection_details/movie_collection_details_notifier.dart';
import 'package:movie_shaker/src/presentation/features/movie_collection_details/movie_collection_details_state.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/entities/movie_pool.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/movie_shaker_scope.dart';
import 'package:movie_shaker/src/presentation/hooks/navigation_hook.dart';
import 'package:movie_shaker/src/presentation/hooks/two_dimensional_scrollable_controller_hook.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/collections_route_extra.dart';
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

    useNavigationExtraEffect<CollectionsRouteExtra>(
      (extra) {
        switch (extra) {
          case RemoveMovieCollectionsRouteExtra(
                :final collectionName,
                :final movieId,
              )
              when collectionName == this.collectionName:
            ref
                .read(
                  movieCollectionDetailsNotifierProvider(
                    collectionName: collectionName,
                  ).notifier,
                )
                .onRemoveMoviePressed(movieId);

          case _:
            break;
        }
      },
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
                onPressed: () => CollectionsRoute(
                  CollectionsRouteExtra.updated(collectionName: collectionName),
                ).go(context),
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

    switch (state) {
      case MovieCollectionDetailsStateLoading():
        return Center(
          child: MsProgressIndicator.moviePosters(),
        );
      case MovieCollectionDetailsStateError():
        return LoadingErrorStub(
          onRetry: () => ref
              .read(
                movieCollectionDetailsNotifierProvider(
                  collectionName: collectionName,
                ).notifier,
              )
              .onRetryPressed(),
        );
      case MovieCollectionDetailsStateData(:final movies):
        final controller = useTwoDimensionalScrollableController();

        return movies.isEmpty
            ? NoItemsStub.emptyCollection()
            : MovieShakerScope(
                scopeId: 'movie_collection_${collectionName}_scope',
                pool: MoviePool.local(movies),
                delegate: MovieCollectionShakerDelegate(
                  collectionName: collectionName,
                  onScrollRequested: (duration, movie) =>
                      controller.animateToIndex(
                        movies.indexOf(movie),
                        duration: duration,
                      ),
                ),
                child: TwoDimensionalScrollableView(
                  controller: controller,
                  itemCount: movies.length,
                  columns: movies.length >= _smallCollectionThreshold ? 3 : 6,
                  itemBuilder: (context, index) {
                    final movie = movies[index];

                    return MovieCard.expanded(
                      action: DeleteButton(
                        onPressed: () => RemoveCollectedMovieRoute(
                          id: movie.id,
                          collectionName: collectionName,
                        ).go(context),
                      ),
                      borderRadius: MsBorderRadius.extraLarge,
                      imageUrl: movie.posterUrl,
                      onTap: () => CollectedMovieDetailsRoute(
                        id: movie.id,
                        collectionName: collectionName,
                      ).go(context),
                    );
                  },
                ),
              );
    }
  }
}
