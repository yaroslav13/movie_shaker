import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/data/entities/credit/credit_dto.dart';

part 'movie_credits_response.freezed.dart';
part 'movie_credits_response.g.dart';

@freezed
sealed class MovieCreditsResponse with _$MovieCreditsResponse {
  const factory MovieCreditsResponse({
    required int id,
    required List<CreditDto> cast,
    required List<CreditDto> crew,
  }) = _MovieCreditsResponse;

  factory MovieCreditsResponse.fromJson(Map<String, Object?> json) =>
      _$MovieCreditsResponseFromJson(json);
}
