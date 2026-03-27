import 'package:movie_shaker/src/data/entities/movie_preferences/movie_preferences_dto.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/entities/imdb_rating/imdb_rating.dart';
import 'package:movie_shaker/src/domain/entities/movie_duration/movie_duration.dart';
import 'package:movie_shaker/src/domain/entities/movie_preferences/movie_preferences.dart';
import 'package:movie_shaker/src/domain/entities/release_years_range/release_years_range.dart';

final class MoviePreferencesDtoMapper
    implements BaseBiMapper<MoviePreferencesDto, MoviePreferences> {
  @override
  MoviePreferences? map(MoviePreferencesDto? argument) {
    if (argument == null) {
      return null;
    }

    final minImdbRating = argument.minImdbRating;
    final minMovieDurationInMinutes = argument.minMovieDurationInMinutes;
    final minReleaseYear = argument.minReleaseYear;
    final maxReleaseYear = argument.maxReleaseYear;

    return MoviePreferences(
      imdbRating: ImdbRating(value: minImdbRating),
      movieDuration: MovieDuration(valueInMinutes: minMovieDurationInMinutes),
      releaseYearsRange: ReleaseYearsRange(
        from: minReleaseYear,
        to: maxReleaseYear,
      ),
    );
  }

  @override
  MoviePreferencesDto? reverseMap(MoviePreferences? argument) {
    if (argument == null) {
      return null;
    }

    return MoviePreferencesDto(
      minImdbRating: argument.imdbRating.value,
      minMovieDurationInMinutes: argument.movieDuration.valueInMinutes,
      minReleaseYear: argument.releaseYearsRange.from,
      maxReleaseYear: argument.releaseYearsRange.to,
    );
  }
}
