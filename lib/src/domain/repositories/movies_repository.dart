import 'package:movie_shaker/src/domain/annotations/throws.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';
import 'package:movie_shaker/src/domain/entities/movies_query/movies_query.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/entities/search_query/search_query.dart';
import 'package:movie_shaker/src/domain/exceptions/cache_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/network_exception.dart';

abstract interface class MoviesRepository {
  @Throws([NetworkException])
  Future<PaginationPage<Movie>> getMovies(MoviesQuery query);

  @Throws([NetworkException])
  Future<PaginationPage<Movie>> getMoviesByQuery(FilterlessSearchQuery query);

  @Throws([NetworkException])
  Future<MovieDetails> getMovieDetails(int movieId);

  @Throws([CacheReadException])
  Future<List<Movie>> getMoviesByCollection(MovieCollection collection);

  @Throws([CacheWriteException])
  Future<void> addMovieToCollection(Movie movie, MovieCollection collection);

  @Throws([CacheDeleteException])
  Future<void> removeMovieFromCollection(
    Movie movie,
    MovieCollection collection,
  );
}
