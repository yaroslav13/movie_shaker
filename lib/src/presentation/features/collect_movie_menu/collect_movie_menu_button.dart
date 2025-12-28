import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';
import 'package:movie_shaker/src/presentation/features/collect_movie_menu/collect_movie_menu_state_notifier.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/collections_branch_route_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/favorites_route_branch_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/home_branch_route_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:ui_components/ui_components.dart';

final class CollectMovieMenuButton extends HookConsumerWidget {
  const CollectMovieMenuButton({
    required this.movieDetails,
    super.key,
  });

  final MovieDetails movieDetails;

  void _onSavePressed(BuildContext context, Movie movie) {
    final router = GoRouter.of(context);

    final currentRoute = router.routerDelegate.currentConfiguration.uri;
    final currentPath = currentRoute.toString();

    Object? extra;

    if (currentPath.contains(const CollectionsRoute().location)) {
      extra = CollectedMovieRouteExtra.saveMovie(movie: movie);
    } else if (currentPath.contains(const HomeRoute().location)) {
      extra = MovieDetailsRouteExtra.saveMovie(movie: movie);
    } else if (currentPath.contains(const FavoritesRoute().location)) {
      extra = FavoriteMovieRouteExtra.addMovie(movie: movie);
    }

    router.go(
      '$currentRoute/collectionPicker',
      extra: extra,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref
            .read(
              collectMovieMenuStateNotifierProvider(
                movieDetails: movieDetails,
              ).notifier,
            )
            .onStart();

        return;
      },
      [movieDetails.id],
    );

    final isLiked = ref.watch(
      collectMovieMenuStateNotifierProvider(
        movieDetails: movieDetails,
      ).select(
        (state) => state.isLiked,
      ),
    );

    final movie = ref.watch(
      collectMovieMenuStateNotifierProvider(
        movieDetails: movieDetails,
      ).select(
        (state) => state.correspondingMovie,
      ),
    );

    final likeButtonTitle = isLiked
        ? context.localizations.unlike
        : context.localizations.like;

    return MsMenuButton(
      items: [
        MsMenuItem.like(
          title: likeButtonTitle.toUpperCase(),
          onTap: () => ref
              .read(
                collectMovieMenuStateNotifierProvider(
                  movieDetails: movieDetails,
                ).notifier,
              )
              .onLikeStateChanged(isLiked: !isLiked),
        ),
        MsMenuItem.bookmark(
          title: context.localizations.save.toUpperCase(),
          onTap: () => _onSavePressed(context, movie),
        ),
      ],
    );
  }
}
