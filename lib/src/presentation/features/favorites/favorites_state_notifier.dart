import 'dart:async';

import 'package:logger/src/logger.dart';
import 'package:movie_shaker/src/di/interactors/get_liked_movies_interactor_provider.dart';
import 'package:movie_shaker/src/di/logger/logger_provider.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/favorites/favorites_state.dart';
import 'package:movie_shaker/src/utils/logger_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_state_notifier.g.dart';

@riverpod
class FavoritesStateNotifier extends _$FavoritesStateNotifier with LoggerMixin {
  @override
  FavoritesState build() {
    return const FavoritesState.loading();
  }

  @override
  Logger get logger => ref.read(loggerProvider);

  void onStart() {
    unawaited(_fetchFavoriteMovies());
  }

  void onRetryPressed() {
    info('Refreshing movies...');

    state = const FavoritesState.loading();

    unawaited(_fetchFavoriteMovies());
  }

  void onMovieLikeStateChanged(Movie movie, {required bool isLiked}) {
    info('on movie like state changed: $movie');

    if (isLiked) {
      return;
    }

    state = switch (state) {
      final FavoritesStateData state => state.copyWith(
        favoriteMovies: state.favoriteMovies
            .where((favoriteMovie) => favoriteMovie.id != movie.id)
            .toList(),
      ),
      _ => state,
    };
  }

  Future<void> _fetchFavoriteMovies() async {
    try {
      info('Fetching favorite movies...');

      final getLikedMoviesInteractor = ref.read(
        getLikedMoviesInteractorProvider,
      );
      final favoriteMovies = await getLikedMoviesInteractor();

      info('Fetched ${favoriteMovies.length} favorite movies.');

      state = FavoritesState.data(favoriteMovies: favoriteMovies);
    } on SemanticException catch (e) {
      state = FavoritesState.error(e);

      error('Failed to fetch favorite movies: $e', e);
    }
  }
}
