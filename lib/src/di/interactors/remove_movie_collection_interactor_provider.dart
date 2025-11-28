import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movie_collections_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/remove_movie_collection_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remove_movie_collection_interactor_provider.g.dart';

@riverpod
RemoveMovieCollectionInteractor removeMovieCollectionInteractor(Ref ref) {
  final movieCollectionsRepository = ref.watch(
    movieCollectionsRepositoryProvider,
  );

  return RemoveMovieCollectionInteractor(movieCollectionsRepository);
}
