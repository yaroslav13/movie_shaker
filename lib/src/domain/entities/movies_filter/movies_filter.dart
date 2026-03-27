import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';
import 'package:movie_shaker/src/domain/entities/imdb_rating/imdb_rating.dart';
import 'package:movie_shaker/src/domain/entities/movie_duration/movie_duration.dart';
import 'package:movie_shaker/src/domain/entities/release_years_range/release_years_range.dart';

part 'movies_filter.freezed.dart';

@freezed
sealed class MoviesFilter with _$MoviesFilter {
  const factory MoviesFilter({
    @Default([]) List<Genre> genres,
    MovieDuration? movieDuration,
    ImdbRating? imdbRating,
    ReleaseYearsRange? releaseYearsRange,
  }) = _MoviesFilter;

  const MoviesFilter._();

  bool get isFilterSet =>
      genres.isNotEmpty ||
      movieDuration != null ||
      imdbRating != null ||
      releaseYearsRange != null;
}
