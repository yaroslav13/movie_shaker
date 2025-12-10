import 'dart:math';

import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/select_query/select_movie_query.dart';

final class SelectSuggestedMovieInteractor
    implements Interactor<Movie, SelectMovieQuery> {
  const SelectSuggestedMovieInteractor();

  @override
  Future<Movie> call(SelectMovieQuery param) async {
    final movies = param.movies;

    final random = Random();

    return movies[random.nextInt(movies.length)];
  }
}
