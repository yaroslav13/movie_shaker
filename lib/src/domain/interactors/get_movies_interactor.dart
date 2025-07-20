import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class GetMoviesInteractor implements NoArgumentInteractor<List<Movie>> {
  GetMoviesInteractor(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<List<Movie>> call() async {
    return _moviesRepository.getMovies();
  }
}
