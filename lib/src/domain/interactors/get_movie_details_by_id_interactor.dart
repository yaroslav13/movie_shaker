import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class GetMovieDetailsByIdInteractor
    implements Interactor<MovieDetails, int> {
  const GetMovieDetailsByIdInteractor(this._movieRepository);

  final MoviesRepository _movieRepository;

  @override
  Future<MovieDetails> call(int movieId) async {
    return _movieRepository.getMovieDetails(movieId);
  }
}
