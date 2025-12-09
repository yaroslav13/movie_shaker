import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movies_filter/movies_filter.dart';

part 'select_movie_query.freezed.dart';

@freezed
sealed class SelectMovieQuery with _$SelectMovieQuery {
  factory SelectMovieQuery({
    required List<Movie> movies,
    MoviesFilter? filter,
  }) = _SelectMovieQuery;
}
