import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movie_collections_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/create_movie_collection_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_movie_collection_interactor_provider.g.dart';

@riverpod
CreateMovieCollectionInteractor createMovieCollectionInteractor(Ref ref) {
  final movieCollectionsRepository = ref.watch(
    movieCollectionsRepositoryProvider,
  );

  return CreateMovieCollectionInteractor(movieCollectionsRepository);
}
