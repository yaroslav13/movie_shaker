import 'package:movie_shaker/src/di/interactors/get_movies_interactor_provider.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_list.g.dart';

@riverpod
class MovieList extends _$MovieList {
  @override
  Future<List<Movie>> build() async {
    final getMoviesInteractor = ref.watch(getMoviesInteractorProvider);

    return getMoviesInteractor();
  }
}
