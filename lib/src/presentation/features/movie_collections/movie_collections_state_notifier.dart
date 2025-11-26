import 'dart:async';

import 'package:logger/src/logger.dart';
import 'package:movie_shaker/src/di/interactors/create_movie_collection_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/get_movie_collections_interactor_provider.dart';
import 'package:movie_shaker/src/di/logger/logger_provider.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/movie_collections/movie_collections_state.dart';
import 'package:movie_shaker/src/utils/logger_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_collections_state_notifier.g.dart';

@riverpod
class MovieCollectionsStateNotifier extends _$MovieCollectionsStateNotifier
    with LoggerMixin {
  @override
  MovieCollectionsState build() => const MovieCollectionsState.loading();

  @override
  Logger get logger => ref.read(loggerProvider);

  void onStart() {
    unawaited(_fetchMovieCollections());
  }

  void onRetryPressed() {
    state = const MovieCollectionsState.loading();

    unawaited(_fetchMovieCollections());
  }

  void onNewCollectionNameEntered(String name) {
    unawaited(_createMovieCollection(name));
  }

  Future<void> _fetchMovieCollections() async {
    info('Fetching movie collections');

    try {
      final getMovieCollectionsInteractor = ref.read(
        getMovieCollectionsInteractorProvider,
      );
      final collections = await getMovieCollectionsInteractor();

      info('Successfully fetched movie collections: $collections');

      state = MovieCollectionsState.data(collections: collections);
    } on AppException catch (e) {
      error('Failed to fetch movie collections', e);

      state = MovieCollectionsState.error(e);
    }
  }

  Future<void> _createMovieCollection(String name) async {
    info('Creating a new movie collection with name: $name');

    try {
      final createMovieCollectionInteractor = ref.read(
        createMovieCollectionInteractorProvider,
      );

      final newCollection = await createMovieCollectionInteractor(
        MovieCollection(name: name),
      );

      info('Successfully created a new movie collection: $newCollection');

      state = switch (state) {
        final MovieCollectionsStateData state => MovieCollectionsState.data(
          collections: [...state.collections, newCollection],
        ),
        _ => throw StateError('Invalid state for adding a new collection'),
      };
    } on AppException catch (e) {
      // TODO:(yhalivets) Handle error properly (e.g., show a snackbar)
      error('Failed to create a new movie collection', e);
    }
  }
}
