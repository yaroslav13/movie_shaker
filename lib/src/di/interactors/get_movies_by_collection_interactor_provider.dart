import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movies_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/get_movies_by_collection_id_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movies_by_collection_interactor_provider.g.dart';

@riverpod
GetMoviesByCollectionInteractor getMoviesByCollectionInteractor(
  Ref ref,
) {
  final moviesRepository = ref.watch(moviesRepositoryProvider);

  return GetMoviesByCollectionInteractor(moviesRepository);
}
