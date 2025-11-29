import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movies_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/remove_movie_from_collection_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remove_movie_from_collection_interactor_provider.g.dart';

@riverpod
RemoveMovieFromCollectionInteractor removeMovieFromCollectionInteractor(
  Ref ref,
) {
  final moviesRepository = ref.watch(moviesRepositoryProvider);

  return RemoveMovieFromCollectionInteractor(moviesRepository);
}
