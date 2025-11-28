import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class GetMovieDetailsByIdInteractor
    implements Interactor<MovieDetails, int> {
  const GetMovieDetailsByIdInteractor(this._movieRepository);

  final MoviesRepository _movieRepository;

  @override
  Future<MovieDetails> call(int movieId) async {
    try {
      return await _movieRepository.getMovieDetails(movieId);
    } on InfrastructureException catch (e, s) {
      Error.throwWithStackTrace(SemanticException(e), s);
    }
  }
}
