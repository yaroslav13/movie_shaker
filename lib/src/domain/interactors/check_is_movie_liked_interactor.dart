import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class CheckIsMovieLikedInteractor implements Interactor<bool, Movie> {
  const CheckIsMovieLikedInteractor(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<bool> call(Movie param) async {
    final favoritesMovies = await _moviesRepository.getMoviesByCollection(
      MovieCollection.favorites,
    );

    return favoritesMovies.any((movie) => movie.id == param.id);
  }
}
