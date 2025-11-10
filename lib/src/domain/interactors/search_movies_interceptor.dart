import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/entities/search_query/search_query.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class SearchMoviesInterceptor
    implements Interactor<PaginationPage<Movie>, SearchQuery> {
  const SearchMoviesInterceptor(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<PaginationPage<Movie>> call(SearchQuery param) async {
    return _moviesRepository.getMoviesByQuery(param);
  }
}
