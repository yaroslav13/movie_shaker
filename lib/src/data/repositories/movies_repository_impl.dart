import 'package:dio/dio.dart';
import 'package:movie_shaker/src/data/datasources/movies/movies_datasource.dart';
import 'package:movie_shaker/src/data/mappers/movie_mapper.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class MoviesRepositoryImpl implements MoviesRepository {
  const MoviesRepositoryImpl(this._moviesDatasource, this._movieMapper);

  final MoviesDatasource _moviesDatasource;
  final MovieMapper _movieMapper;

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await _moviesDatasource.getMovies(page: 1);

      return response.results.map(_movieMapper.map).toList();
    } on DioException catch (e, s) {
      final error = e.error;
      Error.throwWithStackTrace(error ?? const UnknownNetworkException(), s);
    }
  }
}
