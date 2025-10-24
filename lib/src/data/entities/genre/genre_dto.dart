import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_dto.freezed.dart';
part 'genre_dto.g.dart';

@freezed
sealed class GenreDto with _$GenreDto {
  const factory GenreDto({
    int? id,
    String? name,
  }) = _GenreDto;

  factory GenreDto.fromJson(Map<String, dynamic> json) =>
      _$GenreDtoFromJson(json);
}
