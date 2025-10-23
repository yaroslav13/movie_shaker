import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movies_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/search_movies_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_movies_interactor_provider.g.dart';

@riverpod
SearchMoviesInterceptor searchMoviesInteractor(Ref ref) {
  final moviesRepository = ref.watch(moviesRepositoryProvider);

  return SearchMoviesInterceptor(moviesRepository);
}
