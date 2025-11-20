import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/entities/search_query/search_query.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class SearchMoviesInterceptor
    implements Interactor<PaginationPage<Movie>, SearchQuery> {
  const SearchMoviesInterceptor(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<PaginationPage<Movie>> call(SearchQuery param) async {
    final moviesPage = await _moviesRepository.getMoviesByQuery(param);
    final selectedGenreIds = param.filter?.genres?.map((e) => e.id);

    if (selectedGenreIds == null || selectedGenreIds.isEmpty) {
      return moviesPage;
    }

    final filteredMovies = moviesPage.items.where(
      (movie) {
        final movieGenreIds = movie.genreIds.toSet();

        return selectedGenreIds.toSet().intersection(movieGenreIds).isNotEmpty;
      },
    ).toList();

    return moviesPage.copyWith(items: filteredMovies);
  }
}
