import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class CheckIsMovieLikedInteractor implements Interactor<bool, int> {
  const CheckIsMovieLikedInteractor(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<bool> call(int param) async {
    try {
      final favoritesMovies = await _moviesRepository.getMoviesByCollection(
        MovieCollection.favorites,
      );

      return favoritesMovies.any((movie) => movie.id == param);
    } on InfrastructureException catch (e, s) {
      Error.throwWithStackTrace(SemanticException(e), s);
    }
  }
}
