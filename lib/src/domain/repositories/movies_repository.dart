import 'package:movie_shaker/src/domain/entities/movies/movie.dart';

abstract interface class MoviesRepository {
  // TODO(yhalivets): Implement pagination
  Future<List<Movie>> getMovies();
}
