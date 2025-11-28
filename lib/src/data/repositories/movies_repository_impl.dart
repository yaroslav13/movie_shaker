import 'package:dio/dio.dart';
import 'package:movie_shaker/src/data/datasources/local/movie_collection_entries_local_datasource.dart';
import 'package:movie_shaker/src/data/datasources/local/movies_local_datasource.dart';
import 'package:movie_shaker/src/data/datasources/remote/movies_remote_datasource.dart';
import 'package:movie_shaker/src/data/mappers/dbo/movie_dbo_mapper.dart';
import 'package:movie_shaker/src/data/mappers/dto/movie_details_dto_mapper.dart';
import 'package:movie_shaker/src/data/mappers/dto/movie_dto_mapper.dart';
import 'package:movie_shaker/src/data/mappers/dto/reversed_movies_filter_dto_mapper.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';
import 'package:movie_shaker/src/domain/entities/movies_query/movies_query.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/entities/search_query/search_query.dart';
import 'package:movie_shaker/src/domain/exceptions/cache_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/network_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class MoviesRepositoryImpl implements MoviesRepository {
  const MoviesRepositoryImpl(
    this._moviesRemoteDatasource,
    this._moviesLocalDatasource,
    this._movieCollectionEntriesLocalDatasource,
    this._movieDtoMapper,
    this._movieDboMapper,
    this._movieDetailsDtoMapper,
    this._reversedMoviesFilterMapper,
  );

  final MoviesRemoteDatasource _moviesRemoteDatasource;
  final MoviesLocalDatasource _moviesLocalDatasource;
  final MovieCollectionEntriesLocalDatasource
  _movieCollectionEntriesLocalDatasource;

  final MovieDtoMapper _movieDtoMapper;
  final MovieDboMapper _movieDboMapper;
  final MovieDetailsDtoMapper _movieDetailsDtoMapper;
  final ReversedMoviesFilterMapper _reversedMoviesFilterMapper;

  @override
  Future<PaginationPage<Movie>> getMovies(MoviesQuery query) async {
    try {
      final MoviesQuery(:pageNumber, :filter) = query;
      final dtoFilter = _reversedMoviesFilterMapper.map(filter);

      final response = await _moviesRemoteDatasource.discoverMovies(
        page: pageNumber,
        genres: dtoFilter?.genres,
      );

      final movies = response.results
          .map(_movieDtoMapper.map)
          .nonNulls
          .toList();

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
  Future<PaginationPage<Movie>> getMoviesByQuery(
    FilterlessSearchQuery query,
  ) async {
    try {
      final SearchQuery(query: queryText, page: pageNumber) = query;

      final response = await _moviesRemoteDatasource.searchMovies(
        query: queryText,
        page: pageNumber,
      );

      final movies = response.results
          .map(_movieDtoMapper.map)
          .nonNulls
          .toList();

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
      final response = await _moviesRemoteDatasource.getMovieDetails(
        movieId: movieId,
      );

      final movieDetails = _movieDetailsDtoMapper.map(response);

      if (movieDetails == null) {
        throw const BrokenResponseContentException();
      }

      return movieDetails;
    } on DioException catch (e, s) {
      final error = e.error;
      Error.throwWithStackTrace(error ?? const UnknownNetworkException(), s);
    }
  }

  @override
  Future<List<Movie>> getMoviesByCollection(MovieCollection collection) async {
    final movieCollectionEntries = await _movieCollectionEntriesLocalDatasource
        .getMovieCollectionsEntries(collectionName: collection.name);

    final movies = <Movie>[];
    try {
      await Future.wait(
        eagerError: true,
        movieCollectionEntries.map(
          (entry) async {
            final movieDbo = await _moviesLocalDatasource.getMovie(
              id: entry.movieId,
            );

            final movie = _movieDboMapper.map(movieDbo);
            if (movie != null) {
              movies.add(movie);
            }
          },
        ),
      );

      return movies;
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const CacheReadException(),
        s,
      );
    }
  }

  @override
  Future<void> addMovieToCollection(
    Movie movie,
    MovieCollection collection,
  ) async {
    try {
      final movieDbo = _movieDboMapper.reverseMap(movie);
      if (movieDbo == null) {
        throw const CacheWriteException();
      }

      await _moviesLocalDatasource.saveMovie(movie: movieDbo);

      await _movieCollectionEntriesLocalDatasource.saveMovieCollectionEntry(
        collectionName: collection.name,
        movieId: movie.id,
      );
    } on CacheWriteException {
      rethrow;
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const CacheWriteException(),
        s,
      );
    }
  }

  @override
  Future<void> removeMovieFromCollection(
    Movie movie,
    MovieCollection collection,
  ) async {
    try {
      return await _movieCollectionEntriesLocalDatasource
          .deleteMovieCollectionEntry(
            collectionName: collection.name,
            movieId: movie.id,
          );
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const CacheDeleteException(),
        s,
      );
    }
  }
}
