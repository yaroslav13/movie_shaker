import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movie_collections_repository_provider.dart';
import 'package:movie_shaker/src/di/repositories/movies_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/like_movie_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_movie_interactor_provider.g.dart';

@riverpod
LikeMovieInteractor likeMovieInteractor(Ref ref) {
  final moviesRepository = ref.watch(moviesRepositoryProvider);
  final movieCollectionsRepository = ref.watch(
    movieCollectionsRepositoryProvider,
  );

  return LikeMovieInteractor(
    moviesRepository,
    movieCollectionsRepository,
  );
}
