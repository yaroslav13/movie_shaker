import 'dart:async';

import 'package:movie_shaker/src/di/interactors/get_movie_collections_interactor_provider.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/movie_collections/movie_collections_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_collections_state_notifier.g.dart';

@riverpod
class MovieCollectionsStateNotifier extends _$MovieCollectionsStateNotifier {
  @override
  MovieCollectionsState build() => const MovieCollectionsState.loading();

  void onStart() {
    unawaited(_fetchMovieCollections());
  }

  Future<void> _fetchMovieCollections() async {
    try {
      final getMovieCollectionsInteractor = ref.read(
        getMovieCollectionsInteractorProvider,
      );
      final collections = await getMovieCollectionsInteractor();

      state = MovieCollectionsState.data(collections: collections);
    } on AppException catch (e) {
      state = MovieCollectionsState.error(e);
    }
  }
}
