import 'dart:math';

import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movies_filter/movies_filter.dart';
import 'package:movie_shaker/src/domain/entities/movies_query/movies_query.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class GetMovieSuggestionInteractor
    implements Interactor<Movie, MoviesFilter> {
  const GetMovieSuggestionInteractor(
    this._moviesRepository,
  );

  final MoviesRepository _moviesRepository;

  @override
  Future<Movie> call(MoviesFilter param) async {
    try {
      final randomMoviesPage = await _getRandomMoviesPage(
        filter: param.isFilterSet ? param : null,
      );

      final randomMovie = _chooseRandomMovie(randomMoviesPage);

      return randomMovie;
    } on InfrastructureException catch (e, s) {
      Error.throwWithStackTrace(SemanticException(e), s);
    }
  }

  Future<List<Movie>> _getRandomMoviesPage({
    required MoviesFilter? filter,
  }) async {
    final random = Random();
    final pageNumber = random.nextInt(PaginationPage.maxPageNumber);
    final moviesPage = await _moviesRepository.getMovies(
      MoviesQuery(pageNumber: pageNumber, filter: filter),
    );

    return moviesPage.items;
  }

  Movie _chooseRandomMovie(List<Movie> movies) {
    final random = Random();
    final index = random.nextInt(movies.length - 1);

    return movies[index];
  }
}
