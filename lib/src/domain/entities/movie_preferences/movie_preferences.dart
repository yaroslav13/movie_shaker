import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/imdb_rating/imdb_rating.dart';
import 'package:movie_shaker/src/domain/entities/movie_duration/movie_duration.dart';
import 'package:movie_shaker/src/domain/entities/release_years_range/release_years_range.dart';

part 'movie_preferences.freezed.dart';

@freezed
sealed class MoviePreferences with _$MoviePreferences {
  const factory MoviePreferences({
    required ImdbRating imdbRating,
    required MovieDuration movieDuration,
    required ReleaseYearsRange releaseYearsRange,
  }) = _MoviePreferences;
}
