import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie_preferences/movie_preferences.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movie_preferences_repository.dart';

final class GetMovieFiltersInteractor
    implements NoArgumentInteractor<MoviePreferences?> {
  const GetMovieFiltersInteractor(this._moviePreferencesRepository);

  final MoviePreferencesRepository _moviePreferencesRepository;

  @override
  Future<MoviePreferences> call() async {
    try {
      return await _moviePreferencesRepository.getMoviePreferences();
    } on InfrastructureException catch (e, s) {
      Error.throwWithStackTrace(SemanticException(e), s);
    }
  }
}
