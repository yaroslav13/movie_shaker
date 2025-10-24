import 'package:dio/dio.dart';
import 'package:movie_shaker/src/data/entities/discover_movies/discover_movies_response.dart';
import 'package:movie_shaker/src/data/entities/movie_details/movie_details_dto.dart';
import 'package:movie_shaker/src/data/entities/search_movies/search_movies_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_datasource.g.dart';

@RestApi()
abstract interface class MoviesDatasource {
  factory MoviesDatasource(Dio dio) = _MoviesDatasource;

  @GET('/discover/movie')
  Future<DiscoverMoviesResponse> discoverMovies({
    @Query('page') required int page,
  });

  @GET('/search/movie')
  Future<SearchMoviesResponse> searchMovies({
    @Query('query') required String query,
    @Query('page') required int page,
  });

  @GET('/movie/{movie_id}')
  Future<MovieDetailsDto> getMovieDetails({
    @Path('movie_id') required int movieId,
  });
}
