import 'package:movie_shaker/src/domain/entities/movie_preferences/movie_preferences.dart';

abstract interface class MoviePreferencesRepository {
  Future<MoviePreferences> getMoviePreferences();

  Future<void> saveMoviePreferences(MoviePreferences moviePreferences);
}
