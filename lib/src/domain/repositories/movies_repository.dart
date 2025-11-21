import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';
import 'package:movie_shaker/src/domain/entities/movies_query/movies_query.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/entities/search_query/search_query.dart';

abstract interface class MoviesRepository {
  Future<PaginationPage<Movie>> getMovies(MoviesQuery query);

  Future<PaginationPage<Movie>> getMoviesByQuery(FilterlessSearchQuery query);

  Future<MovieDetails> getMovieDetails(int movieId);

  Future<List<Movie>> getMoviesByCollection(MovieCollection collection);

  Future<void> addMovieToCollection(Movie movie, MovieCollection collection);

  Future<void> removeMovieFromCollection(
    Movie movie,
    MovieCollection collection,
  );
}
