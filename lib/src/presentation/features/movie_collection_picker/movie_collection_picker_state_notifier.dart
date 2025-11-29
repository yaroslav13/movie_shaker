import 'dart:async';

import 'package:logger/logger.dart';
import 'package:movie_shaker/src/di/interactors/add_movie_to_collection_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/get_movie_collections_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/remove_movie_from_collection_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/select_collections_containing_movie_interactor_provider.dart';
import 'package:movie_shaker/src/di/logger/logger_provider.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection_entry/movie_collection_entry.dart';
import 'package:movie_shaker/src/domain/entities/select_query/select_collection_query.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/movie_collection_picker/movie_collection_picker_state.dart';
import 'package:movie_shaker/src/utils/logger_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_collection_picker_state_notifier.g.dart';

@riverpod
class MovieCollectionPickerStateNotifier
    extends _$MovieCollectionPickerStateNotifier
    with LoggerMixin {
  @override
  MovieCollectionPickerState build({required Movie movie}) =>
      const MovieCollectionPickerState.loading();

  @override
  Logger get logger => ref.read(loggerProvider);

  void onStart() {
    unawaited(_fetchMovieCollections());
  }

  void onRetryPressed() {
    state = const MovieCollectionPickerState.loading();

    unawaited(_fetchMovieCollections());
  }

  void onCollectionSelected(MovieCollection collection) {
    final isSelected = switch (state) {
      final MovieCollectionPickerStateData data =>
        data.selectedCollections.contains(collection),
      _ => false,
    };

    if (isSelected) {
      unawaited(_removeMovieFromCollection(collection));
    } else {
      unawaited(_addMovieToCollection(collection));
    }
  }

  Future<void> _fetchMovieCollections() async {
    try {
      final getMovieCollectionsInteractor = ref.read(
        getMovieCollectionsInteractorProvider,
      );

      final selectCollectionsContainingMovieInteractor = ref.read(
        selectCollectionsContainingMovieInteractorProvider,
      );

      final collections = await getMovieCollectionsInteractor();

      final selectQuery = SelectCollectionQuery.byMovieId(
        collections: collections,
        movieId: movie.id,
      );

      final selectedCollections =
          await selectCollectionsContainingMovieInteractor(selectQuery);

      state = MovieCollectionPickerState.data(
        allCollections: collections,
        selectedCollections: selectedCollections,
      );
    } on SemanticException catch (e) {
      state = MovieCollectionPickerState.error(error: e);
    }
  }

  Future<void> _addMovieToCollection(
    MovieCollection selectedCollection,
  ) async {
    try {
      state = switch (state) {
        final MovieCollectionPickerStateData state => state.copyWith(
          selectedCollections: [
            ...state.selectedCollections,
            selectedCollection,
          ],
        ),
        _ => state,
      };

      final addMovieToCollectionInteractor = ref.read(
        addMovieToCollectionInteractorProvider,
      );

      await addMovieToCollectionInteractor(
        MovieCollectionEntry(collection: selectedCollection, movie: movie),
      );
    } on SemanticException catch (e) {
      error(
        'Error adding movie to collection: ${selectedCollection.name}',
        e,
      );

      state = switch (state) {
        final MovieCollectionPickerStateData state => state.copyWith(
          selectedCollections: state.selectedCollections
              .where((collection) => collection != selectedCollection)
              .toList(),
        ),
        _ => state,
      };
    }
  }

  Future<void> _removeMovieFromCollection(
    MovieCollection selectedCollection,
  ) async {
    try {
      state = switch (state) {
        final MovieCollectionPickerStateData state => state.copyWith(
          selectedCollections: state.selectedCollections
              .where((collection) => collection != selectedCollection)
              .toList(),
        ),
        _ => state,
      };

      final removeMovieFromCollectionInteractor = ref.read(
        removeMovieFromCollectionInteractorProvider,
      );

      await removeMovieFromCollectionInteractor(
        MovieCollectionEntry(collection: selectedCollection, movie: movie),
      );
    } on SemanticException catch (e) {
      error(
        'Error removing movie from collection: ${selectedCollection.name}',
        e,
      );

      state = switch (state) {
        final MovieCollectionPickerStateData state => state.copyWith(
          selectedCollections: [
            ...state.selectedCollections,
            selectedCollection,
          ],
        ),
        _ => state,
      };
    }
  }
}
