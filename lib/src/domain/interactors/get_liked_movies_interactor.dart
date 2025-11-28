import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class GetLikedMoviesInteractor
    implements NoArgumentInteractor<List<Movie>> {
  const GetLikedMoviesInteractor(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<List<Movie>> call() async {
    try {
      return await _moviesRepository.getMoviesByCollection(
        MovieCollection.favorites,
      );
    } on InfrastructureException catch (e, s) {
      Error.throwWithStackTrace(SemanticException(e), s);
    }
  }
}
