import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/imdb_rating/imdb_rating.dart';
import 'package:movie_shaker/src/domain/entities/movie_duration/movie_duration.dart';
import 'package:movie_shaker/src/domain/entities/release_years_range/release_years_range.dart';

part 'advanced_movie_filters_state.freezed.dart';

@freezed
sealed class AdvancedMovieFiltersState with _$AdvancedMovieFiltersState {
  const factory AdvancedMovieFiltersState({
    required ReleaseYearsRange selectedReleaseYears,
    required MovieDuration selectedMovieDuration,
    required ImdbRating selectedImdbRating,
    @Default(false) bool isApplyingFilters,
  }) = _AdvancedMovieFiltersState;

  const AdvancedMovieFiltersState._();

  int get maxMovieDurationInMinutes => MovieDuration.maxDurationInMinutes;

  int get minMovieDurationInMinutes => MovieDuration.minDurationInMinutes;

  double get maxImdbRatingValue => ImdbRating.maxRatingValue;

  double get minImdbRatingValue => ImdbRating.minRatingValue;

  int get minReleaseYear => ReleaseYearsRange.minYear;
  int get maxReleaseYear => ReleaseYearsRange.maxYear;
}
