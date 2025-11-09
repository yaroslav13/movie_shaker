import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movies_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/unlike_movie_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unlike_movie_interactor_provider.g.dart';

@riverpod
UnlikeMovieInteractor unlikeMovieInteractor(Ref ref) {
  final moviesRepository = ref.watch(moviesRepositoryProvider);

  return UnlikeMovieInteractor(moviesRepository);
}
