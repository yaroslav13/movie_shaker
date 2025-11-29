import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movie_collections_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/get_movie_collections_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_collections_interactor_provider.g.dart';

@riverpod
GetMovieCollectionsInteractor getMovieCollectionsInteractor(Ref ref) {
  final movieCollectionsRepository = ref.watch(
    movieCollectionsRepositoryProvider,
  );

  return GetMovieCollectionsInteractor(movieCollectionsRepository);
}
