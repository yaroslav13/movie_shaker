import 'dart:async';

import 'package:logger/logger.dart';
import 'package:movie_shaker/src/di/interactors/create_movie_collection_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/get_movie_collections_details_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/remove_movie_collection_interactor_provider.dart';
import 'package:movie_shaker/src/di/logger/logger_provider.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/collection_modification_exception.dart';
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

  void onRemoveCollectionPressed(String name) {
    unawaited(_removeMovieCollection(name));
  }

  void onErrorSnackBarClosed() {
    info('Error snack bar closed');

    state = switch (state) {
      final MovieCollectionsStateData state => state.copyWith(
        collectionChangeFailure: null,
      ),
      _ => state,
    };
  }

  Future<void> _fetchMovieCollections() async {
    info('Fetching movie collections');

    try {
      final getMovieCollectionsDetailsInteractor = ref.read(
        getMovieCollectionsDetailsInteractorProvider,
      );
      final collections = await getMovieCollectionsDetailsInteractor();

      info('Successfully fetched movie collections: $collections');

      state = MovieCollectionsState.data(collections: collections);
    } on SemanticException catch (e) {
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
        final MovieCollectionsStateData state => state.copyWith(
          collections: [...state.collections, newCollection],
        ),
        _ => throw StateError('Invalid state for adding a new collection'),
      };
    } on CollectionCreationException catch (e) {
      error('Failed to create a new movie collection', e);

      state = switch (state) {
        final MovieCollectionsStateData state => state.copyWith(
          collectionChangeFailure: e,
        ),
        _ => state,
      };
    }
  }

  Future<void> _removeMovieCollection(String name) async {
    info('Removing movie collection with name: $name');

    try {
      final removeMovieCollectionInteractor = ref.read(
        removeMovieCollectionInteractorProvider,
      );

      final collections = switch (state) {
        final MovieCollectionsStateData state => state.collections,
        _ => throw StateError('Invalid state for removing a collection'),
      };

      final collectionToRemove = collections.firstWhere(
        (collection) => collection.name == name,
      );

      await removeMovieCollectionInteractor(collectionToRemove);

      info('Successfully removed movie collection: $name');

      state = switch (state) {
        final MovieCollectionsStateData state => state.copyWith(
          collections: state.collections
              .where((collection) => collection.name != name)
              .toList(),
        ),
        _ => throw StateError('Invalid state for removing a collection'),
      };
    } on CollectionRemovalException catch (e) {
      error('Failed to remove movie collection', e);

      state = switch (state) {
        final MovieCollectionsStateData state => state.copyWith(
          collectionChangeFailure: e,
        ),
        _ => state,
      };
    }
  }
}
