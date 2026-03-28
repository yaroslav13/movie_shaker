import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_preferences_dto.freezed.dart';
part 'movie_preferences_dto.g.dart';

@freezed
sealed class MoviePreferencesDto with _$MoviePreferencesDto {
  const factory MoviePreferencesDto({
    required double minImdbRating,
    required int minMovieDurationInMinutes,
    required int minReleaseYear,
    required int maxReleaseYear,
  }) = _MoviePreferencesDto;

  factory MoviePreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$MoviePreferencesDtoFromJson(json);
}
