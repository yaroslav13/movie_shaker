import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/data/entities/movie/movie_dto.dart';

part 'discover_movies_response.freezed.dart';
part 'discover_movies_response.g.dart';

@freezed
sealed class DiscoverMoviesResponse with _$DiscoverMoviesResponse {
  const factory DiscoverMoviesResponse({
    required int page,
    required List<MovieDto> results,
    required int totalPages,
    required int totalResults,
  }) = _DiscoverMoviesResponse;

  factory DiscoverMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$DiscoverMoviesResponseFromJson(json);
}
