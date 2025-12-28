import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/presentation/features/favorites/delegates/favorites_movie_shaker_delegate.dart';
import 'package:movie_shaker/src/presentation/features/favorites/favorites_state.dart';
import 'package:movie_shaker/src/presentation/features/favorites/favorites_state_notifier.dart';
import 'package:movie_shaker/src/presentation/features/like_movie/movie_like_button.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/entities/movie_pool.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/movie_shaker_scope.dart';
import 'package:movie_shaker/src/presentation/hooks/movie_carousel_controller_hook.dart';
import 'package:movie_shaker/src/presentation/hooks/navigation_hook.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/favorites_route_branch_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

final class FavoritesScreen extends HookConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritesStateNotifierProvider);

    useEffect(
      () {
        ref.read(favoritesStateNotifierProvider.notifier).onStart();

        return;
      },
      const [],
    );

    useNavigationExtraEffect<FavoritesRouteExtra>(
      (extra) {
        switch (extra) {
          case FavoritesRouteExtraUpdateMovie(:final movieId):
            ref
                .read(favoritesStateNotifierProvider.notifier)
                .onMovieUpdated(movieId);
          case _:
            break;
        }
      },
    );

    final movieCarouselController = useMovieCarouselController();

    return Scaffold(
      body: SafeArea(
        child: switch (state) {
          FavoritesStateLoading() => Center(
            child: MsProgressIndicator.moviePosters(),
          ),
          FavoritesStateData(:final favoriteMovies) => MovieShakerScope(
            scopeId: 'favorites_screen_scope',
            pool: MoviePool.local(favoriteMovies),
            delegate: FavoritesMovieShakerDelegate(
              onScrollRequested: (duration, movie) async =>
                  movieCarouselController.animateToItem(
                    favoriteMovies.indexOf(movie),
                    duration: duration,
                  ),
            ),
            child: MovieCarousel(
              controller: movieCarouselController,
              itemCount: favoriteMovies.length,
              itemBuilder: (_, index) {
                final movie = favoriteMovies[index];

                return MovieCard.expanded(
                  action: MovieLikeButton(
                    padding: MsEdgeInsets.contentMedium,
                    movie: movie,
                    onLikeStateChanged: (isLiked) => ref
                        .read(
                          favoritesStateNotifierProvider.notifier,
                        )
                        .onMovieLikeStateChanged(movie, isLiked: isLiked),
                  ),
                  imageUrl: movie.posterUrl,
                  onTap: () =>
                      FavoriteMovieDetailsRoute(id: movie.id).go(context),
                );
              },
              noItemsBuilder: (_) => NoItemsStub.noFavorites(),
            ),
          ),
          FavoritesStateError() => LoadingErrorStub(
            onRetry: () => ref
                .read(favoritesStateNotifierProvider.notifier)
                .onRetryPressed(),
          ),
        },
      ),
    );
  }
}
