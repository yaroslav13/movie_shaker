import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movie_genres_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/get_movie_genres_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_genres_interactor_provider.g.dart';

@riverpod
GetMovieGenresInteractor getMovieGenresInteractor(Ref ref) {
  final genresRepository = ref.watch(movieGenresRepositoryProvider);

  return GetMovieGenresInteractor(genresRepository);
}
