import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_filter_dto.freezed.dart';

@freezed
sealed class MoviesFilterDto with _$MoviesFilterDto {
  const factory MoviesFilterDto({
    String? genres,
  }) = _MoviesFilterDto;
}
