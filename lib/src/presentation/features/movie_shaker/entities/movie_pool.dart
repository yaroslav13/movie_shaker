import 'package:flutter/foundation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movies_filter/movies_filter.dart';

@immutable
sealed class MoviePool {
  const MoviePool();

  factory MoviePool.global({MoviesFilter? filter}) {
    return GlobalMoviePool(filter: filter);
  }

  factory MoviePool.local(List<Movie> movies) {
    return LocalMoviePool(movies: movies);
  }
}

final class GlobalMoviePool extends MoviePool {
  const GlobalMoviePool({this.filter});

  final MoviesFilter? filter;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is GlobalMoviePool && other.filter == filter;
  }

  @override
  int get hashCode => filter.hashCode;
}

final class LocalMoviePool extends MoviePool {
  const LocalMoviePool({required this.movies});

  final List<Movie> movies;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is LocalMoviePool && listEquals(other.movies, movies);
  }

  @override
  int get hashCode => Object.hashAll(movies);
}
