import 'package:freezed_annotation/freezed_annotation.dart';

part 'imdb_rating.freezed.dart';

@freezed
sealed class ImdbRating with _$ImdbRating {
  const factory ImdbRating({
    required double value,
  }) = _ImdbRating;

  factory ImdbRating.max() =>
      const ImdbRating(value: ImdbRating.maxRatingValue);
  factory ImdbRating.min() =>
      const ImdbRating(value: ImdbRating.minRatingValue);

  const ImdbRating._();

  static const maxRatingValue = 10.0;
  static const minRatingValue = 0.0;
}
