import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movies_query/movies_query.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class GetMoviesInteractor
    implements Interactor<PaginationPage<Movie>, MoviesQuery> {
  const GetMoviesInteractor(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<PaginationPage<Movie>> call(MoviesQuery param) async {
    return _moviesRepository.getMovies(param);
  }
}
