import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_like_state.freezed.dart';

@freezed
sealed class MovieLikeState with _$MovieLikeState {
  const factory MovieLikeState({
    required bool isLiked,
  }) = _MovieLikeState;
}
