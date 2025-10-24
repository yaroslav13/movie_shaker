import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/data/entities/genre/genre_dto.dart';

part 'movie_details_dto.freezed.dart';
part 'movie_details_dto.g.dart';

@freezed
sealed class MovieDetailsDto with _$MovieDetailsDto {
  const factory MovieDetailsDto({
    int? id,
    String? title,
    String? originalTitle,
    String? posterPath,
    String? overview,
    int? runtime,
    double? voteAverage,
    int? voteCount,
    String? releaseDate,
    double? popularity,
    List<GenreDto>? genres,
    String? tagline,
    String? homepage,
  }) = _MovieDetailsDto;

  factory MovieDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsDtoFromJson(json);
}
