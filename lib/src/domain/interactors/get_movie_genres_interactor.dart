import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movie_genres_repository.dart';

final class GetMovieGenresInteractor
    implements NoArgumentInteractor<List<Genre>> {
  const GetMovieGenresInteractor(this._movieGenresRepository);

  final MovieGenresRepository _movieGenresRepository;

  @override
  Future<List<Genre>> call() async {
    try {
      return await _movieGenresRepository.getMovieGenres();
    } on InfrastructureException catch (e, s) {
      Error.throwWithStackTrace(SemanticException(e), s);
    }
  }
}
