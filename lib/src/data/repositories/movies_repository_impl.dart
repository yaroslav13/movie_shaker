import 'package:dio/dio.dart';
import 'package:movie_shaker/src/data/datasources/movies/movies_datasource.dart';
import 'package:movie_shaker/src/data/mappers/movie_details_mapper.dart';
import 'package:movie_shaker/src/data/mappers/movie_mapper.dart';
import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/entities/search_query/search_query.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class MoviesRepositoryImpl implements MoviesRepository {
  const MoviesRepositoryImpl(
    this._moviesDatasource,
    this._movieMapper,
    this._movieDetailsMapper,
  );

  final MoviesDatasource _moviesDatasource;

  final MovieMapper _movieMapper;
  final MovieDetailsMapper _movieDetailsMapper;

  @override
  Future<PaginationPage<Movie>> getMovies(PageNumber pageNumber) async {
    try {
      final response = await _moviesDatasource.discoverMovies(page: pageNumber);

      final movies = response.results.map(_movieMapper.map).nonNulls.toList();

      return PaginationPage<Movie>(
        items: movies,
        pageNumber: response.page,
        isLastPage: response.page >= response.totalPages,
      );
    } on DioException catch (e, s) {
      final error = e.error;
      Error.throwWithStackTrace(error ?? const UnknownNetworkException(), s);
    }
  }

  @override
  Future<PaginationPage<Movie>> getMoviesByQuery(SearchQuery query) async {
    try {
      final SearchQuery(query: queryText, page: pageNumber) = query;
      final response = await _moviesDatasource.searchMovies(
        query: queryText,
        page: pageNumber,
      );

      final movies = response.results.map(_movieMapper.map).nonNulls.toList();

      return PaginationPage<Movie>(
        items: movies,
        pageNumber: response.page,
        isLastPage: response.page >= response.totalPages,
      );
    } on DioException catch (e, s) {
      final error = e.error;
      Error.throwWithStackTrace(error ?? const UnknownNetworkException(), s);
    }
  }

  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    try {
      final response = await _moviesDatasource.getMovieDetails(
        movieId: movieId,
      );

      final movieDetails = _movieDetailsMapper.map(response);

      if (movieDetails == null) {
        throw const MovieDetailsNotFoundException();
      }

      return movieDetails;
    } on DioException catch (e, s) {
      final error = e.error;
      Error.throwWithStackTrace(error ?? const UnknownNetworkException(), s);
    }
  }
}
