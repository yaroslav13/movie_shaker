import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movie_collections_repository_provider.dart';
import 'package:movie_shaker/src/di/repositories/movies_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/get_movie_collections_details_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_collections_details_interactor_provider.g.dart';

@riverpod
GetMovieCollectionsDetailsInteractor getMovieCollectionsDetailsInteractor(
  Ref ref,
) {
  final movieCollectionsRepository = ref.watch(
    movieCollectionsRepositoryProvider,
  );

  final moviesRepository = ref.watch(moviesRepositoryProvider);

  return GetMovieCollectionsDetailsInteractor(
    movieCollectionsRepository,
    moviesRepository,
  );
}
