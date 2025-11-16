import 'package:dio/dio.dart';
import 'package:movie_shaker/src/data/datasources/remote/movie_genres_remote_datasource.dart';
import 'package:movie_shaker/src/data/mappers/dto/genre_dto_mapper.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movie_genres_repository.dart';

final class MovieGenresRepositoryImpl implements MovieGenresRepository {
  const MovieGenresRepositoryImpl(
    this._movieGenresRemoteDatasource,
    this._genreDtoMapper,
  );

  final MovieGenresRemoteDatasource _movieGenresRemoteDatasource;
  final GenreDtoMapper _genreDtoMapper;

  @override
  Future<List<Genre>> getMovieGenres() async {
    try {
      final response = await _movieGenresRemoteDatasource.getMovieGenres();

      final genres = response.genres.map(_genreDtoMapper.map).nonNulls.toList();

      return genres;
    } on DioException catch (e, s) {
      final error = e.error;
      Error.throwWithStackTrace(error ?? const UnknownNetworkException(), s);
    }
  }
}
