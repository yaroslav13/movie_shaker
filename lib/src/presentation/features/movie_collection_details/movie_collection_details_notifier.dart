import 'dart:async';

import 'package:movie_shaker/src/di/interactors/get_movies_by_collection_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/remove_movie_from_collection_interactor_provider.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection_entry/movie_collection_entry.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/movie_collection_details/movie_collection_details_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_collection_details_notifier.g.dart';

@riverpod
class MovieCollectionDetailsNotifier extends _$MovieCollectionDetailsNotifier {
  @override
  MovieCollectionDetailsState build({required String collectionName}) =>
      const MovieCollectionDetailsState.loading();

  void onStart() {
    unawaited(_fetchMoviesByCollection());
  }

  void onRetryPressed() {
    state = const MovieCollectionDetailsState.loading();

    unawaited(_fetchMoviesByCollection());
  }

  void onRemoveMoviePressed(int movieId) {
    final movieToRemove = switch (state) {
      MovieCollectionDetailsStateData(:final movies) => movies.firstWhere(
        (movie) => movie.id == movieId,
      ),
      _ => null,
    };

    if (movieToRemove != null) {
      unawaited(
        _removeMovieFromCollection(movieToRemove),
      );

      state = switch (state) {
        final MovieCollectionDetailsStateData state => state.copyWith(
          movies: state.movies
              .where((movie) => movie.id != movieToRemove.id)
              .toList(),
        ),
        _ => state,
      };
    } else {
      ///TODO: Handle movie not found case
    }
  }

  Future<void> _fetchMoviesByCollection() async {
    try {
      final getMoviesByCollectionInteractor = ref.read(
        getMoviesByCollectionInteractorProvider,
      );

      final movies = await getMoviesByCollectionInteractor(
        MovieCollection(name: collectionName),
      );

      state = MovieCollectionDetailsState.data(movies: movies);
    } on SemanticException catch (e) {
      state = MovieCollectionDetailsState.error(e);
    }
  }

  Future<void> _removeMovieFromCollection(Movie movie) async {
    try {
      final removeMovieFromCollectionInteractor = ref.read(
        removeMovieFromCollectionInteractorProvider,
      );

      await removeMovieFromCollectionInteractor(
        MovieCollectionEntry(
          movie: movie,
          collection: MovieCollection(name: collectionName),
        ),
      );
    } on SemanticException {
      // Handle exception
    }
  }
}
