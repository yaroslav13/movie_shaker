import 'package:dio/dio.dart';
import 'package:movie_shaker/src/data/entities/genre/movie_genres_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_genres_remote_datasource.g.dart';

@RestApi()
abstract interface class MovieGenresRemoteDatasource {
  factory MovieGenresRemoteDatasource(Dio dio) = _MovieGenresRemoteDatasource;

  @GET('/genre/movie/list?language=en')
  Future<MovieGenresResponse> getMovieGenres();
}
