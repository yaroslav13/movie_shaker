import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/data/entities/movie/movie_dto.dart';

part 'search_movies_response.freezed.dart';
part 'search_movies_response.g.dart';

@freezed
sealed class SearchMoviesResponse with _$SearchMoviesResponse {
  const factory SearchMoviesResponse({
    required List<MovieDto> results,
    required int page,
    required int totalPages,
    required int totalResults,
  }) = _SearchMoviesResponse;

  factory SearchMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMoviesResponseFromJson(json);
}
