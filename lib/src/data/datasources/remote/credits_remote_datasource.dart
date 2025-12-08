import 'package:dio/dio.dart';
import 'package:movie_shaker/src/data/entities/movie_credits/movie_credits_response.dart';
import 'package:retrofit/retrofit.dart';

part 'credits_remote_datasource.g.dart';

@RestApi()
abstract interface class CreditsRemoteDatasource {
  factory CreditsRemoteDatasource(Dio dio) = _CreditsRemoteDatasource;

  @GET('/movie/{movie_id}/credits?language=en')
  Future<MovieCreditsResponse> getMovieCredits({
    @Path('movie_id') required int movieId,
  });
}
