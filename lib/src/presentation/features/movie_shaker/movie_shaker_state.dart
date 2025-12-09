import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';

part 'movie_shaker_state.freezed.dart';

@freezed
sealed class MovieShakerState with _$MovieShakerState {
  const factory MovieShakerState({
    @Default(false) bool isShaking,
    Movie? suggestedMovie,
  }) = _MovieShakerState;
}
