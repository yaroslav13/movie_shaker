import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/entities/search_query/search_query.dart';

abstract interface class MoviesRepository {
  Future<PaginationPage<Movie>> getMovies(PageNumber pageNumber);

  Future<PaginationPage<Movie>> getMoviesByQuery(SearchQuery query);

  Future<MovieDetails> getMovieDetails(int movieId);
}
