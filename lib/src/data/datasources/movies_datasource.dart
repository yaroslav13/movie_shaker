import 'package:dio/dio.dart';
import 'package:movie_shaker/src/data/entities/discover_movies/discover_movies_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_datasource.g.dart';

@RestApi()
abstract interface class MoviesDatasource {
  factory MoviesDatasource(Dio dio) = _MoviesDatasource;

  @GET('/discover/movie')
  Future<DiscoverMoviesResponse> getMovies({@Query('page') required int page});
}
