import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/entities/search_query/search_query.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class SearchMoviesInterceptor
    implements Interactor<PaginationPage<Movie>, FilterRichSearchQuery> {
  const SearchMoviesInterceptor(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<PaginationPage<Movie>> call(FilterRichSearchQuery param) async {
    final searchQuery = FilterlessSearchQuery(
      query: param.query,
      page: param.page,
    );

    final moviesPage = await _moviesRepository.getMoviesByQuery(
      searchQuery,
    );

    final shouldApplyFilters = param.filter.isFilterSet;
    if (!shouldApplyFilters) {
      return moviesPage;
    }

    final selectedGenreIds = param.filter.genres
        .map((genre) => genre.id)
        .toSet();

    final filteredMovies = moviesPage.items.where(
      (movie) {
        final movieGenreIds = movie.genreIds.toSet();

        return movieGenreIds.intersection(selectedGenreIds).isNotEmpty;
      },
    ).toList();

    return PaginationPage<Movie>(
      items: filteredMovies,
      pageNumber: moviesPage.pageNumber,
      isLastPage: moviesPage.isLastPage,
    );
  }
}
