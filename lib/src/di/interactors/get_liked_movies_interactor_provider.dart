import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movies_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/get_liked_movies_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_liked_movies_interactor_provider.g.dart';

@riverpod
GetLikedMoviesInteractor getLikedMoviesInteractor(Ref ref) {
  final moviesRepository = ref.watch(moviesRepositoryProvider);

  return GetLikedMoviesInteractor(moviesRepository);
}
