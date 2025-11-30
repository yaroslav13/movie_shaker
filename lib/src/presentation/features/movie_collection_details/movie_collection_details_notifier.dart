import 'dart:async';

import 'package:movie_shaker/src/di/interactors/get_movies_by_collection_interactor_provider.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
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
}
