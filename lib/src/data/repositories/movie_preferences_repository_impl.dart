import 'dart:convert';

import 'package:movie_shaker/src/data/entities/movie_preferences/movie_preferences_dto.dart';
import 'package:movie_shaker/src/data/mappers/dto/movie_preferences_dto_mapper.dart';
import 'package:movie_shaker/src/domain/entities/imdb_rating/imdb_rating.dart';
import 'package:movie_shaker/src/domain/entities/movie_duration/movie_duration.dart';
import 'package:movie_shaker/src/domain/entities/movie_preferences/movie_preferences.dart';
import 'package:movie_shaker/src/domain/entities/release_years_range/release_years_range.dart';
import 'package:movie_shaker/src/domain/exceptions/cache_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movie_preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _moviePreferencesKey = 'movie_preferences';

final class MoviePreferencesRepositoryImpl
    implements MoviePreferencesRepository {
  MoviePreferencesRepositoryImpl(
    this._sharedPreferences,
    this._moviePreferencesDtoMapper,
  );

  final SharedPreferencesAsync _sharedPreferences;
  final MoviePreferencesDtoMapper _moviePreferencesDtoMapper;

  static final _defaultPreferences = MoviePreferences(
    imdbRating: const ImdbRating(value: 5),
    movieDuration: MovieDuration.max(),
    releaseYearsRange: ReleaseYearsRange(
      from: DateTime.now().year - 3,
      to: DateTime.now().year - 1,
    ),
  );

  @override
  Future<MoviePreferences> getMoviePreferences() async {
    try {
      final moviePreferencesDtoJson = await _sharedPreferences.getString(
        _moviePreferencesKey,
      );

      if (moviePreferencesDtoJson == null) {
        return _defaultPreferences;
      }

      final moviePreferencesDto = MoviePreferencesDto.fromJson(
        jsonDecode(moviePreferencesDtoJson) as Map<String, dynamic>,
      );

      final moviePreferences = _moviePreferencesDtoMapper.map(
        moviePreferencesDto,
      );

      return moviePreferences ?? _defaultPreferences;
    } on Exception catch (e, s) {
      Error.throwWithStackTrace(
        const CacheReadException(),
        s,
      );
    }
  }

  @override
  Future<void> saveMoviePreferences(MoviePreferences moviePreferences) async {
    try {
      final moviePreferencesDto = _moviePreferencesDtoMapper.reverseMap(
        moviePreferences,
      );

      if (moviePreferencesDto == null) {
        throw const CacheWriteException();
      }

      await _sharedPreferences.setString(
        _moviePreferencesKey,
        jsonEncode(moviePreferencesDto.toJson()),
      );
    } on Exception catch (e, s) {
      Error.throwWithStackTrace(
        const CacheWriteException(),
        s,
      );
    }
  }
}
