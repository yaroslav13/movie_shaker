import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_duration.freezed.dart';

@freezed
sealed class MovieDuration with _$MovieDuration {
  const factory MovieDuration({
    required int valueInMinutes,
  }) = _MovieDuration;

  factory MovieDuration.max() =>
      const MovieDuration(valueInMinutes: MovieDuration.maxDurationInMinutes);

  factory MovieDuration.min() =>
      const MovieDuration(valueInMinutes: MovieDuration.minDurationInMinutes);

  const MovieDuration._();

  static const maxDurationInMinutes = 240;
  static const minDurationInMinutes = 0;
}
