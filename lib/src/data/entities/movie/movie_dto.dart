import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_dto.freezed.dart';
part 'movie_dto.g.dart';

@freezed
sealed class MovieDto with _$MovieDto {
  const factory MovieDto({
    required int id,
    required String title,
    required String originalTitle,
    required String posterPath,
  }) = _MovieDto;

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);
}
