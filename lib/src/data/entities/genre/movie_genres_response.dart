import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/data/entities/genre/genre_dto.dart';

part 'movie_genres_response.freezed.dart';
part 'movie_genres_response.g.dart';

@freezed
sealed class MovieGenresResponse with _$MovieGenresResponse {
  const factory MovieGenresResponse({
    required List<GenreDto> genres,
  }) = _MovieGenresResponse;

  factory MovieGenresResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieGenresResponseFromJson(json);
}
