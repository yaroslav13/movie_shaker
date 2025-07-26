import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';

abstract interface class MoviesRepository {
  Future<PaginationPage<Movie>> getMovies(PageNumber pageNumber);
}
