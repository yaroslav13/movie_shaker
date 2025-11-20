import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_dto.freezed.dart';
part 'movie_dto.g.dart';

@freezed
sealed class MovieDto with _$MovieDto {
  const factory MovieDto({
    int? id,
    String? title,
    String? originalTitle,
    String? posterPath,
    List<int>? genreIds,
  }) = _MovieDto;

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);
}
